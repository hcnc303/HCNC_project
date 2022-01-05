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
					<div class="contents">
						<div class="page-title">
							<div class="title_left">
								<h3>프로젝트 인력투입</h3>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>프로젝트 인력투입 <small></small></h2>
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
										<form id="demo-form2" name="frm" method="post" action="inputWriteSave.do" data-parsley-validate class="form-horizontal form-label-left">
											<div class="form-group row">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_id">프로젝트 <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 ">
													<input class="form-control cate1" id="p_id"  name="p_id" value="${pvo.p_id }" readonly>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="d_id">사원 <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate2" id="d_id"  name="d_id">
														<option selected value="none">사원을 선택해주세요.</option>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="i_role">역할 <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate3" id="i_role"  name="i_role">
														<option selected value="none">역할을 선택해주세요.</option>
													</select>
												</div>
											</div>
											<div class="form-group row">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="i_stay">상주 <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate4" id="i_stay"  name="i_stay">
														<option selected value="none">상주여부를 선택해주세요.</option>
													</select>
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
			var RoCateList = JSON.parse('${RoCateList}');
			var ScateList = JSON.parse('${ScateList}');
			var DevCateList = JSON.parse('${DevCateList}');
			var ProCateList = JSON.parse('${ProCateList}');
			
			/* var cate1Array = new Array(); */
			var cate2Array = new Array();
			var cate3Array = new Array();
			var cate4Array = new Array();
			
			/* var cate1Obj = new Object(); */
			var cate2Obj = new Object();
			var cate3Obj = new Object();
			var cate4Obj = new Object();
			
			/* var cateSelect1 = $(".cate1"); */
			var cateSelect2 = $(".cate2");
			var cateSelect3 = $(".cate3");
			var cateSelect4 = $(".cate4");
			
			/* 카테고리 배열 초기화 메서드 */
			function makeSCateArray(obj,array,ScateList,masterCd) {
				
				for(var i = 0; i < ScateList.length; i++) {
					
					if(ScateList[i].masterCd === masterCd) {
						
						obj = new Object();
						
						obj.masterCd = ScateList[i].masterCd;
						obj.detailCd = ScateList[i].detailCd;
						obj.detailNm = ScateList[i].detailNm;
						
						array.push(obj);
					}
				}
			}
			
			function makeRoCateArray(obj,array,RoCateList,masterCd) {
				
				for(var i = 0; i < RoCateList.length; i++) {
					
					if(RoCateList[i].masterCd === masterCd) {
						
						obj = new Object();
						
						obj.masterCd = RoCateList[i].masterCd;
						obj.detailCd = RoCateList[i].detailCd;
						obj.detailNm = RoCateList[i].detailNm;
						
						array.push(obj);
					}
				}
			}
			
			function makeDevCateArray(obj,array,DevCateList,tier) {
				
				for(var i = 0; i < DevCateList.length; i++){
					
					if(DevCateList[i].tier === tier){
						obj = new Object();
						
						obj.tier = DevCateList[i].tier;
						obj.d_id = DevCateList[i].dId;
						obj.d_name = DevCateList[i].dName;
						obj.d_jobgrade = DevCateList[i].dJobgrade;
						obj.d_tier = DevCateList[i].dTier;
						obj.d_type =DevCateList[i].dType;
						
						array.push(obj);
					}
				}
			}
			
			function makeProCateArray(obj,array,ProCateList,tier) {
				
				for(var i = 0; i < ProCateList.length; i++){
					
					if(ProCateList[i].tier === tier){
						obj = new Object();
						
						
						obj.p_id = ProCateList[i].pId;
						obj.p_name = ProCateList[i].pName;
						obj.p_startdate = ProCateList[i].pStartdate;
						obj.p_enddate = ProCateList[i].pEnddate;
						obj.p_place = ProCateList[i].pPlace;
						obj.p_buyer = ProCateList[i].pBuyer;
						obj.p_salesman = ProCateList[i].pSalesman;
						obj.p_tell = ProCateList[i].pTell;
						obj.p_progress = ProCateList[i].pProgress;
						obj.p_note = ProCateList[i].pNote;
						obj.tier = ProCateList[i].tier;
						
						array.push(obj);
					}
				}
			}
			
			$(document).ready(function(){
				/* console.log(cate1Array); */
				console.log(cate2Array);
				console.log(cate3Array);
				console.log(cate4Array);
			});
			
			/* 배열 초기화 */
			/* makeProCateArray(cate1Obj,cate1Array,ProCateList,1); */
			makeDevCateArray(cate2Obj,cate2Array,DevCateList,1);
			makeRoCateArray(cate3Obj,cate3Array,RoCateList,'R');
			makeSCateArray(cate4Obj,cate4Array,ScateList,'S');
			
			/* for(let i = 0; i < cate1Array.length; i++){
				cateSelect1.append("<option value='"+cate1Array[i].p_id+"'>" + cate1Array[i].p_name + "</option>");
			} */
			
			for(let i = 0; i < cate2Array.length; i++){
				cateSelect2.append("<option value='"+cate2Array[i].d_id+"'>" + cate2Array[i].d_name + "</option>");
			}
			
			for(let i = 0; i < cate3Array.length; i++){
				cateSelect3.append("<option value='"+cate3Array[i].detailNm+"'>" + cate3Array[i].detailNm + "</option>");
			}
			
			for(let i = 0; i < cate4Array.length; i++){
				cateSelect4.append("<option value='"+cate4Array[i].detailNm+"'>" + cate4Array[i].detailNm + "</option>");
			}
			
		</script>
	</body>
</html>




