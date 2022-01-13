package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ResultService;
import egovframework.example.sample.service.ResultVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("resultService")
public class ResultServiceImpl extends EgovAbstractServiceImpl implements ResultService {	
	@Resource(name="resultDAO")
	private ResultDAO resultDAO;

	@Override
	public InputVO selectResultDetail(String p_id, String d_id) throws Exception {
		
		return resultDAO.selectResultDetail(p_id,d_id);
	}

	@Override
	public String insertResult(ResultVO rvo) throws Exception {

		return resultDAO.insertResult(rvo);
	}

	@Override
	public List<?> selectResultList(ResultVO rvo) throws Exception {

		return resultDAO.selectResultList(rvo);
	}

	@Override
	public int deleteResult(String p_id, String d_id, String year) {
		
		return resultDAO.deleteResult(p_id,d_id,year);
	}

}
