package com.hust.entity;

public class CommunityPosition {
	
	private int pos_id;
	private String pos_name;
	private int user_id;
	private int community_id;
	
	public CommunityPosition() {}
	
	public CommunityPosition(int pos_id, String pos_name) {
		this.pos_id = pos_id;
		this.pos_name = pos_name;
	}
	public CommunityPosition(int positionId,String positionName,int userId,int communityId){
		this.pos_id = positionId;
		this.pos_name = positionName;
		this.user_id = userId;
		this.community_id = communityId;
	}
	public CommunityPosition(String positionName,int userId,int communityId){
		this.pos_name = positionName;
		this.user_id = userId;
		this.community_id = communityId;
	}

	public int getPos_id() {
		return pos_id;
	}

	public void setPos_id(int pos_id) {
		this.pos_id = pos_id;
	}

	public String getPos_name() {
		return pos_name;
	}

	public void setPos_name(String pos_name) {
		this.pos_name = pos_name;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(int community_id) {
		this.community_id = community_id;
	}

	

}
