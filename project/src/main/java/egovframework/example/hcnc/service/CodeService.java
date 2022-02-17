package egovframework.example.hcnc.service;

import java.util.List;

import egovframework.example.hcnc.vo.CodeVo;

public interface CodeService {

	public List<CodeVo> selectCode(CodeVo codeVo) throws Exception;

	public void insertCode(CodeVo codeVo) throws Exception;
	 
    public CodeVo selectDetail(int type_no) throws Exception;
 
    public void updateCode(CodeVo codeVo) throws Exception;
 
    public void deleteCode(int type_no) throws Exception;	
	
}
