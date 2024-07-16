package com.jsp.hibernate.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.hibernate.cms.configaration.DaoSingleton;
import com.jsp.hibernate.cms.dao.UserDao;
import com.jsp.hibernate.cms.entity.User;

@WebServlet("/registerUser")
public class RegisterUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String userEmail = req.getParameter("userEmail");
		String userPassword = req.getParameter("userPassword");
	
		User user = new User();
		user.setUsername(username);
		user.setUserEmail(userEmail);
		user.setUserPassword(userPassword);
		
		boolean result = DaoSingleton.getUserDao().saveUser(user);
		if(result) {
			resp.sendRedirect("Login.jsp");
		}
		else {
			req.setAttribute("message", "User Not Registered Please Try Again");
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		}
	}
}
