package com.hust.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.CommunityDao;
import com.hust.entity.Community;
import com.hust.entity.Recruit;
import com.hust.service.CommunityService;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

@Transactional
@Service
public class CommunityServiceImpl implements CommunityService{

	@Autowired
	public CommunityDao communityDaoImpl;

	public DataGrid getCommunityList(PageHelper pg) {
		DataGrid dg = new DataGrid();
		int page = pg.getPage();
		int rows = pg.getRows();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageSize", rows);   //页面的大小
		map.put("curRow",(page-1)*rows);  //当前记录数
		List<Community> communities = communityDaoImpl.getCommunityList(map);
		dg.setRows(communities);    //设置数据
		dg.setTotal(Long.valueOf(communityDaoImpl.getAllCommunityNumbers()));   //设置数据表格记录数
		return dg;
	}
	
	public DataGrid getRecruitList(PageHelper pg) {
		DataGrid dg = new DataGrid();
		int page = pg.getPage();
		int rows = pg.getRows();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageSize", rows);   //页面的大小
		map.put("curRow",(page-1)*rows);  //当前记录数
		List<Recruit> recruits = communityDaoImpl.getRecruitList(map);
		dg.setRows(recruits);    //设置数据
		dg.setTotal(Long.valueOf(communityDaoImpl.getRecruitNumbers()));   //设置数据表格记录数
		return dg;
	}
	
	public void addCommunity(Community community) {
		 this.communityDaoImpl.addCommunity(community);
	}

	public List<Community> getCommunityByName(String name) {
		return this.communityDaoImpl.getCommunityByName(name);
	}

	public void deleteCommunityById(int id) {
		
		this.communityDaoImpl.deleteCommunityById(id);
	}

	public Community getCommunityById(int id) {
		return this.communityDaoImpl.getCommunityById(id);
	}

	public void updateCommunity(Community community) {
		 this.communityDaoImpl.updateCommunity(community);
	}

	public String getSrcPathById(int id) {
		return this.communityDaoImpl.getSrcPathById(id);
	}

	public void addRecruit(Recruit recruit) {
		 this.communityDaoImpl.addRecruit(recruit);
	}

	public Recruit getRecruitByCommunityId(int id) {
		return this.communityDaoImpl.getRecruitByCommunityId(id);
	}

	public void deleteRecruitById(int id) {
		 this.communityDaoImpl.deleteRecruitById(id);
	}
	
	public List<Community> selectUserStatus(int id) {
		return this.communityDaoImpl.selectUserStatus(id);
	}

}
