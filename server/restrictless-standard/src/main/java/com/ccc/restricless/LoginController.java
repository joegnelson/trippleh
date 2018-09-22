package com.ccc.restricless;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {

	static HashMap<String,User> global_users = new HashMap<String,User>();
	static {
		User joe = new User("joe","joe1","joe@cccentric.com","joe","nelson",null);
		User hailey = new User("hailey","hailey1","hailey@cccentric.com","Hailey","Nelson",null);
		User julia = new User("julia","julia1","julia@cccentric.com","Julia","Oneil",null);

		global_users.put(joe.getUsername(), joe);
		global_users.put(hailey.getUsername(), hailey);
		global_users.put(julia.getUsername(), julia);
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String request_username = req.getParameter("username");
		String request_pass = req.getParameter("pass");
		
		//check the request for username and passwor
		if(request_username==null || request_pass==null) {
			resp.setStatus(400);
			return;
		}
		
		//lookup user by the requested username
		User found_user = global_users.get(request_username);
		if(found_user==null) {
			resp.setStatus(404);
			return;
		}
		
		//check that the passwords match
		if(!found_user.getPasword().equals(request_pass))
		{
			resp.setStatus(404);
			return;
		}
		
		found_user.setLastLogin(new Date());
		
		
		//returning the response
		resp.setContentType("application/json");
		resp.getWriter().println(found_user.toJson());
		System.out.println("ICU " + found_user.getUsername() + "/" + found_user.getEmail());
		resp.setStatus(200);
	}

}