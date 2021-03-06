package egovframework.example.hcnc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.hcnc.dao.CodeDao;
import egovframework.example.hcnc.service.CodeMapper;
import egovframework.example.hcnc.service.TreeMapper;
import egovframework.example.hcnc.vo.CodeVo;
import egovframework.example.hcnc.vo.Search;

@Repository
public class CodeDaoImpl implements CodeDao {
	
	@Autowired
    private SqlSession sqlSession;

	@Override
	public List<CodeVo> selectCode(Search search) throws Exception {
		
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
        return mapper.selectCode(search);
	}

	@Override
	public void insertCode(CodeVo codeVo) throws Exception {
		
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
        mapper.insertCode(codeVo);
	}
	
	@Override
	public CodeVo selectDetail(int type_no) throws Exception {
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
		return mapper.selectDetail(type_no);
	}

	@Override
	public void updateCode(CodeVo codeVo) throws Exception {
		
		 CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
	     mapper.updateCode(codeVo);
	}
	
	@Override
	public void deleteCode(int type_no) throws Exception {
		
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
        mapper.deleteCode(type_no);
		
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		CodeMapper mapper = sqlSession.getMapper(CodeMapper.class);
        return mapper.getBoardListCnt(search);
	}

	

}
