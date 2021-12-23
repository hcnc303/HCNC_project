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


}
