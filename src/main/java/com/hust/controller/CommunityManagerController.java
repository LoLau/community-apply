package com.hust.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.Application;
import com.hust.entity.Community;
import com.hust.entity.Recruit;
import com.hust.entity.User;
import com.hust.service.ApplyHandelService;
import com.hust.service.CommunityApplyService;
import com.hust.service.CommunityService;
import com.hust.service.UserService;
import com.hust.util.DataGrid;
import com.hust.util.Json;
import com.hust.util.PageHelper;

@Controller
@RequestMapping("/CommunityManager")
public class CommunityManagerController {

	@Autowired
	public CommunityService communityServiceImpl;
	
	@Autowired
	public UserService userServiceImpl;
	
	@Autowired
	public ApplyHandelService applyHandelService;
	
		
	/**
	 * 跳转到社团列表页面
	 */
	@RequestMapping(value = "/communityList", method = RequestMethod.GET)
	public String show() {
		return "admin/community/communityList";
	}
	
	/**
	 * 社团列表
	 */
	@ResponseBody
	@RequestMapping(value = "/getCommunityList")
	public DataGrid getCommunityList(PageHelper pg) {
		return communityServiceImpl.getCommunityList(pg);
	}
	
	/**
	 * 进入创建社团页面
	 */
	@RequestMapping("/createPage")
	public String createCommunity() {
		return "admin/community/createCommunity";
	}
	
	
	/**创建社团*/
	@ResponseBody
	@RequestMapping(value="/addCommunity")
	public Json addCommunity(Community community,
				@RequestParam("src") MultipartFile file, HttpServletRequest request) {
		Json json = new Json();
		
		//上传图片
		String path = request.getSession().getServletContext().getRealPath("/image");
		String fileName = file.getOriginalFilename();  
		 
		File targetFile = new File(path, fileName);  
		if(!targetFile.exists()){  
			targetFile.mkdirs();  
		}  

		try {  
			file.transferTo(targetFile);  
		} catch (Exception e) {  
			e.printStackTrace(); 
			json.setMsg("创建失败");
		}  
		
		community.setSrc_path("/CommunityApply/image/"+fileName);
		if(this.communityServiceImpl.getCommunityByName(community.getName()).size() ==0){
			this.communityServiceImpl.addCommunity(community);
			json.setMsg("创建成功");
			json.setSuccess(true);
		} else {
			json.setMsg("社团已存在，创建失败");
			json.setSuccess(false);
		}
		return json;
	}
	
	
	/**
	 *注销社团 
	 */
	@ResponseBody
	@RequestMapping(value="/deleteCommunity")
	public Json cancelCommunity(String id, HttpServletRequest request) {
		int community_id = Integer.parseInt(id);
		
		Json json = new Json();
		String filePath = communityServiceImpl.getSrcPathById(community_id);
		
		if(filePath != null){
			String[] str = filePath.split("/");
			String fileName = str[3];
			String path = request.getSession().getServletContext().getRealPath("/image");
			File targetFile = new File(path, fileName);
			
			if(targetFile.exists()) {
				try {
					targetFile.delete();
				} catch (Exception e) {
					e.printStackTrace();
					json.setMsg("删除失败");
					json.setSuccess(false);
					return json;
				}
			} 
			try {
				communityServiceImpl.deleteCommunityById(community_id);
			} catch (Exception e) {
				e.printStackTrace();
				json.setMsg("删除失败");
				json.setSuccess(false);
				return json;
			}
			json.setMsg("删除成功");
			json.setSuccess(true);
			return json;
		} else {
			try {
				communityServiceImpl.deleteCommunityById(community_id);
			} catch (Exception e) {
				e.printStackTrace();
				json.setMsg("删除失败");
				json.setSuccess(false);
				return json;
			}
		}
		json.setMsg("删除成功");
		json.setSuccess(true);
		return json;
	}
	
	/**
	 * 跳转到编辑社团界面
	 */
	@RequestMapping("/editPage")
	public ModelAndView editPage(String id) {
		ModelAndView mav = new ModelAndView();
		int community_id = Integer.parseInt(id);
	
		Community community = this.communityServiceImpl.getCommunityById(community_id);
		mav.addObject("community", community);
		mav.setViewName("admin/community/editCommunity");
		return mav;
	}
	
	/**
	 *编辑社团 
	 */
	@ResponseBody
	@RequestMapping(value="/editCommunity")
	public Json editCommunity(Community community) {
		Json json = new Json();
		
		try {
			communityServiceImpl.updateCommunity(community);
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("修改失败");
			json.setSuccess(false);
			return json;
		}
		json.setMsg("修改成功");
		json.setSuccess(true);
		return json;
	}
	
	
	/**
	 * 跳转到社团招募列表页面
	 */
	@RequestMapping(value = "/recruitList", method = RequestMethod.GET)
	public String showRecruit() {
		return "admin/community/recruitList";
	}
	

	/**
	 * 招募列表
	 */
	@ResponseBody
	@RequestMapping(value = "/getRecruitList")
	public DataGrid getRecruitList(PageHelper pg) {
		return communityServiceImpl.getRecruitList(pg);
	}
	
	/**
	 * 跳转到社团招募页面
	 */
	
	@RequestMapping("/recruitPage")
	public ModelAndView recruitPage(String id) {
		ModelAndView mav = new ModelAndView();
		int community_id = Integer.parseInt(id);
	
		Community community = this.communityServiceImpl.getCommunityById(community_id);
		mav.addObject("community", community);
		mav.setViewName("admin/community/communityRecruit");
		return mav;
	}
	
	
	/**
	 * 社团招募
	 */
	@ResponseBody
	@RequestMapping("/communityRecruit")
	public Json communityRecruit(Recruit recruit) {
		Json json = new Json();
		
		if(communityServiceImpl.getRecruitByCommunityId(recruit.getCommunity_id()) == null){
			try{
				communityServiceImpl.addRecruit(recruit);
			}catch(Exception e){
				e.printStackTrace();
				json.setMsg("发布失败");
				json.setSuccess(false);
				return json;
			}
			json.setMsg("发布成功");
			json.setSuccess(true);
			return json;
		} else {
			json.setMsg("招募信息已存在");
			json.setSuccess(false);
			return json;
		}
	}
	
	/**
	 * 删除招募信息
	 */
	@ResponseBody
	@RequestMapping("/deleteRecruit")
	public Json deleteRecruit(String id){
		int community_id = Integer.parseInt(id);
		Json json = new Json();
		
		if(communityServiceImpl.getRecruitByCommunityId(community_id) == null){
			json.setMsg("招募信息为空");
			json.setSuccess(false);
			return json;
		}
		try {
			communityServiceImpl.deleteRecruitById(community_id);
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("删除失败");
			json.setSuccess(false);
			return json;
		}
		json.setMsg("删除成功");
		json.setSuccess(true);
		return json;
	}
	
	
	/**
	 * @author jychai
	 * @param request
	 */
	@RequestMapping("/indi")
	public ModelAndView selectUserCommunityStatus(HttpServletRequest request) {
		String username = (String)request.getSession().getAttribute("currentUser");
		User user =	userServiceImpl.checkUser(username);
		List<Application> applications = applyHandelService.selectStatus(user.getUser_id());
		List<Community> communitys = new ArrayList<Community>();
		for(Application apps : applications) {
			Community c = new Community();
			c.setCommunity_id(apps.getCommunity_id());
			String pos = applyHandelService.getApplyTablePos(apps.getApply_table_id());
			c.setPos_id(pos);
			c.setStatus(apps.getStatus()+"");
			c.setTime(apps.getApply_time());
			communitys.add(c);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community", communitys);
		map.put("user",user);
		ModelAndView mav = new ModelAndView("user/individual_center", map);
		return mav;
	}
}
