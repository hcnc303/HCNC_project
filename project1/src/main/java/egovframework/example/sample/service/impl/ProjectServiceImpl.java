package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.ProjectService;
import egovframework.example.sample.service.ProjectVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("projectService")
public class ProjectServiceImpl extends EgovAbstractServiceImpl implements ProjectService {

	@Resource(name="projectDAO")
	private ProjectDAO projectDAO;
	
	@Override
	public String insertProject(ProjectVO vo) throws Exception {
		
		return projectDAO.insertProject(vo);
	}

	@Override
	public List<?> selectProjectList(ProjectVO vo) throws Exception {
		
		return projectDAO.selectProjectList(vo);
	}

	@Override
	public ProjectVO selectProjectDetail(String p_id) throws Exception {
		
		return projectDAO.selectProjectDetail(p_id);
	}

	@Override
	public int deleteProject(String p_id) throws Exception {
		
		return projectDAO.deleteProject(p_id);
	}

	@Override
	public int updateProject(ProjectVO vo) throws Exception {
		
		return projectDAO.updateProject(vo);
	}

	@Override
	public int selectProjectTotal(ProjectVO vo) throws Exception {
		
		return projectDAO.selectProjectTotal(vo);
	}

	@Override
	public List<?> selectBuCateList(DtCateVO dVo) throws Exception {
		
		return projectDAO.selectBuCateList(dVo);
	}

	@Override
	public List<?> selectLoCateList(DtCateVO dvo) throws Exception {

		return projectDAO.selectLoCateList(dvo);
	}

	@Override
	public List<?> selectPoCateList(DtCateVO dvo) throws Exception {
		
		return projectDAO.selectPoCateList(dvo);
	}

	
	
	
}
