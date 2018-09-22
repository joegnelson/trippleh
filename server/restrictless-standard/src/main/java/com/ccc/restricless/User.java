package com.ccc.restricless;

import java.util.Date;

public class User {

	public User(String username,String pasword,String email,String firstName,String lastName,Date lastLogin) {
		this.username=username;
		this.pasword=pasword;
		this.email=email;
		this.firstName=firstName;
		this.lastName=lastName;
		this.lastLogin=lastLogin;
		
	}
	private String username;
	private String pasword;
	private String email;
	private String firstName;
	private String lastName;
	private Date lastLogin;

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPasword() {
		return pasword;
	}
	public void setPasword(String pasword) {
		this.pasword = pasword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public Date getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}
	public String toJson() {
		return "{ "
				+ jsonFormat("firstName",getFirstName())
				+ ","+jsonFormat("lastName",getLastName())
				+ ","+jsonFormat("username",getUsername())
				+ ","+jsonFormat("email",getEmail())
				+ ","+jsonFormat("lastLogin",getLastLogin())
				+ "}";
	}
	private String jsonFormat(String name,Date value) {
		return "\""+name+ "\": \""+value.toString()+ "\" ";
	}
	private String jsonFormat(String name,String value) {
		return "\""+name+ "\": \""+value+ "\" ";
	}
}
