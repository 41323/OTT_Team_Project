package com.ezen.biz.dto;

public class UserVO {
	private String user_id;
	private String password;
	private String role;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", password=" + password + ", role=" + role + "]";
	}
	
}
