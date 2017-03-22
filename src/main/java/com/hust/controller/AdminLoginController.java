package com.hust.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hust.entity.Admin;
import com.hust.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {
	@Autowired
	private AdminService adminServiceImpl;
	
	/**
	 * 登陆处理
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map adminMap = new HashMap();
		adminMap.put("username", username);
		adminMap.put("password", password);
		if (checkPassword(adminMap)) {
			Cookie cookie = new Cookie("user", username+"-"+password);
			cookie.setMaxAge(60*60*24*7);//设置cookie时间为一周
			response.addCookie(cookie);
			
			Admin currentAdmin = new Admin(username, password);
			HttpSession session = request.getSession();
			session.setAttribute("currentAdmin", currentAdmin.getUsername());
			return "admin/adminMain";
		} else {
			return "admin/fail";
		}
	}
	
	/**
	 * 登出处理
	 */
	@RequestMapping("/logout")
	public String logout() {
		return "redirect:login.jsp";
	}
	
	/**
	 * 验证用户
	 */
	public boolean checkPassword(Map adminMap) {
		Admin admin = this.adminServiceImpl.getAdmin(adminMap);
		if(admin != null) {
			return true;
		}
		return false;
	}
}
