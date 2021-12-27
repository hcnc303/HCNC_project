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
	display: none;
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

<script>
    	function fn_update(detailNm) {
    		location = "codeModifyWrite.do?detailNm="+detailNm;
    	}
    </script>
</head>

<body class="nav-md">

	<%@include file="../includes/project/header.jsp" %>

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								프로젝트 관리<small></small>
							</h3>
						</div>

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-secondary" type="button">Go!</button>
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
									<h2>
										프로젝트 리스트 <small></small>
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
												<p class="text-muted font-13 m-b-30">
													프로젝트 리스트 입니다.
													<code></code>
												</p>
												<table id="datatable"
													class="table table-striped table-bordered"
													style="width: 100%">
													<thead>
														<tr>
															<th>프로젝트 코드</th>
															<th>프로젝트 이름</th>
															<th>시작일</th>
															<th>종료일</th>
															<th>사업장소</th>
															<th>발주처</th>
															<th>영업담당자</th>
															<th>연락처</th>
															<th>진행상태</th>
															<th>비고</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="result" items="${resultList}"
															varStatus="status">
															<tr>
																<td>${result.pId }</td>
																<td>${result.pName }</td>
																<td>${result.pStartdate }</td>
																<td>${result.pEnddate }</td>
																<td>${result.pPlace }</td>
																<td>${result.pBuyer }</td>
																<td>${result.pSalesman }</td>
																<td>${result.pTell }</td>
																<td>${result.pProgress }</td>
																<td>
																 <span><button type="button" onclick="location='projectModifyWrite.do?p_id=${result.pId}'" class="btn btn-info btn-xs">수정</button></span> 
																 <span><button type="button" onclick="location='projectDelete.do?p_id=${result.pId}'" class="btn btn-danger btn-xs">삭제</button></span>
																</td>
															</tr>
														</c:forEach>
													</tbody>
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

	<!-- bootstrap-progressbar -->
	<script
		src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>

</body>
</html>