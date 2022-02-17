package egovframework.example.hcnc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.hcnc.service.TreeService;
import egovframework.example.hcnc.vo.Search;
import egovframework.example.hcnc.vo.TreeVO;

@Controller
public class TreeController {
	
	@Autowired
	private TreeService treeService;
	
	//글목록페이지,페이징,검색
	@RequestMapping(value="/treeList.do")
	public String treeListDo(Model model
            ,@RequestParam(required=false,defaultValue="1")int page
            ,@RequestParam(required=false,defaultValue="1")int range
            ,@RequestParam(required=false,defaultValue="title")String searchType
            ,@RequestParam(required=false)String keyword
            ,@ModelAttribute("search")Search search) throws Exception {
        //검색
        model.addAttribute("search", search);
        search.setSearchType(searchType);
        search.setKeyword(keyword);
        
        //전체 개시글 개수
        int listCnt = treeService.getBoardListCnt(search);
        
        //검색 후 페이지
        search.pageInfo(page, range, listCnt);
        //페이징
        model.addAttribute("pagination", search);
        //게시글 화면 출력
        model.addAttribute("list", treeService.selectTree(search));
        
//        model.addAttribute("list", testService.selectTest(testVo));
		
		return "tree/treeList";	
	}
	
	//글 상세페이지
	@RequestMapping(value="treeDetail.do")
	public String viewForm(Model model, HttpServletRequest request) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		
		TreeVO treeVO = treeService.selectDetail(no);
		model.addAttribute("vo", treeVO);
		
		return "tree/treeDetail";
	}
	
	//글 작성페이지
	@RequestMapping(value="/treeRegister.do")
	public String treeRegister() {
		return "tree/treeRegister";
	}
		
	//글쓰기
	@RequestMapping(value="/insertTree.do")
	public String write(@ModelAttribute("treeVO") TreeVO treeVO) throws Exception {
		treeService.insertTree(treeVO);
		return "redirect:treeList.do";
	}
	
	//글수정
	@RequestMapping(value="/updateTree.do")
	public String updateTree(@ModelAttribute("treeVO") TreeVO treeVO) throws Exception {
		treeService.updateTree(treeVO);
		return "redirect:treeDetail.do?no="+treeVO.getNo();	
	}
	
	//글삭제
	@RequestMapping(value="/deleteTree.do")
	public String deleteTree(HttpServletRequest request) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		treeService.deleteTree(no);
		return "redirect:treeList.do";
	}
	
	

}
