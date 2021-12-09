package com.company;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("./login.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		
		boolean isValidUser = new LoginDao().checkUserValidation(username, password);
			
			if(isValidUser == true) {
				Cookie cookie = new Cookie("id",username);
				response.addCookie(cookie);
				
				response.sendRedirect("./dashboard");
			}else {
				response.sendRedirect("./login");
			}
						
		
	}

}
