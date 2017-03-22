package com.hust.entity;

import java.util.Date;

public class Application {
	
	private int apply_id;
	private int community_id;
	private int user_id;
	private int apply_table_id;
	private String apply_time;
	private int status;
	
	public Application(){}
	
	public Application(int apply_id, int community_id, int user_id,
			int apply_table_id, String applytime, int status) {
		super();
		this.apply_id = apply_id;
		this.community_id = community_id;
		this.user_id = user_id;
		this.apply_table_id = apply_table_id;
		this.apply_time = applytime;
		this.status = status;
	}

	

	public Application(int community_id, int user_id, int apply_table_Id,
			String applytime, int status) {
		super();
		this.community_id = community_id;
		this.user_id = user_id;
		this.apply_table_id = apply_table_Id;
		this.apply_time = applytime;
		this.status = status;
	}

	public int getApply_id() {
		return apply_id;
	}
	public void setApply_id(int apply_id) {
		this.apply_id = apply_id;
	}
	public int getCommunity_id() {
		return community_id;
	}
	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getApply_table_id() {
		return apply_table_id;
	}
	public void setApply_table_id(int apply_table_id) {
		this.apply_table_id = apply_table_id;
	}
	

	public String getApply_time() {
		return apply_time;
	}

	public void setApply_time(String apply_time) {
		this.apply_time = apply_time;
	}

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
