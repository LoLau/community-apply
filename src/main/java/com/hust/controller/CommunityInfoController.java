package com.hust.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.Community;
import com.hust.entity.Recruit;
import com.hust.service.CommunityInfoService;
import com.hust.service.CommunitySearchService;
import com.hust.service.CommunityService;


@Controller
@RequestMapping(("/communityInfo"))
public class CommunityInfoController {
	
	@Autowired
	private CommunityInfoService communityInfoServiceImpl;
	
	@Autowired
	private CommunityService communityServiceImpl;
	
	private Community community;

	private Recruit recruit;
	
	@RequestMapping(value="/getCommunity")
	public ModelAndView getCommunity(HttpServletRequest request){
		String name = "";
		try {
			name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace(); 
		} 
		community = this.communityInfoServiceImpl.getCommunityByName(name);
		Map map = new HashMap<String,Community>();
		map.put("community", community);
		return new ModelAndView("jsp/communityInfo",map);
	} 
	
	@RequestMapping(value="/getCommunityInfo")
	public ModelAndView getCommunityInfo() {
		Map map = new HashMap<String,Community>();
		map.put("community", community);
		return new ModelAndView("jsp/communityInfo",map);
	}
	
	@RequestMapping(value="/getRecruit")
	public ModelAndView getRecruit(){
		int community_id = 0;
		if (community != null) {
			community_id = community.getCommunity_id();
		}
		recruit = communityServiceImpl.getRecruitByCommunityId(community_id);
		Map map = new HashMap<String,Recruit>();
		map.put("recruit", recruit);
		map.put("community", community);
		return new ModelAndView("jsp/communityRecruit",map);
	}
	
	@RequestMapping(value="/getHonor")
	public ModelAndView getHonor() {
		Map map = new HashMap<String,Recruit>();
		map.put("recruit", recruit);
		map.put("community", community);
		return new ModelAndView("jsp/communityHonor",map);
	}
}
