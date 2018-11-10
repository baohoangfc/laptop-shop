package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.CategoriesDao;
import dao.ProductDao;
import entity.Product;
import util.StringUtil;

@Controller
@RequestMapping("admin/product")
public class AdminProductController {
	@Autowired
	private CategoriesDao categoriesDao;
	@Autowired
	private ProductDao productDao;
	
	@ModelAttribute
	public void common(ModelMap modelMap) {
		modelMap.addAttribute("alCat", categoriesDao.getItems());
		modelMap.addAttribute("alGua", productDao.getGuaranree());
	}
	
	
	@RequestMapping(value={"{page}",""})
	public String index(@PathVariable(value="page",required=false) Integer page,ModelMap modelMap){
		
		if(page == null){
			page = 1;
		}
		
		int sumPage = (int)(Math.ceil((float)productDao.countItem()/Defines.ROW_COUNT));
		int offset = (page-1)*Defines.ROW_COUNT;
		modelMap.addAttribute("alProduct",productDao.getItems(offset));
		modelMap.addAttribute("sumPage",sumPage);
		modelMap.addAttribute("page",page);	
		return "admin.product.index";
		
	}
	
	@RequestMapping(value="add")
	public String add(){
		return "admin.product.add";
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("objProduct") Product objProduct,@RequestParam("id_categories") int id_categories,BindingResult br,@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request, RedirectAttributes ra){
		
		/*if(br.hasErrors()) {
			return "admin.product.add";
		}*/
		
		//Xử lí upload file
		String filename = cmf.getOriginalFilename();
		if(!filename.isEmpty()){
			//Tạo đường dẫn đến Webcontent
			String appPath = request.getServletContext().getRealPath("");
			String dirPath = appPath + File.separator + Defines.DIR_UPLOAD;
			System.out.println("dirPath: " + dirPath);
			File saveDir = new File(dirPath);
			if(!saveDir.exists()){
				//tạo thư mục nếu chưa có
				saveDir.mkdirs();
			}
			
			String refilename = "";
			File file = null;
			if (!"".equals(filename)) {
				refilename = StringUtil.renameFile(filename);
				// ghi file đã đổi tên database
				String filePath = dirPath + File.separator + refilename;
				file = new File(filePath);
				objProduct.setPicture(refilename);
			} else {
				String filePath = dirPath + File.separator + filename;
				file = new File(filePath);
				objProduct.setPicture(filename);
			}
			
			if(productDao.addItem(objProduct,id_categories) > 0){
				try {
					cmf.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}	
				ra.addFlashAttribute("msg", "Thêm tin thành công !");
				return "redirect:/admin/product";
		} else {
			ra.addFlashAttribute("msg", "Có lỗi khi thêm tin !");
			return "redirect:/admin/product/add";
		}	
	}
	
	@RequestMapping(value="edit/{id_product}")
	public String edit(@PathVariable("id_product") int id_product, ModelMap modelMap,RedirectAttributes ra){
		modelMap.addAttribute("objProduct", productDao.getItem(id_product));
		/*if(landDao.getItem(lid) == null) {
			return "auth.404";
		}*/
		return "admin.product.edit";
	}
	
	@RequestMapping(value="edit/{id_product}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("objProduct") Product objProduct,@PathVariable("id_product") int id_product,@RequestParam("hinhanh") CommonsMultipartFile cmf,HttpServletRequest request,RedirectAttributes ra){
		
		
		String filename = cmf.getOriginalFilename();

		String appPath = request.getServletContext().getRealPath("");
		String dirPath = appPath + File.separator + Defines.DIR_UPLOAD;
		System.out.println("dirPath: " + dirPath);
		File saveDir = new File(dirPath);
		if (!saveDir.exists()) {
			saveDir.mkdir();
		}
		String filePath = dirPath + File.separator + filename;
		File file = new File(filePath);
		/*Timestamp date_create = new Timestamp(new Date().getTime());
		objProduct.setDate_create(date_create);*/

		String refilename = "";
		if (!"".equals(filename)) {
			if (!"".equals(productDao.getItem(id_product).getPicture())) {
				String urlFileDel = dirPath + File.separator + productDao.getItem(id_product).getPicture();
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			
			refilename = StringUtil.renameFile(filename);
			filePath = dirPath + File.separator + refilename;
			file = new File(filePath);
			objProduct.setPicture(refilename);

		} else {
			refilename = productDao.getItem(id_product).getPicture();
			objProduct.setPicture(refilename);
		}
		
		
		if (productDao.editItem(objProduct) > 0) {
			try {
				cmf.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
			}
			ra.addFlashAttribute("msg", "Sửa tin thành công!");
			return "redirect:/admin/product";
			
		} else {
			ra.addFlashAttribute("msg", "Có lỗi trong quá trình sửa!");
			return "redirect:/admin/product/edit";
		}
	
	}
	
	@RequestMapping(value="del/{id_product}")
	public String del(@PathVariable("id_product") int id_product,RedirectAttributes ra){
//		if(productDao.getItem(id_product) == null) {
//			return "auth.404";
//		}
		
		if(productDao.delItem(id_product) > 0){
			ra.addFlashAttribute("msg", "Xóa tin thành công!");
		} else {
			ra.addFlashAttribute("msg", "Có lỗi xảy ra khi xóa !");
		}
		return "redirect:/admin/product";
	}
	
}
