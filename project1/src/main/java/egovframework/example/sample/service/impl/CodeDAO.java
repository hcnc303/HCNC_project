package egovframework.example.sample.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.CodeVO;

import egovframework.example.sample.service.MsCateVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("codeDAO")
public class CodeDAO extends EgovAbstractDAO {

	public String insertCode(CodeVO cvo) {

		return (String) insert("codeVO.insertCode",cvo);
	}

	public List<?> selectCodeList(CodeVO cvo) {
		// TODO Auto-generated method stub
		return (List<?>) list("codeVO.selectCodeList",cvo);
	}


}
