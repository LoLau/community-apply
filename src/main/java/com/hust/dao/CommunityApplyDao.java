package com.hust.dao;

import java.util.List;
import java.util.Map;

import com.hust.entity.Application;

public interface CommunityApplyDao {
	public int showApplyResult(String username);
	public void insertApplyJob(String applyJob);
	public int searchMaxId();
	public int searchUserId(String userName);
	public int searchCommunityId(String communityName);
	public void insertApply(Application application);
	public boolean isInCommunity(Application application);
	public List<Application> showApplyResult(Map<String, Integer> map);
	public int totalMember(String username);
}
