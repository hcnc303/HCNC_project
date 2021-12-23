package egovframework.example.sample.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.sample.service.DeveloperService;
import egovframework.example.sample.service.DeveloperVO;
import egovframework.example.sample.service.DtCateVO;


@Controller
public class DeveloperController {

	@Resource(name="DeveloperService")
	private DeveloperService devService;
	
	@RequestMapping(value="/developerWrite.do")
	public String developerWrite(DtCateVO vo, Model model) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		List list = devService.selectDtCateList(vo);
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
		return "dev/developerWrite";
	}
	
	@RequestMapping(value="devWriteSave.do")
	public String insertDev(DeveloperVO vo) throws Exception {
		
		System.out.println(vo.getD_id());
		System.out.println(vo.getD_name());
		System.out.println(vo.getD_tier());
		System.out.println(vo.getD_jobgrade());
		System.out.println(vo.getD_type());
		
		String result = devService.insertDev(vo);
		
		if(result == null) {	// ok
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		return "redirect:devList.do";
	}

	@RequestMapping(value="/devList.do")
	public String selectDevList(DeveloperVO vo, ModelMap model) throws Exception{
		
		
		List<?> list = devService.selectDevList(vo);
		System.out.println(list);
		
		model.addAttribute("resultList",list);
		
		return "dev/devList";
	}
	

	
	@RequestMapping(value="/devDelete.do")
	public String deleteDev(String d_id) throws Exception {
		
		int result = devService.deleteDev(d_id);
		if(result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		return "redirect:devList.do";
	}
	
	@RequestMapping(value="/devModifyWrite.do")
	public String selectDevModify(String d_id, ModelMap model, DtCateVO vo) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		List list = devService.selectDtCateList(vo);
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
		DeveloperVO devVO = devService.selectDevDetail(d_id);
		
		model.addAttribute("vo",devVO);
		
		return "dev/devModifyWrite";
	}
	
	@RequestMapping(value="/devModifySave.do")
	public String updateDev(DeveloperVO vo) throws Exception {
		
		int result = devService.updateDev(vo);
		if(result == 1) {
			System.out.println("수정완료");
		} else {
			System.out.println("수정실패");
		}
		
		return "redirect:devList.do";
	}
}





