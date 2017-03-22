package com.hust.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.CommunitySearchDao;
import com.hust.entity.Community;
import com.hust.service.CommunitySearchService;

@Service
@Transactional
public class CommunitySearchServiceImpl implements CommunitySearchService {
	
	@Autowired
	private CommunitySearchDao communitySearchDaoImpl;

	@Override
	public List<Community> searchCommunityByName(String name) {
		return communitySearchDaoImpl.searchCommunityByName(name);
	}

	@Override
	public List<Community> searchCommunityByCategory(String type) {
		return communitySearchDaoImpl.searchCommunityByCategory(type);
	}
	
	

}
