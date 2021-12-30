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
<title>Gentelella Alela! |</title>

<!-- Bootstrap -->
<link href="/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- bootstrap-wysiwyg -->
<link href="/vendors/google-code-prettify/bin/prettify.min.css"
	rel="stylesheet">
<!-- Select2 -->
<link href="/vendors/select2/dist/css/select2.min.css" rel="stylesheet">
<!-- Switchery -->
<link href="/vendors/switchery/dist/switchery.min.css" rel="stylesheet">
<!-- starrr -->
<link href="/vendors/starrr/dist/starrr.css" rel="stylesheet">
<!-- bootstrap-daterangepicker -->
<link href="/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="/build/css/custom.min.css" rel="stylesheet">
</head>
<body class="nav-md">

	<%@include file="../includes/project/header.jsp"%>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="contents">
			<div class="page-title">
				<div class="title_left">
					<h3>개발자 관리</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								개발자 등록<small></small>
							</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false"><i class="fa fa-wrench"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<br />
							<form id="demo-form2" name="frm" method="post"
								action="devModifySave.do" data-parsley-validate
								class="form-horizontal form-label-left">

								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_id">사번 <span class="required" readonly>*</span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="d_id" required="required"
											class="form-control " name="d_id" value="${vo.d_id}" readonly>
									</div>
								</div>
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_name">개발자이름 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="d_name" required="required"
											class="form-control" name="d_name" value="${vo.d_name}">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_jobgrade">직급 <span class="required">*</span></label>
									<div class="col-md-6 col-sm-6 ">
										<select class="form-control" id="d_jobgrade" name="d_jobgrade">
												<option <c:out value="${vo.d_jobgrade == '사원'?'selected':''}" />>사원</option>
												<option <c:out value="${vo.d_jobgrade == '대리'?'selected':''}" />>대리</option>
												<option <c:out value="${vo.d_jobgrade == '과장'?'selected':''}" />>과장</option>
												<option <c:out value="${vo.d_jobgrade == '차장'?'selected':''}" />>차장</option>
												<option <c:out value="${vo.d_jobgrade == '부장'?'selected':''}" />>부장</option>
												<option <c:out value="${vo.d_jobgrade == '이사'?'selected':''}" />>이사</option>
												<option <c:out value="${vo.d_jobgrade == '상무'?'selected':''}" />>상무</option>
												<option <c:out value="${vo.d_jobgrade == '전무'?'selected':''}" />>전무</option>
												<option <c:out value="${vo.d_jobgrade == '프리'?'selected':''}" />>프리</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_tier">등급 <span class="required">*</span></label>
									<div class="col-md-6 col-sm-6 ">
										<select class="form-control cate2" id="d_tier" name="d_tier" value="${vo.d_tier }">
											<option <c:out value="${vo.d_tier == '초급'?'selected':''}" />>초급</option>
											<option <c:out value="${vo.d_tier == '중급'?'selected':''}" />>중급</option>
											<option <c:out value="${vo.d_tier == '고급'?'selected':''}" />>고급</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_type">직원구분여부 <span class="required">*</span></label>
									<div class="col-md-6 col-sm-6 ">
										<select class="form-control cate3" id="d_type" name="d_type" value="${vo.d_type }">
											<option <c:out value="${vo.d_type == '정직원'?'selected':''}" />>정직원</option>
											<option <c:out value="${vo.d_type == '프리'?'selected':''}" />>프리</option>
											<option <c:out value="${vo.d_type == '하도급'?'selected':''}" />>하도급</option>
										</select>
									</div>
								</div>
							
								<div class="ln_solid"></div>
								<div class="item form-group">
									<div class="col-md-6 col-sm-6 offset-md-3">
										<button class="btn btn-primary" type="button">취소</button>
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
			Gentelella - Bootstrap Admin Template by <a
				href="https://colorlib.com">Colorlib</a>
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
	<script
		src="/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
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
	<script
		src="/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js"></script>
	<!-- starrr -->
	<script src="/vendors/starrr/dist/starrr.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="/build/js/custom.min.js"></script>


</body>
</html>