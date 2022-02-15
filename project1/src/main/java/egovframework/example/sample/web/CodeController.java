package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.CodeVO;
import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.MsCateVO;

@Controller
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/codeWrite.do")
	public String CodeWrite() throws Exception {
		
		return "code/CodeWrite";
	}
	
	@RequestMapping(value="CodeWriteSave.do")
	public String insertCode(CodeVO cvo) throws Exception {
		
		String code = codeService.insertCode(cvo);
		
		if(code == null) {	// ok
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		return "redirect:codeList.do";
	}
	
	
	@RequestMapping(value="/codeList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectCodesList(CodeVO cvo, ModelMap model) throws Exception {
		List<?> codeList = codeService.selectCodeList(cvo);
		
		model.addAttribute("codeList", codeList);

		
		return "code/CodeList"; 
		
	}
	
	@RequestMapping(value="/codeModifyWrite.do")
	public String selectCodesDetail() throws Exception {
		
		return "code/codeModifyWrite";
		
	}
	
	@RequestMapping(value="/codeModifySave.do")
	public String updateCodes() throws Exception {
				
		return "redirect:/codeList.do";
	}
	
}
