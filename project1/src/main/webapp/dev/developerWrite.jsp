<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>개발자 관리</h3>
				</div>

				<div class="title_right">
					<div class="col-md-5 col-sm-5  form-group pull-right top_search">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
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
							<h2>
								개발자 등록 <small></small>
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
								action="devWriteSave.do" data-parsley-validate
								class="form-horizontal form-label-left">

								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_id">사번 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="d_id" required="required"
											class="form-control " name="d_id">
									</div>
								</div>
								<div class="item form-group">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_name">개발자이름 <span class="required">*</span>
									</label>
									<div class="col-md-6 col-sm-6 ">
										<input type="text" id="d_name" required="required"
											class="form-control" name="d_name">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_jobgrade">직급 <span class="required">*</span></label>
									<div class="col-md-6 col-sm-6 ">
										<select class="form-control cate1" id="d_jobgrade"
											name="d_jobgrade">
											<option selected value="">직급을 선택해주세요.</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_tier">등급 <span class="required">*</span></label>
									<div class="col-md-6 col-sm-6 ">
										<select class="form-control cate2" id="d_tier" name="d_tier">
											<option selected value="none">등급을 선택해주세요.</option>
										</select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-form-label col-md-3 col-sm-3 label-align"
										for="d_type">직원구분여부 <span class="required">*</span></label>
									<div class="col-md-6 col-sm-6 ">
										<select class="form-control cate3" id="d_type" name="d_type">
											<option selected value="none">직원구분여부를 선택해주세요.</option>
										</select>
									</div>
								</div>
							</form>
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

	<script>
		/* 카테고리 */
		let cateList = JSON.parse('${cateList}');

		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();

		let cateSelect1 = $(".cate1");
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");

		/* 카테고리 배열 초기화 메서드 */
		function makeCateArray(obj, array, cateList, masterCd) {
			for (let i = 0; i < cateList.length; i++) {
				if (cateList[i].masterCd === masterCd) {
					obj = new Object();

					obj.masterCd = cateList[i].masterCd;
					obj.detailCd = cateList[i].detailCd;
					obj.detailNm = cateList[i].detailNm;

					array.push(obj);

				}
			}
		}

		/* 배열 초기화 */
		makeCateArray(cate1Obj, cate1Array, cateList, 'G');
		makeCateArray(cate2Obj, cate2Array, cateList, 'T');
		makeCateArray(cate3Obj, cate3Array, cateList, 'O');

		$(document).ready(function() {
			console.log(cate1Array);
			console.log(cate2Array);
			console.log(cate3Array);
		});

		for (let i = 0; i < cate1Array.length; i++) {
			cateSelect1.append("<option value='"+cate1Array[i].detailNm+"'>"
					+ cate1Array[i].detailNm + "</option>");

		}
		for (let i = 0; i < cate2Array.length; i++) {
			cateSelect2.append("<option value='"+cate2Array[i].detailNm+"'>"
					+ cate2Array[i].detailNm + "</option>");

		}
		for (let i = 0; i < cate3Array.length; i++) {
			cateSelect3.append("<option value='"+cate3Array[i].detailNm+"'>"
					+ cate3Array[i].detailNm + "</option>");

		}
	</script>

</body>
</html>