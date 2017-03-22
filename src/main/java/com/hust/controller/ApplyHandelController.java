package com.hust.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.Application;
import com.hust.entity.CommunityPosition;
import com.hust.entity.User;
import com.hust.service.ApplyHandelService;
import com.hust.util.DataGrid;
import com.hust.util.Json;
import com.hust.util.PageHelper;

@Controller
@RequestMapping("/applyHandel")
public class ApplyHandelController {
	
	@Autowired
	public ApplyHandelService applyHandelServiceImpl;

	/**
	 * 查看申请列表
	 */
	@RequestMapping(value="/applyList",method=RequestMethod.GET)
	public String show(){
		return "admin/community/applyList";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/getApplyList")
	public DataGrid getApplyList(PageHelper pg) {
		return applyHandelServiceImpl.getApplyList(pg);
	}
	/**
	 * 同意加入社团
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/approve")
	public Json approve(String id) {
		int apply_id = Integer.parseInt(id);
		Json json = new Json();
		Application application = applyHandelServiceImpl.getApplyListByApplyId(apply_id);
		application.setStatus(1);
		
		int user_id = application.getUser_id();
		int apply_table_id = application.getApply_table_id();
		int community_id = application.getCommunity_id();
		
		String pos = applyHandelServiceImpl.getApplyTablePos(apply_table_id);
		CommunityPosition position = new CommunityPosition(pos,user_id,community_id);
		
		try {
			applyHandelServiceImpl.addPosition(position);
			applyHandelServiceImpl.updateApply(application);
		  	json.setMsg("操作成功");
			json.setSuccess(true);	
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("错误");
			json.setSuccess(false);
		}
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/disApprove")
	public Json disApprove(String id) {
		int apply_id = Integer.parseInt(id);
		Json json = new Json();
		Application application = applyHandelServiceImpl.getApplyListByApplyId(apply_id);
		application.setStatus(0);		
		try {
			applyHandelServiceImpl.updateApply(application);
		  	json.setMsg("操作成功");
			json.setSuccess(true);	
		} catch (Exception e) {
			e.printStackTrace();
			json.setMsg("错误");
			json.setSuccess(false);
		}
		return json;
	}

}
