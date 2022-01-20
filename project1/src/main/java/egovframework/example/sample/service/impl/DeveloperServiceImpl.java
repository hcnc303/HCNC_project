package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeveloperService;
import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.DtCateVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("DeveloperService")
public class DeveloperServiceImpl extends EgovAbstractServiceImpl 
								  implements DeveloperService{
	
	@Resource(name="DeveloperDAO")
	private DeveloperDAO devDAO;
	
	@Override
	public String insertDev(DeveloperVO vo) throws Exception {
		
		return devDAO.insertDev(vo);	// 사원 저장
	}

	@Override
	public List<?> selectDevList(DeveloperVO vo) throws Exception {
		return devDAO.selectDevList(vo);
	}

	@Override
	public int selectDevTotal(DeveloperVO vo) throws Exception {
		return devDAO.selectDevTotal(vo);
	}

	@Override
	public DeveloperVO selectDevDetail(String d_id) throws Exception {
		return devDAO.selectDevDetail(d_id);
	}

	@Override
	public int deleteDev(String d_id) throws Exception {
		return devDAO.deleteDev(d_id);
	}

	@Override
	public int updateDev(DeveloperVO vo) throws Exception {
		return devDAO.updateDev(vo);
	}

	@Override
	public List<?> selectDtCateList(DtCateVO vo) throws Exception {
		return devDAO.selectDtCateList(vo);
	}

	@Override
	public List<?> selectGrade1List(DeveloperVO vo) throws Exception {
		
		return devDAO.selectGrade1List(vo);
	}

	@Override
	public List<?> selectGrade2List(DeveloperVO vo) throws Exception {
		return devDAO.selectGrade2List(vo);
	}

	@Override
	public List<?> selectGrade3List(DeveloperVO vo) throws Exception {
		return devDAO.selectGrade3List(vo);
	}

	@Override
	public List<?> selectGrade4List(DeveloperVO vo) throws Exception {
		return devDAO.selectGrade4List(vo);
	}

	@Override
	public List<?> selectGrade5List(DeveloperVO vo) throws Exception {
		return devDAO.selectGrade5List(vo);
	}

	@Override
	public List<?> selectGrade6List(DeveloperVO vo) throws Exception {
		return devDAO.selectGrade6List(vo); 
	}

	@Override
	public List<?> selcetTier1List(DeveloperVO vo) throws Exception {
		return devDAO.selcetTier1List(vo); 
	}

	@Override
	public List<?> selcetTier2List(DeveloperVO vo) throws Exception {
		return devDAO.selcetTier2List(vo); 
	}

	@Override
	public List<?> selcetTier3List(DeveloperVO vo) throws Exception {
		return devDAO.selcetTier3List(vo);
	}

	@Override
	public List<?> selcetTier4List(DeveloperVO vo) throws Exception {
		return devDAO.selcetTier4List(vo);
	}
}
