package spring.controler;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.Principal;
import java.text.FieldPosition;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import model.Popravka;
import model.Radnik;
import model.Usluga;
import model.Vlasnik;
import model.Vozilo;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import spring.repository.PopravkaR;
import spring.repository.RadnikR;
import spring.repository.StatusR;
import spring.repository.UlogaR;
import spring.repository.UslugaR;
import spring.repository.VlasnikR;
import spring.repository.VoziloR;

//Implementirati sledeću funkcionalnost: Na početnoj stranici, prikazuje se combo box sa svim
//postojećim žanrovima predstava. Izborom jednog žanra i klikom na dugme, u tabeli ispod se
//prikazuju sve predstave, koje pripadaju tom žanru (prikazati naziv, trajanje, opis, ime režisera).
//Poslednja kolona u tabeli je link. Klikom na njega, prikazuju se svi glumci sa nazivima uloga na
//novoj stranici.

@Controller
@RequestMapping(value = "controllerS")
public class ControllerS {
	@Autowired
	PopravkaR pr;
	@Autowired
	RadnikR rr;
	@Autowired
	UlogaR ur;
	@Autowired
	VoziloR vr;
	@Autowired
	UslugaR usr;
	@Autowired
	VlasnikR vlr;
	@Autowired
	StatusR str;

	@RequestMapping(value = "popravkas", method = RequestMethod.GET)
	public String ucitajPopravke(HttpServletRequest request) {
		List<Popravka> p = pr.findAll();
		request.getSession().setAttribute("popravke", p);
		return "strana";
	}
//	@RequestMapping(value = "pocetak", method = RequestMethod.GET)
//	public String pocetak(HttpServletRequest request) {
//		
//		Radnik r=new Radnik();
//		r.setIme("Ogi");
//		r.setKorIme("ogi");
//		r.setPrezime("djesi");
//		r.setKvalifikacije("Faks");
//		r.setUloga(ur.getOne(1));
//		r.setPassword(new BCryptPasswordEncoder().encode("123"));
//		rr.save(r);
//		return "index";
//	}

	@RequestMapping(value = "/admin/add", method = RequestMethod.POST)
	public String dodajM(HttpServletRequest request, Radnik r) {
		String s = r.getPassword();
		BCryptPasswordEncoder e = new BCryptPasswordEncoder();
		r.setPassword(e.encode(s));
		r.setUloga(ur.getOne(2));
		rr.save(r);
		return "index";
	}

	@RequestMapping(value = "/admin/dodajVlasnika", method = RequestMethod.POST)
	public String dodajM(HttpServletRequest request, Vlasnik v) {
		vlr.save(v);
		request.getSession().setAttribute("vlasnici", vlr.findAll());
		return "/admin/dodajVozilo";
	}

	@RequestMapping(value = "/admin/dodajVozilo", method = RequestMethod.POST)
	public String dodajV(HttpServletRequest request, Vozilo v, int idV) {
		Vlasnik vlas = vlr.getOne(idV);
		v.setVlasnik(vlas);
		v.setPopravkas(new LinkedList<Popravka>());
		vr.save(v);
		return "index";
	}

	@RequestMapping(value = "/admin/dodajUslugu", method = RequestMethod.POST)
	public String dodajUslugu(HttpServletRequest request, Usluga v) {
		usr.save(v);
		return "/admin/dodajUsluge";
	}

	@RequestMapping(value = "/admin/popuniVlasnike", method = RequestMethod.GET)
	public String popuniV(HttpServletRequest request) {
		request.getSession().setAttribute("vlasnici", vlr.findAll());

		return "/admin/dodajVozilo";
	}

	@RequestMapping(value = "/users/ucitajPopravke", method = RequestMethod.GET)
	public String popuniP(HttpServletRequest request, Principal pr) {
		String korIme = pr.getName();
		Radnik r = rr.findByKorIme(korIme);

		request.getSession().setAttribute("popravke", r.getPopravkas());

		return "/users/mojePopravke";
	}

	@RequestMapping(value = "/users/ucitajUsluge", method = RequestMethod.GET)
	public String popuniU(HttpServletRequest request, Principal pri, int idP) {
		String korIme = pri.getName();
		Radnik r = rr.findByKorIme(korIme);
		List<Popravka> popravke = r.getPopravkas();
		Popravka p = pr.getOne(idP);
		// Proveri da li radi
		popravke.contains(p);

		request.getSession().setAttribute("popravka", p);
		request.getSession().setAttribute("usluge", usr.findAll());

		return "/users/mojePopravke";
	}

	@RequestMapping(value = "/users/unesiUsluge", method = RequestMethod.POST)
	public String unesiU(HttpServletRequest request, @RequestParam("idU") int[] idU, Principal pri) {

		Popravka p = (Popravka) request.getSession().getAttribute("popravka");

		Popravka poe = pr.getOne(p.getIdPopravka());
		poe.setStatus(str.getOne(2));

		pr.flush();

		for (int i = 0; i < idU.length; i++) {
			Usluga u = usr.getOne(idU[i]);
			Popravka po = pr.getOne(p.getIdPopravka());

			u.addPopravka(po);
			rr.flush();
			usr.flush();
			pr.flush();

			po.addUsluga(u);
			// System.out.println(p.getUslugas().get(0).getNazivUsluge());
			rr.flush();
			usr.flush();
			pr.flush();

		}
		request.getSession().removeAttribute("popravka");
		request.getSession().setAttribute("popravke", rr.findByKorIme(pri.getName()).getPopravkas());

		return "/users/mojePopravke";
	}

	@RequestMapping(value = "/users/dodajZavrsetak", method = RequestMethod.GET)
	public String promeniPopravku(HttpServletRequest request, int idP, Principal pri) {
		Popravka p = pr.getOne(idP);
		List<Usluga> usluge = p.getUslugas();
		int cena = 0;
		for (Usluga usluga : usluge) {
			cena += usluga.getCena();
		}
		p.setCena(cena);
		p.setDatumZavrsetka(new Date());
		p.setStatus(str.getOne(3));
		pr.flush();
		request.getSession().setAttribute("popravke", rr.findByKorIme(pri.getName()).getPopravkas());
		request.getSession().removeAttribute("popravka");
		return "/users/mojePopravke";
	}

	@RequestMapping(value = "/users/login", method = RequestMethod.GET)
	public String promeniPopravku(HttpServletRequest request, Principal pri) {

		request.getSession().setAttribute("korisnik", pri.getName());
		return "index";
	}

	@RequestMapping(value = "/admin/ucitajZaPopravku", method = RequestMethod.GET)
	public String dodajV(HttpServletRequest request) {
		request.getSession().setAttribute("radnici", rr.findAll());
		request.getSession().setAttribute("vozila", vr.findAll());

		return "/admin/ubaciPopravku";
	}

	@RequestMapping(value = "/admin/ucitajZaIzvestaj", method = RequestMethod.GET)
	public String ucitajR(HttpServletRequest request) {
		request.getSession().setAttribute("majstori", rr.findAll());
		Date d = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		StringBuffer str = new StringBuffer();
		StringBuffer pre = new StringBuffer();
		FieldPosition fp = new FieldPosition(3);
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);

		sd.format(d, str, fp);
		sd.format(cal.getTime(), pre, fp);
		request.getSession().setAttribute("pre", pre.toString());
		request.getSession().setAttribute("danas", str.toString());
		return "/admin/izvestaji";
	}

//	@RequestMapping(value = "/users/ucitajZaBrojPopravki", method = RequestMethod.GET)
//	public String ucitajBr(HttpServletRequest request) {
//		request.getSession().setAttribute("majstori", rr.findAll());
//		Date d = new Date();
//
//		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
//		StringBuffer str = new StringBuffer();
//		StringBuffer pre = new StringBuffer();
//		FieldPosition fp = new FieldPosition(3);
//		Calendar cal = Calendar.getInstance();
//		cal.add(Calendar.MONTH, -1);
//
//		sd.format(d, str, fp);
//		sd.format(cal.getTime(), pre, fp);
//		request.getSession().setAttribute("pre", pre.toString());
//		request.getSession().setAttribute("danas", str.toString());
//		return "/users/brojPopravki";
//	}

	@RequestMapping(value = "/admin/dodajVoziloRadniku", method = RequestMethod.POST)
	public String dodajVoziloRadniku(HttpServletRequest request, int idV, int idR, String opis) {
		Popravka p = new Popravka();
		Radnik r = rr.getOne(idR);

		p.addRadnik(r);
		p.setVozilo(vr.getOne(idV));
		p.setDatumPrijema(new Date());
		p.setStatus(str.getOne(1));
		p.setOpisPopravke(opis);
		r.addPopravka(p);
		rr.flush();
		pr.save(p);
		return "/admin/ubaciPopravku";
	}

	OutputStream out;

	@RequestMapping(value = "/admin/izvestaj", method = RequestMethod.POST)
	public void izvestaj(HttpServletRequest request, HttpServletResponse response, Integer idR, String pocetak,
			String kraj) {
		if (out == null) {
			try {
				out = response.getOutputStream();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		try {

			List<Popravka> popravke;
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date p = format.parse(pocetak);
			Date k = format.parse(kraj);
			Map<String, Object> params = new HashMap<String, Object>();
			String naziv;
			if (idR != null) {
				Radnik r = rr.getOne(idR);
				popravke = pr.getPopravkasFromRadnikDate(idR, p, k);

				params.put("naslov", r.getIme() + " " + r.getPrezime());

				naziv = r.getIme() + "_" + r.getPrezime();
			} else {
				params.put("naslov", "sve radnike");
				popravke = pr.findAll();
				popravke.stream().sorted(Comparator.comparingInt((Popravka x) -> x.getRadniks().get(0).getIdRadnik()));
				naziv = "Od_" + p.toString() + "_do_" + k.toString();
			}
			for (Popravka popravka : popravke) {
				popravka.setRadniks(popravka.getRadniks());
			}
			params.put("datum", p);
			params.put("datumKraj", k);

			response.setContentType("text/html");
			JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(popravke);
			InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/MajstorIzvestaj.jrxml");
			JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
			inputStream.close();

			response.setContentType("application/x-download");
			response.addHeader("Content-disposition", "attachment; filename=" + naziv + "_izvestaj.pdf");
			JasperExportManager.exportReportToPdfStream(jasperPrint, out);
			out.flush();
			out.close();
		} catch (IOException | JRException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

//	@RequestMapping(value = "/users/brPopravki", method = RequestMethod.POST)
//	public String brP(HttpServletRequest request, int idR, String pocetak, String kraj) throws Exception {
//		Radnik r = rr.getOne(idR);
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		Date p = format.parse(pocetak);
//		Date k = format.parse(kraj);
//		List<Popravka> popravke = pr.getPopravkasFromRadnikDate(idR, p, k);
//		String info = "Majstor " + r.getIme() + " " + r.getPrezime() + " je imao " + popravke.size() + " popravki Od: "
//				+ pocetak + " Do: " + kraj;
//		request.getSession().setAttribute("radnikPod", info);
//		return "/users/brojPopravki";
//	}

}
