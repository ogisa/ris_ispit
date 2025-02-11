package model;

import java.io.Serializable;
import javax.persistence.*;

import java.util.LinkedList;
import java.util.List;


/**
 * The persistent class for the usluga database table.
 * 
 */
@Entity
@NamedQuery(name="Usluga.findAll", query="SELECT u FROM Usluga u")
public class Usluga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUsluga;

	private double cena;

	@Column(name="naziv_usluge")
	private String nazivUsluge;

	//bi-directional many-to-many association to Popravka
	@ManyToMany(mappedBy="uslugas",fetch = FetchType.EAGER)
	private List<Popravka> popravkas;

	public Usluga() {
	}

	public int getIdUsluga() {
		return this.idUsluga;
	}

	public void setIdUsluga(int idUsluga) {
		this.idUsluga = idUsluga;
	}

	public double getCena() {
		return this.cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public String getNazivUsluge() {
		return this.nazivUsluge;
	}

	public void setNazivUsluge(String nazivUsluge) {
		this.nazivUsluge = nazivUsluge;
	}

	public List<Popravka> getPopravkas() {
		return this.popravkas;
	}

	public void setPopravkas(List<Popravka> popravkas) {
		this.popravkas = popravkas;
	}

	public void addPopravka(Popravka p) {
		if(popravkas!=null) {
			popravkas=new LinkedList<Popravka>();
		}
		popravkas.add(p);
		
	}
	public boolean imaP(int p) {
		if(popravkas!=null) {
			for (Popravka popravka : popravkas) {
				if (popravka.getIdPopravka()==p) {
					return true;
				}
			}
		}
		return false;
	}


}