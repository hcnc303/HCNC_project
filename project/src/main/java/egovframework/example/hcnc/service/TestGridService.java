package egovframework.example.hcnc.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface TestGridService {
	/*코드 테이블 구분명 및 코드,구분 검색*/
	public ArrayList<HashMap<String, Object>> getCodeReaderSearch(HashMap<String, Object> hashMap);

	/*코드 수정 테이블 코드추가*/
	public String getCodeAdd(HashMap<String, Object> modelMap);

	/*코드 수정 테이블 코드수정*/
	public String getCodeModify(HashMap<String, Object> modelMap);

	/*코드 수정 테이블 코드검색*/
	public ArrayList<HashMap<String, Object>> getCodeReaderSearch2(HashMap<String, Object> modelMap);

	/*코드 수정 테이블 코드삭제*/
	public String getCodeRemove(HashMap<String, Object> modelMap);

	/*코드 테이블 구분명*/
	public ArrayList<HashMap<String, Object>> fgDescCode1();

	/*코드 존재 유무*/
	public String CodeCheck(String CODE);

	/*구분 존재 유무*/
	public String GubunCheck(String FG);
}
