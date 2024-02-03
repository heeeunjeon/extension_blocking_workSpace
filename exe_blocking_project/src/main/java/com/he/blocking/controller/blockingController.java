package com.he.blocking.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.he.blocking.model.service.blockingService;

@Controller
public class blockingController {

	@Autowired
	private blockingService blockingService;
	
	/**
	 * 고정 확장자 저장, 수정, 삭제 
	 */
	@RequestMapping(value = "/fixedChkSave.do", method = RequestMethod.GET)
	public String saveFixedChk(@RequestParam Map<String, String> chkVal, Model model) {
	    
	    String exeType = chkVal.get("exeType");
	    String exeNm = chkVal.get("exeNm");
	    
        String[] exeNmArray = exeNm.split(",");
        
        if(exeNmArray.length < 2) { // 1이면 신규 저장 insert 
    	    int result = blockingService.fixedChkVal(chkVal);

        } else if (exeNmArray.length > 1) { // 1보다 크면 수정 update  
        	String firstVal = exeNmArray[0]; // exeNmArray의 0번째 값 = 해당 저장된 고정 확장자 순번을 찾기 위해
            chkVal.put("firstVal", firstVal);
        	int result = blockingService.updateFixedChk(chkVal);
        
        } 
//        else if(exeNmArray.length < 1) { // 1보다 작으면 삭제
//        	
//        	blockingService.updateDelYn(chkVal); // 삭제 여부 변경 Y
//          // del_yn이 Y인 데이터 삭제 
//        }

	    return "/blocking/mainPage";
	}
	
	/**
	 * 커스텀 확장자 추가
	 */
	
	@RequestMapping(value = "/customExeSave.do", method = RequestMethod.GET)
	public String customExeSave(@RequestParam Map<String, String> customExe, Model model) {
		
	    if (customExe == null || customExe.isEmpty()) {
	        // costomExe가 null이거나 빈 문자열일 경우 처리
	        model.addAttribute("errorMessage", "커스텀 확장자명은 필수 값입니다.");
	        return "/error/errorPage";
	    }
	    customExe.put("exeType", "커스텀 확장자");
	    String exeNm = customExe.get("exeNm");
	    int result = blockingService.customExeSave(customExe);

	    return "/blocking/mainPage";
	}

	/**
	 * 커스텀 확장자 삭제
	 */
	
	@RequestMapping(value = "/delCustom.do", method = RequestMethod.GET)
	public String delCustom(@RequestParam Map<String, String> param, Model model) {
		
	    if (param == null || param.isEmpty()) {
	        model.addAttribute("errorMessage", "커스텀 확장자명은 필수 값입니다.");
	        return "/error/errorPage";
	    }

	    param.put("exeType", "커스텀 확장자");
	    String exeNm = param.get("exeNm");
	    int result = blockingService.delCustom(param);

	    return "/blocking/mainPage";
	}
	
}
