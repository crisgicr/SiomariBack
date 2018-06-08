package com.siomari.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siomari.model.Predio;
import com.siomari.model.Usuario;
import com.siomari.repository.IUsuarioRepository;
import com.siomari.service.IUsuarioService;

/**
 * 
 * @author crismetal
 *
 */
@Service
public class UsuarioServiceImpl implements IUsuarioService {

	@Autowired
	private IUsuarioRepository usuarioRepo;

	/**
	 * @see com.siomari.service.IService
	 */
	@Override
	public void registrar(Usuario usuario) {

		// nos aseguramos que no tenga un id para que no sobre escriba un registro existente
		if(usuario.getId() != 0) return;	
		
		usuarioRepo.save(usuario);

	}

	/**
	 * @see com.siomari.service.IService
	 */
	@Override
	public void actualizar(Usuario usuario) {

		usuarioRepo.save(usuario);
		
	}

	/**
	 * @see com.siomari.service.IService
	 */
	@Override
	public void eliminar(int id) {

		usuarioRepo.delete(id);
	}

	/**
	 * @see com.siomari.service.IService
	 */
	@Override
	public List<Usuario> listar() {

		List<Usuario> lst = usuarioRepo.findAll();

		return lst;
	}

	/**
	 * @see com.siomari.service.IService
	 */
	@Override
	public Usuario listar(int id) {

		Usuario usuario = usuarioRepo.findOne(id);

		//nos aseguramos de no devilver objetos nulos
		if(usuario == null) {
			usuario = new Usuario();
		}
		
		//eliminamos los datos que no necesitamos del predio para no tener errores ciclicos
		if(usuario.getPredioId() != null) {
			
			Predio predio = new Predio();
			predio.setNombre(usuario.getPredioId().getNombre());
			predio.setId(usuario.getPredioId().getId());
			
			usuario.setPredioId(predio);
		}
		
		return usuario;
	}

	@Override
	public int buscarIdPorIdentificacion(String identificacion) {
		
		Integer id = usuarioRepo.buscarIdPorIdentificacion(identificacion);

		if (id == null) {
			id = 0;
		}

		return id;
	}

	@Override
	public List<Usuario> buscarIdNombreIdentificacionPorNombreOIdentificacion(String query) {
		
		return usuarioRepo.buscarIdNombreIdentificacionPorNombreOIdentificacion(query);
	}

	
}
