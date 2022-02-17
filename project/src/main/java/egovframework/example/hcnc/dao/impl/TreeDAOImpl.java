package egovframework.example.hcnc.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import egovframework.example.hcnc.dao.TreeDAO;
import egovframework.example.hcnc.service.TreeMapper;
import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TreeVO;

@Repository
public class TreeDAOImpl implements TreeDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<TreeVO> selectTree(Search search) throws Exception {
		TreeMapper mapper = sqlSession.getMapper(TreeMapper.class);
		return mapper.selectTree(search);
	}

	@Override
	public void insertTree(TreeVO treeVO) throws Exception {
		TreeMapper mapper = sqlSession.getMapper(TreeMapper.class);
		 mapper.insertTree(treeVO);
		
	}

	@Override
	public TreeVO selectDetail(int no) throws Exception {
		TreeMapper mapper = sqlSession.getMapper(TreeMapper.class);
		return mapper.selectDetail(no);
	}

	@Override
	public void updateTree(TreeVO treeVO) throws Exception {
		TreeMapper mapper = sqlSession.getMapper(TreeMapper.class);
		 mapper.updateTree(treeVO);
		
	}

	@Override
	public void deleteTree(int no) throws Exception {
		TreeMapper mapper = sqlSession.getMapper(TreeMapper.class);
		 mapper.deleteTree(no);
		
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
        TreeMapper mapper = sqlSession.getMapper(TreeMapper.class);
        return mapper.getBoardListCnt(search);
	}

}
