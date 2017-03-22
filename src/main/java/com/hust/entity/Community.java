package com.hust.entity;

public class Community {
	private int community_id;
	private String name;
	private String src_path;
	private String type;
	private String intro; //社团简介
	private String current_situation; //社团现状
	private String status;
	private String pos_id;
	private String time;
	private String create_time;
	
	public Community(){}

	public Community(int community_id,
				String name, 
				String src_path,
				String type, 
				String intro, 
				String current_situation) {
		this.community_id = community_id;
		this.name = name;
		this.src_path = src_path;
		this.type = type;
		this.intro = intro;
		this.current_situation = current_situation;
	}

	
		
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}

	public String getSrc_path() {
		return src_path;
	}

	public void setSrc_path(String src_path) {
		this.src_path = src_path;
	}

	public String getCurrent_situation() {
		return current_situation;
	}

	public void setCurrent_situation(String current_situation) {
		this.current_situation = current_situation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
	

	public String getPos_id() {
		return pos_id;
	}

	public void setPos_id(String pos_id) {
		this.pos_id = pos_id;
	}
	
	

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	
	
	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	@Override
	public String toString() {
		return "Community [communityId=" + community_id + ", name=" + name
				+ ", type=" + type + ", intro=" + intro + ", current_situation="
				+ current_situation + "]";
	}
	
	
}
