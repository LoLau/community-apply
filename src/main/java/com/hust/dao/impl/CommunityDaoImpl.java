package com.hust.dao.impl;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hust.dao.CommunityDao;
import com.hust.entity.Community;
import com.hust.entity.Recruit;

@Repository
public class CommunityDaoImpl extends SqlSessionDaoSupport implements
		CommunityDao {

	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	public void addCommunity(Community community) {
		this.getSqlSession()
				.insert("hust.community.insertCommunity", community);
	}

	public List<Community> getCommunityByName(String name) {
		return this.getSqlSession().selectList(
				"hust.community.selectCommunityByName", name);
	}

	public List<Community> getCommunityList(Map map) {
		return this.getSqlSession().selectList(
				"hust.community.selectAllCommunity", map);
	}

	public int getAllCommunityNumbers() {
		return this.getSqlSession().selectOne(
				"hust.community.selectCountCommunity");
	}

	public int getRecruitNumbers() {
		return this.getSqlSession().selectOne(
				"hust.community.selectCountRecruit");
	}

	public List<Recruit> getRecruitList(Map map) {
		return this.getSqlSession().selectList(
				"hust.community.selectRecruitList", map);
	}

	public void deleteCommunityById(int id) {
		this.getSqlSession().delete("hust.community.deleteCommunityById", id);
	}

	public Community getCommunityById(int id) {
		return this.getSqlSession().selectOne(
				"hust.community.selectCommunityById", id);
	}

	public void updateCommunity(Community community) {
		this.getSqlSession()
				.update("hust.community.updateCommunity", community);
	}

	public String getSrcPathById(int id) {
		return this.getSqlSession().selectOne("hust.community.getSrcPathById",
				id);
	}

	public void addRecruit(Recruit recruit) {
		this.getSqlSession().insert("hust.community.addRecruit", recruit);
	}

	public Recruit getRecruitByCommunityId(int id) {
		return this.getSqlSession().selectOne("hust.community.getRecruitByCommunityId",id);
	}

	public void deleteRecruitById(int id) {
		this.getSqlSession().delete("hust.community.deleteRecruitById", id);
	}

	public List<Community> selectUserStatus(int id) {
		return this.getSqlSession().selectList("hust.community.selectUserStatus", id);
	}
	
	

}
