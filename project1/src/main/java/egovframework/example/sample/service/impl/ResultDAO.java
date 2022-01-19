package egovframework.example.sample.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ResultVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("resultDAO")
public class ResultDAO extends EgovAbstractDAO {
	public InputVO selectResultDetail(String p_id, String p_name, String d_id, String d_name) {
		
		Map map = new HashMap();
			map.put("p_id", p_id);
			map.put("p_name", p_name);
			map.put("d_id", d_id);
			map.put("d_name", d_name);
		
		
		return (InputVO) select("resultDAO.selectResultDetail",map);
		
	}
	
	public ResultVO selectResultModifyDetail(String p_id, String p_name, String d_id, String d_name, String year) {
	
		Map map = new HashMap();
			map.put("p_id", p_id);
			map.put("p_name", p_name);
			map.put("d_id", d_id);
			map.put("d_name", d_name);
			map.put("year",year);
		
		return (ResultVO) select("resultDAO.selectResultModifyDetail", map);
	}

	public String insertResult(ResultVO rvo) {

		return (String) insert("resultDAO.insertResult",rvo);
	}

	public List<?> selectResultList(ResultVO rvo) {

		return list("resultDAO.selectResultList", rvo);
	}

	public int deleteResult(String p_id, String d_id, String year) {
		
		Map map = new HashMap();
			map.put("p_id", p_id);
			map.put("d_id", d_id);
			map.put("year", year);
			
		return (int) delete("resultDAO.deleteResult",map);
	}

	public int updateResult(ResultVO rvo) {

		return (int) update("resultDAO.updateResult", rvo);
	}

	public List<?> selectMonthResultList(ResultVO rvo) {
		
		return list("resultDAO.selectMonthResultList", rvo);
	}



}
