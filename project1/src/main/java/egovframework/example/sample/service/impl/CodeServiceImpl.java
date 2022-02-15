package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;

import egovframework.example.sample.service.MsCateVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements CodeService {
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertCode(CodeVO cvo) throws Exception {

		return codeDAO.insertCode(cvo);
	}

	@Override
	public List<?> selectCodeList(CodeVO cvo) throws Exception {
		// TODO Auto-generated method stub
		return codeDAO.selectCodeList(cvo);
	}



}
