package com.he.blocking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class blockingController {

	@RequestMapping(value="mainPage.do")
	public String mainPage() {
		return "/blocking/mainPage";
	}
}
