package egovframework.example.hcnc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.example.hcnc.service.TestGridService;




@Controller
public class Test2Controller {

	@Autowired
	private SqlSession sqlSession;
	

	
//	/* 코드 관리 페이지 이동 */
//	@RequestMapping(value= "/testGrid.do" , produces = "application/text; charset=utf8", method = RequestMethod.GET)
//	public ModelAndView CodeReader() {
//
//		ModelAndView vie = new ModelAndView();
//
//		TestGridService service = sqlSession.getMapper(TestGridService.class);
//
//		ArrayList<HashMap<String, Object>> lists = service.fgDescCode1();
//
//		vie.setViewName("test/testGrid");
//
//		vie.addObject("fgDescCode1List", lists);
//
//		return vie;
//	}

//	/*코드 테이블 구분명 및 코드,구분검색*/
//	@RequestMapping(value = "/smCodeReaderSearch.do", produces = "application/text; charset=utf8", method = RequestMethod.POST)
//	public ModelAndView CodeReaderSearch(ModelMap model,HttpSession session
//										,@RequestParam("fgDescSearch") String fgDescSearch
//										,@RequestParam("fgDescCode1") String fgDescCode1){
//
//		TestGridService service = sqlSession.getMapper(TestGridService.class);
//
//		HashMap<String, Object> modelMap = new HashMap<String, Object>();
//	    modelMap.put("fgDescSearch",fgDescSearch);
//		modelMap.put("fgDescCode1", fgDescCode1);
//
//		ArrayList<HashMap<String, Object>> list = service.getCodeReaderSearch(modelMap);
//
//		ModelAndView vie = new ModelAndView();
//		vie.addObject("rows",list);
//		vie.setViewName("jsonView");
//
//		return vie;
//		}
//
//    /*코드 수정 테이블 코드검색*/
//	@RequestMapping(value = "/smCodeReaderSearch2.do", produces = "application/text; charset=utf8", method = RequestMethod.POST)
//	public ModelAndView CodeReaderSearch2(ModelMap model
//			, HttpSession session
//			, @RequestParam("Codenumber") String Codenumber
//			,HttpServletRequest request, HttpServletResponse response) throws Throwable {
//
//		TestGridService service = sqlSession.getMapper(TestGridService.class);
//		HashMap<String, Object> modelMap = new HashMap<String, Object>();
//		modelMap.put("Codenumber", Codenumber);
//
//		ModelAndView vie = new ModelAndView();
//
//		vie.addObject("rows",service.getCodeReaderSearch2(modelMap));
//		vie.setViewName("jsonView");
//
//		return vie;
//	}
//	/*코드 수정 테이블 코드추가*/
//	@RequestMapping(value = "/smCodeAdd.do", produces = "application/text; charset=utf8", method = RequestMethod.POST)
//	@ResponseBody public ModelAndView CodeAdd( @RequestBody HashMap<String, Object> modelMap, HttpSession session
//	         ) throws Throwable {
//
//	     ModelAndView vie = new ModelAndView();
//
//	     TestGridService dao = sqlSession.getMapper(TestGridService.class);
//
//	     String status = "NO";
//	     String srtCODE=(String)modelMap.get("CODE");
//	     String srtFGNM =(String)modelMap.get("FGNM");
//	     String srtFG=(String) modelMap.get("FG");
//
//	     if(srtCODE.length()==0 || srtFG.length()==0){
//
//	     }else{
//	    	 status = dao.getCodeAdd(modelMap);
//	      	}
//	      vie.setViewName("jsonView");
//	      vie.addObject("RESULT", status);
//
//	      return vie;
//	   }
//
//	 /*코드 수정 테이블 코드수정*/
//	@RequestMapping(value ="/smCodeModify.do", produces ="application/json; charset=utf8", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView CodeModify(@RequestBody HashMap<String, Object> modelMap )throws Throwable {
//
//
//		ModelAndView vie = new ModelAndView();
//		TestGridService service = sqlSession.getMapper(TestGridService.class);
//
//		String CODE = (String) modelMap.get("CODE");
//		String FG = (String) modelMap.get("FG");
//
//		String CodeCheck = service.CodeCheck(CODE);
//		String FGCheck = service.GubunCheck(FG);
//		String sttus = "";
//
//		if(CodeCheck.equals("nocode")){
//			sttus = "nocode";
//		}
//		else{
//			if(FGCheck.equals("nofg")){
//				sttus = "nofg";
//			}
//			else{
//				String result = service.getCodeModify(modelMap);
//				vie.addObject("status", result);
//				sttus = "success";
//			}
//		}
//
//		vie.addObject("sttus", sttus);
//		vie.setViewName("jsonView");
//
//		return vie;
//	}
//
//	 /*코드 수정 테이블 코드삭제*/
//	@RequestMapping(value ="/smCodeRemove.do", produces ="application/text; charset=utf8", method = RequestMethod.POST)
//	@ResponseBody
//	public ModelAndView CodeRemove(HashMap<String, Object> modelMap,
//			@RequestParam(value="seEmplNo") String seEmplNo,
//			@RequestParam(value="ChassetNO[]") ArrayList<String> ChassetNO)throws Throwable {
//
//			ModelAndView vie = new ModelAndView();
//			TestGridService service = sqlSession.getMapper(TestGridService.class);
//
//			String result = service.getCodeRemove(modelMap);
//			String sttus="false";
//			for(int i=0; i< ChassetNO.size();i++){
//				modelMap.put("CODE", ChassetNO.get(i));
//				modelMap.put("seEmplNo", seEmplNo);
//				sttus=service.getCodeRemove(modelMap);
//			}
//
//			vie.addObject("sttus", sttus);
//			vie.addObject("status",result);
//			vie.setViewName("jsonView");
//
//				return vie;
//
//	}

    @RequestMapping(value="/testGrid.do")
    public String testGrid() {
    	
    	return "test/testGrid";
    }


}
