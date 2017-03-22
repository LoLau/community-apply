 package com.hust.dao;

import java.util.List;
import java.util.Map;

import com.hust.entity.Application;
import com.hust.entity.CommunityPosition;
import com.hust.entity.User;

public interface ApplyHandelDao {
	public List<Application> getAllApplyList(Map map);
	
	public int getApplyNumber();
	
	public Application getApplyByApplyId(int id);
	public boolean updateApply(Application apply);
	public void addPosition(CommunityPosition pos);
	public String getApplyTablePos(int apply_table_id);
	public boolean deleteApplyTableById(int apply_table_id);
	public User getUserById(int user_id);
	public int getUserId(int apply_id);
	public List<Application> selectStatus(int id);

}
