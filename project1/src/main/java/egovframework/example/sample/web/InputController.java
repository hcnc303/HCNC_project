package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.example.sample.service.DtCateVO;
import egovframework.example.sample.service.InputService;
import egovframework.example.sample.service.InputVO;


@Controller
public class InputController {
	@Resource(name="inputService")
	private InputService inputService;
	@RequestMapping(value="/inputList.do",method = {RequestMethod.GET, RequestMethod.POST})
	public String selectInputList(InputVO vo) {
		
		return "input/inputList";
		
	}
	
	@RequestMapping(value="/inputWrite.do")
	public String insertInput(DtCateVO vo, Model model) throws Exception {
		
		ObjectMapper objm = new ObjectMapper();
		
		List DtList = inputService.selectDtCateList(vo);
		
		String DtCateList = objm.writeValueAsString(DtList);
		
		model.addAttribute("DtCateList",DtCateList);
		
		return "input/inputWrite";
		
	}
}
