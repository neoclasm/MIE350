package com.mie.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.mie.model.User;
import com.mie.util.DbUtil;

public class UserDao {
	/**
	 * This class handles the User objects and the login component of the web
	 * app.
	 */
	static Connection currentCon = null;
	static ResultSet rs1 = null;
	static ResultSet rs2 = null;

	public static User login(String username, String password) {
		/**
		 * This method attempts to log the user in based on username and password parameters.
		 */
		Statement stmt = null;
		User u = new User();
		/**
		 * Search through both student and startuprep tables for the user.
		 */
		
		String searchQuery1 = "select * from Student where Email='"
				+ username + "' AND Password='" + password + "'";
		String searchQuery2 = "select * from StartupRep where Email='"
				+ username + "' AND Password='" + password + "'";
		String e="";
		String p="";
		
		try {
			// connect to DB
			currentCon = DbUtil.getConnection();
			stmt = currentCon.createStatement();
			rs1 = stmt.executeQuery(searchQuery1);
			rs2 = stmt.executeQuery(searchQuery2);
			boolean more1 = rs1.next();
			boolean more2 = rs2.next();
			/**
			 * If there are no results from either query, set the user to false.
			 * The person attempting to log in will be redirected to the home
			 * page when isValid is false.
			 */
			
			//the user doesn't exist in either DB
			//either incorrect username or password, or both
			if (!more2&&!more1) {
				u.setValid(false);
			}

			/**
			 * Set the type of the user according to which query returned an entry.
			 */
			else if (more1) {
				//this is a valid student user
				e = rs1.getString("Email");
				p = rs1.getString("Password");
				u.setType("student");
			}
			else if (more2) {
				//this is a valid startup user
				e = rs2.getString("Email");
				p = rs2.getString("Password");
				u.setType("startup rep");
			}
			
			if(more1||more2){
				//in either case (startup rep or student), set valid to true and set email and password within user object
				u.setValid(true);
				u.setEmail(e);
				u.setPassword(p);
			}
		}

		catch (Exception ex) {
			System.out.println("Log In failed: An Exception has occurred! "
					+ ex);
		}
		/**
		 * Return the user object.
		 */
		return u;

	}
}
