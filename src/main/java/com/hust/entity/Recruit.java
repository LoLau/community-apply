package com.hust.entity;

public class Recruit {
	
	private int recruit_id;
	private int community_id;
	private String content;
	
	public Recruit() {}
	
	public Recruit(int recruit_id, String content) {
		super();
		this.recruit_id = recruit_id;
		this.content = content;
	}

	public int getRecruit_id() {
		return recruit_id;
	}

	public void setRecruit_id(int recruit_id) {
		this.recruit_id = recruit_id;
	}

	public int getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Recruit [recruit_id=" + recruit_id + ", community_id="
				+ community_id + ", content=" + content + "]";
	}
	
}
