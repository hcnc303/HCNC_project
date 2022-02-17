package egovframework.example.hcnc.service;

import java.util.List;

import egovframework.example.hcnc.vo.CodeVo;
import egovframework.example.hcnc.vo.Search;

public interface CodeService {

	public List<CodeVo> selectCode(Search search) throws Exception;
	public void insertCode(CodeVo codeVo) throws Exception;
    public CodeVo selectDetail(int type_no) throws Exception;
    public void updateCode(CodeVo codeVo) throws Exception;
    public void deleteCode(int type_no) throws Exception;
	public int getBoardListCnt(Search search) throws Exception;	
	
}
