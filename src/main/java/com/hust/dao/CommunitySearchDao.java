package com.hust.dao;

import java.util.List;

import com.hust.entity.Community;

public interface CommunitySearchDao {
	
	public List<Community> searchCommunityByName(String name);
	
	public List<Community> searchCommunityByCategory(String type);

}
