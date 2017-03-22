package com.hust.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.Community;
import com.hust.entity.User;
import com.hust.service.MemberService;
import com.hust.util.DataGrid;
import com.hust.util.Json;
import com.hust.util.PageHelper;

@Controller
@RequestMapping("/member")
public class MemberManagerController {
	@Autowired
	private MemberService memberServiceImpl;
	
	/**
	 * 成员职位设置
	 */
	@ResponseBody
	@RequestMapping("/setposition")		//测试成功
	public Json setPostiton(String username,String position) {
		Json json = new Json();
		Map memberMap = new HashMap();
		memberMap.put("username",username);
		memberMap.put("position",position);
		this.memberServiceImpl.setPosition(memberMap);
		json.setSuccess(true);
		json.setMsg("修改成功");
		return json;
		
		
	}
	
	@RequestMapping("/setPositionJsp")
	public String setPositionJsp(){
		return "admin/memberManager/setPosition";
	}
	
	
	/**
	 * 成员删除
	 */
	@RequestMapping("/cancelmember")		//测试成功
	public void cancelMember(String username,HttpServletRequest request) {
		//String username=request.getParameter("username");
		this.memberServiceImpl.cancelMember(username);
	}
	
	@ResponseBody
	@RequestMapping("/cancelmemberbyid")
	public Json cancelmemberbyid(String name,String username) throws IOException{
		Map map=new HashMap<String,String>();
		String communityname=name;
		String communityName= new String(communityname.getBytes("ISO-8859-1"),"utf-8");
		map.put("communityName",communityName);
		map.put("username",username);
//		System.out.println(communityName);
//		System.out.println(username);
		boolean result=this.memberServiceImpl.cancelmemberbyid(map);
		Json json = new Json();
		if(result) {
			json.setMsg("删除成功");
			json.setSuccess(true);
		} else {
			json.setMsg("删除失败");
			json.setSuccess(false);
		}
		return json;
	}
	
	@RequestMapping("/cancelMemberJsp")
	public String cancelMemberJsp(){
		return "admin/memberManager/cancelMember";
	}
	
	
	@RequestMapping("/editPage")
	public ModelAndView editPage(String id) {
		ModelAndView mav = new ModelAndView();
		int user_id = Integer.parseInt(id);
	
		String username=this.memberServiceImpl.getUsernameById(user_id);
		mav.addObject("username",username);
		mav.setViewName("admin/memberManager/setPosition");
		return mav;
	}
	
	
	
	
	
	
	/**
	 * 成员数据统计
	 * @return
	 */
	@RequestMapping("/totalmember")
	public int totalMember(){			//测试正确
		int temp=this.memberServiceImpl.totalMember();
		return temp;
	}
	
	
	
	
	/**
	 * 成员信息查看
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkmemberinfo")			//测试正确
	public DataGrid checkMemberInfo(PageHelper pg){
		return this.memberServiceImpl.checkMemberInfo(pg);
	}
	
	
	@RequestMapping("/checkMemberInfoJsp")
	public String checkMemberInfoJsp(){
		return "admin/memberManager/checkMemberInfo";
	}
}
