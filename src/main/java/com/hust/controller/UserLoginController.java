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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hust.entity.User;
import com.hust.service.UserService;
import com.hust.util.Json;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	@Autowired
	private UserService userServiceImpl;
	
	@RequestMapping("/preregister")
	public String preRegister(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		session.removeAttribute("msg");
		return "redirect:/register/register-ui.jsp";
	}
	
	/**
	 * 用户注册
	 */
	@RequestMapping( value ="/register",method=RequestMethod.POST)
	public String register(String username,String password,String age,String name,String sex,String academy,String major,HttpServletRequest request) {
		User user = new User(username, password,Integer.parseInt(age), name, sex, academy, major);
		HttpSession session = request.getSession();
		if(isRegistered(username)) {
			try {
				this.userServiceImpl.addUser(user);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			session.setAttribute("msg", "用户已存在！");
			return "redirect:/register/register-ui.jsp";
		}
		return "redirect:/index.jsp";
	}
	
	/**
	 * 判断是否注册过
	 */
	public boolean isRegistered(String username) {
		User user = this.userServiceImpl.checkUser(username);
		if(user == null) {
			return true;
		}
		return false;
	}
	
	/**
	 * 登陆处理
	 */
	
	@ResponseBody
	@RequestMapping(value="/logIn", method=RequestMethod.POST)
	public Json logIn(User user,HttpServletRequest request,HttpServletResponse response){
		Json json = new Json();
		Map userMap = new HashMap();
		String username = user.getUsername();
		String password = user.getPassword();
		userMap.put("username", username);
		userMap.put("password", password);
		HttpSession session = request.getSession();
		if (checkPassword(userMap)) {
			Cookie cookie = new Cookie("user", username+"-"+password);
			cookie.setMaxAge(60*60*24*7);//设置cookie时间为一周
			response.addCookie(cookie);
			
			User currentUser = new User(username, password);
			
			session.setAttribute("currentUser", currentUser.getUsername());
			json.setMsg("登陆成功");
			json.setSuccess(true);
		} else {
			
			json.setMsg("用户名或密码错误！");
			json.setSuccess(false);
		}
		return json;
	}
	
	/**
	 * 登出处理
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		return "redirect:/index.jsp";
	}

	/**
	 * 验证用户
	 */
	public boolean checkPassword(Map userMap) {
		User user = this.userServiceImpl.getUser(userMap);
		if(user != null) {
			return true;
		}
		return false;
	}
	
	@RequestMapping(value="/editPass")
	public String editPass() {
		return "/user/editpass";
	}
	
	@RequestMapping(value="/userindex")
	public String userindex() {
		return "redirect:/user/userindex.jsp";
	}
	
	
	/**
	 * 跳转到修改密码页面
	 */
	
	@RequestMapping(value="/forgetPass")
	public ModelAndView forgetPass(HttpServletRequest request,HttpServletResponse response){
		String username = (String) request.getAttribute("username");
		ModelAndView mav = new ModelAndView();
		mav.addObject("username", username);
		mav.setViewName("login/editpass");
		return mav;
	}
	/**
	 * 忘记密码
	 */
	@ResponseBody
	@RequestMapping(value="/editPassword" , method = RequestMethod.POST)
	public Json forgetPassword(String password,HttpServletRequest request) {
		Json json = new Json();
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("currentUser");
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("password", password);
		int result = -1;
			result = userServiceImpl.editPass(map);
		if(result == 1) {
			json.setSuccess(true);
			json.setMsg("密码更新成功");
		} else {
			json.setSuccess(false);
			json.setMsg("密码更新失败");
		}
		return json;
	}
	
	/**
	 * 资料完善
	 */
	@RequestMapping("/index")
	public String index() {
		return "redirect:/index.jsp";
	}
}
