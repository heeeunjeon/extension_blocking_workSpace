package com.he.blocking.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class blockingServiceimpl implements blockingService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 고정 확장자 저장 
	 */
	@Override
	public int fixedChkVal(Map<String, String> chkVal) {
		int result = 0;
		
		if(chkVal.get("exeNm") != null || chkVal.get("exeNm") != "") {
			result = sqlSession.insert("exeBlockMapper.saveFixedChk", chkVal);
		}
		
		return result;
	}

	/**
	 * 고정 확장자 수정 
	 */
	@Override
	public int updateFixedChk(Map<String, String> chkVal) {
		int result = 0;
		if(chkVal.get("exeNm") != null || chkVal.get("exeNm") != "") {
			result = sqlSession.insert("exeBlockMapper.updateFixedChk", chkVal);
		}
		return result;
	}

	/**
	 * 커스텀 확장자 추가 
	 */
	@Override
	public int customExeSave(Map<String, String> customExe) {
		
		return sqlSession.insert("exeBlockMapper.insertCustomExe", customExe);
	}

	/**
	 * 커스텀 확장자 삭제 
	 */
	@Override
	public int delCustom(Map<String, String> param) {
		
		return sqlSession.insert("exeBlockMapper.deleteCustom", param);
	}

//	/**
//	 * 고정 확장자 삭제 여부 변경
//	 */
//	@Override
//	public int updateDelYn(Map<String, String> chkVal) {
//		
//		return sqlSession.delete("exeBlockMapper.updateDelYn", chkVal);
//	}

}
