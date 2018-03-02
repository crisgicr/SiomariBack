package com.siomari.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.siomari.model.Unidad;

/**
 * 
 * @author crismetal
 *
 */
public interface IUnidadRepository extends JpaRepository<Unidad, Integer> {

	/**
	 * Se buscara una unidad por su nombre
	 * @param nombre
	 * @return id de la unidad
	 */
	@Query("select u.id from Unidad u where u.nombre = ?1")
	Integer buscarIdPorNombre(String nombre);
}
