package egovframework.example.hcnc.dao;

import java.util.List;

import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TestVo;

public interface TestDao {
    public List<TestVo> selectTest(Search search) throws Exception;
    
    public void insertTest(TestVo testVo) throws Exception;
 
    public TestVo selectDetail(int testId)throws Exception;
 
    public void updateTest(TestVo testVo) throws Exception;
 
    public void deleteTest(int testId) throws Exception;
 
    public int getBoardListCnt(Search search) throws Exception;

}
