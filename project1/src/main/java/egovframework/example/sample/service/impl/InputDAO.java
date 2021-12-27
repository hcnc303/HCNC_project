package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.InputVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("inputDAO")
public class InputDAO extends EgovAbstractDAO{

	public String insertInput(InputVO vo) {

		return (String) insert("inputDAO.insertInput", vo);
	}

	public List<?> selectDtCateList(DtCateVO vo) {

		return list("inputDAO.selectDtCateList", vo);
	}
	
	

}
