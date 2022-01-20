<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
								<h3>코드 작성</h3>
							</div>

						</div>
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>대분류 코드 작성 <small></small></h2>
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
										<form id="demo-form2" name="frm" method="post" action="MsCodeWriteSave.do" data-parsley-validate class="form-horizontal form-label-left">
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="masterCd" >대분류 코드 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="masterCd" required="required" class="form-control "name="masterCd" autocomplete="off">
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="masterNm">대분류명 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="masterNm" required="required" class="form-control" name="masterNm" autocomplete="off">
												</div>
											</div>
											<div class="ln_solid"></div>
											<div class="item form-group">
												<div class="col-md-6 col-sm-6 offset-md-3">
													<button class="btn btn-danger" type="button">취소</button>
													<button class="btn btn-primary" type="reset">초기화</button>
													<button type="submit" class="btn btn-success">저장</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>소분류 코드 작성 <small></small></h2>
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
										<form id="demo-form2" name="frm" method="post" action="DtCodeWriteSave.do" data-parsley-validate class="form-horizontal form-label-left">
											<div class="form-group row">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="masterCd">대분류 코드 <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate1" id="masterCd"  name="masterCd">
														<option selected value="none">대분류를 선택해주세요.</option>
													</select>
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="detailCd">소분류 코드 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="detailCd" required="required" class="form-control" name="detailCd" autocomplete="off">
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="detailNm">소분류명 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="detailNm" required="required" class="form-control" name="detailNm" autocomplete="off">
												</div>
											</div>
											<div class="ln_solid"></div>
											<div class="item form-group">
												<div class="col-md-6 col-sm-6 offset-md-3">
													<button class="btn btn-danger" type="button">취소</button>
													<button class="btn btn-primary" type="reset">초기화</button>
													<button type="submit" class="btn btn-success">저장</button>
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
			var MsCateList = JSON.parse('${MsCateList}');
			
			var cate1Array = new Array();
			var cate1Obj = new Object();
			
			var cateSelect1 = $(".cate1");
			
			/* 카테고리 배열 초기화 메서드 */
			function makeCateArray(obj,array,MsCateList, msTier){
				
				for(var i = 0; i < MsCateList.length; i++){
					if(MsCateList[i].msTier === msTier){
						obj = new Object();
						
						obj.masterCd = MsCateList[i].masterCd;
						obj.masterNm = MsCateList[i].masterNm;
						
						array.push(obj);				
						
					}
				}
			}	

			$(document).ready(function(){
				console.log(cate1Array);
			});
			
			/* 배열 초기화 */
			makeCateArray(cate1Obj,cate1Array,MsCateList,1);

			/*
			$(document).ready(function(){
				console.log(cate1Array);
			});
			*/
			for(let i = 0; i < cate1Array.length; i++){
				cateSelect1.append("<option value='"+cate1Array[i].masterCd+"'>" + cate1Array[i].masterNm + "</option>");
			}
		</script>
	</body>
</html>