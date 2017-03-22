package com.hust.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.CommunitySearchDao;
import com.hust.entity.Community;

@Repository
public class CommunitySearchDaoImpl extends SqlSessionDaoSupport implements CommunitySearchDao {
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public List<Community> searchCommunityByName(String name) {
		return getSqlSession().selectList("hust.search.searchCommunityByName", name);
	}

	@Override
	public List<Community> searchCommunityByCategory(String type) {
		return getSqlSession().selectList("hust.search.searchCommunityByCategory", type);
	}

}
