package com.hust.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hust.dao.MemberDao;
import com.hust.entity.User;

@Repository
public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public void setPosition(Map memberMap) {
		this.getSqlSession().update("hust.user.updateUser",memberMap);	
	}

	@Override
	public int totalMember() {	
		return this.getSqlSession().selectOne("hust.user.selectTotalUser");
	}

	@Override
	public void cancelMember(String username) {
		this.getSqlSession().delete("hust.user.cancelMember",username);
	}

	@Override
	public List checkMemberInfo(Map map) {
		return this.getSqlSession().selectList("hust.user.selectUserByName1",map);
	}

	@Override
	public boolean cancelmemberbyid(Map map) {
		this.getSqlSession().delete("hust.application.cancelmemberbyid",map);
		return true;
	}

	@Override
	public String getUsernameById(int user_id) {
		return this.getSqlSession().selectOne("hust.application.getUsernameById",user_id);
	}
	
	
	
	
}
