package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ManagerDao;
import entity.Manager;

@Controller
@RequestMapping("admin")
public class AdminIndexController {
	@Autowired
	private ManagerDao managerDao;
	
	@RequestMapping("")
	public String index(Principal principal,HttpSession session,ModelMap modelMap){
		Manager objLogin = managerDao.getItemByUsername(principal.getName());
		session.setAttribute("objLogin", objLogin);
		System.out.println("username: "+principal.getName());
		if(objLogin.getRole_id() == 3) {
			session.setAttribute("objLogin", objLogin);
			System.out.println("username: "+principal.getName());
			return "redirect:/";
		} else {
			return "admin.index.index";
		}
		
		
	}
	
	
}
