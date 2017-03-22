package com.hust.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.CommunityApplyDao;
import com.hust.entity.Application;
import com.hust.entity.User;
import com.hust.service.CommunityApplyService;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

@Service
@Transactional
public class CommunityApplyServiceImpl implements CommunityApplyService {
	
	@Autowired
	private CommunityApplyDao communityApplyDaoImpl;

	@Override
	public boolean isInCommunity(Application application) {
		return this.communityApplyDaoImpl.isInCommunity(application);
	}

	@Override
	public int showApplyResult(String username) {
		return this.communityApplyDaoImpl.showApplyResult(username);
	}

	@Override
	public void insertApplyJob(String applyJob) {
		this.communityApplyDaoImpl.insertApplyJob(applyJob);
		
	}

	@Override
	public int searchMaxId() {
		
		return this.communityApplyDaoImpl.searchMaxId();
	}

	@Override
	public int searchUserId(String userName) {	
			return this.communityApplyDaoImpl.searchUserId(userName);
	}

	@Override
	public int searchCommunityId(String communityName) {
		return this.communityApplyDaoImpl.searchCommunityId(communityName);
	}

	@Override
	public void insertApply(Application application) {
		this.communityApplyDaoImpl.insertApply(application);
		
	}

	@Override
	public DataGrid showApplyResult(PageHelper pg,String username) {
		DataGrid dg = new DataGrid();
		int page = pg.getPage();
		int rows = pg.getRows();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageSize",rows);   //页面的大小
		map.put("curRow",(page-1)*rows);  //当前记录数
		List<Application> applications = communityApplyDaoImpl.showApplyResult(map);
		dg.setRows(applications);    //设置数据
		dg.setTotal(Long.valueOf(communityApplyDaoImpl.totalMember(username)));   //设置数据表格记录数
		return dg;
	}
	
}
