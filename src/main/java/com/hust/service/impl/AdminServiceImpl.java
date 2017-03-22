package com.hust.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hust.dao.AdminDao;
import com.hust.entity.Admin;
import com.hust.service.AdminService;

@Transactional
@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDaoImpl;
	
	public Admin getAdmin(Map adminMap) {
		return this.adminDaoImpl.getAdmin(adminMap);
	}
	
}
