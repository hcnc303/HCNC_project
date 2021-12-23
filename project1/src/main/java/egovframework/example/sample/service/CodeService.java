package egovframework.example.sample.service;

import java.util.List;

public interface CodeService {

	public String insertMsCode(MasterCodeVO mvo) throws Exception; 
	
	public String insertDtCode(DetailCodeVO dvo) throws Exception;
	
	List<?> selectMsCateList(MsCateVO vo) throws Exception;
	
	List<?> selectCodesList(MasterCodeVO mvo) throws Exception;
	
	List<?> selectMsCodeList(MasterCodeVO mvo) throws Exception;
	
	List<?> selectDtCodeList(DetailCodeVO dvo) throws Exception;	
	
	public int selectCodesCount(MasterCodeVO mvo) throws Exception;
	
	public DetailCodeVO selectCodesDetail(String detailNm) throws Exception;
	
	public int updateCodes(DetailCodeVO vo) throws Exception;
	
}
