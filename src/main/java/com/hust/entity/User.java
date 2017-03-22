package com.hust.entity;

public class User {
	
	private int user_id;
	private String username;
	private String sex;
	private int age;
	private String password;
	private String academy;
	private String major;
	private String name;

	
	public User(){}
	
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public User(int user_id, String username, String password, int age) {
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.age = age;
	}
	
	public User(String username, String password, int age, String name,
			String sex, String academy, String major) {
		super();
		this.username = username;
		this.password = password;
		this.age = age;
		this.name = name;
		this.sex = sex;
		this.academy = academy;
		this.major = major;
	}

	public User(int user_id, String username, String sex, int age,
			String password, String academy, String major) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.sex = sex;
		this.age = age;
		this.password = password;
		this.academy = academy;
		this.major = major;
	}
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getAge() {
		return age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAcademy() {
		return academy;
	}

	public void setAcademy(String academy) {
		this.academy = academy;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", username=" + username + ", sex="
				+ sex + ", age=" + age + ", password=" + password
				+ ", academy=" + academy + ", major=" + major + ", name="
				+ name + "]";
	}

}
