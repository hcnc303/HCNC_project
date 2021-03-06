package egovframework.example.sample.service;

import java.util.List;

public interface InputService {

	public String insertInput(InputVO vo) throws Exception;
	
	List<?> selectRoCateList(DtCateVO tvo) throws Exception;
	
	List<?> selectSCateList(DtCateVO tvo) throws Exception;
	
	List<?> selectDevCateList(DeveloperVO dvo) throws Exception;
	
	List<?> selectProCateList(ProjectVO pvo) throws Exception;
	
	List<?> selectInputList(InputVO vo) throws Exception;
	
	public String insertInput2(InputVO vo) throws Exception;
	
	public InputVO selectInputDetail(String p_id, String d_id) throws Exception;
	
	public int updateInput(InputVO vo) throws Exception;
	
	public int deleteInput(String p_id, String d_id) throws Exception;
}


