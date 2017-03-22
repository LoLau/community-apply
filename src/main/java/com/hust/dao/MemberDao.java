package com.hust.dao;

import java.util.List;
import java.util.Map;

import com.hust.entity.User;

public interface MemberDao {
	public void setPosition(Map memberMap);
	public int totalMember();
	public void cancelMember(String name);
	public List<User> checkMemberInfo(Map map);
	public boolean cancelmemberbyid(Map map);
	public String getUsernameById(int user_id);
}
