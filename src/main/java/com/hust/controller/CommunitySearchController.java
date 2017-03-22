package com.hust.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.Community;
import com.hust.service.CommunityInfoService;
import com.hust.service.CommunitySearchService;

/**
 * 
 * @author jychai
 *
 */
@Controller
@RequestMapping("/search")
public class CommunitySearchController {
	
	@Autowired
	private CommunitySearchService communitySearchServiceImpl;
	
	@Autowired
	private CommunityInfoService communityInfoService;
	
	/**
	 * 社团搜索
	 */
	@RequestMapping(value="/searchCommunityByName")
	public ModelAndView searchCommunity(HttpServletRequest request) {
		String name = "";
		try {
			name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace(); 
		} 
		Community c = this.communityInfoService.getCommunityByName(name);
		Map<String, Community> mp = new HashMap<String, Community>();
		
		mp.put("community", c);
		return new ModelAndView("/jsp/communityInfo", mp);
	}
	
}
