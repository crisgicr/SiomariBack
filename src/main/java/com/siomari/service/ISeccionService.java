package com.siomari.service;

import java.util.List;

import com.siomari.model.Seccion;

/**
 * 
 * @author crismetal
 *
 */
public interface ISeccionService extends IService<Seccion> {
	
	/**
	 * @see com.siomari.repository.ISeccionRepository
	 */
	List<Seccion> buscarPorZonaId(int id);
	
	/**
	 * @see com.siomari.repository.ISeccionRepository
	 */
	int buscarIdPorNombreYZona(String nombre, int zona);
	
	/**
	 * @see com.siomari.repository.ISeccionRepository
	 */
	int buscarCanalServidorPorId(int id);
	
	/**
	 * @see com.siomari.repository.ISeccionRepository
	 */
	List<Integer> buscarCanalServidor(int id);
	
	/**
	 * @see com.siomari.repository.ISeccionRepository
	 */
	void updateCanalServidor(int id, int canalServidor);
}
