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
	function fn_update(d_id) {
		location = "devModifyWrite.do?d_id=" + d_id;
	}
	function fn_delete(d_id) {
		if (confirm("정말 삭제하시겠습니까?")) {
			location = "devDelete.do?d_id=" + d_id;
		}
	}
</script>
</head>

<body class="nav-md">

	<%@include file="../includes/project/header.jsp"%>

	<!-- page content -->
	<div class="right_col" role="main">
		<div class="contents">
			<div class="page-title">
				<div class="title_left">
					<h3>
						개발자 관리<small></small>
					</h3>
				</div>
			</div>
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								직원비율 및 등급비율 <small></small>
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
										<p class="text-muted font-13 m-b-30">사원비율 및 등급비율</p>
									</div>
								</div>	
								<div style="display: flex; width: 100%; justify-content: center;" >
									<div style="width: 400px; height: 400px; margin-right: 200px; ">
										<!--차트가 그려질 부분-->
										<canvas id="grade" style="width: 400px; height: 400px;" ></canvas>
									</div>
									<div style="width: 400px; height: 400px;">
										<!--차트가 그려질 부분-->
										<canvas id="tier" style="width: 400px; height: 400px;" ></canvas>
									</div>
								</div>														
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 col-sm-12 ">
					<div class="x_panel">
						<div class="x_title">
							<h2>
								개발자 리스트 <small></small>
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
										<p class="text-muted font-13 m-b-30">개발자 리스트 입니다.</p>
										<table id="datatable-fixed-header"
											class="table table-striped table-bordered"
											style="width: 100%">
											<thead>
												<tr>
													<th>no</th>
													<th>사번</th>
													<th>개발자이름</th>
													<th>직급</th>
													<th>등급</th>
													<th>직원구분여부</th>
													<th>입사일</th>
													<th>구분</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="result" items="${resultList}"
													varStatus="status">
													<tr>
														<td>${result.dNo}</td>
														<td>${result.dId}</td>
														<td>${result.dName}</td>
														<td>${result.dJobgrade}</td>
														<td>${result.dTier}</td>
														<td>${result.dType}</td>
														<td>${result.joindate }</td>
														<td>
															<button type="button" class="btn btn-round btn-primary"
																onclick="fn_update('${result.dId}')">수정</button>
															<button type="button" class="btn btn-round btn-danger"
																onclick="fn_delete('${result.dId}')">삭제</button>
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
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script type="text/javascript">
            var context = document
                .getElementById('grade')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'pie', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '사원','대리','과장','차장','부장','이사'
                    ],
                    datasets: [
                        { //데이터
                            label: '사원 비율', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                ${list1},${list2},${list3},${list4},${list5},${list6} //x축 label에 대응되는 데이터 값
                            ], 
                            backgroundColor: [
                                //색상
                                'rgba(247, 8, 5, 0.3)',
                                'rgba(57, 79, 240, 0.3)',
                                'rgba(247, 246, 28, 0.3)',
                                'rgba(75, 192, 192, 0.3)',
                                'rgba(153, 102, 255, 0.3)',
                                'rgba(255, 159, 64, 0.3)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
        <script type="text/javascript">
            var context = document
                .getElementById('tier')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'pie', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                        '초급','중급','고급','특급'
                    ],
                    datasets: [
                        { //데이터
                            label: '등급 비율', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                                ${tierlist1},${tierlist2},${tierlist3},${tierlist4} //x축 label에 대응되는 데이터 값
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(247, 8, 5, 0.3)',
                                'rgba(57, 79, 240, 0.3)',
                                'rgba(247, 246, 28, 0.3)',
                                'rgba(75, 192, 192, 0.3)',
                                'rgba(153, 102, 255, 0.3)',
                                'rgba(255, 159, 64, 0.3)'
                            ], 
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
        </script>
</body>
</html>