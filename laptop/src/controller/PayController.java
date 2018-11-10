package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="pay")
public class PayController {
	
	@RequestMapping(method=RequestMethod.POST)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="paypal",method=RequestMethod.POST)
	public String paypal() {
		return "index";
	}
}
