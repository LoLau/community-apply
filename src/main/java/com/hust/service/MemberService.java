package com.hust.service;

import java.util.Map;

import com.hust.entity.User;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

public interface MemberService {
	public void setPosition(Map memberMap);
	public int totalMember();
	public void cancelMember(String name);
	public DataGrid checkMemberInfo(PageHelper pg);
	public boolean cancelmemberbyid(Map map);
	public String getUsernameById(int user_id);
}
