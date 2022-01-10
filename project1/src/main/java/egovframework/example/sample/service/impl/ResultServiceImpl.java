package egovframework.example.sample.service.impl;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ResultService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("resultService")
public class ResultServiceImpl extends EgovAbstractServiceImpl implements ResultService {	
	@Resource(name="resultDAO")
	private ResultDAO resultDAO;

	@Override
	public InputVO selectResultDetail(String p_id, String d_id) throws Exception {
		
		return resultDAO.selectResultDetail(p_id,d_id);
	}

}
