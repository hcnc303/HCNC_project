package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ResultService;
import egovframework.example.sample.service.ResultVO;

@Controller
public class ResultController {
	
	@Resource(name="resultService")
	private ResultService resultService;
	
	
	@RequestMapping(value="/resultWrite.do")
	public String resultWrite(ResultVO rvo, String p_id,String d_id, Model model) throws Exception {
		
		InputVO ivo = resultService.selectResultDetail(p_id,d_id);
		model.addAttribute("ivo", ivo);
		System.out.println("list=====>" + ivo);
		
		model.addAttribute("rvo",rvo);
		
		return "result/resultWrite";
		
	}
	
	@RequestMapping(value="/resultWriteSave.do")
	public String insertResult(ResultVO rvo) throws Exception {
		
		String result = resultService.insertResult(rvo);
		
		if(result == null) {
			System.out.println("저장완료");
		}
		
		return "redirect:resultList.do";
		
	}
	
	@RequestMapping(value="/resultList.do") 
	public String selectResultList(ResultVO rvo, Model model) throws Exception {
		
		List<?> list = resultService.selectResultList(rvo);
		
		model.addAttribute("resultList",list);
		
		return "result/resultList";
		
	}


	@RequestMapping(value="/resultDelete.do")
	public String deleteResult(String p_id, String d_id, String year) throws Exception {
		
		int result = resultService.deleteResult(p_id, d_id, year);
		if(result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		return "redirect:resultList.do";
	} 
}
