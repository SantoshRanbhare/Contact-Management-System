package com.jsp.hibernate.cms.configaration;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class EMFSingleton {

	private static EntityManagerFactory factory;
	
	private EMFSingleton() {
		super();
	}

	public static synchronized EntityManagerFactory getFactory() {
		if(factory == null) {
			factory = Persistence.createEntityManagerFactory("mysql_config");
		}
		return factory;
	}
}
