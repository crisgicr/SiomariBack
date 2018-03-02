package com.siomari.service;

import com.siomari.model.Unidad;

/**
 * 
 * @author crismetal
 *
 */
public interface IUnidadService extends IService<Unidad> {

	/**
	 * se verificara si existe una unidad por su nombre
	 * @param nombre
	 * @return true si existe, false si no existe
	 */
	boolean existePorNombre(String nombre);
}
