package egovframework.example.hcnc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.hcnc.dao.CodeDao;
import egovframework.example.hcnc.service.CodeService;
import egovframework.example.hcnc.vo.CodeVo;
import egovframework.example.hcnc.vo.Search;

@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	private CodeDao codeDao;
	
	@Override
	public List<CodeVo> selectCode(Search search) throws Exception {
		
		return codeDao.selectCode(search);
	}

	@Override
	public void insertCode(CodeVo codeVo) throws Exception {
		
		codeDao.insertCode(codeVo);
	}

	@Override
	public CodeVo selectDetail(int type_no) throws Exception {
		
		return codeDao.selectDetail(type_no);
	}
	
	@Override
	public void updateCode(CodeVo codeVo) throws Exception {
		
		codeDao.updateCode(codeVo);
	}

	@Override
	public void deleteCode(int type_no) throws Exception {
		
		codeDao.deleteCode(type_no);
		
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		
		return codeDao.getBoardListCnt(search);
	}

}
