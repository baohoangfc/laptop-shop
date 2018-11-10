package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import constant.Defines;
import dao.SlideDao;
import entity.Slide;
import util.StringUtil;

@Controller
@RequestMapping("admin/slide")
public class AdminSlideController {
	@Autowired
	private SlideDao slideDao;
	
	@RequestMapping("")
	public String index(ModelMap modelMap) {
		modelMap.addAttribute("listSlide", slideDao.getItems());
		return "admin.slide.index";
	}
	
	@RequestMapping("add")
	public String add(ModelMap modelMap) {
		return "admin.slide.add";
	}
	
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@ModelAttribute("objSlide") Slide objSlide,@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request,ModelMap modelMap,RedirectAttributes ra) {
		//Xử lí upload file
		String filename = cmf.getOriginalFilename();
		if(!filename.isEmpty()){
			System.out.println("tên file : "+filename);
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
				objSlide.setImage(refilename);
			} else {
				String filePath = dirPath + File.separator + filename;
				file = new File(filePath);
				objSlide.setImage(filename);
			}
			
			
			if(slideDao.addItem(objSlide) > 0){
				try {
					cmf.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
				ra.addFlashAttribute("msg", "Thêm ảnh thành công !");
				return "redirect:/admin/slide";
		} else {
			ra.addFlashAttribute("msg", "Có lỗi khi thêm ảnh !");
			return "redirect:/admin/slide/add";
		}
		
	}
	
	@RequestMapping(value="edit/{id}")
	public String edit(@PathVariable("id") int id,ModelMap modelMap) {
		if(slideDao.getItem(id) == null) {
			return "auth.404";
		}
		modelMap.addAttribute("objSlide", slideDao.getItem(id));
		return "admin.slide.edit";
	}
	
	@RequestMapping(value="edit/{id}",method=RequestMethod.POST)
	public String edit(@ModelAttribute("objSlide") Slide objSlide,@PathVariable("id") int id,@RequestParam("hinhanh") CommonsMultipartFile cmf, HttpServletRequest request,ModelMap modelMap,RedirectAttributes ra) {
		objSlide.setId_slide(id);
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

		String refilename = "";
		if (!"".equals(filename)) {
			if (!"".equals(slideDao.getItem(id).getImage())) {
				String urlFileDel = dirPath + File.separator + slideDao.getItem(id).getImage();
				File delFile = new File(urlFileDel);
				delFile.delete();
			}
			
			refilename = StringUtil.renameFile(filename);
			filePath = dirPath + File.separator + refilename;
			file = new File(filePath);
			objSlide.setImage(refilename);

		} else {
			refilename = slideDao.getItem(id).getImage();
			objSlide.setImage(refilename);
		}
		
		
		if (slideDao.editItem(objSlide) > 0) {
			try {
				cmf.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
			}
			ra.addFlashAttribute("msg", "Sửa tin thành công!");
			return "redirect:/admin/slide";
			
		} else {
			ra.addFlashAttribute("msg", "Có lỗi trong quá trình sửa!");
			return "redirect:/admin/slide/edit";
		}
	}
	
	

}
