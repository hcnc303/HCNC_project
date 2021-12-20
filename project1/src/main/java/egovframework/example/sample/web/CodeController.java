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

import egovframework.example.sample.service.CodeService;
import egovframework.example.sample.service.DetailCodeVO;
import egovframework.example.sample.service.MasterCodeVO;

@Controller
public class CodeController {
	
	@Resource(name="codeService")
	private CodeService codeService;
	
	@RequestMapping(value="/MsCodeWrite.do")
	public String MscodeWrite() {
		return "code/MsCodeWrite";
	}
	
	@RequestMapping(value="/DtCodeWrite.do")
	public String DtcodeWrite() {
		return "code/DtCodeWrite";
	}
	
	@RequestMapping(value="/MsCodeWriteSave.do")
	public String insertCode(MasterCodeVO mvo) throws Exception{
		
		String result = codeService.insertMsCode(mvo);
		
		if( result == null) {
			System.out.println("저장완료");
		}
		
		
		return "redirect:DtCodeWrite.do";
		
	}
	
	@RequestMapping(value="/DtCodeWriteSave.do")
	public String insertCode(DetailCodeVO dvo) throws Exception{
		 
		String result = codeService.insertDtCode(dvo);

		
		if( result == null) {
			System.out.println("저장완료");
		}
		
		return "redirect:DtCodeWrite.do";
	}
	
	@RequestMapping(value="/codeList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectCodesList(Model model, MasterCodeVO mvo, DetailCodeVO dvo) throws Exception {
		
		// 총 데이터 개수
		int total = codeService.selectCodesCount(mvo);
		// 총 페이지 수
		int totalPage = (int) Math.ceil((double)total/10);
		
		int viewPage = mvo.getViewPage();
		int startIndex = (viewPage-1) * 10 + 1;
		int endIndex = startIndex + (10 - 1);
		
		mvo.setStartIndex(startIndex);
		mvo.setEndIndex(endIndex);
		
		List<?> list = codeService.selectCodesList(mvo);
		List<?> msList = codeService.selectMsCodeList(mvo);
		List<?> dtList = codeService.selectDtCodeList(dvo);
		model.addAttribute("resultTotal", total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
		model.addAttribute("resultMsList",msList);
		model.addAttribute("resultDtList",dtList);

		//System.out.println("list =====> " + list);


		return "code/NewFile"; 
		
	}
}
