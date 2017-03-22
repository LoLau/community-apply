package com.hust.service;

import java.util.List;
import java.util.Map;

import com.hust.entity.Community;
import com.hust.entity.Recruit;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

public interface CommunityService {
	
	public DataGrid getCommunityList(PageHelper pg);
	
	public void addCommunity(Community community);

	public List<Community> getCommunityByName(String name);
	
	public Community getCommunityById(int id);
	
	public void deleteCommunityById(int id);
	
	public void updateCommunity(Community community);
	
	public String getSrcPathById(int id);
	
	public void addRecruit(Recruit recruit);
	
	public Recruit getRecruitByCommunityId(int id);
	
	public DataGrid getRecruitList(PageHelper pg);
	
	public void deleteRecruitById(int id);
	
	public List<Community> selectUserStatus(int id);
}
