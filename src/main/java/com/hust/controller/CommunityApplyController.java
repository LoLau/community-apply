package com.hust.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.Application;
import com.hust.service.CommunityApplyService;
import com.hust.util.DataGrid;
import com.hust.util.PageHelper;

@Controller
@RequestMapping("/apply")
public class CommunityApplyController {
	
	@Autowired
	private CommunityApplyService communityApplyServiceImpl;
	
	/**
	 * 填写申请表
	 * @throws Exception 
	 */
	@RequestMapping("/fillInTable")
	public String fillInTable(HttpServletRequest request,HttpServletResponse response) throws Exception {
			String userName=request.getParameter("username");
		    int userId = this.communityApplyServiceImpl.searchUserId(userName);
		    String communityName=request.getParameter("communityName");
		    int community_id=this.communityApplyServiceImpl.searchCommunityId(communityName);
		    Application application=new Application();
		    application.setUser_id(userId);
		    application.setCommunity_id(community_id);
			if(isInCommunity(application)){
				//显示该用户已经在社团中
				return "apply/fail";
			}
			
			String applyJob=request.getParameter("applyJob");
			this.communityApplyServiceImpl.insertApplyJob(applyJob);
			int apply_table_id=this.communityApplyServiceImpl.searchMaxId();
			
			int status=0;
			
			String applyDate=request.getParameter("applyDate");
			Application application1=new Application(community_id,userId,apply_table_id,applyDate, status);
			this.communityApplyServiceImpl.insertApply(application1);
			return "apply/success";		//申请成功
	}
	
	/**
	 * 申请结果显示
	 */
	@ResponseBody
	@RequestMapping("/showApplyResult")
	public DataGrid showApplyResult(PageHelper pg,HttpServletRequest request,HttpServletResponse response) {
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("currentUser");
		return this.communityApplyServiceImpl.showApplyResult(pg,username);
	}
	
	/**
	 * 判断是否已加入社团
	 */
	public boolean isInCommunity(Application application) {
		return this.communityApplyServiceImpl.isInCommunity(application);
	}
	
	@RequestMapping(value="/applyChange")
	public ModelAndView applyChange(HttpServletRequest request,HttpServletResponse response) throws IOException{
		Map<String, String> map = new HashMap<String, String>();
		String community = request.getParameter("communityname");
		String communityName = new String(community.getBytes("ISO-8859-1"),"utf-8");
		map.put("communityName", communityName);
		return new ModelAndView("/apply/apply", map);
		
	}
}
