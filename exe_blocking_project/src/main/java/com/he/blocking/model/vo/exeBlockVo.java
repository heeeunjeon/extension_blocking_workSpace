package com.he.blocking.model.vo;

import java.sql.Date;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor // 기본생성자
@Setter
@Getter
@ToString
public class exeBlockVo {
	
	private int exeNo; // 확장자 순번 
	private String exeNm; // 확장자명 	
	private String exePath; // 확장자 경로 
	private String exeType; // 확장자 종류 (고정, 커스텀)
	private String exeDelYn; // 확장자 삭제 여부 (Y: 삭제)
	private Date exeSaveDate; // 확장자 저장일시 
}
