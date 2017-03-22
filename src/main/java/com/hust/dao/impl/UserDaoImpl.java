package com.hust.dao.impl;

import java.util.List;


import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.UserDao;
import com.hust.entity.User;

@Repository
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao{

	private List<User> userList ;
		
	public List<User> getAllUser() {
		userList = this.getSqlSession().selectList("hust.user.selectAllUser");
		return userList;
	}
	
	public void addUser(User user) {
		this.getSqlSession().insert("hust.user.insertUser", user);
	}
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public User getUser(Map userMap) {
		User user = this.getSqlSession().selectOne("hust.user.selectUserByName", userMap);
		return user;
	}

	public User checkUser(String username) {
		
		return this.getSqlSession().selectOne("hust.user.checkUser",username);
	}

	public int editPass(Map map) {
		return this.getSqlSession().update("hust.user.editPass",map);
	}

	
}
