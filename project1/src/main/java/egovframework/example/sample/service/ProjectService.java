package egovframework.example.sample.service;

import java.util.List;

public interface ProjectService {
	public String insertProject(ProjectVO vo) throws Exception;
	public List<?> selectProjectList(ProjectVO vo) throws Exception;
	public ProjectVO selectProjectDetail(String p_id) throws Exception;
	public int deleteProject(String p_id) throws Exception;
	public int updateProject(ProjectVO vo) throws Exception;
	
	public int selectProjectTotal(ProjectVO vo) throws Exception;
	public List<?> selectBuCateList(DtCateVO dVo) throws Exception;
	public List<?> selectLoCateList(DtCateVO dvo) throws Exception;
	public List<?> selectPoCateList(DtCateVO dvo) throws Exception;
}