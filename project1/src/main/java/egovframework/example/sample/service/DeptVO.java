package egovframework.example.sample.service;

import lombok.Data;

@Data
public class DeptVO {
	
	// 캑체지향 : 캡슐화 (접근지정자 세팅)
	private String deptno;
	private String dname;
	private String loc;

}
