<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix= "spring" uri= "http://www.springframework.org/tags" %>      
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Gentelella Alela! | </title>
	<style>
		.hidden {display:none;}
	</style>
		<!-- Bootstrap -->
		<link href="/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Font Awesome -->
		<link href="/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<!-- NProgress -->
		<link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
		<!-- iCheck -->
		<link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
		<!-- bootstrap-wysiwyg -->
		<link href="/vendors/google-code-prettify/bin/prettify.min.css" rel="stylesheet">
		<!-- Select2 -->
		<link href="/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
		<!-- Switchery -->
		<link href="/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
		<!-- starrr -->
		<link href="/vendors/starrr/dist/starrr.css" rel="stylesheet">
		<!-- bootstrap-daterangepicker -->
		<link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
	
		<!-- Custom Theme Style -->
		<link href="/build/css/custom.min.css" rel="stylesheet">
	</head>
	<body class="nav-md">
	
    <%@include file="../includes/project/header.jsp" %>
	
				<!-- page content -->
				<div class="right_col" role="main">
					<div class="">
						<div class="page-title">
							<div class="title_left">
								<h3>프로젝트 수정</h3>
							</div>
	
							<div class="title_right">
								<div class="col-md-5 col-sm-5  form-group pull-right top_search">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Search for...">
										<span class="input-group-btn">
											<button class="btn btn-default" type="button">Go!</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>프로젝트 수정 <small></small></h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
											</li>
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-wrench"></i></a>
											</li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<br />
										<form id="demo-form2" name="frm" method="post" action="projectModifySave.do" data-parsley-validate class="form-horizontal form-label-left">
											<div class="item form-group hidden">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_id" >프로젝트 코드 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_id" required="required" class="form-control "name="p_id" value="${vo.p_id }" readonly> 
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_name" >프로젝트 이름 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_name" required="required" class="form-control "name="p_name" value="${vo.p_name }"> 
												</div>
											</div>
											<div class="field item form-group">
	                                            <label class="col-form-label col-md-3 col-sm-3  label-align">프로젝트 시작일<span class="required">*</span></label>
	                                            <div class="col-md-6 col-sm-6">
	                                                <input class="form-control" type="date" name="p_startdate" required="required" value="${vo.p_startdate}"></div>
                                        	</div>
											<div class="field item form-group">
	                                            <label class="col-form-label col-md-3 col-sm-3  label-align">프로젝트 종료일<span class="required">*</span></label>
	                                            <div class="col-md-6 col-sm-6">
	                                                <input class="form-control" type="date" name="p_enddate" required="required" value="${vo.p_enddate}"></div>
                                        	</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_place">사업 장소<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate4" id="p_place" name="p_place">
														<c:forEach var="cateList" items="${dVo}" varStatus="i">
			                                          		<option selected value="none">사업장소를 선택해주세요.</option>
			                                          		<option value="${cateList.p_place}">${cateList.p_place}</option>
			                                          	</c:forEach>
			                                       </select>
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_buyer">발주처<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate6" id="p_buyer" name="p_buyer">
			                                          <c:forEach var="cateList" items="${dVo}" varStatus="i">
			                                          		<option selected value="none">발주처를 선택해주세요.</option>
			                                          		<option value="${cateList.p_place}">${cateList.p_place}</option>
			                                          	</c:forEach>
			                                       </select>
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_salesman">영업담당자<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_salesman" required="required" class="form-control" name="p_salesman" value="${vo.p_salesman }">
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_tell">연락처<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_tell" required="required" class="form-control" name="p_tell" value="${vo.p_tell }">
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_progress">진행상태<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate5" id="p_progress" name="p_progress">
			                                        	<option <c:out value="${vo.p_progress == '공고전'?'selected':''}" />>공고전</option>
														<option <c:out value="${vo.p_progress == '수행중'?'selected':''}" />>수행중</option>
														<option <c:out value="${vo.p_progress == '사업완료'?'selected':''}" />>사업완료</option>
			                                       </select>
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_note">비고<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_note" required="required" class="form-control" name="p_note" value="${vo.p_note }">
												</div>
											</div>
											<div class="ln_solid"></div>
											<div class="item form-group">
												<div class="col-md-6 col-sm-6 offset-md-3">
													<button class="btn btn-primary" type="button">취소</button>
													<button class="btn btn-primary" type="reset">초기화</button>
													<button class="btn btn-success" type="submit">저장</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
	
					</div>
				</div>
				<!-- /page content -->
	
				<!-- footer content -->
				<footer>
					<div class="pull-right">
						Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
					</div>
					<div class="clearfix"></div>
				</footer>
				<!-- /footer content -->
			</div>
		</div>
	
		<!-- jQuery -->
		<script src="/vendors/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!-- FastClick -->
		<script src="/vendors/fastclick/lib/fastclick.js"></script>
		<!-- NProgress -->
		<script src="/vendors/nprogress/nprogress.js"></script>
		<!-- bootstrap-progressbar -->
		<script src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
		<!-- iCheck -->
		<script src="/vendors/iCheck/icheck.min.js"></script>
		<!-- bootstrap-daterangepicker -->
		<script src="/vendors/moment/min/moment.min.js"></script>
		<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
		<!-- bootstrap-wysiwyg -->
		<script src="/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js"></script>
		<script src="/vendors/jquery.hotkeys/jquery.hotkeys.js"></script>
		<script src="/vendors/google-code-prettify/src/prettify.js"></script>
		<!-- jQuery Tags Input -->
		<script src="/vendors/jquery.tagsinput/src/jquery.tagsinput.js"></script>
		<!-- Switchery -->
		<script src="/vendors/switchery/dist/switchery.min.js"></script>
		<!-- Select2 -->
		<script src="/vendors/select2/dist/js/select2.full.min.js"></script>
		<!-- Parsley -->
		<script src="/vendors/parsleyjs/dist/parsley.min.js"></script>
		<!-- Autosize -->
		<script src="/vendors/autosize/dist/autosize.min.js"></script>
		<!-- jQuery autocomplete -->
		<script src="/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
		<!-- starrr -->
		<script src="/vendors/starrr/dist/starrr.js"></script>
		<!-- Custom Theme Scripts -->
		<script src="/build/js/custom.min.js"></script>
		
		<script>
		/* 카테고리 */
		let cateList = JSON.parse('${cateList}');
		
		
		let cate4Array = new Array();
		let cate5Array = new Array();
		let cate6Array = new Array();
		let cate4Obj = new Object();
		let cate5Obj = new Object();
		let cate6Obj = new Object();
		
		let cateSelect4 = $(".cate4");
		let cateSelect5 = $(".cate5");
		let cateSelect6 = $(".cate6");
		
		/* 카테고리 배열 초기화 메서드 */
		function makeCateArray(obj,array,cateList, masterCd){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].masterCd === masterCd){
					obj = new Object();
					
					obj.masterCd = cateList[i].masterCd;
					obj.detailCd = cateList[i].detailCd;
					obj.detailNm = cateList[i].detailNm;
					
					array.push(obj);				
					
				}
			}
		}	

		/* 배열 초기화 */
		makeCateArray(cate4Obj,cate4Array,cateList,'L');
		makeCateArray(cate5Obj,cate5Array,cateList,'P');
		makeCateArray(cate6Obj,cate6Array,cateList,'B');
		
		/* 발주처 카테고리 */
		for(let i = 0; i < cate4Array.length; i++){
			cateSelect4.append("<option value='"+cate4Array[i].detailNm+"'>" + cate4Array[i].detailNm + "</option>");
		}
		
		
		for(let i = 0; i < cate6Array.length; i++){
			cateSelect6.append("<option value='"+cate6Array[i].detailNm+"'>" + cate6Array[i].detailNm + "</option>");
		}// for
		
		for(let i = 0; i < cate5Array.length; i++){
			cateSelect5.append("<option value='"+cate5Array[i].detailNm+"'>" + cate5Array[i].detailNm + "</option>");
		}// for
		
		
		
		</script>
	</body>
</html>