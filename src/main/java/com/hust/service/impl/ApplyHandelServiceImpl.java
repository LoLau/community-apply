package com.hust.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.ApplyHandelDao;
import com.hust.entity.Application;
import com.hust.entity.CommunityPosition;
import com.hust.entity.User;
import com.hust.service.ApplyHandelService;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;
@Transactional
@Service
public class ApplyHandelServiceImpl implements ApplyHandelService {
	@Autowired
	public ApplyHandelDao applyHandelDaoImpl;

	@Override
	public DataGrid getApplyList(PageHelper pg) {
		DataGrid dg = new DataGrid();
		int page = pg.getPage();
		int rows = pg.getRows();
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("pageSize", rows);
		map.put("curRow",(page-1)*rows);
		List<Application> apply = applyHandelDaoImpl.getAllApplyList(map);
		dg.setRows(apply);
		dg.setTotal(Long.valueOf(applyHandelDaoImpl.getApplyNumber()));   //设置数据表格记录数
		return dg;
	}

	@Override
	public Application getApplyListByApplyId(int id) {
		return this.applyHandelDaoImpl.getApplyByApplyId(id);

}
	@Override
	public boolean updateApply(Application apply) {
		return this.applyHandelDaoImpl.updateApply(apply);
	}

	@Override
	public void addPosition(CommunityPosition pos) {
		this.applyHandelDaoImpl.addPosition(pos);
		
	}

	@Override
	public String getApplyTablePos(int apply_table_id) {
		 return this.applyHandelDaoImpl.getApplyTablePos(apply_table_id);
	}

	@Override
	public boolean deletApplyTableById(int apply_table_id) {
		
		return this.applyHandelDaoImpl.deleteApplyTableById(apply_table_id);
	}

	@Override
	public User getUserById(int id) {
		return this.applyHandelDaoImpl.getUserById(id);
	}

	@Override
	public int getUserId(int apply_id) {
		
		return this.applyHandelDaoImpl.getUserId(apply_id);
	}
	
	@Override
	public List<Application> selectStatus(int id) {
		return this.applyHandelDaoImpl.selectStatus(id);
	}
}
