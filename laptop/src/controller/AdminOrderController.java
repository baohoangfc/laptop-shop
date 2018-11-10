package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import constant.Defines;
import dao.OrderDao;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	@Autowired
	private OrderDao orderDao;
	
	
	@RequestMapping(value={"{page}",""})
	public String index(@PathVariable(value="page",required=false) Integer page,ModelMap modelMap){
		
		if(page == null){
			page = 1;
		}
		
		int sumPage = (int)(Math.ceil((float)orderDao.countItem()/Defines.ROW_COUNT));
		int offset = (page-1)*Defines.ROW_COUNT;
		modelMap.addAttribute("list",orderDao.getItems(offset));
		modelMap.addAttribute("sumPage",sumPage);
		modelMap.addAttribute("page",page);	
		return "admin.order.index";
		
	}
}
