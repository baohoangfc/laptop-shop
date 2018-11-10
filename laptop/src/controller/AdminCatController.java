package controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dao.CategoriesDao;
import dao.ManagerDao;
import entity.Categories;

@Controller
@RequestMapping("admin/cat")
public class AdminCatController {
	@Autowired
	private CategoriesDao categoriesDao;
	@Autowired
	private ManagerDao managerDao;
	
	@ModelAttribute
	public void addCommon(ModelMap modelMap) {
		modelMap.addAttribute("alCat", categoriesDao.getItems());
		modelMap.addAttribute("alCatAdd", categoriesDao.listCatAdd());
	}
	
	@RequestMapping("")
	public String index(ModelMap modelMap){
		modelMap.addAttribute("alCat", categoriesDao.getItems());
		return "admin.cat.index";
	}
	
	@RequestMapping("add")
	public String add(ModelMap modelMap) {
		return "admin.cat.add";
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objCat") Categories objCat,@RequestParam("cname") String cname,@RequestParam("cid") int cid,BindingResult bindingResult,RedirectAttributes ra){
		
		/*if(bindingResult.hasErrors()){
			return "admin.cat.add";
		}*/
		
		if(!objCat.getCname().trim().equals("")) {
			objCat.setCname(objCat.getCname().trim());
			if(categoriesDao.checkName(objCat))
				if(categoriesDao.addItem(cname,cid) > 0){
					ra.addFlashAttribute("msg", "Thêm danh mục tin thành công !");
					return "redirect:/admin/cat";
				} else {
					ra.addFlashAttribute("msg", "Có lỗi trong quá trình thêm !");
				}
		}
		
		return "admin.cat.add";
		
	}
	
	@RequestMapping(value="del/{id}") // nếu ?id= thì dùng ReParam,
	public String del(@PathVariable("id") int id,RedirectAttributes ra){
		if(managerDao.getItem(id) == null) {
			if(categoriesDao.delItem(id) > 0){
				ra.addFlashAttribute("msg","Xóa danh mục tin thành công");
			} else {
				ra.addFlashAttribute("msg","Có lỗi trong quá trình xóa");
			}
		} else {
			return "auth.404";
		}
		
		return "redirect:/admin/cat";
	}
	
	@RequestMapping("edit")
	public String edit(ModelMap modelMap) {
		modelMap.addAttribute("alCatEdit", categoriesDao.listCatAdd());
		return "admin.cat.edit";
	}
	
	@RequestMapping(value="edit/{id}")
	public String edit(ModelMap modelMap,@PathVariable("id") int id,RedirectAttributes ra){
		modelMap.addAttribute("objCat", categoriesDao.getItem(id));
		if(categoriesDao.getItem(id) == null) {
			return "auth.404";
		}
		return "admin.cat.edit";
	}
	
	@RequestMapping(value="edit/{id}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("objCat") Categories cat,@RequestParam("cid") int cid,@PathVariable("id") int id,RedirectAttributes ra){
		
		
		cat.setCid(id);
		if(!cat.getCname().trim().equals("")) {
			cat.setCname(cat.getCname().trim());
			if(categoriesDao.checkName(cat))
				if(categoriesDao.editItem(cat,cid,id) > 0){
					ra.addFlashAttribute("msg","Sửa danh mục tin thành công");
					return "redirect:/admin/cat";
				} else {
					ra.addFlashAttribute("msg","Có lỗi trong quá trình sửa");
					return "redirect:/admin/cat/edit";
				}
		}
		
		return "admin.cat.edit";
		
		
	}
	
	
	
	
}
