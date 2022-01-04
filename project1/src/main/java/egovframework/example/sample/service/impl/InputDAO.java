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

	public List<?> selectRoCateList(DtCateVO tvo) {

		return list("inputDAO.selectRoCateList", tvo);
	}
	
	public List<?> selectSCateList(DtCateVO tvo) {

		return list("inputDAO.selectSCateList", tvo);
	}

	public List<?> selectDevCateList(DeveloperVO dvo) {
		return list("inputDAO.selectDevCateList", dvo);
	}
	
	public List<?> selectProCateList(ProjectVO pvo) {
		return list("inputDAO.selectProCateList", pvo);
	}

	public List<?> selectInputList(InputVO vo) {
		
		return list("inputDAO.selectInputList", vo);
	}
	
	public String insertInput2(InputVO vo) {

		return (String) insert("inputDAO.insertInput2", vo);
	}

	public InputVO selectInputDetail(String d_id) {
		return (InputVO) select("inputDAO.selectInputDetail",d_id);
	}

	public int updateInput(InputVO vo) {
		return (int) update("inputDAO.updateInput",vo);
	}

	public int deleteInput(String d_id) {
		return (int) delete("inputDAO.deleteInput",d_id);
	}


}
