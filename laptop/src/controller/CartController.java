package controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.ManagerDao;
import dao.OrderDao;
import dao.PaymentDao;
import dao.ProductDao;
import entity.Item;
import entity.Manager;
import entity.Order;
import entity.OrderDetail;
import util.SlugUtil;


@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ManagerDao managerDao;
	@Autowired
	private SlugUtil slugUtil;
	@Autowired
	private PaymentDao paymentDao;
	
	@ModelAttribute
	public void common(ModelMap modelMap) {
		modelMap.addAttribute("slugUtil", slugUtil);
		modelMap.addAttribute("alPay", paymentDao.getItems());
	}
	
	@RequestMapping("")
	public String index(ModelMap modelMap,Principal principal,HttpSession session) {
		modelMap.put("title", "Cart");
		modelMap.put("title", "cart");
		return "public.laptop.cart";
	}
	
	@RequestMapping(value="buy/{id}",method=RequestMethod.GET)
	public String buy(@PathVariable("id") int id,ModelMap modelMap,HttpSession session) {
		modelMap.put("title", "Cart");
		if(session.getAttribute("cart") == null) {
			ArrayList<Item> cart = new ArrayList<Item>();
			cart.add(new Item(id, 1, productDao.getDetail(id).getName_product(),productDao.getDetail(id).getPrice()));
			session.setAttribute("cart", cart);
		} else {
			List<Item> cart = (List<Item>)session.getAttribute("cart");
			int index = isExists(id, session);
			if(index == -1) {
				cart.add(new Item(id, 1, productDao.getDetail(id).getName_product(),productDao.getDetail(id).getPrice()));
			} else {
				int quantity = cart.get(index).getQuantity() + 1;
				cart.get(index).setQuantity(quantity);
				session.setAttribute("cart", cart);
			}
			session.setAttribute("cart", cart);
		}
		return "public.laptop.cart";
	}
	
	private int isExists(int id,HttpSession session) {
		List<Item> cart = (List<Item>)session.getAttribute("cart");
		for (int i = 0; i < cart.size(); i++)
			if(cart.get(i).getId_product() == id)
				return i;
		return -1;
	}
	
	@RequestMapping(value="del/{index}",method=RequestMethod.GET)
	public String del(@PathVariable("index") int index,ModelMap modelMap,HttpSession session) {
		List<Item> cart = (List<Item>)session.getAttribute("cart");
		cart.remove(index);
		return "redirect:/cart";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public String update(HttpServletRequest request,HttpSession session) {
		List<Item> cart = (List<Item>)session.getAttribute("cart");
		String []quantity = request.getParameterValues("quantity");
		for (int i = 0; i < cart.size(); i++) {
			cart.get(i).setQuantity(Integer.parseInt(quantity[i]));
		}
		session.setAttribute("cart", cart);
		return "redirect:/cart";
	}
	
	@RequestMapping(value="/checkout",method=RequestMethod.GET)
	public String checkout(HttpServletRequest request,HttpSession session) {
		return "public.laptop.checkout";
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(@ModelAttribute("order") Order order,HttpServletRequest request,HttpSession session) {
			List<Item> cart = (List<Item>)session.getAttribute("cart");
			OrderDetail orderDetail = new OrderDetail();
			for (int i = 0; i < cart.size(); i++) {
				order.setTotal(cart.get(i).getPrice()*cart.get(i).getQuantity());
				order.setId_payment(order.getId_payment());
				
				
				orderDetail.setPrice(cart.get(i).getPrice());
				orderDetail.setQuantity(cart.get(i).getQuantity());
				orderDetail.setId_product(cart.get(i).getId_product());
				
				
				orderDao.addItem(order);
				
				orderDetail.setId_order(orderDao.getIdO(order));
				
				orderDao.addDetail(orderDetail);
			
			}
			
			
			session.removeAttribute("cart");
			
			return "public.laptop.checkout";
	}
	
	
	@RequestMapping(value="/save/account",method=RequestMethod.POST)
	public String saveAcc(@ModelAttribute("order") Order order,Principal principal,HttpServletRequest request,HttpSession session) {
				
				if(session.getAttribute("objLogin") == null) {
					return "auth.login";
				} else {
					Manager objLogin = managerDao.getItemByUsername(principal.getName());
					session.setAttribute("objLogin", objLogin);
					
					List<Item> cart = (List<Item>)session.getAttribute("cart");
					OrderDetail orderDetail = new OrderDetail();
					for (int i = 0; i < cart.size(); i++) {
						order.setTotal(cart.get(i).getPrice()*cart.get(i).getQuantity());
						order.setRole_id(objLogin.getMid());
						order.setAddress(objLogin.getAddress());
						order.setEmail(objLogin.getEmail());
						order.setPhone(objLogin.getPhone());
						
						//set giá trị thanh toán
						order.setId_payment(order.getId_payment());
						
						//set giá trị orderdetail
						orderDetail.setPrice(cart.get(i).getPrice());
						orderDetail.setQuantity(cart.get(i).getQuantity());
						orderDetail.setId_product(cart.get(i).getId_product());
						
						//thêm vào order
						orderDao.addItem(order);
						
						//set id_order cho ordersdetail
						orderDetail.setId_order(orderDao.getIdO(order));
						
						//thêm vào ordersdetail
						orderDao.addDetail(orderDetail);
					}
					
					session.removeAttribute("cart");
					
					return "public.laptop.index";
				}
			
		
		
	}
	
	
	
	
	
}
