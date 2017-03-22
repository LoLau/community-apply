package com.hust.dao;

import java.util.List;
import java.util.Map;

import com.hust.entity.Community;
import com.hust.entity.Recruit;

public interface CommunityDao {
	public List<Community> getCommunityList(Map map);
	
	public List<Recruit> getRecruitList(Map map);
	
	public int getAllCommunityNumbers();
	
	public int getRecruitNumbers();
	
	public void addCommunity(Community community);
	
	public List<Community> getCommunityByName(String name);
	
	public Community getCommunityById(int id);
	
	public void deleteCommunityById(int id);
	
	public void updateCommunity(Community community);
	
	public String getSrcPathById(int id);
	
	public void addRecruit(Recruit recruit);
	
	public Recruit getRecruitByCommunityId(int id);

	public void deleteRecruitById(int id);
	
	public List<Community> selectUserStatus(int id);
}
