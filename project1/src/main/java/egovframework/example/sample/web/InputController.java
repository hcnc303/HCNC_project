package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.InputService;
import egovframework.example.sample.service.InputVO;
import egovframework.example.sample.service.MasterCodeVO;
import egovframework.example.sample.service.ProjectVO;


@Controller
public class InputController {
	@Resource(name="inputService")
	private InputService inputService;
	
	@RequestMapping(value="/inputList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectInputList(InputVO vo, Model model) throws Exception {
		
		List<?> list = inputService.selectInputList(vo);
		
		model.addAttribute("resultList", list);
		
		return "input/inputList";
		
	}
	
	@RequestMapping(value="/inputWrite.do")
	public String insertInput(DtCateVO tvo, DeveloperVO dvo, ProjectVO pvo, Model model) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		
		List RoList = inputService.selectRoCateList(tvo);
		List Slist = inputService.selectSCateList(tvo);
		List DevList = inputService.selectDevCateList(dvo);	
		List ProList = inputService.selectProCateList(pvo);
		
		String RoCateList = objm.writeValueAsString(RoList);
		String ScateList = objm.writeValueAsString(Slist);
		String DevCateList = objm.writeValueAsString(DevList);		
		String ProCateList = objm.writeValueAsString(ProList);
		
		model.addAttribute("RoCateList",RoCateList);
		model.addAttribute("ScateList",ScateList);
		model.addAttribute("DevCateList", DevCateList);		
		model.addAttribute("ProCateList", ProCateList);
		model.addAttribute("pvo", pvo);
		
		return "input/inputWrite";
		
	}
	
	@RequestMapping(value="/inputWrite2.do") // 프로젝트 리스트에서 바로 input 입력으로 바로 가게 하는 것
	public String insertInput2(DtCateVO tvo, DeveloperVO dvo, ProjectVO pvo, Model model) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		
		List RoList = inputService.selectRoCateList(tvo);
		List Slist = inputService.selectSCateList(tvo);
		List DevList = inputService.selectDevCateList(dvo);		
		List ProList = inputService.selectProCateList(pvo);
		
		String RoCateList = objm.writeValueAsString(RoList);	
		String ScateList = objm.writeValueAsString(Slist);
		String DevCateList = objm.writeValueAsString(DevList);		
		String ProCateList = objm.writeValueAsString(ProList);
		
		model.addAttribute("RoCateList",RoCateList);
		model.addAttribute("ScateList",ScateList);
		model.addAttribute("DevCateList", DevCateList);	
		model.addAttribute("ProCateList", ProCateList);
		model.addAttribute("pvo", pvo);
		
		return "input/inputWrite2";
		
	}
	
	@RequestMapping(value="/inputWriteSave.do")
	public String insertInput(InputVO vo) throws Exception{
		
		String result = inputService.insertInput(vo);
		

		
		if( result == null) {
			System.out.println("저장완료");
		}
		
		
		return "redirect:inputList.do";
		
	}
	
	@RequestMapping(value="/inputModifyWrite.do")
	public String inputDetail(DtCateVO tvo, String p_id, String d_id, DeveloperVO dvo, ProjectVO pvo, Model model) throws Exception {		
		ObjectMapper objm = new ObjectMapper();
		
		List RoCateList = inputService.selectRoCateList(tvo);		
		List ScateList = inputService.selectSCateList(tvo);
		List DevCateList = inputService.selectDevCateList(dvo);		
		List ProCateList = inputService.selectProCateList(pvo);
		
		//String RoCateList = objm.writeValueAsString(RoList);
		//String ScateList = objm.writeValueAsString(Slist);
		//String DevCateList = objm.writeValueAsString(DevList);		
		//String ProCateList = objm.writeValueAsString(ProList);
		
		model.addAttribute("RoCateList",RoCateList);
		model.addAttribute("ScateList",ScateList);
		model.addAttribute("DevCateList", DevCateList);	
		model.addAttribute("ProCateList", ProCateList);
		model.addAttribute("pvo", pvo);
		
		InputVO vo = inputService.selectInputDetail(p_id,d_id);
		model.addAttribute("vo", vo);
		
		
		return "input/inputModifyWrite";
	}
	
	@RequestMapping(value="/inputModifySave.do")
	public String updateInput(InputVO vo) throws Exception {
		
		int result = inputService.updateInput(vo);
		if(result == 1) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
		
		return "redirect:/inputList.do";
		
	}
		
	
	@RequestMapping(value="/inputDelete.do")
	public String deleteDev(String d_id) throws Exception {
		
		int result = inputService.deleteInput(d_id);
		if(result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		return "redirect:inputList.do";
	} 
}