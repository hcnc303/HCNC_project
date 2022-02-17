package egovframework.example.hcnc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.hcnc.dao.TreeDAO;
import egovframework.example.hcnc.service.TreeService;
import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TreeVO;

@Service
public class TreeServiceImpl implements TreeService {
	@Autowired
	private TreeDAO treeDAO;

	@Override
	public List<TreeVO> selectTree(Search search) throws Exception {
		return treeDAO.selectTree(search);
	}

	@Override
	public void insertTree(TreeVO treeVO) throws Exception {
		treeDAO.insertTree(treeVO);
		
	}

	@Override
	public TreeVO selectDetail(int no) throws Exception {
		return treeDAO.selectDetail(no);
	}

	@Override
	public void updateTree(TreeVO treeVO) throws Exception {
		treeDAO.updateTree(treeVO);
		
	}

	@Override
	public void deleteTree(int no) throws Exception {
		treeDAO.deleteTree(no);
		
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return treeDAO.getBoardListCnt(search);
	}
	
	

}
