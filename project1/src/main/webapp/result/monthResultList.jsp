<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.hidden {
	display : none;
}
</style>
<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link href="/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
<!-- Datatables -->

<link href="/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
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
					<h3>
						프로젝트별 공수 관리<small></small>
					</h3>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								프로젝트별 월투입 공수현황 <small></small>
							</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i
										class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-expanded="false"><i
										class="fa fa-wrench"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
							<div class="row">
								<div class="col-sm-12">
									<div class="card-box table-responsive">
										<p class="text-muted font-13 m-b-30">2022년 프로젝트별 월투입 공수현황 입니다.</p>
										<table id="datatable-fixed-header" class="table table-striped table-bordered" style="width: 100%">
											<thead>
												<tr>
													<th>코드</th>
													<th>프로젝트명</th>												
													<th>투입공수</th>
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
												<c:forEach var="list" items="${monthList}">
													<tr>
														<td>${list.pId }</td>
														<td>${list.pName }</td>												
														<td>
															${list.jan+
															list.feb+
															list.mar+
															list.apr+
															list.may+
															list.jun+
															list.jul+
															list.aug+
															list.sep+
															list.oct+
															list.nov+
															list.dec }
														</td>
														<td>${list.jan }</td>
														<td>${list.feb }</td>
														<td>${list.mar }</td>
														<td>${list.apr }</td>
														<td>${list.may }</td>
														<td>${list.jun }</td>
														<td>${list.jul }</td>
														<td>${list.aug }</td>
														<td>${list.sep }</td>
														<td>${list.oct }</td>
														<td>${list.nov }</td>
														<td>${list.dec }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="card-box table-responsive">
										<p class="text-muted font-13 m-b-30"></p>
										<table id="datatable-fixed-header" class="table table-striped table-bordered" style="width: 100%">
												<tr>
													<th>구분</th>
													<th>투입공수</th>
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
												<c:forEach var="list" items="${sumList}">
													<tr style="background-color:rgba(255, 253, 124, 0.456);">
														<th>투입공수 평균</th>
														<td>
															${Math.round((list.jan+list.feb+list.mar+list.apr+list.may+list.jun+list.jul+list.aug+list.sep+list.oct+list.nov+list.dec)*10/12)/10}
														</td>
														<td>${list.jan }</td>
														<td>${list.feb }</td>
														<td>${list.mar }</td>
														<td>${list.apr }</td>
														<td>${list.may }</td>
														<td>${list.jun }</td>
														<td>${list.jul }</td>
														<td>${list.aug }</td>
														<td>${list.sep }</td>
														<td>${list.oct }</td>
														<td>${list.nov }</td>
														<td>${list.dec }</td>
													</tr>
													<tr>
														<th>개발인원</th>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
														<td>${list.dName }</td>
													</tr>
													<tr>
														<th>부족 인원</th>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round((list.jan+list.feb+list.mar+list.apr+list.may+list.jun+list.jul+list.aug+list.sep+list.oct+list.nov+list.dec)/12) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.jan) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.feb) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.mar) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.apr) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.may) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.jun) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.jul) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.aug) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.sep) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.oct) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.nov) }</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${list.dName - Math.round(list.dec) }</td>
													</tr>
													<tr>
														<th>가동율</th>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">
															${Math.round((list.jan+list.feb+list.mar+list.apr+list.may+list.jun+list.jul+list.aug+list.sep+list.oct+list.nov+list.dec)/12/list.dName*100)}%
														</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.jan)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.feb)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.mar)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.apr)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.may)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.jun)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.jul)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.aug)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.sep)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.oct)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.nov)/list.dName * 100 )}%</td>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">${Math.round((list.dec)/list.dName * 100 )}%</td>
													</tr>
												</c:forEach>
										</table>
									</div>
								</div>
							</div>
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

	<!-- jQuery -->
	<script src="/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- FastClick -->
	<script src="/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script src="/vendors/iCheck/icheck.min.js"></script>
	<!-- Datatables -->
	<script src="/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="/vendors/jszip/dist/jszip.min.js"></script>
	<script src="/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="/build/js/custom.min.js"></script>
	

</body>
</html>

