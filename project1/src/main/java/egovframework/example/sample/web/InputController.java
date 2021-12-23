package egovframework.example.sample.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InputController {
	@RequestMapping(value="/inputList.do")
	public String selectInputList() {
		return "input/inputList";
		
	}
}
