package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Radnik;

public interface RadnikR extends JpaRepository<Radnik, Integer>{
	public Radnik findByKorIme(String korIme);
}
