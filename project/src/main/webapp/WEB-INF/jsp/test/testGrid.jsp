<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script src="/js/jquery-1.12.4.min.js"></script>
<script src="/jqgrid/js/CommonAjaxLodingEvent.js"></script>
<script src="/jqgrid/js/i18n/grid.locale-kr.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/jqgrid/js/minified/jquery.jqGrid.min.js"></script>
<script src="/jqgrid/js/CommonExcelEvent.js"></script>




<link rel="stylesheet" type="text/css" href="/jqgrid/css/common.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/contents_IE9.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/contents.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/error.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/font.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/import.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/main.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/ui_style.css" />
<link rel="stylesheet" type="text/css" href="/css/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="/jqgrid/css/reset.css" />



<script>
	$(document).ready(function () {
		jqGrid(); //페이지 접속시 jqGrid생성
		searchCodeAll(); //코드 통합검색하는 FUNCTION
		searchCodeOnly(); //코드만 검색하는 FUNCTION
		commonCodeEnterKey(); //통합검색 엔터키 사용
		commonOnlyCodeEnterKey(); //코드검색 엔터키 사용
	});


	/*해당 텍스트 박스에 엔터키를 눌렸을시 버튼이랑 똑같은 동작하는 부분*/
	function commonCodeEnterKey(){
		$('#txt_fgDescCode2').keydown(function(e){
			if(e.keyCode == '13'){
				$("#btn_fgnmSearchBtn2").trigger('click');
			}
		})
	};
	function commonOnlyCodeEnterKey(){
		$('#txt_code').keydown(function(e){
			if(e.keyCode == '13'){
				$("#codeSearchBtn2").trigger('click');
			}
		})
	};

	/* 페이지 접속시 그리드 불러오기 */
	function jqGrid(){
		var name01 = ["구분", "구분명", "코드","코드명"];

		var model = new Array();

		model.push({ name : "FG", 		index : "FG", width:300});
		model.push({ name : "FG_NM", 		index : "FG_NM", width:300});
		model.push({ name : "CODE", 		index :"CODE", width:300});
		model.push({ name : "DES", 		index :"DES", width:300});

		$("#tb_jqGrid").jqGrid({
	    	datatype : 'local',
			height : 'auto',	// 높이 지정
			autowidth : true,	//넓이 auto, 지정 하고싶으면 width
			colNames : name01,	// header 이름
			colModel : model,	// 값 대칭
			sortname : '일치 여부',	  // 정렬 기준
			sortable : false,
			sortorder : 'desc',	  // 오름차순, 내림차순
			multiselect : true,  // 체크박스
			multiboxonly : false, // 체크박스만 클릭 했을 때 check
			rowNum : 10,			  // 보여줄 데이터 개수 -1하면 무한데
			rownumbers : false,		//행 숫자 표현
			emptyrecords: '데이터가 없습니다.',
			caption : "코드 등록 현황",
			loadtext : false,
			pager: '#div_pager',
			pginput : true,
			shrinkToFit:false,
			viewrecords: true,
			recordtext: "view {0}-{1} of {2}",
			loadonce: true,		//서버에서 데이터 한번만 들고 오기
			onSelectRow : function(rowid){
				var item = $("#tb_jqGrid").jqGrid('getRowData',rowid);

			    $("#txt_code").val(item.code);
			    $("#txt_fg").val(item.fg);
			    $("#txt_desc").val(item.desc);
			    $("#txt_fgNm").val(item.fgNm);
			    $("#hid_code").val(item.code);
			    $("#hid_fg").val(item.fg);
			}
		});
	}

	/*코드 및 통합검색 조회부분*/
  	function searchCodeAll(){
		var fgDescCode1 =  $("#com_fgDescCode1").val();
		var fgDescSearch = $("#txt_fgDescCode2").val();

		$("#tb_jqGrid").clearGridData();
		jQuery('#tb_jqGrid').jqGrid('setGridParam', {
	          url: "/smCodeReaderSearch.do",
	          mtype:'POST',
	          postData:{
	        	  		"fgDescCode1" : fgDescCode1,
		     	   		"fgDescSearch" : fgDescSearch
	       	  			},
	          datatype:'json',
	          loadComplete : function(result){

	            var model = new Array();

	    		model.push({ name : "FG", 		index : "FG", width:300});
	    		model.push({ name : "FG_NM", 		index : "FG_NM", width:300});
	    		model.push({ name : "CODE", 		index :"CODE", width:300});
	    		model.push({ name : "DES", 		index :"DES", width:300});
	          }
	      });
		jQuery("#tb_jqGrid").trigger('reloadGrid');
  	}

	/* 코드만 검색하는 부분 */
 	function searchCodeOnly(){
	 	$("#codeSearchBtn2").on("click", function(){
			var Codenumber =  $("#txt_code").val();

			$("#tb_jqGrid").clearGridData();
			jQuery('#tb_jqGrid').jqGrid('setGridParam', {
		          url: "/smCodeReaderSearch2.do",
		          mtype:'POST',
		          postData:{
		        	  		"Codenumber" : Codenumber
		       	  		   },
		          datatype:'json',
		          loadComplete : function(result){

		        	if(result.rows[0] != null){
		            var model = new Array();

		    		model.push({ name : "FG", 		index : "FG", width:300});
		    		model.push({ name : "FG_NM", 		index : "FG_NM", width:300});
		    		model.push({ name : "CODE", 		index :"CODE", width:300});
		    		model.push({ name : "DES", 		index :"DES", width:300});

		    		 $("#txt_code").val(result.rows[0].code);
				     $("#txt_fg").val(result.rows[0].fg);
				     $("#txt_desc").val(result.rows[0].desc);
				     $("#txt_fgNm").val(result.rows[0].fgNm);
				     $("#hid_code").val(result.rows[0].code);
				     $("#hid_fg").val(result.rows[0].fg);
		        	}
		        	else{
		        		alert("조회된 데이터가 없습니다.");
		        	}
		          }
		      });
			jQuery("#tb_jqGrid").trigger('reloadGrid');
		});
 	}

 	/* 코드 등록하는 부분 */
	function insertCode(){
		var formdata = $("form[name=CodeRework]").serializeObject();
		var jsondata=JSON.stringify(formdata);
		var CODE = $("#txt_code").val();
		var DESC = $("#txt_desc").val();
		var FG = $("#txt_fg").val();
		var FGNM = $("#txt_fgNm").val();


		if(CODE == "" || DESC == "" || FG == "" || FGNM == "" ){
			alert("코드, 코드명, 구분, 구분명은 필수 값입니다.")
		}else{
			if(confirm("등록하시겠습니까?")==true){
				$.ajax({
					type : 'POST',
					url : '/smCodeAdd.do',
					contentType : 'application/json; charset=utf-8',
					dataType: 'json',
					data: jsondata,
					error:function(request,status,error, xhr){
						alert("알 수 없는 에러가 발생하였습니다. 관리자에게 문의해주시기 바랍니다.");
		            },
		            success : function(result){
		            	alert("정상적으로 등록이 완료되었습니다.");
		            	searchCodeAll();
		            }
				});
			}
		}
	}

 	/* 코드 수정하는 부분 */
	function updateCode(){
		var formdata=$("form[name=CodeRework]").serializeObject();
		var jsondata=JSON.stringify(formdata);

		var CODE = $("#txt_code").val();
		var DESC = $("#txt_desc").val();
		var FG = $("#txt_fg").val();
		var FGNM = $("#txt_fgNm").val();

		if(CODE == "" || DESC == "" || FG == "" || FGNM == "" ){
			alert("코드, 코드명, 구분, 구분명은 필수 값입니다.")
		}else{
			if(confirm("수정하시겠습니까?")==true){
				$.ajax({
					type : 'POST',
					url : '/smCodeModify.do',
					contentType : 'application/json; charset=utf-8',
					dataType: 'json',
					data :jsondata,
					error:function(request,status,error, xhr){
						alert("알 수 없는 에러가 발생하였습니다. 관리자에게 문의해주시기 바랍니다.");
		            },
		            success : function(result){

		            	if(result.sttus == "nocode"){
		            		alert("존재하는 코드가 아닙니다.");
		            	}
		            	else if(result.sttus == "nofg"){
		            		alert("존재하는 구분 코드가 아닙니다.");
		            	}
		            	else{
		            		alert("정상적으로 수정이 완료되었습니다.");
			            	searchCodeAll();
			            	searchCodeOnly();
		            	}
		            }
				});
			}
		}
	};

	/* 코드 삭제하는 부분 */
	function deleteCode(){

		var checkbox=$("input:checkbox[class='cbox']:checked");
		var ChassetNO = new Array();
		var seEmplNo = $("#hid_seEmplNo").val();

		checkbox.each(function(e){
			var tr = checkbox.parent().parent().eq(e);
			var td = tr.children();
			var CODE =td.eq(3).text();

			if(CODE != "코드"){
				ChassetNO.push(CODE);
			}
		});

		var CODE = $("#txt_code").val();
		var DESC = $("#txt_desc").val();
		var FG = $("#txt_fg").val();
		var FGNM = $("#txt_fgNm").val();

		if(ChassetNO.length == 0){
			alert("삭제 할 코드를 체크 하시기 바랍니다.");
		}
		else{
		if(confirm("삭제하시겠습니까?")==true){
			$.ajax({
				type : 'POST',
				url : '/smCodeRemove.do',
				dataType: 'json',
				data:{
					"ChassetNO":ChassetNO,
					"seEmplNo":seEmplNo
				},
				error:function(request,status,error, xhr){
					alert("알 수 없는 에러가 발생하였습니다. 관리자에게 문의해주시기 바랍니다.");
	            },
	            success : function(result){
              	   alert("정상적으로 삭제가 완료되었습니다.");
	               searchCodeAll();
	            }
			});
		}
		}
	}

	/* json 형식 변환 object */
	jQuery.fn.serializeObject = function() {
		var obj = null;
	    try {
	        if(this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
	            var arr = this.serializeArray();
	            if(arr){
	            	obj = {};
	            	jQuery.each(arr, function() {
	            		obj[this.name] = this.value;
	            	});
	            }
	        }
	    }catch(e) {
        	alert(e.message);
	    }finally {}
     	return obj;
     };

     /* 엑셀 다운로드 */
 	function excelDownload(){
 		<c:choose>
			<c:when test = '${dspyAuthr.downAuthr == "N"}'>
				alert("다운로드 권한이 없습니다.");
			</c:when>
			<c:otherwise>
		 		var fgDescCode1 =  $("#com_fgDescCode1").val();
				var fgDescSearch = $("#txt_fgDescCode2").val();

		 		if(confirm("코드 관리를 엑셀으로 다운로드 하시겠습니까?")){
		 			$.ajax({
		 				type : 'POST',
		 				url : '/smCodeReaderSearch.do',
		 				dataType: 'json',
		 				data:{
		 					"fgDescCode1" : fgDescCode1,
			     	   		"fgDescSearch" : fgDescSearch

		 				},
		 				error:function(request, xhr, status, error){
		 					alert("알 수 없는 에러가 발생하였습니다. 관리자에게 문의해주시기 바랍니다.");
		 		           },
		 				success : function(result){
		 					excelExport("CodeReader", result);
		 				}
		 			});
		 		}
		 		$('#excelList').empty();
			</c:otherwise>
		</c:choose>
 	}
</script>
<div id="mask"></div>
	<div class="sub-container page-code">
		<div class="middle-cont">
			<div class="section wp68 iewp63 mg-r34ie">
				<h3>코드 정보</h3>
				<div class="section-box">
					<table class="table-type04">
						<caption>코드정보 테이블</caption>
						<colgroup>
							<col class="w120" />
							<col class="wp20" />
							<col class="w120" />
							<col class="wp40" />
						</colgroup>
						<tbody>
							<tr>
								<th scope = "row" class="wp10">구분명</th>
								<td class= "wp40">
                               		<label for="com_fgDescCode1" class="hide">구분명</label>
									<select name = "fgDescCode1" id="com_fgDescCode1" class="wp70">
										<c:forEach var = "fgDescCode1Val" items = "${fgDescCode1List}">
                           					<option value = "${fgDescCode1Val.FG_NM}">${fgDescCode1Val.FG_NM}</option>
                               			</c:forEach>
									</select>
									<!-- <button type="button" name="fgnmSearchBtn" id="btn_fgnmSearchBtn1" class="btn-search mg-l10"  onclick="searchCodeAll();"></button> -->
								</td>
                                <th scope = "row" class="wp10">코드 검색</th>
							 	<td class= "wp60">
							 		<label for="txt_fgDescCode2" class="hide">코드</label>
									<input type="text"  name="fgDescCode2" id="txt_fgDescCode2" class="wp60 mg-l20" placeholder="코드 또는 구분을 입력하세요." />
									<button type="button" name="fgnmSearchBtn" id="btn_fgnmSearchBtn2" class="btn-search mg-l10"  onclick="searchCodeAll();"></button>
								</td>
							</tr>
							</tbody>
					</table>
					<div class="section wp100">
		       			<table id="tb_jqGrid"></table>
						<div id="div_pager"></div>
			    	</div>
					<div class="dis_ib pd-t10 fw500">※ 체크박스를 통해 삭제를 누르면 다중삭제도 가능합니다.</div>
				</div>
			</div>
			<div class="section  wp30-4">
				<h3 class="bg-gray">코드 관리</h3>
				<div class="section-box">
				<form name="CodeRework" id="CodeRework">
					<input type="hidden" name="seEmplNo" id="hid_seEmplNo" value="<c:out value="${emplNo}"/>" />
					<input type="hidden" name="FG1" id="hid_fg" />
					<input type="hidden" name="CODE1" id="hid_code" />
					<table class="table-type04">
						<caption>코드 관리 테이블</caption>
						<colgroup>
							<col class="wp15" />
							<col class="wp85" />
						</colgroup>
						<tbody>
							<tr>
								<th scope = "row"><span class="red">*</span>코드</th>
								<td>
									<label for="txt_code" class="hide">코드</label>
									<input type="text"  name="CODE" id="txt_code" class="calc80-38 mg-l20"  maxlength="10" />
									<button type="button" name="codeSearchBtn2" id="codeSearchBtn2" class="btn-search">코드검색</button>
								</td>
							</tr>
							<tr>
								<th scope = "row"><span class="red">*</span>코드명</th>
								<td>
									<label for="txt_desc" class="hide">코드설명</label>
								    <textarea  name="DES" id ="txt_desc" class = "wp80 mg-l20 pd-t190 h300 va-m" maxlength="255"></textarea>
								</td>
							</tr>
							<tr>
								<th scope = "row"><span class="red">*</span>구분</th>
								<td>
									<label for="txt_fg" class="hide">구분</label>
									<input type="text" name="FG" id="txt_fg" class="wp80 mg-l20"  maxlength="10" />
								</td>
							</tr>
							<tr>
								<th scope = "row"><span class="red">*</span>구분명</th>
								<td>
									<input type="text" name="FG_NM" id="txt_fgNm" class="wp80 mg-l20" maxlength="50" />
									<label for="txt_fgNm" class="hide">구분명</label>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
					<div class="button-cont min0 mg-t20">
						<div class="btn-box fn">
							<ul class="fl-ju">
								<c:if test = '${dspyAuthr.updtAuthr == "Y"}'>
									<li><a href="javascript:updateCode();" title="수정">수정</a></li>
								</c:if>
								<c:if test = '${dspyAuthr.deleteAuthr == "Y"}'>
									<li><a href="javascript:deleteCode();" title="삭제">삭제</a></li>
								</c:if>
								<c:if test = '${dspyAuthr.inputAuthr == "Y"}'>
									<li><a href="javascript:insertCode();" title="등록" class="bg-navy">등록</a></li>
								</c:if>
							</ul>
						</div>
					</div>
					<!-- .button-cont -->
					<span class="warn fr pd-b20 red">*필수 값을 입력해주세요</span>
				</div>
			</div>
			<!-- .section end-->
		</div>
		<!-- .middle-cont end-->
	</div>
	<!-- .sub-container end -->
<div id="excelList" class="dis_n"></div>