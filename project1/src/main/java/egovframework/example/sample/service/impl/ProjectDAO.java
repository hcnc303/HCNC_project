package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.ProjectVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("projectDAO")
public class ProjectDAO extends EgovAbstractDAO {

	public String insertProject(ProjectVO vo) {
		
		return (String) insert("projectDAO.insertProject",vo);
	}

	public List<?> selectProjectList(ProjectVO vo) {
		
		return (List<?>) list("projectDAO.selectProjectList",vo);
	}

	public ProjectVO selectProjectDetail(String p_id) {
		
		return (ProjectVO) select("projectDAO.selectProjectDetail",p_id);
	}

	public int deleteProject(String p_id) {
		
		return (int) delete("projectDAO.deleteProject", p_id);
	}

	public int updateProject(ProjectVO vo) {
		
		return (int) update("projectDAO.updateProject", vo);
	}

	public int selectProjectTotal(ProjectVO vo) {
		
		return (int) select("projectDAO.selectProjectTotal", vo);
	}

	public List<?> selectDtCateList(DtCateVO dVo) {
		
		return list("projectDAO.selectDtCateList", dVo);
	}
	
}
