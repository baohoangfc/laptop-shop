package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoriesDao;
import dao.ManagerDao;
import dao.ProductDao;
import dao.SlideDao;
import entity.Manager;
import util.SlugUtil;

@Controller
public class PublicShopController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private CategoriesDao categoriesDao;
	@Autowired
	private SlideDao slideDao;
	@Autowired
	private SlugUtil slugUtil;
	
	@ModelAttribute
	public void common(ModelMap modelMap) {
		modelMap.addAttribute("alCat", categoriesDao.getItems());
		modelMap.addAttribute("alSlide", slideDao.getItems());
		modelMap.addAttribute("slugUtil", slugUtil);
	}
	
	@RequestMapping("/")
	public String index(ModelMap modelMap,Principal principal,HttpSession session) {
		modelMap.addAttribute("alProduct", productDao.getItems());
		return "public.laptop.index";
	}
	
	
	@RequestMapping("/detail")
	public String detail() {
		return "public.laptop.detail";
	}
	
	@RequestMapping("{name}/{id}.html")
	public String detail(@PathVariable("id") int id,ModelMap modelMap){
		if(productDao.getItem(id) == null) {
			return "auth.404";
		} else {
			modelMap.addAttribute("obj", productDao.getDetail(id));
			return "public.laptop.detail";
		}
		
	}
	
	@RequestMapping(value="user/add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("user") Manager user,BindingResult br,RedirectAttributes ra,ModelMap modelMap){
		
		/*if(br.hasErrors()){
			return "admin.manager.add";
		}*/
		
		String password = passwordEncoder.encode(user.getPassword());
		user.setPassword(password);
		
		
		if (managerDao.addUser(user) > 0) {
			ra.addFlashAttribute("msg", "Đăng kí tài khoản thành công!");
			return "redirect:/admin/manager";
		} else {
			ra.addFlashAttribute("msg", "Có lỗi trong quá trình đăng kí!");
			return "redirect:/auth.login";
		}
		
	}
	
	@RequestMapping("/category")
	public String category() {
		return "public.laptop.category";
	}
	
	@RequestMapping("{name}/{id}")
	public String category(@ModelAttribute("id") int id,ModelMap modelMap) {
		if(productDao.getItemsByCid(id) == null) {
			return "auth.404";
		} else {
			modelMap.addAttribute("itemsP", productDao.getItemsByCid(id));
			return "public.laptop.category";
		}
		
	}
}
