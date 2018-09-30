package com.ccc.restricless;

import java.io.FileInputStream;
import java.util.Date;

import com.google.api.client.json.GenericJson;
import com.google.auth.Credentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.cloud.datastore.DatastoreOptions.Builder;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.Key;
import com.google.cloud.http.HttpTransportOptions.DefaultHttpTransportFactory;

public class User {

	public User() {
		
	}
	public User(String username, String pasword, String email, String firstName, String lastName, Date lastLogin) {
		this.username = username;
		this.pasword = pasword;
		this.email = email;
		this.firstName = firstName;
		this.lastName = lastName;
		this.lastLogin = lastLogin;

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
		return "{ " + jsonFormat("firstName", getFirstName()) + "," + jsonFormat("lastName", getLastName()) + ","
				+ jsonFormat("username", getUsername()) + "," + jsonFormat("email", getEmail()) + ","
				+ jsonFormat("lastLogin", getLastLogin()) + "}";
	}

	private String jsonFormat(String name, Date value) {
		return "\"" + name + "\": \"" + value.toString() + "\" ";
	}

	private String jsonFormat(String name, String value) {
		return "\"" + name + "\": \"" + value + "\" ";
	}

	public static void main(String... args) throws Exception {

	}

	public static User get(String taskKeyID) {

		try {
			DatastoreOptions dsOptions = DatastoreOptions.getDefaultInstance();
			Builder builder = dsOptions.toBuilder();
			Datastore datastore = builder.build().getService();
			
			String kind = "user";
			Key taskKey = datastore.newKeyFactory().setKind(kind).newKey(taskKeyID);
			Entity retrieved = datastore.get(taskKey);
			if(retrieved==null) {
				return null;
			}
//			System.out.printf("Retrieved %s: %s%n", taskKey.getName(), retrieved.getString("email"));

			User user = new User();
			user.setEmail(retrieved.getString("email"));
			user.setPasword(retrieved.getString("pasword"));
			user.setUsername(retrieved.getString("username"));
			return user;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void insert(User user) {
		// Instantiates a client
		try {
			Builder y;
			if (true) {
				DatastoreOptions x = DatastoreOptions.getDefaultInstance();
				y = x.toBuilder();
			} else {
				y = DatastoreOptions.newBuilder();
				y.setProjectId("ccc-restrictless-login-t1");

				// GenericJson fileContents=null;
				// ServiceAccountCredentials.fromJson(fileContents,new
				// DefaultHttpTransportFactory());
				// ServiceAccountCredentials.fromStream(new FileInputStream("key.json"), new
				// DefaultHttpTransportFactory());

				Credentials credentials = ServiceAccountCredentials.fromStream(new FileInputStream("key.json"));
				y.setCredentials(credentials);
			}

			Datastore datastore = y.build().getService();

			// The kind for the new entity
			String kind = "user";
			// The name/ID for the new entity
			// The Cloud Datastore key for the new entity
			Key taskKey = datastore.newKeyFactory().setKind(kind).newKey(user.username);

			// Prepares the new entity
			Entity task = Entity.newBuilder(taskKey)
					.set("email", user.email)
					.set("pasword", user.pasword)
					.set("username", user.username)
//					.set("", user.lastLogin)
					.build();

			// Saves the entity
			datastore.put(task);

			System.out.printf("Saved %s: %s%n", task.getKey().getName(), task.getString("email"));

			// Retrieve entity
			Entity retrieved = datastore.get(taskKey);

			System.out.printf("Retrieved %s: %s%n", taskKey.getName(), retrieved.getString("email"));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
