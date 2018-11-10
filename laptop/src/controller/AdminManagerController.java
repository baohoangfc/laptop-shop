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

import constant.Defines;
import dao.ManagerDao;
import entity.Manager;


@Controller
@RequestMapping("admin/manager")
public class AdminManagerController {
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@ModelAttribute
	public void common(ModelMap modelMap) {
		modelMap.addAttribute("alRole", managerDao.getItemRole());
	}
	
	@RequestMapping({"{page}",""})
	public String index(@PathVariable(value="page",required=false) Integer page,ModelMap modelMap){
		if(page == null) {
			page = 1;
		}
		int sumPage = (int)(Math.ceil((float)managerDao.countItem()/Defines.ROW_COUNT));
		int offset = (page - 1)*Defines.ROW_COUNT;
		modelMap.addAttribute("alManager", managerDao.getItems(offset));
		modelMap.addAttribute("sumPage", sumPage);
		modelMap.addAttribute("page", page);
		return "admin.manager.index";
	}
	
	@RequestMapping(value="add")
	public String add(ModelMap modelMap){
		return "admin.manager.add";
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("manager") Manager manager,BindingResult br,RedirectAttributes ra,ModelMap modelMap){
		if(br.hasErrors()){
			return "admin.manager.add";
		}
		
		/*if(!manager.getPassword().equals(manager.getRepassword())){
			return "redirect:/admin/manager/add?pass=0";
		}*/
		
		String password = passwordEncoder.encode(manager.getPassword());
		manager.setPassword(password);
		
		
		if (managerDao.addItem(manager) > 0) {
			ra.addFlashAttribute("msg", "Thêm tài khoản thành công!");
			return "redirect:/admin/manager";
		} else {
			ra.addFlashAttribute("msg", "Có lỗi trong quá trình thêm!");
			return "redirect:/admin/manager/add";
		}
	}
	
	@RequestMapping(value="edit/{mid}")
	public String edit(@PathVariable("mid") int mid ,ModelMap modelMap,Principal principal,HttpSession session,RedirectAttributes ra){
		
		Manager objLogin = managerDao.getItemByUsername(principal.getName());
		session.setAttribute("objLogin", objLogin);
		
		if(managerDao.getItem(mid) == null) {
			return "auth.404";
		}
		
		
		if("admin".equals(managerDao.getItem(objLogin.getMid()).getUsername()) || (mid == objLogin.getMid())  ) {
			modelMap.addAttribute("objManager", managerDao.getItem(mid));
			modelMap.addAttribute("alRole", managerDao.getItemRole());
			return "admin.manager.edit";
		} else {
			//ra.addFlashAttribute("msg", "Bạn không thể truy cập !!");
			return "auth.403";
		}
		
	}
	
	@RequestMapping(value="edit/{mid}",method=RequestMethod.POST)
	public String edit(@Valid @ModelAttribute("objManager") Manager objManager,BindingResult br,@PathVariable("mid") int mid, RedirectAttributes ra,ModelMap modelMap){
		if(br.hasErrors()){
			return "admin.manager.edit";
		}
		
		/*if(!objUser.getPassword().equals(objUser.getRepassword())){
			return "redirect:/admin/user/edit/{id}?pass=0";
		}*/
		
		if (!"".equals(objManager.getPassword())) {
			String password = passwordEncoder.encode(objManager.getPassword());
			objManager.setPassword(password);
		} else {
			objManager.setPassword(managerDao.getItem(mid).getPassword());
		}
		
		if (managerDao.editItem(objManager) > 0) {
			ra.addFlashAttribute("msg", "Sửa thành công!");
			return "redirect:/admin/manager";
		} else {
			ra.addFlashAttribute("msg", "Có lỗi trong quá trình sửa!");
			return "redirect:/admin/manager/edit";
		}
		
		
	}
	
	@RequestMapping(value="del/{mid}")
	public String del(@PathVariable("mid") int mid ,RedirectAttributes ra){
		
		
		if(managerDao.getItem(mid) == null) {
			return "auth.404";
		}
		
		if("admin".equals(managerDao.getItem(mid).getUsername())) {
			ra.addFlashAttribute("msg", "Bạn không thể xóa người dùng này!");
			return "redirect:/admin/manager";
		} else {
			if (managerDao.delItem(mid) > 0) {
				ra.addFlashAttribute("msg", "Xóa người dùng thành công!");
			} else {
				ra.addFlashAttribute("msg", "Có lỗi trong quá trình xóa!");
			}
			return "redirect:/admin/manager";
		}
		
		
	}
	
	
}
