package com.hust.dao.impl;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.CommunityInfoDao;
import com.hust.entity.Community;

@Repository
public class CommunityInfoDaoImpl extends SqlSessionDaoSupport implements CommunityInfoDao {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public Community getCommunityByName(String name) {
		return this.getSqlSession().selectOne("hust.communityInfo.selectCommunityByName",name);
	}
	
}
