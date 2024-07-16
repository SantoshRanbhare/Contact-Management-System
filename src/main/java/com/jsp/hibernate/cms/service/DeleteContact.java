package com.jsp.hibernate.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.hibernate.cms.configaration.DaoSingleton;

@WebServlet("/deleteContact")
public class DeleteContact extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		
		boolean result = DaoSingleton.getContactDao().deleteContact(contactId);
		
		if(result) {
			resp.sendRedirect("manageContact");
		}else {
			req.setAttribute("error", "Contact Not Deleted");
			req.getRequestDispatcher("ManageContact.jsp").forward(req, resp);
		}
	}
}
