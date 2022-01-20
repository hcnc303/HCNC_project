package egovframework.example.sample.service;

import java.util.List;

public interface ResultService {
	
	public InputVO selectResultDetail(String p_id, String p_name, String d_id, String d_name) throws Exception;
	
	public ResultVO selectResultModifyDetail(String p_id, String p_name, String d_id, String d_name, String year) throws Exception;
	
	public String insertResult(ResultVO rvo) throws Exception;
	
	List<?> selectResultList(ResultVO rvo) throws Exception;

	public int deleteResult(String p_id, String d_id, String year) throws Exception;
	
	public int updateResult(ResultVO rvo) throws Exception ;
	
	List<?> selectDevResultList(ResultVO rvo) throws Exception;

	public List<?> selectMonthResultList(ResultVO rvo) throws Exception;
	
	List<?> selectDevSumList(ResultVO rvo) throws Exception;

}
