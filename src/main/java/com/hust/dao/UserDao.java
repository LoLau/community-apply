package com.hust.dao;

import java.util.List;
import java.util.Map;

import com.hust.entity.User;

public interface UserDao {
	public List<User> getAllUser();
	public void addUser(User user);
	public User getUser(Map userMap);
	public User checkUser(String username);
	public int editPass(Map map);
}
