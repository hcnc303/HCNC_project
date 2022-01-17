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
		<!-- <link href="/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet"> -->
		
		<link rel="stylesheet" href="datepicker/air-datepicker/dist/css/datepicker.min.css">
	
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
								<h3>프로젝트별 공수 관리</h3>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="row">
							<div class="col-md-12 col-sm-12 ">
								<div class="x_panel">
									<div class="x_title">
										<h2>프로젝트별 공수 작성 <small></small></h2>
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
										<form id="demo-form2" name="frm" method="post" action="resultWriteSave.do" data-parsley-validate class="form-horizontal form-label-left">
	
											<div class="item form-group" style=display:none;>
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_id" >프로젝트 코드 <span class="required" >*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_id" required="required" class="form-control "name="p_id" autocomplete="off" readonly="readonly" value="${ivo.p_id}">
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_name" >프로젝트 이름 <span class="required" >*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_name" required="required" class="form-control "name="p_name" autocomplete="off" readonly="readonly" value="${ivo.p_name}">
												</div>
											</div>
											<div class="item form-group" style=display:none;>
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="d_id">사번 <span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="d_id" required="required" class="form-control" name="d_id" autocomplete="off" readonly="readonly" value="${ivo.d_id}">
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="d_name" >이름 <span class="required" >*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="d_name" required="required" class="form-control "name="d_name" autocomplete="off" readonly="readonly" value="${ivo.d_name}">
												</div>
											</div>
											<div class="field item form-group">
	                                            <label class="col-form-label col-md-3 col-sm-3  label-align">프로젝트 투입일<span class="required">*</span></label> 
	                                            <div class="col-md-6 col-sm-6">
	                                                <input class="form-control" type="text"  name="d_startdate" required="required" autocomplete="'off" readonly="readonly" value="${ivo.d_startdate }"> 
	                                            </div>
                                        	</div>
											<div class="field item form-group">
	                                            <label class="col-form-label col-md-3 col-sm-3  label-align">프로젝트 철수일<span class="required">*</span></label>
	                                            <div class="col-md-6 col-sm-6">
	                                                <input class="form-control" type="text" name="d_enddate" required="required" autocomplete="'off" readonly="readonly" value="${ivo.d_enddate }">
	                                            </div>
                                        	</div>
											<div class="form-group row">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="year">년도 <span class="required">*</span></label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate4" id="year"  name="year">
														<option value="">년도를 선택해주세요</option>
														  <c:forEach var="i" begin="${ivo.d_startdate.substring(0,4) }" end="${ivo.d_enddate.substring(0,4) }"> 
														   
														    <option value="${i}">${i}년</option>
														  </c:forEach>
													</select>
												</div>
											</div>
											<div class="card-box table-responsive">
												<p class="text-muted font-13 m-b-30">
						
													<code></code>
												</p>
												<table id="datatable" class="table table-striped table-bordered" style="width: 100%">
													<thead>
														<tr>
															<th>1월</th>
															<th>2월</th>
															<th>3월</th>
															<th>4월</th>
															<th>5월</th>
															<th>6월</th>
															<th>7월</th>
															<th>8월</th>
															<th>9월</th>
															<th>10월</th>
															<th>11월</th>
															<th>12월</th>															
														</tr>
													</thead>
													<tbody>
													
														<tr>
															<td>
																<input class="form-control" type="text" id="jan" name="jan" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="feb" name="feb" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="mar" name="mar" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="apr" name="apr" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="may" name="may" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="jun" name="jun" required="required" autocomplete="off" value="0">
															</td>	
															<td>
																<input class="form-control" type="text" id="jul" name="jul" required="required" autocomplete="off" value="0">
															</td>																																																										
															<td>
																<input class="form-control" type="text" id="aug" name="aug" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="sep" name="sep" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="oct" name="oct" required="required" autocomplete="off" value="0">
															</td>
															<td>
																<input class="form-control" type="text" id="nov" name="nov" required="required" autocomplete="off" value="0"> 
															</td>
															<td>
																<input class="form-control" type="text" id="dec" name="dec" required="required" autocomplete="off" value="0">
															</td>
														</tr>
														
													</tbody>
												</table>			
											</div>
											<div class="ln_solid"></div>
											<div class="item form-group">
												<div class="col-md-6 col-sm-6 offset-md-3">
													<button class="btn btn-primary" type="button">취소</button>
													<button class="btn btn-primary" type="reset">초기화</button>
													<button class="btn btn-success" type="submit" onclick="check()">저장</button>
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
		<!-- <script src="/vendors/moment/min/moment.min.js"></script>
		<script src="/vendors/bootstrap-daterangepicker/daterangepicker.js"></script> -->
		
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
		
	    <script src="datepicker/air-datepicker/dist/js/datepicker.min.js"></script>
	    <script src="datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>	
	</body>
</html>