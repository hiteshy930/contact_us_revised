package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RequestsDao;

@SuppressWarnings("serial")
@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String archiveId = request.getParameter("archiveButton");
		String activeId = request.getParameter("activeButton");

		int numberOfRowsAffected = 0;
		
		if (archiveId != null) {
			int id = Integer.parseInt(archiveId);
			RequestsDao requestDao = new RequestsDao();
			numberOfRowsAffected = requestDao.makeRequestArchived(id);

		} else {
			int num = Integer.parseInt(activeId);
			RequestsDao requestDao = new RequestsDao();
			numberOfRowsAffected = requestDao.makeRequestActive(num);
		}

		if (numberOfRowsAffected != 0) {
			out.println("<script> window.location = \"./dashboard\" </script>");
		} else {
			out.println("<script> alert('Data Updation failed. Please retry'); "
					+ "window.location = \"./dashboard\" </script>");
		}
	}

}
