package egovframework.example.sample.service;

import java.util.List;

public interface ResultService {
	
	public InputVO selectResultDetail(String p_id,String d_id) throws Exception;
	
	public String insertResult(ResultVO rvo) throws Exception;
	
	List<?> selectResultList(ResultVO rvo) throws Exception;

}
