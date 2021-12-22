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
	public DeveloperVO selectDevDetail(String dId) throws Exception;
	//	삭제처리
	public int deleteDev(String dId) throws Exception;
	//	수정처리
	public int updateDev(DeveloperVO vo) throws Exception;
}
