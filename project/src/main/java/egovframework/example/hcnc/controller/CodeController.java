package egovframework.example.hcnc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.hcnc.service.CodeService;
import egovframework.example.hcnc.vo.CodeVo;

@Controller
public class CodeController {
	@Autowired
	private CodeService codeService;
	
	//글목록페이지
    @RequestMapping(value="/codeList.do")
    public String codeListDo(CodeVo codeVo, Model model) throws Exception{
        
        model.addAttribute("list", codeService.selectCode(codeVo));
        
        return "code/codeList";
    }
    
    //글작성페이지
    @RequestMapping(value="/codeRegister.do")
    public String codeRegister(){
        return "code/codeRegister";
    }
    
    //글쓰기
    @RequestMapping(value="/insertCode.do")
    public String write(@ModelAttribute("testVo") CodeVo codeVo) throws Exception {
        codeService.insertCode(codeVo);
        return "redirect:codeList.do";
    }
    
    //글 상세페이지
    @RequestMapping(value="codeDetail.do")
    public String viewForm(Model model, HttpServletRequest request) throws Exception{
    	int type_no = Integer.parseInt(request.getParameter("type_no"));
        
        CodeVo codeVo = codeService.selectDetail(type_no);
        model.addAttribute("vo", codeVo);
         
        return "code/codeDetail";
    }
    
    //코드 수정
    @RequestMapping(value="/updateCode.do")
    public String updateCode(@ModelAttribute("codeVo") CodeVo codeVo) throws Exception {
        codeService.updateCode(codeVo);
        return "redirect:codeDetail.do?type_no="+codeVo.getType_no();
    }
    
    //코드 삭제
    @RequestMapping(value="/deleteCode.do")
    public String deleteCode(HttpServletRequest request) throws Exception {
    	
        int type_no = Integer.parseInt(request.getParameter("type_no"));
        codeService.deleteCode(type_no);
        return "redirect:codeList.do";
    }
	
}
