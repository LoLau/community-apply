package com.hust.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.CommunityApplyDao;
import com.hust.entity.Application;
import com.hust.entity.Community;

@Repository
public class CommunityApplyDaoImpl extends SqlSessionDaoSupport implements CommunityApplyDao {
	
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public boolean isInCommunity(Application application) {
		int apply_table_id = 0;
		List list = this.getSqlSession().selectList("hust.application.isExistUser",application);
		if(list.size() == 0) { //用户不在申请表中
			return false;
		} else { //用户在申请表中
			apply_table_id=getSqlSession().selectOne("hust.application.isExistUser1",application);
			int status = this.getSqlSession().selectOne("hust.application.isExistUser2",apply_table_id);
			if(status==0) //申请表中用状态为未通过
				return false;
		}
		return true;
	}

	@Override
	public int showApplyResult(String username) {
		int temp=this.getSqlSession().selectOne("hust.application.showApplyResult",username);
		return 0;
	}

	@Override
	public void insertApplyJob(String applyJob) {
		this.getSqlSession().insert("hust.application.insertApplyJob",applyJob);
		
	}

	@Override
	public int searchMaxId() {
		return this.getSqlSession().selectOne("hust.application.searchMaxId");
	}

	@Override
	public int searchUserId(String userName) {
		return  this.getSqlSession().selectOne("hust.application.searchUserId",userName);
	}

	@Override
	public int searchCommunityId(String communityName) {
		return this.getSqlSession().selectOne("hust.application.searchCommunityId",communityName);
	}

	@Override
	public void insertApply(Application application) {
		this.getSqlSession().insert("insertApply",application);
		
	}

	@Override
	public List<Application> showApplyResult(Map map) {
		return this.getSqlSession().selectList("hust.application.selectApplyByName",map);
	}

	@Override
	public int totalMember(String username) {
		return this.getSqlSession().selectOne("hust.application.selectTotalApply",username);
	}

}
