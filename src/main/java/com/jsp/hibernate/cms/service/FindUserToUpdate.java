package com.jsp.hibernate.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.hibernate.cms.configaration.DaoSingleton;
import com.jsp.hibernate.cms.entity.User;

@WebServlet("/manageProfile")
public class FindUserToUpdate extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// from Session
		User user = (User)req.getSession().getAttribute("user");
		
		// from database
		User user2 = DaoSingleton.getUserDao().findUserById(user.getUserId());
		
		req.setAttribute("user", user2);
		req.getRequestDispatcher("ManageProfile.jsp").forward(req, resp);;
	}
}
