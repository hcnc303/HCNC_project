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
	public List<?> selectDtCateList(DtCateVO vo) throws Exception {

		return inputDAO.selectDtCateList(vo);
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
}
