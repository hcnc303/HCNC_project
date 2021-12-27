package egovframework.example.sample.service;

import java.util.List;

public interface InputService {

	public String insertInput(InputVO vo) throws Exception;
	
	List<?> selectDtCateList(DtCateVO vo) throws Exception;
	
}
