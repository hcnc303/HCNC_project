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
<script>
	function fn_update(p_id, p_name, d_id, d_name, year) {
		location = "resultModifyWrite.do?p_id=" + p_id + "&p_name" + p_name + "&d_id=" + d_id + "&d_name" + d_name + "&year=" + year;
	}
	function fn_delete(p_id, d_id, year) {
		if (confirm("정말 삭제하시겠습니까?")) {
			location = "resultDelete.do?p_id=" + p_id + "&d_id=" + d_id+ "&year=" + year;
		}
	}
</script>
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
						기술개발부 월별 투입공수<small></small>
					</h3>
				</div>
			</div> <!-- page-title 끝 -->

			<div class="clearfix"></div>

			<div class="row">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								월별 공수 관리 <small></small>
							</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a></li>
							</ul>
							<div class="clearfix"></div>
						</div>	<!-- x_title 끝  -->			
								
						<div class="x_content">
							<ul class="nav nav-tabs bar_tabs" id="myTab" role="tablist">
		                		<li class="nav-item">
		                			<a class="nav-link active" id="fir-tab" data-toggle="tab" href="#fir" role="tab" aria-controls="fir" aria-selected="true">2022년</a>
		                		</li>
		                		<li class="nav-item">
		                			<a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">2023년</a>
		                		</li>
		                		<li class="nav-item">
		                			<a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">2024년</a>
		                		</li>
	                    	</ul>	
                    	                    	
							<div class="tab-content" id="myTabContent">
			                	<div class="tab-pane fade show active" id="fir" role="tabpanel" aria-labelledby="fir-tab">
									<div class="col-sm-12">
										<div class="card-box table-responsive">
											<p class="text-muted font-13 m-b-30">2022년 기술개발부 월별 투입공수 입니다.</p>
											<table id="datatable-fixed-header" class="table table-striped table-bordered" style="width: 100%">
												<thead>
													<tr>
													 	<th style="display:none;">no</th>
														<th>이름</th>
														<th>년도</th>
														<th>투입율</th>															
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
															<td style="display:none;">${list.no }</td>
															<td>${list.dName }</td>
															<td>${list.year }</td>
															<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">
																${Math.round(
																	(list.jan + 
																	list.feb + 
																	list.mar + 
																	list.apr + 
																	list.may + 
																	list.jun +
																	list.jul +
																	list.aug +
																	list.sep +
																	list.oct +
																	list.nov +
																	list.dec) / 12 * 100 
																)}%
															</td>														
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
			                    	<div class="col-sm-12">
			                    		<div class="card-box table-responsive">
											<table id="datatable-fixed" class="table table-striped table-bordered" style="width: 100%">
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
													<tr>
														<th>월별투입</th>
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
													<tr>
														<th>인원</th>
														<td>${list.dName * 12 }</td>
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
														<th>월가동율</th>
														<td style="background-color: rgba(255, 158, 158, 0.938); color:red;">
															${Math.round((list.jan+
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
																list.dec)/(list.dName*12) * 100 )}%
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
			                    
			                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
									<div class="col-sm-12">
										<div class="card-box table-responsive">
											<p class="text-muted font-13 m-b-30">2023년 공수 리스트 입니다.</p>								
										</div>
									</div>
			                    </div>
			                    
			                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
									<div class="col-sm-12">
										<div class="card-box table-responsive">
											<p class="text-muted font-13 m-b-30">2024년 공수 리스트 입니다.</p>								
										</div>
									</div>
			                    </div>	
			                    		                    
		                   </div> <!-- tab-content 끝 -->			                   
						</div> <!-- x_content 끝 -->						
					</div> <!-- x_panel 끝 -->
				</div> <!-- col-md-12 끝 -->
			</div> <!-- row 끝 -->
		</div> <!-- contents 끝 -->
	</div> <!-- right_col 끝 -->
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

