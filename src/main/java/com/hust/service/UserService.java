package com.hust.service;

import java.util.List;
import java.util.Map;

import com.hust.entity.User;

public interface UserService {
	public List<User> getAllUser();
	public User getUser(Map userMap);
	public User checkUser(String username);
	public void addUser(User user);
	public int editPass(Map map);
}
