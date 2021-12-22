package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.DeveloperService;
import egovframework.example.sample.service.DeveloperVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("DeveloperService")
public class DeveloperServiceImpl extends EgovAbstractServiceImpl 
								  implements DeveloperService{
	
	@Resource(name="DeveloperDAO")
	private DeveloperDAO devDAO;
	
	@Override
	public String insertDev(DeveloperVO vo) throws Exception {
		//	프로그램 작성
		return devDAO.insertDev(vo);	// 데이터 저장
	}

	@Override
	public List<?> selectDevList(DeveloperVO vo) throws Exception {
		return devDAO.selectDevList(vo);
	}

	@Override
	public int selectDevTotal(DeveloperVO vo) throws Exception {
		return devDAO.selectDevTotal(vo);
	}

	@Override
	public DeveloperVO selectDevDetail(String dId) throws Exception {
		return devDAO.selectDevDetail(dId);
	}

	@Override
	public int deleteDev(String dId) throws Exception {
		return devDAO.deleteDev(dId);
	}

	@Override
	public int updateDev(DeveloperVO vo) throws Exception {
		return devDAO.updateDev(vo);
	}
}
