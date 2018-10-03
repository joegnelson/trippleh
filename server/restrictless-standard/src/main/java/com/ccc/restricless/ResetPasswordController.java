package com.ccc.restricless;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
// [END simple_includes]
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccc.restricless.LoginController.HTTPStatus;
import com.ccc.restricless.dao.util.DateUtil;

@WebServlet(name = "resetpassword", urlPatterns = { "/resetpassword" })
public class ResetPasswordController extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String request_email = req.getParameter("email");
		String request_pass = req.getParameter("pass");
		String request_code = req.getParameter("code");
		String request_onlyValidateEmail = req.getParameter("onlyValidateEmail");

		//EMAIL REQUIRED
		if(request_email==null || request_email.trim().length()==0) {
			resp.setStatus(HTTPStatus.BadRequest400.getValue());
			return;
		}
		
		//GET USER BY EMAIL
		User user =User.getByEmail(request_email);
		if(user==null) {
			resp.setStatus(HTTPStatus.NotFound404.getValue());
			return;
		}
		//HANDLE onlyValidateEmail
		if("true".equalsIgnoreCase(request_onlyValidateEmail)) {
			try{
				String code =RandomNumber.generateNumber();
				user.setResetCode(code);
				User.upsert(user);

				sendEmail(user.getEmail(),user.getUsername(),code);
				resp.setStatus(200);
				return;
			}catch(Exception e) {
				resp.setContentType("application/json");
				resp.getWriter().println("{\"error\":\""
						+e.getMessage()
						+ "\"}");

				resp.setStatus(500);
				return;
				
			}
		}
		
		//VALIDATE REQUIRED PARAMS
		if(request_code==null || request_code.trim().length()==0) {
			resp.setStatus(HTTPStatus.BadRequest400.getValue());
			return;
		}
		if(request_pass==null || request_pass.trim().length()==0) {
			resp.setStatus(HTTPStatus.BadRequest400.getValue());
			return;
		}

		//VALIDATE CODE
		if(!request_code.equals(user.getResetCode())) {
			resp.setStatus(HTTPStatus.Forbidden403.getValue());
			return;
		}
		
		//RESET PASSWORD
		user.setPasword(request_pass);
		user.setResetCode(DateUtil.nowDate());
		User.upsert(user);
		resp.setStatus(200);
		return;

		
		
	}
	private void sendEmail(String emailAddress,String username,String code) throws UnsupportedEncodingException, MessagingException {
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);

		  Message msg = new MimeMessage(session);
		  msg.setFrom(new InternetAddress("restrictless@cccentric.com", "RestrictLESS Admin"));
		  msg.addRecipient(Message.RecipientType.TO,
		                   new InternetAddress(emailAddress, username));
		  msg.setSubject("Restrictless restpassword request");
		  msg.setText("Reset your password using this code:\n"+code);
		  Transport.send(msg);
	}
	
	

}
