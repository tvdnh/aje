package com.test.demo;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/writeForm")
	public ModelAndView writeBoard(Model model) {
		ModelAndView mav = new ModelAndView();
		logger.info("writeForm=============");
		mav.setViewName("writeForm");
		return mav;
	}
	
	@RequestMapping(value = "/getBoard2", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBoard2(@RequestBody Map<String, Object> paramMap,Model model
			) {
		logger.info( "getBoard:::========================================"+paramMap.get("title") );
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", "title");
		map.put("content", paramMap.get("content"));
//		mav.addObject("boardList","board");
		return map;
	}
	
}
