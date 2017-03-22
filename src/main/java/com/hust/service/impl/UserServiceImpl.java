package com.hust.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.UserDao;
import com.hust.entity.User;
import com.hust.service.UserService;

@Transactional
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDaoImpl;
	
	public List<User> getAllUser() {
		return this.userDaoImpl.getAllUser();
	}
	
	public void addUser(User user) {
		this.userDaoImpl.addUser(user);
	}

	public User getUser(Map userMap) {
		return this.userDaoImpl.getUser(userMap);
	}

	public User checkUser(String username) {
		return this.userDaoImpl.checkUser(username);
	}

	@Override
	public int editPass(Map map) {
		return this.userDaoImpl.editPass(map);
	}
	
	
	
}
