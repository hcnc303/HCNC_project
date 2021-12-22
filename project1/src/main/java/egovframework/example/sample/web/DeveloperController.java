package egovframework.example.sample.web;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.DeveloperService;
import egovframework.example.sample.service.DeveloperVO;


@Controller
public class DeveloperController {

	@Resource(name="DeveloperService")
	private DeveloperService devService;
	
	@RequestMapping(value="/developerWrite.do")
	public String developerWrite() {
		
		return "dev/developerWrite";
	}
	
	@RequestMapping(value="devWriteSave.do")
	public String InsertDev(DeveloperVO vo) throws Exception {
		
		System.out.println(vo.getDId());
		System.out.println(vo.getDName());
		System.out.println(vo.getDTier());
		System.out.println(vo.getDRole());
		System.out.println(vo.getDJobgrade());
		System.out.println(vo.getDType());
		
		String result = devService.insertDev(vo);
		
		if(result == null) {	// ok
			System.out.println("저장완료");
		} else {
			System.out.println("저장실패");
		}
		
		return "";
	}

	@RequestMapping(value="/devList.do")
	public String selectDevList(DeveloperVO vo, ModelMap model) throws Exception{
		
		//	총 데이터 개수
		int total = devService.selectDevTotal(vo);
		
		//	(double)12/10 -> ceil(1.2) -> Integer(2.0) -> 2
		int totalPage = (int) Math.ceil((double)total/10);
		
		int viewPage = vo.getViewPage();
		// 1 -> 1,10 , // 2-> 11,20 // 3-> 21,30
		// (1-1)*10+1 -> 1
		// (2-1)*10+1 -> 11
		int startIndex = (viewPage-1) * 10 + 1;
		int endIndex = startIndex + (10 - 1);
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> list = devService.selectDevList(vo);
		System.out.println(list);
		
		model.addAttribute("total",total);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("resultList",list);
		
		return "dev/devList";
	}
	
	@RequestMapping(value="/devDetail.do")
	public String selectDevDetail(String dId, ModelMap model) throws Exception{
		 
		DeveloperVO vo = devService.selectDevDetail(dId);
		
		model.addAttribute("devVO",vo);
		
		return "dev/devDetail";
	}
	
	@RequestMapping(value="/devDelete.do")
	public String deleteDev(String dId) throws Exception {
		
		int result = devService.deleteDev(dId);
		if(result == 1) {
			System.out.println("삭제완료");
		} else {
			System.out.println("삭제실패");
		}
		return "redirect:devList.do";
	}
	
	@RequestMapping(value="/devModifyWrite.do")
	public String selectDevModify(String dId, ModelMap model) throws Exception {
		
		DeveloperVO vo = devService.selectDevDetail(dId);
		
		model.addAttribute("vo",vo);
		
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





