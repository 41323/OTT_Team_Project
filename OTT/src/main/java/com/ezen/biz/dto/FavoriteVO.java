package com.ezen.biz.dto;

public class FavoriteVO {
	private String 	user_id;
	private int		ott_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getOtt_id() {
		return ott_id;
	}
	public void setOtt_id(int ott_id) {
		this.ott_id = ott_id;
	}
	
	@Override
	public String toString() {
		return "FavoriteVO [user_id=" + user_id + ", ott_id=" + ott_id + "]";
	}
}
