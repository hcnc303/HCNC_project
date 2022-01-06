package egovframework.example.sample.service.impl;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.InputVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("resultDAO")
public class ResultDAO extends EgovAbstractDAO {
	public InputVO selectResultDetail(String d_id) {
		
		return (InputVO) select("resultDAO.selectResultDetail",d_id);
		
	}

}
