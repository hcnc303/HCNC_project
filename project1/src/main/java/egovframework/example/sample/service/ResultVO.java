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
	private double jan;
	private double feb;
	private double mar;
	private double apr;
	private double may;
	private double jun;
	private double jul;
	private double aug;
	private double sep;
	private double oct;
	private double nov;
	private double dec;

	private ProjectVO projectVO;
	private DeveloperVO developerVO;
	private InputVO inputVO; 
}
