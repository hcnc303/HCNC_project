package egovframework.example.sample.service;

import lombok.Data;

@Data
public class InputVO {
	private int no;
	private String p_id;
	private String d_id;
	private String i_stay;
	private String i_role;
	private String d_startdate;
	private String d_enddate;
	
	private ProjectVO projectVO;
	private DeveloperVO developerVO;

	
}
