package com.he.blocking.model.service;

import java.util.List;
import java.util.Map;

public interface blockingService {

	

	/**
	 * 고정 확장자 저장 
	 */
	int fixedChkVal(Map<String, String> chkVal);

	/**
	 * 고정 확장자 수정 
	 * @param firstVal 
	 */
	int updateFixedChk(Map<String, String> chkVal);

	/**
	 * 커스텀 확장자 추가
	 */
	int customExeSave(Map<String, String> customExe);

	/**
	 * 커스텀 확장자 삭제
	 */
	int delCustom(Map<String, String> param);

	/**
	 * 고정 확장자 삭제 여부 변경
	 */
//	int updateDelYn(Map<String, String> chkVal);

}
