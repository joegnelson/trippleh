package com.ccc.restricless;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.cloud.datastore.KeyFactory;


@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginController extends HttpServlet {

	public static enum HTTPStatus{
		BadRequest400(400),
		NotFound404(404),
		Forbidden403(403) ;
        private final int value;

        HTTPStatus(final int newValue) {
            value = newValue;
        }

        public int getValue() { return value; }
	}
	
//	private Datastore datastore;
//	private KeyFactory keyFactory;

	public LoginController() {
//	  datastore = DatastoreOptions.getDefaultInstance().getService(); // Authorized Datastore service
//	  keyFactory = datastore.newKeyFactory().setKind("recipe");      // Is used for creating keys later
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		String request_username = req.getParameter("username");
		String request_pass = req.getParameter("pass");
		
		//check the request for username and passwor
		if(request_username==null || request_pass==null) {
			resp.setStatus(HTTPStatus.BadRequest400.getValue());//400 Bad Request
			return;
		}
		
		//lookup user by the requested username
		//User found_user = global_userByName.get(request_username);
		User found_user =User.get(request_username);
		if(found_user==null) {
			resp.setStatus(HTTPStatus.NotFound404.getValue());
			return;
		}
		
		//check that the passwords match
		if(!found_user.getPasword().equals(request_pass))
		{
			resp.setStatus(HTTPStatus.Forbidden403.getValue());
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