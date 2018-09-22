package com.ccc.restricless;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HelloAppEngine", urlPatterns = { "/hello" })
public class HelloAppEngine extends HttpServlet {

	// @Override
	public void doGet2(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

		response.getWriter().print("Hello App Engine!\r\n");

	}

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		resp.setContentType("text/plain");
		resp.getWriter().println("{ "
				+ "\"name\": \"Nelson2 Family!\" "
				+ "\"email\": \""+email+ "\" "
				+ "}");
		System.out.println("ICU " + email + "/" + pass);
	}

}