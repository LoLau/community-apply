package com.hust.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.MemberDao;
import com.hust.entity.Community;
import com.hust.entity.User;
import com.hust.service.MemberService;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

@Transactional
@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao memberDaoImpl;

	@Override
	public void setPosition(Map memberMap) {
		this.memberDaoImpl.setPosition(memberMap);
	}

	@Override
	public int totalMember() {
		return this.memberDaoImpl.totalMember();
	}

	@Override
	public void cancelMember(String name) {
		this.memberDaoImpl.cancelMember(name);
		
	}

	@Override
	public DataGrid checkMemberInfo(PageHelper pg) {
		DataGrid dg = new DataGrid();
		int page = pg.getPage();
		int rows = pg.getRows();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pageSize", rows);   //页面的大小
		map.put("curRow",(page-1)*rows);  //当前记录数
		List users = memberDaoImpl.checkMemberInfo(map);
		dg.setRows(users);    //设置数据
		dg.setTotal(Long.valueOf(memberDaoImpl.totalMember()));   //设置数据表格记录数
		return dg;
	}

	@Override
	public boolean cancelmemberbyid(Map map) {
		return this.memberDaoImpl.cancelmemberbyid(map);
	}

	@Override
	public String getUsernameById(int user_id) {
		return this.memberDaoImpl.getUsernameById(user_id);
	}
	
	
	
}
