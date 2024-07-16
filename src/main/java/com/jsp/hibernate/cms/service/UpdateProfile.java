package com.jsp.hibernate.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.hibernate.cms.configaration.DaoSingleton;
import com.jsp.hibernate.cms.entity.User;

@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("userId"));
		String username = req.getParameter("username");
		String userEmail = req.getParameter("userEmail");
		String userPassword = req.getParameter("userPassword");
		
		User user = new User();
		user.setUserId(userId);
		user.setUsername(username);
		user.setUserEmail(userEmail);
		user.setUserPassword(userPassword);
		
		boolean result = DaoSingleton.getUserDao().updateUser(user);
		
		if(result) {
			resp.sendRedirect("Home.jsp");
		}else {
			req.setAttribute("result", "User Details Not Updated");
			req.getRequestDispatcher("ManageProfile.jsp").forward(req, resp);
		}
	}
}
