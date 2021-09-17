package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DMDao;
import com.example.demo.dao.UsersDao;
import com.example.demo.vo.DMVO;

@Controller
@RequestMapping("/dm/insertDM.do")
public class InsertDMController {
	
	@Autowired
	private DMDao dao;
	@Autowired
	private UsersDao userdao;
	
	public void setDao(DMDao dao) {
		this.dao = dao;
	}

	
	@ResponseBody
	public int insertDM(DMVO d, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User)authentication.getPrincipal();		
		String id = user.getUsername();
		session.setAttribute("u", userdao.getUsers(id));
		System.out.println("insertDM.do 동작함");
		System.out.println("login한 회원의 아이디: "+id);		
		
		int re = dao.insertDM(d);

		return re;
	}
}