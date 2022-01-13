package egovframework.example.sample.service;

import lombok.Data;

@Data
public class ResultVO {
	private String p_id;
	private String d_id;
	private String d_startdate;
	private String d_enddate;
	private String year;
	private int jan;
	private int feb;
	private int mar;
	private int apr;
	private int may;
	private int jun;
	private int jul;
	private int aug;
	private int sep;
	private int oct;
	private int nov;
	private int dec;

	private ProjectVO projectVO;
	private DeveloperVO developerVO;
	private InputVO inputVO; 
}
