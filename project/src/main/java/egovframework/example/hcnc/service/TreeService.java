package egovframework.example.hcnc.service;

import java.util.List;

import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TreeVO;

public interface TreeService {
	public List<TreeVO> selectTree(Search search) throws Exception;
	public void insertTree(TreeVO treeVO) throws Exception;
	public TreeVO selectDetail(int no) throws Exception;
	public void updateTree(TreeVO treeVO) throws Exception;
	public void deleteTree(int no) throws Exception;
	public int getBoardListCnt(Search search) throws Exception;
}
