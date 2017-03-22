package com.hust.dao.impl;

import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.AdminDao;
import com.hust.entity.Admin;

@Repository
public class AdminDaoImpl extends SqlSessionDaoSupport implements AdminDao{
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public Admin getAdmin(Map adminMap) {
		Admin admin = this.getSqlSession().selectOne("hust.admin.selectAdminByName", adminMap);
		return admin;
	}

	
}
