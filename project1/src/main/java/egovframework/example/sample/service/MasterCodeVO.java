package egovframework.example.sample.service;

import lombok.Data;

@Data
public class MasterCodeVO {
	
	private String masterCd;
	private String masterNm;
	
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 10;
	
	private String searchCate;
	private String searchText;

	
	private DetailCodeVO detailCodeVO;





	

}
