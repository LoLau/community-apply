package com.hust.service;

import java.util.List;

import com.hust.entity.Community;

public interface CommunitySearchService {
	
	public List<Community> searchCommunityByName(String name);
	
	public List<Community> searchCommunityByCategory(String type);

}
