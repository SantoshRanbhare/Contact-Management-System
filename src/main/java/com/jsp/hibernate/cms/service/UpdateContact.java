package com.jsp.hibernate.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.hibernate.cms.configaration.DaoSingleton;
import com.jsp.hibernate.cms.entity.Contact;
import com.jsp.hibernate.cms.entity.User;

@WebServlet("/updateContact")
public class UpdateContact extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int contactId = Integer.parseInt(req.getParameter("contactId"));
		String contactName = req.getParameter("contactName");
		long contactNumber = Long.parseLong(req.getParameter("contactNumber"));
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		Contact contact = new Contact();
		contact.setContactId(contactId);
		contact.setContactName(contactName);
		contact.setContactNumber(contactNumber);
		contact.setUser(user);
		
		boolean result = DaoSingleton.getContactDao().updateContact(contact);
		
		if(result) {
			resp.sendRedirect("manageContact");
		}else {
			req.setAttribute("error", "Contact details Not updated");
			req.getRequestDispatcher("manageContact").forward(req, resp);
		}
	}
}
