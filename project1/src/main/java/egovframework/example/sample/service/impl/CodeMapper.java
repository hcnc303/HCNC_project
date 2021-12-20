package egovframework.example.sample.service.impl;

import java.util.List;

import egovframework.example.sample.service.MasterCodeVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("codeMapper")
public interface CodeMapper {
	
	 List<?> selectCodesList() throws Exception;
}
