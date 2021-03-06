package egovframework.example.hcnc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.hcnc.dao.TestDao;
import egovframework.example.hcnc.service.TestService;
import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TestVo;
@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private TestDao testDao;
    
    @Override
    public List<TestVo> selectTest(Search search) throws Exception {
        return testDao.selectTest(search);
    }
 
    @Override
    public void insertTest(TestVo testVo) throws Exception {
        testDao.insertTest(testVo);
    }
 
    @Override
    public TestVo selectDetail(int testId) throws Exception {
        return testDao.selectDetail(testId);
    }
 
    @Override
    public void updateTest(TestVo testVo) throws Exception {
        testDao.updateTest(testVo);
    }
 
    @Override
    public void deleteTest(int testId) throws Exception {
        testDao.deleteTest(testId);
    }
 
    @Override
    public int getBoardListCnt(Search search) throws Exception {
        return testDao.getBoardListCnt(search);
    }

}
