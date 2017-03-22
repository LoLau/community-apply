package com.hust.service;

import com.hust.entity.Application;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

public interface CommunityApplyService {
	public int showApplyResult(String username);
	public void insertApplyJob(String applyJob);
	public int searchMaxId();
	public int searchUserId(String userName);
	public int searchCommunityId(String communityName);
	public void insertApply(Application application);
	public boolean isInCommunity(Application application);
	public DataGrid showApplyResult(PageHelper pg,String username);
}
