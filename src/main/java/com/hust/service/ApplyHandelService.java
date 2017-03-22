package com.hust.service;
import java.util.List;

import com.hust.entity.Application;
import com.hust.entity.CommunityPosition;
import com.hust.entity.User;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

public interface ApplyHandelService {
		public DataGrid getApplyList(PageHelper pg);
		public Application getApplyListByApplyId(int id);
		public boolean updateApply(Application apply);
		public void addPosition(CommunityPosition pos);
		public String getApplyTablePos(int apply_table_id);
		public boolean deletApplyTableById(int apply_table_id);
		public User getUserById(int user_id);
		public int getUserId(int apply_id);
		public List<Application> selectStatus(int id);
}
