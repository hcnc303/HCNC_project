package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.DtCateVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("DeveloperDAO")
public class DeveloperDAO extends EgovAbstractDAO {

	public String insertDev(DeveloperVO vo) {
		return (String) insert("devDAO.insertDev",vo);
	}

	public List<?> selectDevList(DeveloperVO vo) {
		return (List<?>) list("devDAO.selectDevList",vo);
		//ID값은 프로젝트 내에 고유해야함
	}

	public int selectDevTotal(DeveloperVO vo) {
		return (int) select("devDAO.selectDevTotal",vo);
	}

	public DeveloperVO selectDevDetail(String d_id) {
		return (DeveloperVO) select("devDAO.selectDevDetail",d_id);
	}

	public int deleteDev(String d_id) {
		return (int) delete("devDAO.deleteDev",d_id);
	}

	public int updateDev(DeveloperVO vo) {
		return (int) update("devDAO.updateDev",vo);
	}

	public List<?> selectDtCateList(DtCateVO vo) {
		return list("devDAO.selectDtCateList",vo);
	}
	

	public List<?> selectGrade1List(DeveloperVO vo) {
		
		return list("devDAO.selectGrade1List",vo);
	}

	public List<?> selectGrade2List(DeveloperVO vo) {
		return list("devDAO.selectGrade2List",vo);
	}

	public List<?> selectGrade3List(DeveloperVO vo) {
		return list("devDAO.selectGrade3List",vo);
	}

	public List<?> selectGrade4List(DeveloperVO vo) {
		return list("devDAO.selectGrade4List",vo);
	}

	public List<?> selectGrade5List(DeveloperVO vo) {
		return list("devDAO.selectGrade5List",vo);
	}

	public List<?> selectGrade6List(DeveloperVO vo) {
		return list("devDAO.selectGrade6List",vo);
	}
	

	public List<?> selcetTier1List(DeveloperVO vo) {
		return list("devDAO.selcetTier1List",vo);
	}

	public List<?> selcetTier2List(DeveloperVO vo) {
		return list("devDAO.selcetTier2List",vo);
	}

	public List<?> selcetTier3List(DeveloperVO vo) {
		return list("devDAO.selcetTier3List",vo);
	}

	public List<?> selcetTier4List(DeveloperVO vo) {
		return list("devDAO.selcetTier4List",vo);
	}


}
