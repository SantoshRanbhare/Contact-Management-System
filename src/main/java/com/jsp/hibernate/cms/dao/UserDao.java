package com.jsp.hibernate.cms.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import com.jsp.hibernate.cms.configaration.EMFSingleton;
import com.jsp.hibernate.cms.entity.User;

public class UserDao {

	public boolean saveUser(User user) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();
			manager.persist(user);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}
	}

	public boolean updateUser(User user) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();
			manager.merge(user);
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}
	}

	public boolean deleteUser(User user) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		try {
			transaction.begin();
			manager.remove(manager.contains(user) ? user : manager.merge(user));
			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			manager.close();
		}
	}

	public User findUserById(int userId) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();

		User user = manager.find(User.class, userId);

		manager.close();
		return user;
	}

	public User findUserByEmailAndPassword(String userEmail, String userPassword) {
		EntityManager manager = EMFSingleton.getFactory().createEntityManager();
		try {
			TypedQuery<User> query = manager
					.createQuery("from User where userEmail= :email and userPassword= :password", User.class);
			query.setParameter("email", userEmail);
			query.setParameter("password", userPassword);
			User user = query.getSingleResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			manager.close();
		}
	}
}
