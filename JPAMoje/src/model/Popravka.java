package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;


/**
 * The persistent class for the popravka database table.
 * 
 */
@Entity
@NamedQuery(name="Popravka.findAll", query="SELECT p FROM Popravka p")
public class Popravka implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPopravka;

	@Temporal(TemporalType.DATE)
	@Column(name="datum_prijema")
	private Date datumPrijema;

	@Temporal(TemporalType.DATE)
	@Column(name="datum_zavrsetka")
	private Date datumZavrsetka;

	@Column(name="opis_popravke")
	private String opisPopravke;
	
	@Column(name="cena")
	private int cena;

	public int getCena() {
		return cena;
	}

	public void setCena(int cena) {
		this.cena = cena;
	}

	//bi-directional many-to-many association to Radnik
	@ManyToMany
	@JoinTable(
		name="popravka_has_radnik"
		, joinColumns={
			@JoinColumn(name="Radnik_idRadnik")
			}
		, inverseJoinColumns={
			@JoinColumn(name="Popravka_idPopravka")
			}
		)
	private List<Radnik> radniks;

	//bi-directional many-to-one association to Status
	@ManyToOne
	@JoinColumn(name="Status_idStatus")
	private Status status;

	//bi-directional many-to-many association to Usluga
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
		name="popravka_has_usluga"
		, joinColumns={
			@JoinColumn(name="Usluga_idUsluga")
			}
		, inverseJoinColumns={
			@JoinColumn(name="Popravka_idPopravka")
			}
		)
	private List<Usluga> uslugas;

	//bi-directional many-to-one association to Vozilo
	@ManyToOne
	@JoinColumn(name="vozilo_idVozilo")
	private Vozilo vozilo;

	public Popravka() {
	}

	public int getIdPopravka() {
		return this.idPopravka;
	}

	public void setIdPopravka(int idPopravka) {
		this.idPopravka = idPopravka;
	}

	public Date getDatumPrijema() {
		return this.datumPrijema;
	}

	public void setDatumPrijema(Date datumPrijema) {
		this.datumPrijema = datumPrijema;
	}

	public Date getDatumZavrsetka() {
		return this.datumZavrsetka;
	}

	public void setDatumZavrsetka(Date datumZavrsetka) {
		this.datumZavrsetka = datumZavrsetka;
	}

	public String getOpisPopravke() {
		return this.opisPopravke;
	}

	public void setOpisPopravke(String opisPopravke) {
		this.opisPopravke = opisPopravke;
	}

	public List<Radnik> getRadniks() {
		return this.radniks;
	}

	public void setRadniks(List<Radnik> radniks) {
		this.radniks = radniks;
	}

	public Status getStatus() {
		return this.status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public List<Usluga> getUslugas() {
		return this.uslugas;
	}

	public void setUslugas(List<Usluga> uslugas) {
		this.uslugas = uslugas;
	}

	public Vozilo getVozilo() {
		return this.vozilo;
	}

	public void setVozilo(Vozilo vozilo) {
		this.vozilo = vozilo;
	}

	

	public void addRadnik(Radnik one) {
		if (radniks==null) {
			radniks=new LinkedList<Radnik>();
			
		}
		radniks.add(one);
	}

	public void addUsluga(Usluga u) {
		if (uslugas==null) {
			uslugas=new LinkedList<Usluga>();
		}
		uslugas.add(u);
	}


}