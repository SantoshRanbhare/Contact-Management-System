package com.jsp.hibernate.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.hibernate.cms.configaration.DaoSingleton;
import com.jsp.hibernate.cms.entity.User;

@WebServlet("/validateUser")
public class ValidateUser extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userEmail = req.getParameter("userEmail");
		String userPassword = req.getParameter("userPassword");

		User user = DaoSingleton.getUserDao().findUserByEmailAndPassword(userEmail, userPassword);

		if (user != null) {
			HttpSession session = req.getSession(true);
			session.setAttribute("user", user);
			resp.sendRedirect("Home.jsp");
		} else {
			req.setAttribute("error", "Invalid username or password");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
	}
}
