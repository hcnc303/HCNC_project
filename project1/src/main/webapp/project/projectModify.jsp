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
								<h3>프로젝트 수정</h3>
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
	                                                <input class="form-control" type="date" name="p_startdate" id="datepicker1" required="required" value="${vo.p_startdate}"></div>
                                        	</div>
											<div class="field item form-group">
	                                            <label class="col-form-label col-md-3 col-sm-3  label-align">프로젝트 종료일<span class="required">*</span></label>
	                                            <div class="col-md-6 col-sm-6">
	                                                <input class="form-control" type="date" name="p_enddate" id="datepicker2" required="required" value="${vo.p_enddate}"></div>
                                        	</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_place">사업 장소<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control cate4" id="p_place" name="p_place">
														<c:forEach var="locateList" items="${loCateList}">
															<option <c:out value="${vo.p_place==locateList.detailNm?'selected':''}" />>${ locateList.detailNm}</option>
														</c:forEach>
			                                       </select>
												</div>
											</div>
											<div class="item form-group">
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_buyer">발주처<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<select class="form-control" id="p_buyer" name="p_buyer">
														<c:forEach var="bucateList" items="${cateList}">
															<option <c:out value="${vo.p_buyer==bucateList.detailNm?'selected':''}" />>${ bucateList.detailNm}</option>
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
												<label class="col-form-label col-md-3 col-sm-3 label-align" for="p_tel">연락처<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6 ">
													<input type="text" id="p_tel" required="required" class="form-control" name="p_tel" value="${vo.p_tel }">
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
		
		<script src="datepicker/air-datepicker/dist/js/datepicker.min.js"></script>
	    <script src="datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>
		
		<script>
		/* 카테고리 */
		let cateList = JSON.parse('${cateList}');
		let loCateList = JSON.parse('${loCateList}');
		let poCateList = JSON.parse('${poCateList}');
		
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
		
		function makeLoCateArray(obj,array,loCateList, masterCd){
			for(let i = 0; i < loCateList.length; i++){
				if(loCateList[i].masterCd === masterCd){
					obj = new Object();
					
					obj.masterCd = loCateList[i].masterCd;
					obj.detailCd = loCateList[i].detailCd;
					obj.detailNm = loCateList[i].detailNm;
					
					array.push(obj);				
					
				}
			}
		}
		
		function makePoCateArray(obj,array,poCateList, masterCd){
			for(let i = 0; i < poCateList.length; i++){
				if(poCateList[i].masterCd === masterCd){
					obj = new Object();
					
					obj.masterCd = poCateList[i].masterCd;
					obj.detailCd = poCateList[i].detailCd;
					obj.detailNm = poCateList[i].detailNm;
					
					array.push(obj);				
					
				}
			}
		}

		/* 배열 초기화 */
		makeLoCateArray(cate4Obj,cate4Array,loCateList,'L');
		makePoCateArray(cate5Obj,cate5Array,poCateList,'P');
		makeCateArray(cate6Obj,cate6Array,cateList,'B');
		
		/* 발주처 카테고리 */
		for(let i = 0; i < cate4Array.length; i++){
			cateSelect4.append("<option value='"+cate4Array[i].detailNm+"'>" + cate4Array[i].detailNm + "</option>");
		}
		
		for(let i = 0; i < cate6Array.length; i++){
			cateSelect6.append("<option value='"+cate6Array[i].detailNm+"'>" + cate6Array[i].detailNm + "</option>");
		}
		
		for(let i = 0; i < cate5Array.length; i++){
			cateSelect5.append("<option value='"+cate5Array[i].detailNm+"'>" + cate5Array[i].detailNm + "</option>");
		}
		
		</script>
		
		<script>// 달력

        //두개짜리 제어 연결된거 만들어주는 함수
        datePickerSet($("#datepicker1"), $("#datepicker2"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

        /*
            * 달력 생성기
            * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
            * @example   datePickerSet($("#datepicker"));
            * 
            * 
            * @param sDate, 
            * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
            * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
            */
        function datePickerSet(sDate, eDate, flag) {

            //시작 ~ 종료 2개 짜리 달력 datepicker	
            if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
                var sDay = sDate.val();
                var eDay = eDate.val();

                if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
                    var sdp = sDate.datepicker().data("datepicker");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

                    var edp = eDate.datepicker().data("datepicker");
                    edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
                }

                //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
                if (!isValidStr(eDay)) {
                    sDate.datepicker({
                        maxDate: new Date(eDay.replace(/-/g, "/"))
                    });
                }
                sDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });

                //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
                if (!isValidStr(sDay)) {
                    eDate.datepicker({
                        minDate: new Date(sDay.replace(/-/g, "/"))
                    });
                }
                eDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });

                //한개짜리 달력 datepicker
            } else if (!isValidStr(sDate)) {
                var sDay = sDate.val();
                if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
                    var sdp = sDate.datepicker().data("datepicker");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
                }

                sDate.datepicker({
                    language: 'ko',
                    autoClose: true
                });
            }


            function isValidStr(str) {
                if (str == null || str == undefined || str == "")
                    return true;
                else
                    return false;
            }
        }
    	</script>
	</body>
</html>