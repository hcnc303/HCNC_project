package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.DetailCodeVO;
import egovframework.example.sample.service.MasterCodeVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("codeService")
public class CodeServiceImpl extends EgovAbstractServiceImpl implements CodeService {
	@Resource(name = "codeDAO")
	private CodeDAO codeDAO;

	@Override
	public String insertMsCode(MasterCodeVO mvo) throws Exception {
		
		return codeDAO.insertMsCode(mvo);
	}

	@Override
	public String insertDtCode(DetailCodeVO dvo) throws Exception {
		
		return codeDAO.insertDtCode(dvo);
	}

	@Override
	public List<?> selectCodesList(MasterCodeVO mvo) throws Exception {

		return codeDAO.selectCodesList(mvo);
	}
	
	@Override
	public List<?> selectMsCodeList(MasterCodeVO mvo) throws Exception {

		return codeDAO.selectMsCodeList(mvo);
	}	
	
	@Override
	public List<?> selectDtCodeList(DetailCodeVO dvo) throws Exception {
		
		return codeDAO.selectDtCodeList(dvo);
	}	

	@Override
	public int selectCodesCount(MasterCodeVO mvo) throws Exception {
		
		return codeDAO.selectCodesCount(mvo);
	}

	@Override
	public DetailCodeVO selectCodesDetail(String detailNm) throws Exception {

		return codeDAO.selectCodesDetail(detailNm);
	}

}
