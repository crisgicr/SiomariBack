package com.siomari.SiomariBack;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.siomari.model.Users;
import com.siomari.service.IUsersService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SiomariBackApplicationTests {

	@Autowired
	private IUsersService service;

	@Test
	public void contextLoads() {

		Users user = new Users();
		
		user.setIdentificacion("1075299691");
		user.setClave("232322");
		user.setRol("ROLE_JEFE_DISTRITO");
		
		service.registrar(user);
		
	}

}
