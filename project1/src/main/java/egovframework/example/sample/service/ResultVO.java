package egovframework.example.sample.service;

import lombok.Data;

@Data
public class ResultVO {
	private int no;
	private String p_id;
	private String p_name;
	private String d_id;
	private String d_name;
	private String d_startdate;
	private String d_enddate;
	private String year;
	private float jan;
	private float feb;
	private float mar;
	private float apr;
	private float may;
	private float jun;
	private float jul;
	private float aug;
	private float sep;
	private float oct;
	private float nov;
	private float dec;

	private ProjectVO projectVO;
	private DeveloperVO developerVO;
	private InputVO inputVO; 
}
