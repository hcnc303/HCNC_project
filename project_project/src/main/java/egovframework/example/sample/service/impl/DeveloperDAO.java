package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeveloperVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("DeveloperDAO")
public class DeveloperDAO extends EgovAbstractDAO {

	public String InsertDev(DeveloperVO vo) {
		return (String) insert("DeveloperDAO.InsertDev",vo);
	}

	public List<?> SelectDevList(DeveloperVO vo) {
		return (List<?>) list("DeveloperDAO.SelectDevList",vo);
		//ID값은 프로젝트 내에 고유해야함
	}

	public int selectDevTotal(DeveloperVO vo) {
		return (int) select("devDAO.selectDevTotal",vo);
	}

	public DeveloperVO selectDevDetail(String dId) {
		return (DeveloperVO) select("devDAO.selectDevDetail",dId);
	}

	public int deleteDev(String dId) {
		return (int) delete("devDAO.deleteDev",dId);
	}

	public int updateDev(DeveloperVO vo) {
		return (int) update("devDAO.updateDev",vo);
	}


}
