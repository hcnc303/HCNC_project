package egovframework.example.hcnc.dao;

import java.util.List;

import egovframework.example.hcnc.vo.CodeVo;

public interface CodeDao {
	public List<CodeVo> selectCode(CodeVo codeVo) throws Exception;
	public void insertCode(CodeVo codeVo) throws Exception;
	public CodeVo selectDetail(int type_no) throws Exception;
	public void updateCode(CodeVo codeVo) throws Exception;
	public void deleteCode(int type_no) throws Exception;
	
}
