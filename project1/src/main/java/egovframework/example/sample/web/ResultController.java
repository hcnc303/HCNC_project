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
	public String resultWrite(ResultVO rvo, String p_id, String p_name, String d_id, String d_name, Model model) throws Exception {
		
		InputVO ivo = resultService.selectResultDetail(p_id, p_name, d_id, d_name);
		model.addAttribute("ivo", ivo);
		System.out.println("list=====>" + ivo);
		
		model.addAttribute("rvo",rvo);
		
		return "result/resultWrite";
		
	}
	
	@RequestMapping(value="/resultModifyWrite.do")
	public String resultModify(String p_id, String p_name, String d_id, String d_name, String year, Model model) throws Exception {
		
		ResultVO rvo = resultService.selectResultModifyDetail(p_id, p_name, d_id, d_name, year);
		model.addAttribute("rvo", rvo);
		
		
		return "result/resultModifyWrite";
	}
	
	@RequestMapping(value="/resultWriteSave.do")
	public String insertResult(ResultVO rvo) throws Exception {
		
		String result = resultService.insertResult(rvo);
		
		if(result == null) {
			System.out.println("저장완료");
		}
		
		return "redirect:resultList.do";
		
	}
	
	@RequestMapping(value="/resultModifyWriteSave.do")
	public String updateResult(ResultVO rvo) throws Exception {
		
		int result = resultService.updateResult(rvo);
		if(result == 1) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
		
		return "redirect:/resultList.do";
		
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
	
	@RequestMapping(value="/devResultList.do")
	public String selectDevList(ResultVO rvo, Model model) throws Exception {
		List<?> devList = resultService.selectDevResultList(rvo);
		List<?> devList2 = resultService.selectDevResultList2(rvo);
		List<?> devList3 = resultService.selectDevResultList3(rvo);
		
		List<?> sumList = resultService.selectResultSumList(rvo);
		List<?> sumList2 = resultService.selectResultSumList2(rvo);
		List<?> sumList3 = resultService.selectResultSumList3(rvo);
		
		model.addAttribute("devList", devList);
		model.addAttribute("devList2", devList2);
		model.addAttribute("devList3", devList3);
		
		model.addAttribute("sumList",sumList);
		model.addAttribute("sumList2",sumList2);
		model.addAttribute("sumList3",sumList3);
		return "result/devResultList";
	}
	
	@RequestMapping(value="/monthResultList.do")
	public String selectMonthList(ResultVO rvo, Model model) throws Exception {
		List<?> monthList = resultService.selectMonthResultList(rvo);
		List<?> monthList2 = resultService.selectMonthResultList2(rvo);
		List<?> monthList3= resultService.selectMonthResultList3(rvo);
		
		List<?> sumList = resultService.selectResultSumList(rvo);
		List<?> sumList2 = resultService.selectResultSumList2(rvo);
		List<?> sumList3 = resultService.selectResultSumList3(rvo);
		
		model.addAttribute("monthList", monthList);
		model.addAttribute("monthList2", monthList2);
		model.addAttribute("monthList3", monthList3);
		
		model.addAttribute("sumList",sumList);
		model.addAttribute("sumList2",sumList2);
		model.addAttribute("sumList3",sumList3);
		return "result/monthResultList";
	}
}
