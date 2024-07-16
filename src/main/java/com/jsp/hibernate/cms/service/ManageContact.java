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

@WebServlet("/manageContact")
public class ManageContact extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		User user2 = DaoSingleton.getUserDao().findUserById(user.getUserId());
			req.setAttribute("user", user2);
			req.getRequestDispatcher("ManageContact.jsp").forward(req, resp);
	}
}
