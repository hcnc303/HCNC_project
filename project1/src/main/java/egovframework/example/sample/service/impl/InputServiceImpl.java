package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.InputService;
import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ProjectVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("inputService")
public class InputServiceImpl extends EgovAbstractServiceImpl implements InputService {
	@Resource(name = "inputDAO")
	private InputDAO inputDAO;

	@Override
	public String insertInput(InputVO vo) throws Exception {

		return inputDAO.insertInput(vo);
	}

	@Override
	public List<?> selectRoCateList(DtCateVO tvo) throws Exception {

		return inputDAO.selectRoCateList(tvo);
	}
	
	@Override
	public List<?> selectSCateList(DtCateVO tvo) throws Exception {

		return inputDAO.selectSCateList(tvo);
	}

	@Override
	public List<?> selectDevCateList(DeveloperVO dvo) throws Exception {
		return inputDAO.selectDevCateList(dvo);
	}

	@Override
	public List<?> selectProCateList(ProjectVO pvo) throws Exception {
		
		return inputDAO.selectProCateList(pvo);
	}

	@Override
	public List<?> selectInputList(InputVO vo) throws Exception {
		
		return inputDAO.selectInputList(vo);
	}

	@Override
	public String insertInput2(InputVO vo) throws Exception {
		
		return inputDAO.insertInput2(vo);
	}

	@Override
	public InputVO selectInputDetail(String p_id, String d_id) throws Exception {
		return inputDAO.selectInputDetail(p_id, d_id);
	}

	@Override
	public int updateInput(InputVO vo) throws Exception {
		return inputDAO.updateInput(vo);
	}

	@Override
	public int deleteInput(String p_id, String d_id) throws Exception {
		return inputDAO.deleteInput(p_id, d_id);
	}



	
}
