package egovframework.example.hcnc.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.hcnc.service.TestService;
import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TestVo;

@Controller
public class TestController {
    @Autowired
    private TestService testService;
    
    //글목록페이지,페이징,검색
    @RequestMapping(value="/testList.do")
    public String testListDo(Model model
            ,@RequestParam(required=false,defaultValue="1")int page
            ,@RequestParam(required=false,defaultValue="1")int range
            ,@RequestParam(required=false,defaultValue="testTitle")String searchType
            ,@RequestParam(required=false)String keyword
            ,@ModelAttribute("search")Search search) throws Exception{
        
        //검색
        model.addAttribute("search", search);
        search.setSearchType(searchType);
        search.setKeyword(keyword);
        
        //전체 개시글 개수
        int listCnt = testService.getBoardListCnt(search);
        
        //검색 후 페이지
        search.pageInfo(page, range, listCnt);
        //페이징
        model.addAttribute("pagination", search);
        //게시글 화면 출력
        model.addAttribute("list", testService.selectTest(search));
        
//        model.addAttribute("list", testService.selectTest(testVo));
        
        return "test/testList";
    }
    
    //글 상세페이지
    @RequestMapping(value="testDetail.do")
    public String viewForm(Model model, HttpServletRequest request) throws Exception{
        int testId = Integer.parseInt(request.getParameter("testId"));
        
        TestVo testVo = testService.selectDetail(testId);
        model.addAttribute("vo", testVo);
        
        return "test/testDetail";
    }
    
    //글작성페이지
    @RequestMapping(value="/testRegister.do")
    public String testRegister(){
        return "test/testRegister";
    }
    
    // 글쓰기
    @RequestMapping(value = "/insertTest.do")
    public String write(@ModelAttribute("testVo") TestVo testVo) throws Exception {
 
        // 파일 업로드 처리
        String fileName = null;
        MultipartFile uploadFile = testVo.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
            UUID uuid = UUID.randomUUID(); // UUID 구하기
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File("C:\\upload\\" + fileName));
        }
        testVo.setFileName(fileName);
 
        System.out.println(testVo.getFileName());
 
        testService.insertTest(testVo);
 
        return "redirect:testList.do";
    }
    
    // 글수정
    @RequestMapping(value = "/updateTest.do")
    public String updateTest(@ModelAttribute("testVo") TestVo testVo, HttpServletRequest request) throws Exception {
        
        // 파일 업로드
        String fileName = null;
        MultipartFile uploadFile = testVo.getUploadFile();
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName); // 확장자구하기
            UUID uuid = UUID.randomUUID(); // uuid구하기
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File("C:\\upload\\" + fileName));
            testVo.setFileName(fileName);
        }else{
            testService.updateTest(testVo);
            return "redirect:testDetail.do?testId=" + testVo.getTestId();
        }
        
        testService.updateTest(testVo);
        return "redirect:testDetail.do?testId=" + testVo.getTestId();
    }

    //글삭제
    @RequestMapping(value="/deleteTest.do")
    public String deleteTest(HttpServletRequest request) throws Exception {
        int testId = Integer.parseInt(request.getParameter("testId"));
        testService.deleteTest(testId);
        return "redirect:testList.do";
    }

}
