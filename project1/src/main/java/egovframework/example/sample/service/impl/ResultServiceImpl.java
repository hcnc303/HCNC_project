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
	public InputVO selectResultDetail(String p_id, String p_name, String d_id, String d_name) throws Exception {
		
		return resultDAO.selectResultDetail(p_id, p_name, d_id, d_name);
	}
	
	@Override
	public ResultVO selectResultModifyDetail(String p_id, String p_name, String d_id, String d_name, String year) throws Exception {
		// TODO Auto-generated method stub
		return resultDAO.selectResultModifyDetail(p_id,p_name,d_id,d_name,year);
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

	@Override
	public int updateResult(ResultVO rvo) throws Exception {
		
		return resultDAO.updateResult(rvo);
	}

	@Override
	public List<?> selectDevResultList(ResultVO rvo) throws Exception {
		
		return resultDAO.selectDevResultList(rvo);
	}
	
	@Override
	public List<?> selectDevResultList2(ResultVO rvo) throws Exception {

		return resultDAO.selectDevResultList2(rvo);
	}

	@Override
	public List<?> selectDevResultList3(ResultVO rvo) throws Exception {

		return resultDAO.selectDevResultList3(rvo);
	}


	@Override
	public List<?> selectResultSumList(ResultVO rvo) throws Exception {
		
		return resultDAO.selectResultSumList(rvo);
	}

	@Override
	public List<?> selectResultSumList2(ResultVO rvo) throws Exception {
		
		return resultDAO.selectResultSumList2(rvo);
	}

	@Override
	public List<?> selectResultSumList3(ResultVO rvo) throws Exception {
		
		return resultDAO.selectResultSumList3(rvo);
	}
	
	@Override
	public List<?> selectMonthResultList(ResultVO rvo) throws Exception {
		return resultDAO.selectMonthResultList(rvo);
	}	

	@Override
	public List<?> selectMonthResultList2(ResultVO rvo) throws Exception {

		return resultDAO.selectMonthResultList2(rvo);
	}

	@Override
	public List<?> selectMonthResultList3(ResultVO rvo) throws Exception {

		return resultDAO.selectMonthResultList3(rvo);
	}



}
