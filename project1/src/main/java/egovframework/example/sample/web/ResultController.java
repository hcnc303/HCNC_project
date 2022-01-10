package egovframework.example.sample.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.ResultService;

@Controller
public class ResultController {
	
	@Resource(name="resultService")
	private ResultService resultService;
	
	
	@RequestMapping(value="/resultWrite.do")
	public String resultWrite(String p_id,String d_id, Model model) throws Exception {
		
		InputVO ivo = resultService.selectResultDetail(p_id,d_id);
		model.addAttribute("ivo", ivo);
		System.out.println("list=====>" + ivo);
		
		return "result/resultWrite";
		
	}

}
