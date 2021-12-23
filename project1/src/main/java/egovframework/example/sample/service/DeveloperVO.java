package egovframework.example.sample.service;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DeveloperVO {
	private String d_id;
	//사번
	private String d_name;
	//개발자성명
	private String d_tier;
	//등급
	private String d_jobgrade;
	//직급
	private String d_type;
	//직원구분여부
	
}
