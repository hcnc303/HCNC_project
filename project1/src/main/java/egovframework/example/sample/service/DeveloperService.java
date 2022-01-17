package egovframework.example.sample.service;

import java.util.List;


public interface DeveloperService {
	//	저장처리
	public String insertDev(DeveloperVO vo) throws Exception;
	//	화면목록
	public List<?> selectDevList(DeveloperVO vo) throws Exception;
	//	Total 개수 얻기
	public int selectDevTotal(DeveloperVO vo) throws Exception;
	//	상세보기
	public DeveloperVO selectDevDetail(String d_id) throws Exception;
	//	삭제처리
	public int deleteDev(String d_id) throws Exception;
	//	수정처리
	public int updateDev(DeveloperVO vo) throws Exception; 
	
	List<?> selectDtCateList(DtCateVO vo) throws Exception;
	
	// 사원 비율
	List<?> selectGrade1List(DeveloperVO vo) throws Exception;
	List<?> selectGrade2List(DeveloperVO vo) throws Exception;
	List<?> selectGrade3List(DeveloperVO vo) throws Exception;
	List<?> selectGrade4List(DeveloperVO vo) throws Exception;
	List<?> selectGrade5List(DeveloperVO vo) throws Exception;
	List<?> selectGrade6List(DeveloperVO vo) throws Exception;
	
	// 등급 비율
	List<?> selcetTier1List(DeveloperVO vo) throws Exception;
	List<?> selcetTier2List(DeveloperVO vo) throws Exception;
	List<?> selcetTier3List(DeveloperVO vo) throws Exception;
	List<?> selcetTier4List(DeveloperVO vo) throws Exception;
	
	
}
