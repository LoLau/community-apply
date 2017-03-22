package com.hust.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.CommunityInfoDao;
import com.hust.entity.Community;
import com.hust.service.CommunityInfoService;

@Transactional
@Service
public class CommunityInfoServiceImpl implements CommunityInfoService {

	@Autowired
	private CommunityInfoDao communityInfoDaoImpl;
	
	public Community getCommunityByName(String name) {
		return this.communityInfoDaoImpl.getCommunityByName(name);
	}

}
