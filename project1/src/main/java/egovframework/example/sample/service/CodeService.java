package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {
	
	// 코드 인서트
	public String insertCode(CodeVO cvo) throws Exception;
	
	// 코드 목록
	public List<?> selectCodeList(CodeVO cvo) throws Exception;
	
}
