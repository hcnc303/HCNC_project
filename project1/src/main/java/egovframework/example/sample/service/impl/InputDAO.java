package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ProjectVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("inputDAO")
public class InputDAO extends EgovAbstractDAO{

	public String insertInput(InputVO vo) {

		return (String) insert("inputDAO.insertInput", vo);
	}

	public List<?> selectDtCateList(DtCateVO vo) {

		return list("inputDAO.selectDtCateList", vo);
	}

	public List<?> selectDevCateList(DeveloperVO dvo) {
		return list("inputDAO.selectDevCateList", dvo);
	}
	
	public List<?> selectProCateList(ProjectVO pvo) {
		return list("inputDAO.selectProCateList", pvo);
	}

}
