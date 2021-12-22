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
import egovframework.example.sample.service.DetailCodeVO;
import egovframework.example.sample.service.MasterCodeVO;

@Controller
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/codeWrite.do")
	public String MscodeWrite() {
		
		return "code/CodeWrite";
	}
	
	
	@RequestMapping(value="/MsCodeWriteSave.do")
	public String insertCode(MasterCodeVO mvo) throws Exception{
		
		String result = codeService.insertMsCode(mvo);
		
		if( result == null) {
			System.out.println("저장완료");
		}
		
		
		return "redirect:CodeWrite";
		
	}
	
	@RequestMapping(value="/DtCodeWriteSave.do")
	public String insertCode(DetailCodeVO dvo) throws Exception{
		 
		String result = codeService.insertDtCode(dvo);

		
		if( result == null) {
			System.out.println("저장완료");
		}
		
		return "redirect:CodeWrite";
	}
	
	@RequestMapping(value="/codeList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectCodesList(Model model, MasterCodeVO mvo, DetailCodeVO dvo) throws Exception {
		
		
		List<?> list = codeService.selectCodesList(mvo);
		List<?> msList = codeService.selectMsCodeList(mvo);
		List<?> dtList = codeService.selectDtCodeList(dvo);
		

		
		
		model.addAttribute("resultList",list);
		model.addAttribute("resultMsList",msList);
		model.addAttribute("resultDtList",dtList);

		//System.out.println("list =====> " + list);


		return "code/CodeList"; 
		
	}
	
	@RequestMapping(value="/codeModifyWrite.do")
	public String selectCodesDetail(String detailNm, Model model) throws Exception {
		DetailCodeVO vo = codeService.selectCodesDetail(detailNm);
		System.out.println("detail======>"+vo);
		model.addAttribute("vo",vo);
		
		return "code/codeModifyWrite";
		
	}
	
	@RequestMapping(value="/codeModifySave.do")
	public String updateCodes(DetailCodeVO vo) throws Exception {
		
		int result = codeService.updateCodes(vo);
		
		return "redirect:/codeList.do";
	}
	
}
