 package com.hust.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.ApplyHandelDao;
import com.hust.entity.Application;
import com.hust.entity.CommunityPosition;
import com.hust.entity.User;


@Repository
public class ApplyHandelDaoImpl extends SqlSessionDaoSupport implements ApplyHandelDao{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public List<Application> getAllApplyList(Map map) {
		
		return this.getSqlSession().selectList("hust.applyHandel.selectAllApplyList",map);
	}
	
	@Override
	public int getApplyNumber() {
		
		return this.getSqlSession().selectOne("hust.applyHandel.selectCountApply");
	}

	@Override
	public Application getApplyByApplyId(int id) {
	
		return this.getSqlSession().selectOne("hust.applyHandel.selectApplyById",id);
	}

	@Override
	public boolean updateApply(Application apply) { 
		
	 this.getSqlSession().update("hust.applyHandel.updateApply",apply);
	   return true;
	}

	@Override
	public void addPosition(CommunityPosition pos) {
		this.getSqlSession().insert("hust.position.insertPosistion",pos);
	}

	@Override
	public String getApplyTablePos(int apply_table_id) {
		return this.getSqlSession().selectOne("hust.applyTable.selectApplyTable", apply_table_id);
	}
	
	@Override
	public boolean deleteApplyTableById(int apply_table_id) {
	  this.getSqlSession().delete("hust.applyTable.deleteById",apply_table_id);
	  return true;
	}
	@Override
	public User getUserById(int user_id) {
		return this.getSqlSession().selectOne("hust.userInfo.selectByUserId",user_id);
	}

	@Override
	public int getUserId(int apply_id) {
		
		return this.getSqlSession().selectOne("hust.userInfo.selectUseId",apply_id);
	}

	@Override
	public List<Application> selectStatus(int id) {
		 return this.getSqlSession().selectList("hust.applyHandel.selectStatus", id);
	}
}
