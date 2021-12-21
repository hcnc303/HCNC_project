package egovframework.example.sample.service;

import java.util.Date;

import lombok.Data;

@Data
public class ProjectVO {
	/* 프로젝트코드 */
	private String p_id;
	
	/* 프로젝트이름*/
	private String p_name;
	
	/* 프로젝트 시작일 */
	private String p_startdate;
	
	/* 프로젝트 종료일 */
	private String p_enddate;
	
	/* 사업장소 */
	private String p_place;
	
	/* 발주처 */ 
	private String p_buyer;
	
	/* 영업당담자 */
	private String p_salesman;
	
	/* 연락처 */
	private String p_tell;
	
	/* 진행과정 */
	private String p_progress;
	
	/* 비고 */
	private String p_note;
}
