package com.ccc.restricless;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import com.ccc.restricless.dao.util.DateUtil;
import com.google.auth.Credentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.datastore.Datastore;
import com.google.cloud.datastore.DatastoreOptions;
import com.google.cloud.datastore.DatastoreOptions.Builder;
import com.google.cloud.datastore.Entity;
import com.google.cloud.datastore.Key;
import com.google.cloud.datastore.Query;
import com.google.cloud.datastore.QueryResults;
import com.google.cloud.datastore.StructuredQuery.PropertyFilter;

public class User {

	public static final String KIND = "user";
	//-------------------------------------------------------------------------
	// BEAN
	//-------------------------------------------------------------------------
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
	private String resetCode;

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
	public String getResetCode() {
		return resetCode;
	}
	public void setResetCode(String resetCode) {
		this.resetCode = resetCode;
	}

	public String toJson() {
		return "{ " + jsonFormat("firstName", getFirstName()) + "," + jsonFormat("lastName", getLastName()) + ","
				+ jsonFormat("username", getUsername()) + "," + jsonFormat("email", getEmail()) + ","
				+ jsonFormat("lastLogin", getLastLogin()) + "}";
	}

	private String jsonFormat(String name, Date value) {
		return "\"" + name + "\": \"" + DateUtil.nowDate(value) + "\" ";
	}

	private String jsonFormat(String name, String value) {
		return "\"" + name + "\": \"" + value + "\" ";
	}

	//-------------------------------------------------------------------------
	// LOCAL TESTING
	//-------------------------------------------------------------------------
	static boolean localTest=false;
	public static HashMap<String,User> local_global_userByName = new HashMap<String,User>();
	public static HashMap<String,User> local_global_userByEmail = new HashMap<String,User>();
	static {
		addUser( new User("joe","joe1","joe@cccentric.com","joe","nelson",null));
		addUser( new User("hailey","hailey1","hailey@cccentric.com","Hailey","Nelson",null));
		addUser( new User("julia","julia1","julia@cccentric.com","Julia","Oneil",null));
	}
	
	public static User addUser(User user) {
		local_global_userByName.put(user.getUsername(), user);
		local_global_userByEmail.put(user.getEmail(), user);
		return user;
	}

	//-------------------------------------------------------------------------
	// DAO
	//-------------------------------------------------------------------------
	public static User getByEmail(String email) {
		if(localTest) {
			return local_global_userByEmail.get(email);
		}
		Datastore datastore = getDatastore();
		Query<Entity> query = Query.newEntityQueryBuilder()
			 .setKind(KIND)
			 .setFilter(PropertyFilter.eq("email", email))
			 .build();
		
		QueryResults<Entity> tasks = datastore.run(query);
		if(!tasks.hasNext())return null;
		Entity retrieved =tasks.next();
		User user = buildUser(retrieved);
		return user;

	}

	public static User get(String taskKeyID) {

		try {
			Datastore datastore = getDatastore();
			Key taskKey = datastore.newKeyFactory().setKind(KIND).newKey(taskKeyID);
			Entity retrieved = datastore.get(taskKey);
			if(retrieved==null) {
				return null;
			}
//			System.out.printf("Retrieved %s: %s%n", taskKey.getName(), retrieved.getString("email"));

			User user = buildUser(retrieved);
			return user;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void upsert(User user) throws FileNotFoundException, IOException {
		
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
			// The name/ID for the new entity
			// The Cloud Datastore key for the new entity
			Key taskKey = datastore.newKeyFactory().setKind(KIND).newKey(user.username);

			// Prepares the new entity
			Entity task = Entity.newBuilder(taskKey)
					.set("email", user.email)
					.set("pasword", user.pasword)
					.set("username", user.username)
					.set("resetCode",  user.resetCode)
					.set("lastLogin", DateUtil.nowDate(user.lastLogin))
					.build();

			// Saves the entity
			datastore.put(task);

			System.out.printf("Saved %s: %s%n", task.getKey().getName(), task.getString("email"));

			// Retrieve entity
			Entity retrieved = datastore.get(taskKey);

			System.out.printf("Retrieved %s: %s%n", taskKey.getName(), retrieved.getString("email"));

		

	}
	private static Datastore getDatastore() {
		DatastoreOptions dsOptions = DatastoreOptions.getDefaultInstance();
		Builder builder = dsOptions.toBuilder();
		Datastore datastore = builder.build().getService();
		return datastore;
	}
	private static User buildUser(Entity retrieved) {
		User user = new User();
		user.setEmail(retrieved.getString("email"));
		user.setPasword(retrieved.getString("pasword"));
		user.setUsername(retrieved.getString("username"));
		user.setResetCode(retrieved.getString("resetCode"));
		return user;
	}

}
