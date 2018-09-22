package com.ccc.restricless;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccc.restricless.LoginController.HTTPStatus;


@WebServlet(name = "register", urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {

	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String request_email = req.getParameter("email");
		String request_username = req.getParameter("username");
		String request_pass = req.getParameter("pass");
		
		
		//check the request for username and passwor
		if(request_username==null || request_pass==null|| request_email==null) {
			resp.setStatus(HTTPStatus.BadRequest400.getValue());//400 Bad Request
			return;
		}
		
		//lookup user by the requested username
		if(LoginController.global_userByName.get(request_username)!=null) {
			resp.setStatus(HTTPStatus.Forbidden403.getValue());//forbidedn
			return;
		}
		if(LoginController.global_userByEmail.get(request_email)!=null) {
			resp.setStatus(HTTPStatus.Forbidden403.getValue());//forbidedn
			return;
		}
		User user =LoginController.addUser(new User(request_username,request_pass,request_email,null,null,null));
		
		user.setLastLogin(new Date());
		
		
		//returning the response
		resp.setContentType("application/json");
		resp.getWriter().println(user.toJson());
		System.out.println("ICU " + user.getUsername() + "/" + user.getEmail());
		resp.setStatus(200);
	}

}