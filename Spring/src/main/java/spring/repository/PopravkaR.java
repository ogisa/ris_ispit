package spring.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import model.Popravka;

public interface PopravkaR extends JpaRepository<Popravka, Integer>{
	@Query("SELECT p FROM Popravka p INNER JOIN p.radniks r WHERE r.idRadnik = :idR AND p.datumPrijema BETWEEN :stDate AND :edDate ")
	public List<Popravka> getPopravkasFromRadnikDate(@Param("idR")int idRadnik, @Param("stDate")Date pocetak,@Param("edDate")Date kraj);
}
