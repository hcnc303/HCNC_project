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
		
		List<?> list1 = devService.selectGrade1List(vo);
		List<?> list2 = devService.selectGrade2List(vo);
		List<?> list3 = devService.selectGrade3List(vo);
		List<?> list4 = devService.selectGrade4List(vo);
		List<?> list5 = devService.selectGrade5List(vo);
		List<?> list6 = devService.selectGrade6List(vo);
		
		List<?> tierlist1 = devService.selcetTier1List(vo);
		List<?> tierlist2 = devService.selcetTier2List(vo);
		List<?> tierlist3 = devService.selcetTier3List(vo);
		List<?> tierlist4 = devService.selcetTier4List(vo);
			
		model.addAttribute("resultList",list);
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("list5",list5);
		model.addAttribute("list6",list6);
		
		model.addAttribute("tierlist1",tierlist1);
		model.addAttribute("tierlist2",tierlist2);
		model.addAttribute("tierlist3",tierlist3);
		model.addAttribute("tierlist4",tierlist4);
		
		
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





