package com.mie.model;

public class Student {
	private String name;
	private String year;
	private String major;
	private String email;
	private String password;
	private String phone;

	public String getName(){return name;}
	public String getYear(){return year;}
	public String getMajor(){return major;}
	public String getEmail(){return email;}
	public String getPassword(){return password;}
	public String getPhone(){return phone;}

	public void setName(String n){name=n;}
	public void setYear(String y){year=y;}
	public void setMajor(String m){major=m;}
	public void setEmail(String e){email=e;}
	public void setPassword(String p){password=p;}
	public void setPhone(String p){phone=p;}

	/*.getName());
			preparedStatement.setString(2, student.getYear());
			preparedStatement.setString(3, student.getMajor());
			preparedStatement.setString(4, student.getEmail());
			preparedStatement.setString(5, student.getPhone());*/
		
}
