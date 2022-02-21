/*엑셀 확장자 Chcek*/
    function checkFileType(filePath){
   	 	var fileFormat = filePath.split(".");
	   	 if(fileFormat.indexOf("xls") > -1){
	   	 	return true;
	   	 }else if(fileFormat.indexOf("xlsx") > -1){
	   	 	return true;
	   	 }else{
	   	 	return false;
	   	 }
    }

/* 공통 엑셀다운로드 function */
	function fnExcelReport(id, title) { //하드웨어 테스트
		 var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
		 tab_text = tab_text + '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
		 tab_text = tab_text + '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
		 tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
		 tab_text = tab_text + '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
		 tab_text = tab_text + '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
		 tab_text = tab_text + "<table border='1px'>";
		 var exportTable = $('#' + id).clone();
			 exportTable.find('input').each(function (index, elem) {
				 $(elem).remove();
				 }
			 );
		 tab_text = tab_text + exportTable.html();
		 tab_text = tab_text + '</table></body></html>';
		 var data_type = 'data:application/vnd.ms-excel';
		 var ua = window.navigator.userAgent;
		 var msie = ua.indexOf("MSIE ");
		 var fileName = title + '.xls';
		 //Explorer 환경에서 다운로드
		 if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
			 if (window.navigator.msSaveBlob) {
				 var blob = new Blob([tab_text], {
					type: "application/csv;charset=utf-8;"
				 });
			 navigator.msSaveBlob(blob, fileName);
			 }
		 }else{
			 var blob2 = new Blob([tab_text], {
			 	type: "application/csv;charset=utf-8;"
			 });
			 var filename = fileName;
			 var elem = window.document.createElement('a');
			 elem.href = window.URL.createObjectURL(blob2);
			 elem.download = filename;
			 document.body.appendChild(elem);
			 elem.click();
			 document.body.removeChild(elem);
		 }
	}

/* 엑셀 업로드 양식 다운로드 */
    function excelUploadDown(param){
    	var url;
    	if(param == "HwAssetManagement"){
    		var url = "/download/excel/ITAM_HW_OA_Upload_File.xlsx"
    	}else if(param == "SwAssetManage"){
    		 var url = "/download/excel/ITAM_SW_Upload_File.xlsx"
    	}else if(param == "CommAssetManage"){
    		var url = "/download/excel/ITAM_COMM_Upload_File.xlsx"
    	}else if(param == "EtcSubAssetManage"){
    		var url = "/download/excel/ITAM_EQP_Upload_File.xlsx"
    	}
    	location.href = url;
    }

/* 엑셀 삭제 양식 다운로드 */
    function excelDeleteDown(param){
    	var url = "/download/excel/ITAM_TOTAL_Delete_File.xlsx"
    	location.href = url;
    }

/* 엑셀 삭제 function */
    function excelDelete(){
		 var file = $("#file_excelDelete").val();
		 if(file == "" || file == null){
			alert("파일을 선택하세요");
		 	return false;
		 }else if(!checkFileType(file)){
		 	alert("엑셀 파일만 업로드 가능합니다.");
		 	return false;
		 }
		 	var fileFormat = file.split(".");
		var fileType = fileFormat[1];
		if(confirm("자료삭제 하시겠습니까?")){
			$("#excelDeleteForm").attr("action","/amTotalExcelDelete.do");
			dataType: 'json';
		       var options = {
		          success:function(result){
		           	  if(result.sttus == true){
		                	   var successCode = result.listSize -4; /* 엑셀 데이터를 입력한 행을 표출하기 위해서 5행부터 읽기때문에 -4을 해줌 */
		           			 alert("자료삭제 성공 : 총 " + successCode + "개의 데이터 중 " + successCode + "개의 데이터가 삭제되었습니다.");
		           		    location.reload();
		           	  }
		          },
		          error : function(request,status,error){
		        	  alert("알 수 없는 에러가 발생하였습니다. 관리자에게 문의해주시기 바랍니다.");
		       		  location.reload();
		          },
		          type: "POST",
		          data : {"excelType" : fileType}
		       };
		          $("#excelDeleteForm").ajaxSubmit(options);
		}
    }

///////////////////////////////////// 엑셀 Export 부분/////////////////////////////////////////////////////

	function excelExport(param, result){
		/* IT자산현황 - H/W 장비현황*/
		if(param == "AssetReality"){excelDownAssetReality(result);
		/* IT자산현황 - S/W 라이선스 현황*/
		}else if(param == "SwAssetReality"){excelDownSwAssetReality(result);
		/* IT자산현황 - 통신장비 장비현황*/
		}else if(param == "CommAssetReality"){excelDownCommAssetReality(result);
		/* IT자산현황 - 기반설비 장비현황*/
		}else if(param == "EtcsubAssetReality"){excelDownEtcsubAssetReality(result);
		/* IT자산별 관리 - H/W 장비 관리 엑셀 다운로드*/
		}else if(param == "HwAssetManagement"){excelDownHwAssetManagement(result);
		/* IT자산별 관리 - S/W 라이선스 관리 엑셀 다운로드*/
		}else if(param == "SwAssetManage"){excelDownSwAssetManage(result);
		/* IT자산별 관리 -통신장비 관리 엑셀 다운로드*/
		}else if(param == "CommAssetManage"){excelDownCommAssetManage(result);
		/* IT자산별 관리 -기반설비 관리 엑셀 다운로드*/
		}else if(param == "EtcSubAssetManage"){excelDownEtcSubAssetManage(result);
		/* 대여장비 현황 엑셀 다운로드*/
		}else if(param == "RentNtbkSttus"){excelDownRentNtbkSttus(result);
		/* 대여장비 로그현황*/
		}else if(param == "RentAssetLogSttus"){excelDownRentAssetLogSttus(result);
		/* OA장비 자산실사 현황*/
		}else if(param == "AssetAcinsSttus"){excelDownAssetAcinsSttus(result);
		/* IT자산 반납(창고) 현황*/
		}else if(param == "AssetWrhusSttus"){excelDownAssetWrhusSttus(result);
		/* IT자산 폐기대상 현황*/
		}else if(param == "AssetDsuseSttus"){excelDownAssetDsuseSttus(result);
		/* IT자산 폐기완료 현황 - HW 장비 현황*/
		}else if(param == "HwAssetDsuseComplete"){excelDownHwAssetDsuseComplete(result);
		/* IT자산 폐기완료 현황 - SW 라이선스 현황*/
		}else if(param == "SwAssetDsuseComplete"){excelDownSwAssetDsuseComplete(result);
		/* IT자산 폐기완료 현황 - 통신장비 현황*/
		}else if(param == "CommAssetDsuseComplete"){excelDownCommAssetDsuseComplete(result);
		/* IT자산 폐기완료 현황* - 기반설비 현황*/
		}else if(param == "EtcsubAssetDsuseComplete"){excelDownEtcsubAssetDsuseComplete(result);
		/* IT자산 손망실 관리*/
		}else if(param == "AssetLossSttus"){excelDownAssetLossSttus(result);
		/* 유지보수 계약 현황*/
		}else if(param == "AssetMntSttus"){excelDownAssetMntSttus(result);
		/* 사용자 등록 현황*/
		}else if(param == "UserRegisterSttus"){excelDownUserRegisterSttus(result);
		/* 코드관리*/
		}else if(param == "CodeReader"){excelDownCodeReader(result);
		/* 가상화코드관리*/
		}else if(param == "VirtualCodeReader"){excelDownVirtualCodeReader(result);
		/* 화면 관리 */
		}else if(param == "DsplyAdministrate"){excelDownDsplyAdministrate(result);
		/* 사용자 권한별 화면 관리 */
		}else if(param == "AuthrDsplyAdministrate"){excelDownAuthrDsplyAdministrate(result);
		/* 사용자 변경 관리 */
		}else if(param == "amB_DeptAssetSttus"){excelDownamB_DeptAssetSttus(result);
		/* 가상화코드 */
		}else if(param == "VirtualCode"){excelDownVirtualCode(result);		
		/* 가상화현황 */
		}else if(param == "VirtualReality"){excelDownVirtualAsset(result);}
	}

	function excelDownAssetReality(result){
		var data  = result.rows;
 		var str =   '<TABLE>'
 					+'<CAPTION>HW 장비 현황</CAPTION>'
 					+'<COLGROUP>'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 					+'</COLGROUP>'
 						+ '<TBODY>'
 							+ '<TR>'
 									+'<TH>HW 장비번호</TH>'
 									+'<TH>확인번호</TH>'
 									+'<TH>제품 시리얼 번호</TH>'
 									+'<TH>제품명</TH>'
 									+'<TH>중구분</TH>'
 									+'<TH>소구분</TH>'
 									+'<TH>제조사</TH>'
 									+'<TH>모델명</TH>'
 									+'<TH>자산상태</TH>'
 									+'<TH>사용자</TH>'
 									+'<TH>직급/직위</TH>'
 									+'<TH>기관명</TH>'
 									+'<TH>지사</TH>'
 									+'<TH>부서명</TH>'
 									+'<TH>위치</TH>'
 									+'<TH>도입일자</TH>'
 									+'<TH>업무구분</TH>'
 									+'<TH>용도구분</TH>'
 									+'<TH>M/A 여부</TH>'
 									+'<TH>장비번호 출력 여부</TH>'
 									+'<TH>비고</TH>'
 								+'</TR>' ;
 	 $.each(data , function(i){

	 		 var itAssetNo 		= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	 		 var itAssetSerno 	= data[i].itAssetSerno; 	if(itAssetSerno == undefined){itAssetSerno = ""}
	 		 var prodtSnNo 		= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}
			 var prodtNm 		= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
			 var middlFg		= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
			 var smallFg		= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
			 var mnfCmpny		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
			 var modelNm		= data[i].modelNm; 			if(modelNm == undefined){modelNm = ""}
			 var assetSttus		= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
			 var nm 			= data[i].nm; 				if(nm == undefined){nm = ""}
			 var ofcps			= data[i].ofcps;			if(ofcps == undefined){ofcps = ""}
			 var insttNm		= data[i].insttNm;			if(insttNm == undefined){insttNm = ""}
			 var brffcNm		= data[i].brffcNm;			if(brffcNm == undefined){brffcNm = ""}
			 var deptNm			= data[i].deptNm;       	if(deptNm == undefined){deptNm = ""}
			 var loc			= data[i].loc;          	if(loc == undefined){loc = ""}
			 var indcDy			= data[i].indcDy;       	if(indcDy == undefined){indcDy = ""}
			 var jobFg			= data[i].jobFg;        	if(jobFg == undefined){jobFg = ""}
			 var prposFg		= data[i].prposFg;      	if(prposFg == undefined){prposFg = ""}
			 var mntNeedYn		= data[i].mntNeedYn;		if(mntNeedYn == undefined){mntNeedYn = ""}
			 var assetNoPrintng	= data[i].assetNoPrintng;	if(assetNoPrintng == undefined){assetNoPrintng = ""}
			 var rm				= data[i].rm;				if(rm == undefined){rm = ""}

 				str += 		 '<TR>'
		 						+'<TD>' + itAssetNo 		+ '</TD>'
		 						+'<TD>' + itAssetSerno 		+ '</TD>'
		 						+'<TD>' + prodtSnNo 		+ '</TD>'
								+'<TD>' + prodtNm 			+ '</TD>'
								+'<TD>' + middlFg 			+ '</TD>'
								+'<TD>' + smallFg 			+ '</TD>'
								+'<TD>' + mnfCmpny 			+ '</TD>'
								+'<TD>' + modelNm 			+ '</TD>'
								+'<TD>' + assetSttus 		+ '</TD>'
								+'<TD>' + nm 				+ '</TD>'
								+'<TD>' + ofcps 			+ '</TD>'
								+'<TD>' + insttNm 			+ '</TD>'
								+'<TD>' + brffcNm 			+ '</TD>'
								+'<TD>' + deptNm			+ '</TD>'
								+'<TD>' + loc 				+ '</TD>'
								+'<TD>' + indcDy 			+ '</TD>'
								+'<TD>' + jobFg 			+ '</TD>'
								+'<TD>' + prposFg			+ '</TD>'
								+'<TD>' + mntNeedYn			+ '</TD>'
 								+'<TD>' + assetNoPrintng 	+ '</TD>'
 								+'<TD>' + rm 				+ '</TD>'
 							+'</TR>';
 	   });
 			     str +=   '</TBODY>'
 						+'</TABLE>';
 	   $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
 	   fnExcelReport('excelList','HW 장비 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownSwAssetReality(result){
		var data  = result.rows;
 		var str =   '<TABLE>'
 					+'<CAPTION>SW 라이선스 현황</CAPTION>'
 					+'<COLGROUP>'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 					+'</COLGROUP>'
 						+ '<TBODY>'
 							+ '<TR>'
 									+'<TH>SW 관리번호</TH>'
 									+'<TH>확인번호</TH>'
 									+'<TH>제품 시리얼 번호</TH>'
 									+'<TH>제품명</TH>'
 									+'<TH>중구분</TH>'
 									+'<TH>소구분</TH>'
 									+'<TH>제조사</TH>'
 									+'<TH>모델명</TH>'
 									+'<TH>자산상태</TH>'
 									+'<TH>사용자</TH>'
 									+'<TH>직급/직위</TH>'
 									+'<TH>기관명</TH>'
 									+'<TH>지사</TH>'
 									+'<TH>부서명</TH>'
 									+'<TH>위치</TH>'
 									+'<TH>도입일자</TH>'
 									+'<TH>업무구분</TH>'
 									+'<TH>용도구분</TH>'
 									+'<TH>M/A 여부</TH>'
 									+'<TH>비고</TH>'
 								+'</TR>' ;
 	 $.each(data , function(i){

	 		 var itAssetNo 		= data[i].itAssetNo; 	if(itAssetNo == undefined){itAssetNo = ""}
	 		 var itAssetSerno 	= data[i].itAssetSerno; if(itAssetSerno == undefined){itAssetSerno = ""}
	 		 var prodtSnNo 		= data[i].prodtSnNo; 	if(prodtSnNo == undefined){prodtSnNo = ""}
	 		 var prodtNm 		= data[i].prodtNm; 		if(prodtNm == undefined){prodtNm = ""}
	 		 var middlFg		= data[i].middlFg; 		if(middlFg == undefined){middlFg = ""}
	 		 var smallFg		= data[i].smallFg; 		if(smallFg == undefined){smallFg = ""}
	 		 var mnfCmpny		= data[i].mnfCmpny; 	if(mnfCmpny == undefined){mnfCmpny = ""}
	 		 var modelNm		= data[i].modelNm; 		if(modelNm == undefined){modelNm = ""}
	 		 var assetSttus		= data[i].assetSttus; 	if(assetSttus == undefined){assetSttus = ""}
	 		 var nm 			= data[i].nm; 			if(nm == undefined){nm = ""}
	 		 var ofcps			= data[i].ofcps;		if(ofcps == undefined){ofcps = ""}
	 		 var insttNm		= data[i].insttNm;		if(insttNm == undefined){insttNm = ""}
	 		 var brffcNm		= data[i].brffcNm;		if(brffcNm == undefined){brffcNm = ""}
	 		 var deptNm			= data[i].deptNm;       if(deptNm == undefined){deptNm = ""}
	 		 var loc			= data[i].loc;          if(loc == undefined){loc = ""}
	 		 var indcDy			= data[i].indcDy;       if(indcDy == undefined){indcDy = ""}
	 		 var jobFg			= data[i].jobFg;        if(jobFg == undefined){jobFg = ""}
	 		 var prposFg		= data[i].prposFg;      if(prposFg == undefined){prposFg = ""}
	 		 var mntNeedYn		= data[i].mntNeedYn;	if(mntNeedYn == undefined){mntNeedYn = ""}
	 		 var rm				= data[i].rm;			if(rm == undefined){rm = ""}

 				str += 		 '<TR>'
 								+'<TD>' + itAssetNo 	+ '</TD>'
		 						+'<TD>' + itAssetSerno 	+ '</TD>'
		 						+'<TD>' + prodtSnNo 	+ '</TD>'
 								+'<TD>' + prodtNm 		+ '</TD>'
 								+'<TD>' + middlFg 		+ '</TD>'
 								+'<TD>' + smallFg 		+ '</TD>'
 								+'<TD>' + mnfCmpny 		+ '</TD>'
 								+'<TD>' + modelNm 		+ '</TD>'
 								+'<TD>' + assetSttus 	+ '</TD>'
 								+'<TD>' + nm 			+ '</TD>'
 								+'<TD>' + ofcps 		+ '</TD>'
 								+'<TD>' + insttNm 		+ '</TD>'
		 						+'<TD>' + brffcNm 		+ '</TD>'
		 						+'<TD>' + deptNm		+ '</TD>'
		 						+'<TD>' + loc 			+ '</TD>'
		 						+'<TD>' + indcDy 		+ '</TD>'
		 						+'<TD>' + jobFg 		+ '</TD>'
		 						+'<TD>' + prposFg		+ '</TD>'
		 						+'<TD>' + mntNeedYn		+ '</TD>'
		 						+'<TD>' + rm 			+ '</TD>'
 							+'</TR>';
 	   });
 			     str +=   '</TBODY>'
 						+'</TABLE>';
 	   $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
 	   fnExcelReport('excelList','SW 라이선스 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

		function excelDownCommAssetReality(result){
			var data  = result.rows;
	 		var str =   '<TABLE>'
	 					+'<CAPTION>통신장비 현황</CAPTION>'
	 					+'<COLGROUP>'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 						+'<COL width="200px">'
	 					+'</COLGROUP>'
	 						+ '<TBODY>'
	 							+ '<TR>'
	 									+'<TH>통신방비 장비번호</TH>'
	 									+'<TH>확인번호</TH>'
	 									+'<TH>제품 시리얼 번호</TH>'
	 									+'<TH>제품명</TH>'
	 									+'<TH>중구분</TH>'
	 									+'<TH>소구분</TH>'
	 									+'<TH>제조사</TH>'
	 									+'<TH>모델명</TH>'
	 									+'<TH>자산상태</TH>'
	 									+'<TH>사용자</TH>'
	 									+'<TH>직급/직위</TH>'
	 									+'<TH>기관명</TH>'
	 									+'<TH>지사</TH>'
	 									+'<TH>부서명</TH>'
	 									+'<TH>위치</TH>'
	 									+'<TH>도입일자</TH>'
	 									+'<TH>업무구분</TH>'
	 									+'<TH>용도구분</TH>'
	 									+'<TH>M/A 여부</TH>'
	 									+'<TH>장비번호 출력 여부</TH>'
	 									+'<TH>비고</TH>'
	 								+'</TR>' ;
	 	 $.each(data , function(i){

		 		 var itAssetNo 		= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
		 		 var itAssetSerno 		= data[i].itAssetSerno; if(itAssetSerno == undefined){itAssetSerno = ""}
		 		 var prodtSnNo 		= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}
				 var prodtNm 		= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
				 var middlFg		= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
				 var smallFg		= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
				 var mnfCmpny		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
				 var modelNm		= data[i].modelNm; 			if(modelNm == undefined){modelNm = ""}
				 var assetSttus		= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
				 var nm 			= data[i].nm; 				if(nm == undefined){nm = ""}
				 var ofcps			= data[i].ofcps;			if(ofcps == undefined){ofcps = ""}
				 var insttNm		= data[i].insttNm;			if(insttNm == undefined){insttNm = ""}
				 var brffcNm		= data[i].brffcNm;			if(brffcNm == undefined){brffcNm = ""}
				 var deptNm			= data[i].deptNm;       	if(deptNm == undefined){deptNm = ""}
				 var loc			= data[i].loc;          	if(loc == undefined){loc = ""}
				 var indcDy			= data[i].indcDy;       	if(indcDy == undefined){indcDy = ""}
				 var jobFg			= data[i].jobFg;        	if(jobFg == undefined){jobFg = ""}
				 var prposFg		= data[i].prposFg;      	if(prposFg == undefined){prposFg = ""}
				 var mntNeedYn		= data[i].mntNeedYn;		if(mntNeedYn == undefined){mntNeedYn = ""}
				 var assetNoPrintng	= data[i].assetNoPrintng;	if(assetNoPrintng == undefined){assetNoPrintng = ""}
				 var rm				= data[i].rm;				if(rm == undefined){rm = ""}

	 				str += 		 '<TR>'
				 					+'<TD>' + itAssetNo 		+ '</TD>'
			 						+'<TD>' + itAssetSerno 		+ '</TD>'
			 						+'<TD>' + prodtSnNo 		+ '</TD>'
									+'<TD>' + prodtNm 			+ '</TD>'
									+'<TD>' + middlFg 			+ '</TD>'
									+'<TD>' + smallFg 			+ '</TD>'
									+'<TD>' + mnfCmpny 			+ '</TD>'
									+'<TD>' + modelNm 			+ '</TD>'
									+'<TD>' + assetSttus 		+ '</TD>'
									+'<TD>' + nm 				+ '</TD>'
									+'<TD>' + ofcps 			+ '</TD>'
									+'<TD>' + insttNm 			+ '</TD>'
									+'<TD>' + brffcNm 			+ '</TD>'
									+'<TD>' + deptNm			+ '</TD>'
									+'<TD>' + loc 				+ '</TD>'
									+'<TD>' + indcDy 			+ '</TD>'
									+'<TD>' + jobFg 			+ '</TD>'
									+'<TD>' + prposFg			+ '</TD>'
									+'<TD>' + mntNeedYn 		+ '</TD>'
									+'<TD>' + assetNoPrintng 	+ '</TD>'
									+'<TD>' + rm 				+ '</TD>'
	 							+'</TR>';
	 	   });
	 			     str +=   '</TBODY>'
	 						+'</TABLE>';
	 	   $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
	 	   fnExcelReport('excelList','통신장비 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownEtcsubAssetReality(result){
		var data  = result.rows;
 		var str =   '<TABLE>'
 					+'<CAPTION>기반설비 현황</CAPTION>'
 					+'<COLGROUP>'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 					+'</COLGROUP>'
 						+ '<TBODY>'
 							+ '<TR>'
 									+'<TH>기반설비 장비번호</TH>'
 									+'<TH>확인번호</TH>'
 									+'<TH>제품 시리얼 번호</TH>'
 									+'<TH>제품명</TH>'
 									+'<TH>중구분</TH>'
 									+'<TH>소구분</TH>'
 									+'<TH>제조사</TH>'
 									+'<TH>모델명</TH>'
 									+'<TH>자산상태</TH>'
 									+'<TH>사용자</TH>'
 									+'<TH>직급/직위</TH>'
 									+'<TH>기관명</TH>'
 									+'<TH>지사</TH>'
 									+'<TH>부서명</TH>'
 									+'<TH>위치</TH>'
 									+'<TH>도입일자</TH>'
 									+'<TH>업무구분</TH>'
 									+'<TH>용도구분</TH>'
 									+'<TH>M/A 여부</TH>'
 									+'<TH>장비번호 출력 여부</TH>'
 									+'<TH>비고</TH>'
 								+'</TR>' ;
 	 $.each(data , function(i){

	 		 var itAssetNo 		= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	 		 var itAssetSerno 	= data[i].itAssetSerno; 	if(itAssetSerno == undefined){itAssetSerno = ""}
	 		 var prodtSnNo 		= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}
			 var prodtNm 		= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
			 var middlFg		= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
			 var smallFg		= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
			 var mnfCmpny		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
			 var modelNm		= data[i].modelNm; 			if(modelNm == undefined){modelNm = ""}
			 var assetSttus		= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
			 var nm 			= data[i].nm; 				if(nm == undefined){nm = ""}
			 var ofcps			= data[i].ofcps;			if(ofcps == undefined){ofcps = ""}
			 var insttNm		= data[i].insttNm;			if(insttNm == undefined){insttNm = ""}
			 var brffcNm		= data[i].brffcNm;			if(brffcNm == undefined){brffcNm = ""}
			 var deptNm			= data[i].deptNm;       	if(deptNm == undefined){deptNm = ""}
			 var loc			= data[i].loc;          	if(loc == undefined){loc = ""}
			 var indcDy			= data[i].indcDy;       	if(indcDy == undefined){indcDy = ""}
			 var jobFg			= data[i].jobFg;        	if(jobFg == undefined){jobFg = ""}
			 var prposFg		= data[i].prposFg;      	if(prposFg == undefined){prposFg = ""}
			 var mntNeedYn		= data[i].mntNeedYn;		if(mntNeedYn == undefined){mntNeedYn = ""}
			 var assetNoPrintng	= data[i].assetNoPrintng;	if(assetNoPrintng == undefined){assetNoPrintng = ""}
			 var rm				= data[i].rm;				if(rm == undefined){rm = ""}

				str += 		 '<TR>'
			 					+'<TD>' + itAssetNo 		+ '</TD>'
		 						+'<TD>' + itAssetSerno 		+ '</TD>'
		 						+'<TD>' + prodtSnNo 		+ '</TD>'
								+'<TD>' + prodtNm 			+ '</TD>'
								+'<TD>' + middlFg 			+ '</TD>'
								+'<TD>' + smallFg 			+ '</TD>'
								+'<TD>' + mnfCmpny 			+ '</TD>'
								+'<TD>' + modelNm 			+ '</TD>'
								+'<TD>' + assetSttus 		+ '</TD>'
								+'<TD>' + nm 				+ '</TD>'
								+'<TD>' + ofcps 			+ '</TD>'
								+'<TD>' + insttNm 			+ '</TD>'
								+'<TD>' + brffcNm 			+ '</TD>'
								+'<TD>' + deptNm			+ '</TD>'
								+'<TD>' + loc 				+ '</TD>'
								+'<TD>' + indcDy 			+ '</TD>'
								+'<TD>' + jobFg 			+ '</TD>'
								+'<TD>' + prposFg			+ '</TD>'
								+'<TD>' + mntNeedYn 		+ '</TD>'
								+'<TD>' + assetNoPrintng 	+ '</TD>'
								+'<TD>' + rm 				+ '</TD>'
							+'</TR>';
 	   });
 			     str +=   '</TBODY>'
 						+'</TABLE>';
 	   $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
 	   fnExcelReport('excelList','기반설비 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownHwAssetManagement(result){
		var data  = result.list;
		 var str =  '<table>'+
		 			'<caption>HW 엑셀 업로드 결과 현황</caption>'+
		 			'<colgroup>' +
		 				'<col width="200px" />' +
		 				'<col width="200px" />' +
		 				'<col width="200px" />' +
		 				'<col width="200px" />' +
		 				'<col width="200px" />' +
		 				'<col width="200px" />' +
		 			'</colgroup>' +
		 				'<tbody>' +
		 					'<tr>' +
	   	 					'<th>IT자산번호</th>' +
	   	 					'<th>제조사</th>' +
	                  		'<th>제품명</th>' +
	                 		'<th>시리얼번호</th>' +
	                 		'<th>대구분</th>' +
	                 		'<th>중구분</th>' +
	                 		'<th>소구분</th>' +
	            			'</tr>' ;
		 $.each(data , function(i){

			 var it_ASSET_NO 	= data[i].it_ASSET_NO; 	if(it_ASSET_NO == undefined){it_ASSET_NO = ""}
			 var mnf_CMPNY 		= data[i].mnf_CMPNY; 	if(mnf_CMPNY == undefined){mnf_CMPNY = ""}
			 var prodt_NM 		= data[i].prodt_NM; 	if(prodt_NM == undefined){prodt_NM = ""}
			 var prodt_SN_NO 	= data[i].prodt_SN_NO; 	if(prodt_SN_NO == undefined){prodt_SN_NO = ""}
			 var lrge_FG 		= data[i].lrge_FG; 		if(lrge_FG == undefined){lrge_FG = ""}
			 var middl_FG 		= data[i].middl_FG; 	if(middl_FG == undefined){middl_FG = ""}
			 var small_FG 		= data[i].small_FG; 	if(small_FG == undefined){small_FG = ""}

	        str += 		'<tr>' +
	       	 				'<td>' + it_ASSET_NO 	+ '</td>' +
	       	 				'<td>' + mnf_CMPNY 		+ '</td>' +
	                		'<td>' + prodt_NM 		+ '</td>' +
	                		'<td>' + prodt_SN_NO 	+ '</td>' +
	                		'<td>' + lrge_FG 		+ '</td>' +
	                		'<td>' + middl_FG 		+ '</td>' +
	                		'<td>' + small_FG 		+ '</td>' +
	            		'</tr>';
	   });
	        str += 	'</tbody>' +
	 				'</table>';
	   $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
	   fnExcelReport('excelList','HW 엑셀 업로드 결과'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */ //하드웨어 테스트

		 var successCode = result.listSize -4; /* 엑셀 데이터를 입력한 행을 표출하기 위해서 5행부터 읽기때문에 -4을 해줌 */
		 alert("업로드 성공 : 총 " + successCode + "개의 데이터 중 " + successCode + "개의 데이터가 업로드되었습니다.");
	    location.reload();
	}

	function excelDownSwAssetManage(result){
		var data  = result.list;
      	 var str =  '<TABLE>'+
      	 			'<CAPTION>SW 엑셀 업로드 결과 현황</CAPTION>'+
      	 			'<COLGROUP>' +
      	 				'<COL width="200px">' +
      	 				'<COL width="200px">' +
      	 				'<COL width="200px">' +
      	 				'<COL width="200px">' +
      	 				'<COL width="200px">' +
      	 				'<COL width="200px">' +
      	 			'</COLGROUP>' +
      	 				'<TBODY>' +
      	 					'<TR>' +
          	 					'<TH>IT자산번호</TH>' +
          	 					'<TH>제조사</TH>' +
		                  		'<TH>제품명</TH>' +
		                 		'<TH>시리얼번호</TH>' +
		                 		'<TH>대구분</TH>' +
		                 		'<TH>중구분</TH>' +
		                 		'<TH>소구분</TH>' +
	                 			'</TR>' ;
      	 $.each(data , function(i){

	      		 var it_ASSET_NO 	= data[i].it_ASSET_NO; 	if(it_ASSET_NO == undefined){it_ASSET_NO = ""}
				 var mnf_CMPNY 		= data[i].mnf_CMPNY; 	if(mnf_CMPNY == undefined){mnf_CMPNY = ""}
				 var prodt_NM 		= data[i].prodt_NM; 	if(prodt_NM == undefined){prodt_NM = ""}
				 var prodt_SN_NO 	= data[i].prodt_SN_NO; 	if(prodt_SN_NO == undefined){prodt_SN_NO = ""}
				 var lrge_FG 		= data[i].lrge_FG; 		if(lrge_FG == undefined){lrge_FG = ""}
				 var middl_FG 		= data[i].middl_FG; 	if(middl_FG == undefined){middl_FG = ""}
				 var small_FG 		= data[i].small_FG; 	if(small_FG == undefined){small_FG = ""}

		        str += 		'<tr>' +
		       	 				'<td>' + it_ASSET_NO 	+ '</td>' +
		       	 				'<td>' + mnf_CMPNY 		+ '</td>' +
		                		'<td>' + prodt_NM 		+ '</td>' +
		                		'<td>' + prodt_SN_NO 	+ '</td>' +
		                		'<td>' + lrge_FG 		+ '</td>' +
		                		'<td>' + middl_FG 		+ '</td>' +
		                		'<td>' + small_FG 		+ '</td>' +
		            		'</tr>';
          });
               str += 	'</TBODY>' +
        				'</TABLE>';
          $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
          fnExcelReport('excelList','SW 엑셀 업로드 결과'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */

      	 var successCode = result.listSize -4; /* 엑셀 데이터를 입력한 행을 표출하기 위해서 5행부터 읽기때문에 -4을 해줌 */
      	 alert("업로드 성공 : 총 " + successCode + "개의 데이터 중 " + successCode + "개의 데이터가 업로드되었습니다.");
        location.reload();
	}

	function excelDownCommAssetManage(result){
	   	 var data  = result.list;
	   	 var str =  '<TABLE>'+
	   	 			'<CAPTION>통신장비 엑셀 업로드 결과 현황</CAPTION>'+
	   	 			'<COLGROUP>' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 			'</COLGROUP>' +
	   	 				'<TBODY>' +
	   	 					'<TR>' +
	       	 					'<TH>IT자산번호</TH>' +
	       	 					'<TH>제조사</TH>' +
		                  		'<TH>제품명</TH>' +
		                 		'<TH>시리얼번호</TH>' +
		                 		'<TH>대구분</TH>' +
		                 		'<TH>중구분</TH>' +
		                 		'<TH>소구분</TH>' +
	                			'</TR>' ;
	   	 $.each(data , function(i){

		   		 var it_ASSET_NO 	= data[i].it_ASSET_NO; 	if(it_ASSET_NO == undefined){it_ASSET_NO = ""}
				 var mnf_CMPNY 		= data[i].mnf_CMPNY; 	if(mnf_CMPNY == undefined){mnf_CMPNY = ""}
				 var prodt_NM 		= data[i].prodt_NM; 	if(prodt_NM == undefined){prodt_NM = ""}
				 var prodt_SN_NO 	= data[i].prodt_SN_NO; 	if(prodt_SN_NO == undefined){prodt_SN_NO = ""}
				 var lrge_FG 		= data[i].lrge_FG; 		if(lrge_FG == undefined){lrge_FG = ""}
				 var middl_FG 		= data[i].middl_FG; 	if(middl_FG == undefined){middl_FG = ""}
				 var small_FG 		= data[i].small_FG; 	if(small_FG == undefined){small_FG = ""}

		        str += 		'<tr>' +
		       	 				'<td>' + it_ASSET_NO 	+ '</td>' +
		       	 				'<td>' + mnf_CMPNY 		+ '</td>' +
		                		'<td>' + prodt_NM 		+ '</td>' +
		                		'<td>' + prodt_SN_NO 	+ '</td>' +
		                		'<td>' + lrge_FG 		+ '</td>' +
		                		'<td>' + middl_FG 		+ '</td>' +
		                		'<td>' + small_FG 		+ '</td>' +
		            		'</tr>';
	       });
	            str += 	'</TBODY>' +
	     				'</TABLE>';
	       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
	       fnExcelReport('excelList','통신장비 엑셀 업로드 결과'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */

	   	 var successCode = result.listSize -4; /* 엑셀 데이터를 입력한 행을 표출하기 위해서 5행부터 읽기때문에 -4을 해줌 */
	   	 alert("업로드 성공 : 총 " + successCode + "개의 데이터 중 " + successCode + "개의 데이터가 업로드되었습니다.");
        location.reload();
	}

	function excelDownEtcSubAssetManage(result){
		 var data  = result.list;
	   	 var str =  '<TABLE>'+
	   	 			'<CAPTION>기반설비 엑셀 업로드 결과 현황</CAPTION>'+
	   	 			'<COLGROUP>' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 				'<COL width="200px">' +
	   	 			'</COLGROUP>' +
	   	 				'<TBODY>' +
	   	 					'<TR>' +
	       	 					'<TH>IT자산번호</TH>' +
	       	 					'<TH>제조사</TH>' +
		                  		'<TH>제품명</TH>' +
		                 		'<TH>시리얼번호</TH>' +
		                 		'<TH>대구분</TH>' +
		                 		'<TH>중구분</TH>' +
		                 		'<TH>소구분</TH>' +
	                			'</TR>' ;
	   	 $.each(data , function(i){

		   		 var it_ASSET_NO 	= data[i].it_ASSET_NO; 	if(it_ASSET_NO == undefined){it_ASSET_NO = ""}
				 var mnf_CMPNY 		= data[i].mnf_CMPNY; 	if(mnf_CMPNY == undefined){mnf_CMPNY = ""}
				 var prodt_NM 		= data[i].prodt_NM; 	if(prodt_NM == undefined){prodt_NM = ""}
				 var prodt_SN_NO 	= data[i].prodt_SN_NO; 	if(prodt_SN_NO == undefined){prodt_SN_NO = ""}
				 var lrge_FG 		= data[i].lrge_FG; 		if(lrge_FG == undefined){lrge_FG = ""}
				 var middl_FG 		= data[i].middl_FG; 	if(middl_FG == undefined){middl_FG = ""}
				 var small_FG 		= data[i].small_FG; 	if(small_FG == undefined){small_FG = ""}

		        str += 		'<tr>' +
		       	 				'<td>' + it_ASSET_NO 	+ '</td>' +
		       	 				'<td>' + mnf_CMPNY 		+ '</td>' +
		                		'<td>' + prodt_NM 		+ '</td>' +
		                		'<td>' + prodt_SN_NO 	+ '</td>' +
		                		'<td>' + lrge_FG 		+ '</td>' +
		                		'<td>' + middl_FG 		+ '</td>' +
		                		'<td>' + small_FG 		+ '</td>' +
		            		'</tr>';
	       });
	            str += 	'</TBODY>' +
	     				'</TABLE>';
	       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
	       fnExcelReport('excelList','기반설비 엑셀 업로드 결과'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */

	   	 var successCode = result.listSize -4; /* 엑셀 데이터를 입력한 행을 표출하기 위해서 5행부터 읽기때문에 -4을 해줌 */
	   	 alert("업로드 성공 : 총 " + successCode + "개의 데이터 중 " + successCode + "개의 데이터가 업로드되었습니다.");
         location.reload();
	}

	function excelDownRentNtbkSttus(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>대여장비 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>대여일</TH>'
			                 		+'<TH>반납 예정일</TH>'
			                 		+'<TH>이름</TH>'
			                 		+'<TH>직급/직위</TH>'
			                 		+'<TH>부서명</TH>'
			                 		+'<TH>기관명</TH>'
			                 		+'<TH>지사</TH>'
			                 		+'<TH>대여 여부</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

	   		var itAssetNo 		= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	   		var prodtNm 		= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
	   		var lendDy 			= data[i].lendDy; 			if(lendDy == undefined){lendDy = ""}
	   		var rturnPrarnde 	= data[i].rturnPrarnde; 	if(rturnPrarnde == undefined){rturnPrarnde = ""}
	   		var nm 				= data[i].nm; 				if(nm == undefined){nm = ""}
	   		var ofcps 			= data[i].ofcps; 			if(ofcps == undefined){ofcps = ""}
	   		var deptNm 			= data[i].deptNm; 			if(deptNm == undefined){deptNm = ""}
	   		var insttNm 		= data[i].insttNm; 			if(insttNm == undefined){insttNm = ""}
	   		var deptNm 			= data[i].deptNm; 			if(deptNm == undefined){deptNm = ""}
	   		var brffcNm 		= data[i].brffcNm; 			if(brffcNm == undefined){brffcNm = ""}
	   		var lendYn 			= data[i].lendYn; 			if(lendYn == undefined){lendYn = ""}

                    str += 		 '<TR>'
                   	 				+'<TD>' + itAssetNo 	+ '</TD>'
                   	 				+'<TD>' + prodtNm		+ '</TD>'
	                         		+'<TD>' + lendDy		+ '</TD>'
	                         		+'<TD>' + rturnPrarnde 	+ '</TD>'
	                         		+'<TD>' + nm			+ '</TD>'
	                         		+'<TD>' + ofcps			+ '</TD>'
	                         		+'<TD>' + deptNm 		+ '</TD>'
	                         		+'<TD>' + insttNm		+ '</TD>'
	                         		+'<TD>' + brffcNm		+ '</TD>'
	                         		+'<TD>' + lendYn		+ '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','대여장비 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownRentAssetLogSttus(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>대여장비 로그현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>대여 여부</TH>'
			                 		+'<TH>대여일</TH>'
			                 		+'<TH>반납 예정일</TH>'
			                 		+'<TH>이름</TH>'
			                 		+'<TH>직급/직위</TH>'
			                 		+'<TH>부서명</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

   		 	var itAssetNo 		= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	   		var prodtNm 		= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
	   		var lendYn 			= data[i].lendYn; 			if(lendYn == undefined){lendYn = ""}
	   		var lendDy 			= data[i].lendDy; 			if(lendDy == undefined){lendDy = ""}
	   		var rturnPrarnde 	= data[i].rturnPrarnde; 	if(rturnPrarnde == undefined){rturnPrarnde = ""}
	   		var nm 				= data[i].nm; 				if(nm == undefined){nm = ""}
	   		var ofcps 			= data[i].ofcps; 			if(ofcps == undefined){ofcps = ""}
	   		var deptNm 			= data[i].deptNm; 			if(deptNm == undefined){deptNm = ""}

                    str += 		 '<TR>'
                   	 				+'<TD>' + itAssetNo 	+ '</TD>'
                   	 				+'<TD>' + prodtNm 		+ '</TD>'
	                         		+'<TD>' + lendYn 		+ '</TD>'
	                         		+'<TD>' + lendDy 		+ '</TD>'
	                         		+'<TD>' + rturnPrarnde 	+ '</TD>'
	                         		+'<TD>' + nm 			+ '</TD>'
	                         		+'<TD>' + ofcps 		+ '</TD>'
	                         		+'<TD>' + deptNm 		+ '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','대여장비 로그현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownAssetAcinsSttus(result){
		var data  = result.searchAssetAcins;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>OA장비 자산실사 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>도입일자</TH>'
			                 		+'<TH>이름</TH>'
			                 		+'<TH>직급/직위</TH>'
			                 		+'<TH>기관명</TH>'
			                 		+'<TH>지사명</TH>'
			                 		+'<TH>부서명</TH>'
			                 		+'<TH>실사여부</TH>'
			                 		+'<TH>실사일자</TH>'
			                 		+'<TH>실사결과</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

   		 	var itAssetNo 		= data[i].itAssetNo; 	if(itAssetNo == undefined){itAssetNo = ""}
   		 	var prodtNm 		= data[i].prodtNm; 		if(prodtNm == undefined){prodtNm = ""}
	   		var indcDy 			= data[i].indcDy; 		if(indcDy == undefined){indcDy = ""}
	   		var nm 				= data[i].nm; 			if(nm == undefined){nm = ""}
	   		var ofcps 			= data[i].ofcps; 		if(ofcps == undefined){ofcps = ""}
	   		var insttNm 		= data[i].insttNm; 		if(insttNm == undefined){insttNm = ""}
	   		var brffcNm 		= data[i].brffcNm; 		if(brffcNm == undefined){brffcNm = ""}
	   		var deptNm 			= data[i].deptNm; 		if(deptNm == undefined){deptNm = ""}
	   		var acinsYn 		= data[i].acinsYn; 		if(acinsYn == undefined){acinsYn = ""}
	   		var acinsDy 		= data[i].acinsDy; 		if(acinsDy == undefined){acinsDy = ""}
	   		var acinsRsult 		= data[i].acinsRsult; 	if(acinsRsult == undefined){acinsRsult = ""}

                    str += 		 '<TR>'
                   	 				+'<TD>' + itAssetNo + '</TD>'
                   	 				+'<TD>' + prodtNm + '</TD>'
	                         		+'<TD>' + indcDy + '</TD>'
	                         		+'<TD>' + nm + '</TD>'
	                         		+'<TD>' + ofcps + '</TD>'
	                         		+'<TD>' + insttNm + '</TD>'
	                         		+'<TD>' + brffcNm + '</TD>'
	                         		+'<TD>' + deptNm + '</TD>'
	                         		+'<TD>' + acinsYn + '</TD>'
	                         		+'<TD>' + acinsDy + '</TD>'
	                         		+'<TD>' + acinsRsult + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','OA장비 자산실사 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownAssetWrhusSttus(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>IT자산 반납(창고) 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>도입일자</TH>'
			                 		+'<TH>대구분</TH>'
			                 		+'<TH>중구분</TH>'
			                 		+'<TH>소구분</TH>'
			                 		+'<TH>자산취득번호</TH>'
			                 		+'<TH>반납일(입고일)</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

   		var itAssetNo 		= data[i].itAssetNo; 	if(itAssetNo == undefined){itAssetNo = ""}
   		var prodtNm 		= data[i].prodtNm; 		if(prodtNm == undefined){prodtNm = ""}
   		var indcDy 			= data[i].indcDy; 		if(indcDy == undefined){indcDy = ""}
   		var lrgeFg 			= data[i].lrgeFg; 		if(lrgeFg == undefined){lrgeFg = ""}
   		var middlFg 		= data[i].middlFg; 		if(middlFg == undefined){middlFg = ""}
   		var smallFg 		= data[i].smallFg; 		if(smallFg == undefined){smallFg = ""}
   		var assetAcqsNo 	= data[i].assetAcqsNo; 	if(assetAcqsNo == undefined){assetAcqsNo = ""}
   		var wrhusDate2 		= data[i].wrhusDate2; 	if(wrhusDate2 == undefined){wrhusDate2 = ""}

                    str += 		 '<TR>'
                   	 				+'<TD>' + itAssetNo 	+ '</TD>'
                   	 				+'<TD>' + prodtNm 		+ '</TD>'
	                         		+'<TD>' + indcDy 		+ '</TD>'
	                         		+'<TD>' + lrgeFg 		+ '</TD>'
	                         		+'<TD>' + middlFg 		+ '</TD>'
	                         		+'<TD>' + smallFg 		+ '</TD>'
	                         		+'<TD>' + assetAcqsNo 	+ '</TD>'
	                         		+'<TD>' + wrhusDate2 	+ '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','IT자산 반납(창고) 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownAssetDsuseSttus(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>IT자산 폐기대상 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>도입일자</TH>'
			                 		+'<TH>대구분</TH>'
			                 		+'<TH>중구분</TH>'
			                 		+'<TH>소구분</TH>'
			                 		+'<TH>자산취득번호</TH>'
			                 		+'<TH>폐기일(입고일)</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

	   		var itAssetNo 		= data[i].itAssetNo; 	if(itAssetNo == undefined){itAssetNo = ""}
	   		var prodtNm 		= data[i].prodtNm; 		if(prodtNm == undefined){prodtNm = ""}
	   		var indcDy 			= data[i].indcDy; 		if(indcDy == undefined){indcDy = ""}
	   		var lrgeFg 			= data[i].lrgeFg; 		if(lrgeFg == undefined){lrgeFg = ""}
	   		var middlFg 		= data[i].middlFg; 		if(middlFg == undefined){middlFg = ""}
	   		var smallFg 		= data[i].smallFg; 		if(smallFg == undefined){smallFg = ""}
	   		var assetAcqsNo 	= data[i].assetAcqsNo; 	if(assetAcqsNo == undefined){assetAcqsNo = ""}
	   		var dsusedate2 		= data[i].dsusedate2; 	if(dsusedate2 == undefined){dsusedate2 = ""}

                    str += 		 '<TR>'
			                    	+'<TD>' + itAssetNo 	+ '</TD>'
			       	 				+'<TD>' + prodtNm 		+ '</TD>'
			                 		+'<TD>' + indcDy 		+ '</TD>'
			                 		+'<TD>' + lrgeFg 		+ '</TD>'
			                 		+'<TD>' + middlFg 		+ '</TD>'
			                 		+'<TD>' + smallFg 		+ '</TD>'
			                 		+'<TD>' + assetAcqsNo 	+ '</TD>'
	                         		+'<TD>' + dsusedate2 + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','IT자산 폐기대상 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownHwAssetDsuseComplete(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>HW 장비 폐기완료 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'

       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
            	 					+'<TH>폐기 완료일</TH>'
            	 					+'<TH>최종 변경자 이름</TH>'
			                  		+'<TH>IT자산 번호</TH>'
			                 		+'<TH>제품명</TH>'
			                 		+'<TH>제품 시리얼 번호</TH>'

			                 		+'<TH>대구분</TH>'
			                 		+'<TH>중구분</TH>'
			                 		+'<TH>소구분</TH>'
			                 		+'<TH>용도구분</TH>'
			                 		+'<TH>업무 구분</TH>'

            	 					+'<TH>제조사</TH>'
            	 					+'<TH>납품사</TH>'
			                  		+'<TH>기술지원사</TH>'
			                 		+'<TH>유지보수사</TH>'
			                 		+'<TH>도입 일자</TH>'

			                 		+'<TH>제품 W/I</TH>'
			                 		+'<TH>기술 지원 W/I</TH>'
			                 		+'<TH>유지보수 필요 여부</TH>'
			                 		+'<TH>유지보수 일자</TH>'
			                 		+'<TH>도입 금액</TH>'

            	 					+'<TH>유지보수 요율</TH>'
            	 					+'<TH>유지보수 금액</TH>'
			                  		+'<TH>자산취득번호</TH>'
			                 		+'<TH>사원 번호</TH>'
			                 		+'<TH>위치</TH>'

			                 		+'<TH>IP 주소</TH>'
			                 		+'<TH>구매 구분</TH>'
			                 		+'<TH>자산상태</TH>'
			                 		+'<TH>장비번호 출력여부</TH>'
			                 		+'<TH>비고</TH>'

			                 		+'<TH>모델이름</TH>'
			                 		+'<TH>CPU</TH>'
			                 		+'<TH>메모리</TH>'
			                 		+'<TH>O/S</TH>'
			                 		+'<TH>디스크용량/개수</TH>'
			                 		+'<TH>그래픽카드</TH>'
			                 		+'<TH>모니터 인치</TH>'
			                 		+'<TH>화면타입</TH>'
			                 		+'<TH>출력형식</TH>'
			                 		+'<TH>인쇄(스캔)속도</TH>'
			                 		+'<TH>인쇄(스캔)해상도</TH>'
			                 		+'<TH>인쇄(스캔)가능용지</TH>'

			                 		+'<TH>건물</TH>'
			                 		+'<TH>층수</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

   		var dsuseComptDy 		= data[i].dsuseComptDy; 	if(dsuseComptDy == undefined){dsuseComptDy = ""}
   		var lstInputEmplNoNm 	= data[i].lstInputEmplNoNm; if(lstInputEmplNoNm == undefined){lstInputEmplNoNm = ""}
   		var itAssetNo 			= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
   		var prodtNm 			= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
   		var prodtSnNo 			= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}

   		var lrgeFg 				= data[i].lrgeFg; 			if(lrgeFg == undefined){lrgeFg = ""}
   		var middlFg 			= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
   		var smallFg 			= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
   		var prposFg 			= data[i].prposFg; 			if(prposFg == undefined){prposFg = ""}
   		var jobFg 				= data[i].jobFg; 			if(jobFg == undefined){jobFg = ""}

   		var mnfCmpny	 		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
   		var dvyfgCmpny 			= data[i].dvyfgCmpny; 		if(dvyfgCmpny == undefined){dvyfgCmpny = ""}
   		var techSupptCmpny 		= data[i].techSupptCmpny; 	if(techSupptCmpny == undefined){techSupptCmpny = ""}
   		var mntCmpny 			= data[i].mntCmpny; 		if(mntCmpny == undefined){mntCmpny = ""}
   		var indcDy 				= data[i].indcDy; 			if(indcDy == undefined){indcDy = ""}

   		var prodtWrtin 			= data[i].prodtWrtin; 		if(prodtWrtin == undefined){prodtWrtin = ""}
   		var techSupptWrtin 		= data[i].techSupptWrtin; 	if(techSupptWrtin == undefined){techSupptWrtin = ""}
   		var mntNeedYn 			= data[i].mntNeedYn; 		if(mntNeedYn == undefined){mntNeedYn = ""}
   		var mntDy 				= data[i].mntDy; 			if(mntDy == undefined){mntDy = ""}
   		var indcAmont 			= data[i].indcAmont; 		if(indcAmont == undefined){indcAmont = ""}

   		var mntTarif 			= data[i].mntTarif; 		if(mntTarif == undefined){mntTarif = ""}
   		var mntAmont 			= data[i].mntAmont; 		if(mntAmont == undefined){mntAmont = ""}
   		var assetAcqsNo 		= data[i].assetAcqsNo; 		if(assetAcqsNo == undefined){assetAcqsNo = ""}
   		var emplNo 				= data[i].emplNo; 			if(emplNo == undefined){emplNo = ""}
   		var loc 				= data[i].loc; 				if(loc == undefined){loc = ""}

   		var ipAdres 			= data[i].ipAdres; 			if(ipAdres == undefined){ipAdres = ""}
   		var purchsFg 			= data[i].purchsFg; 		if(purchsFg == undefined){purchsFg = ""}
   		var assetSttus 			= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
   		var assetNoPrintng 		= data[i].assetNoPrintng; 	if(assetNoPrintng == undefined){assetNoPrintng = ""}
   		var rm 					= data[i].rm; 				if(rm == undefined){rm = ""}

   		var hModelNm 			= data[i].hModelNm; 		if(hModelNm == undefined){hModelNm = ""}
   		var hCpu 				= data[i].hCpu; 			if(hCpu == undefined){hCpu = ""}
   		var hMory 				= data[i].hMory; 			if(hMory == undefined){hMory = ""}
   		var hOs 				= data[i].hOs; 				if(hOs == undefined){hOs = ""}
   		var hDiskCpctyCo 		= data[i].hDiskCpctyCo; 	if(hDiskCpctyCo == undefined){hDiskCpctyCo = ""}
   		var hGrpicCard 			= data[i].hGrpicCard; 		if(hGrpicCard == undefined){hGrpicCard = ""}
   		var hMontrInch 			= data[i].hMontrInch; 		if(hMontrInch == undefined){hMontrInch = ""}
   		var hScrinTy 			= data[i].hScrinTy; 		if(hScrinTy == undefined){hScrinTy = ""}
   		var hOutptFom 			= data[i].hOutptFom; 		if(hOutptFom == undefined){hOutptFom = ""}
   		var hPrntngVe 			= data[i].hPrntngVe; 		if(hPrntngVe == undefined){hPrntngVe = ""}
   		var hPrntngRsoltn 		= data[i].hPrntngRsoltn; 	if(hPrntngRsoltn == undefined){hPrntngRsoltn = ""}
   		var hPrntngPosbl 		= data[i].hPrntngPosbl; 	if(hPrntngPosbl == undefined){hPrntngPosbl = ""}

   		var buld 				= data[i].buld; 			if(buld == undefined){buld = ""}
   		var floor 				= data[i].floor; 			if(floor == undefined){floor = ""}

                    str += 		 '<TR>'
                   	 				+'<TD>' + dsuseComptDy 		+ '</TD>'
                   	 				+'<TD>' + lstInputEmplNoNm 	+ '</TD>'
	                         		+'<TD>' + itAssetNo 		+ '</TD>'
	                         		+'<TD>' + prodtNm 			+ '</TD>'
	                         		+'<TD>' + prodtSnNo 		+ '</TD>'

	                         		+'<TD>' + lrgeFg 			+ '</TD>'
	                         		+'<TD>' + middlFg 			+ '</TD>'
	                         		+'<TD>' + smallFg			+ '</TD>'
	                         		+'<TD>' + prposFg 			+ '</TD>'
	                         		+'<TD>' + jobFg 			+ '</TD>'

                   	 				+'<TD>' + mnfCmpny 			+ '</TD>'
                   	 				+'<TD>' + dvyfgCmpny 		+ '</TD>'
	                         		+'<TD>' + techSupptCmpny 	+ '</TD>'
	                         		+'<TD>' + mntCmpny	 		+ '</TD>'
	                         		+'<TD>' + indcDy 			+ '</TD>'

	                         		+'<TD>' + prodtWrtin 		+ '</TD>'
	                         		+'<TD>' + techSupptWrtin 	+ '</TD>'
	                         		+'<TD>' + mntNeedYn 		+ '</TD>'
	                         		+'<TD>' + mntDy 			+ '</TD>'
	                         		+'<TD>' + indcAmont 		+ '</TD>'

                   	 				+'<TD>' + mntTarif 			+ '</TD>'
                   	 				+'<TD>' + mntAmont			+ '</TD>'
	                         		+'<TD>' + assetAcqsNo 		+ '</TD>'
	                         		+'<TD>' + emplNo 			+ '</TD>'
	                         		+'<TD>' + loc 				+ '</TD>'

	                         		+'<TD>' + ipAdres 			+ '</TD>'
	                         		+'<TD>' + purchsFg 			+ '</TD>'
	                         		+'<TD>' + assetSttus 		+ '</TD>'
	                         		+'<TD>' + assetNoPrintng 	+ '</TD>'
	                         		+'<TD>' + rm 				+ '</TD>'

	                         		+'<TD>' + hModelNm + '</TD>'
	                         		+'<TD>' + hCpu + '</TD>'
	                         		+'<TD>' + hMory + '</TD>'
	                         		+'<TD>' + hOs + '</TD>'
	                         		+'<TD>' + hDiskCpctyCo + '</TD>'
	                         		+'<TD>' + hGrpicCard + '</TD>'
	                         		+'<TD>' + hMontrInch + '</TD>'
	                         		+'<TD>' + hScrinTy + '</TD>'
	                         		+'<TD>' + hOutptFom + '</TD>'
	                         		+'<TD>' + hPrntngVe + '</TD>'
	                         		+'<TD>' + hPrntngRsoltn + '</TD>'
	                         		+'<TD>' + hPrntngPosbl + '</TD>'

	                         		+'<TD>' + buld + '</TD>'
	                         		+'<TD>' + floor + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','HW 장비 폐기완료 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownSwAssetDsuseComplete(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>SW 라이선스 폐기완료 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

       	 			+'</COLGROUP>'
           	 				+ '<TBODY>'
           	 				 	+ '<TR>'
	               	 				+'<TH>폐기 완료일</TH>'
		               	 			+'<TH>최종 변경자 이름</TH>'
		               	 			+'<TH>IT자산 번호</TH>'
		               	 			+'<TH>제품명</TH>'
		               	 			+'<TH>제품 시리얼 번호</TH>'

		               	 			+'<TH>대구분</TH>'
		               	 			+'<TH>중구분</TH>'
		               	 			+'<TH>소구분</TH>'
		               	 			+'<TH>용도구분</TH>'
		               	 			+'<TH>업무 구분</TH>'

		               	 			+'<TH>제조사</TH>'
		               	 			+'<TH>납품사</TH>'
		               	 			+'<TH>기술지원사</TH>'
		               	 			+'<TH>유지보수사</TH>'
		               	 			+'<TH>도입 일자</TH>'

		               	 			+'<TH>제품 W/I</TH>'
		               	 			+'<TH>기술 지원 W/I</TH>'
		               	 			+'<TH>유지보수 필요 여부</TH>'
		               	 			+'<TH>유지보수 일자</TH>'
		               	 			+'<TH>도입 금액</TH>'

		               	 			+'<TH>유지보수 요율</TH>'
		               	 			+'<TH>유지보수 금액</TH>'
		               	 			+'<TH>자산취득번호</TH>'
		               	 			+'<TH>사원 번호</TH>'
		               	 			+'<TH>위치</TH>'

		               	 			+'<TH>IP 주소</TH>'
		               	 			+'<TH>구매 구분</TH>'
		               	 			+'<TH>자산상태</TH>'
		               	 			+'<TH>비고</TH>'

		               	 			+'<TH>모델이름</TH>'
				               	 	+'<TH>버전</TH>'
				               	 	+'<TH>설명</TH>'
				               	 	+'<TH>라이선스 번호</TH>'
				               	 	+'<TH>호스트 이름</TH>'
				               	 	+'<TH>MAC주소</TH>'
				               	 	+'<TH>설치 자산</TH>'

		               	 			+'<TH>건물</TH>'
		               	 			+'<TH>층수</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

	   		var dsuseComptDy 		= data[i].dsuseComptDy; 	if(dsuseComptDy == undefined){dsuseComptDy = ""}
	   		var lstInputEmplNoNm 	= data[i].lstInputEmplNoNm; if(lstInputEmplNoNm == undefined){lstInputEmplNoNm = ""}
	   		var itAssetNo 			= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	   		var prodtNm 			= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
	   		var prodtSnNo 			= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}

	   		var lrgeFg 				= data[i].lrgeFg; 			if(lrgeFg == undefined){lrgeFg = ""}
	   		var middlFg 			= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
	   		var smallFg 			= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
	   		var prposFg 			= data[i].prposFg; 			if(prposFg == undefined){prposFg = ""}
	   		var jobFg 				= data[i].jobFg; 			if(jobFg == undefined){jobFg = ""}

	   		var mnfCmpny	 		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
	   		var dvyfgCmpny 			= data[i].dvyfgCmpny; 		if(dvyfgCmpny == undefined){dvyfgCmpny = ""}
	   		var techSupptCmpny 		= data[i].techSupptCmpny; 	if(techSupptCmpny == undefined){techSupptCmpny = ""}
	   		var mntCmpny 			= data[i].mntCmpny; 		if(mntCmpny == undefined){mntCmpny = ""}
	   		var indcDy 				= data[i].indcDy; 			if(indcDy == undefined){indcDy = ""}

	   		var prodtWrtin 			= data[i].prodtWrtin; 		if(prodtWrtin == undefined){prodtWrtin = ""}
	   		var techSupptWrtin 		= data[i].techSupptWrtin; 	if(techSupptWrtin == undefined){techSupptWrtin = ""}
	   		var mntNeedYn 			= data[i].mntNeedYn; 		if(mntNeedYn == undefined){mntNeedYn = ""}
	   		var mntDy 				= data[i].mntDy; 			if(mntDy == undefined){mntDy = ""}
	   		var indcAmont 			= data[i].indcAmont; 		if(indcAmont == undefined){indcAmont = ""}

	   		var mntTarif 			= data[i].mntTarif; 		if(mntTarif == undefined){mntTarif = ""}
	   		var mntAmont 			= data[i].mntAmont; 		if(mntAmont == undefined){mntAmont = ""}
	   		var assetAcqsNo 		= data[i].assetAcqsNo; 		if(assetAcqsNo == undefined){assetAcqsNo = ""}
	   		var emplNo 				= data[i].emplNo; 			if(emplNo == undefined){emplNo = ""}
	   		var loc 				= data[i].loc; 				if(loc == undefined){loc = ""}

	   		var ipAdres 			= data[i].ipAdres; 			if(ipAdres == undefined){ipAdres = ""}
	   		var purchsFg 			= data[i].purchsFg; 		if(purchsFg == undefined){purchsFg = ""}
	   		var assetSttus 			= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
	   		var rm 					= data[i].rm; 				if(rm == undefined){rm = ""}

	   		var sModelNm 			= data[i].sModelNm; 		if(sModelNm == undefined){sModelNm = ""}
	   		var sVer 				= data[i].sVer; 			if(sVer == undefined){sVer = ""}
	   		var dsc 				= data[i].dsc; 				if(dsc == undefined){dsc = ""}
	   		var sLcnsNo 			= data[i].sLcnsNo; 			if(sLcnsNo == undefined){sLcnsNo = ""}
	   		var sHostNm 			= data[i].sHostNm; 			if(sHostNm == undefined){sHostNm = ""}
	   		var sMacAdres 			= data[i].sMacAdres; 		if(sMacAdres == undefined){sMacAdres = ""}
	   		var sInstlAsset 		= data[i].sInstlAsset; 		if(sInstlAsset == undefined){sInstlAsset = ""}

	   		var buld 				= data[i].buld; 			if(buld == undefined){buld = ""}
	   		var floor 				= data[i].floor; 			if(floor == undefined){floor = ""}

                    str += 		 '<TR>'
			                    	+'<TD>' + dsuseComptDy 		+ '</TD>'
			       	 				+'<TD>' + lstInputEmplNoNm 	+ '</TD>'
			                 		+'<TD>' + itAssetNo 		+ '</TD>'
			                 		+'<TD>' + prodtNm 			+ '</TD>'
			                 		+'<TD>' + prodtSnNo 		+ '</TD>'

			                 		+'<TD>' + lrgeFg 			+ '</TD>'
			                 		+'<TD>' + middlFg 			+ '</TD>'
			                 		+'<TD>' + smallFg			+ '</TD>'
			                 		+'<TD>' + prposFg 			+ '</TD>'
			                 		+'<TD>' + jobFg 			+ '</TD>'

			       	 				+'<TD>' + mnfCmpny 			+ '</TD>'
			       	 				+'<TD>' + dvyfgCmpny 		+ '</TD>'
			                 		+'<TD>' + techSupptCmpny 	+ '</TD>'
			                 		+'<TD>' + mntCmpny	 		+ '</TD>'
			                 		+'<TD>' + indcDy 			+ '</TD>'

			                 		+'<TD>' + prodtWrtin 		+ '</TD>'
			                 		+'<TD>' + techSupptWrtin 	+ '</TD>'
			                 		+'<TD>' + mntNeedYn 		+ '</TD>'
			                 		+'<TD>' + mntDy 			+ '</TD>'
			                 		+'<TD>' + indcAmont 		+ '</TD>'

			       	 				+'<TD>' + mntTarif 			+ '</TD>'
			       	 				+'<TD>' + mntAmont			+ '</TD>'
			                 		+'<TD>' + assetAcqsNo 		+ '</TD>'
			                 		+'<TD>' + emplNo 			+ '</TD>'
			                 		+'<TD>' + loc 				+ '</TD>'

			                 		+'<TD>' + ipAdres 			+ '</TD>'
			                 		+'<TD>' + purchsFg 			+ '</TD>'
			                 		+'<TD>' + assetSttus 		+ '</TD>'
			                 		+'<TD>' + rm 				+ '</TD>'

		                        	+'<TD>' + sModelNm + '</TD>'
		                        	+'<TD>' + sVer + '</TD>'
		                        	+'<TD>' + dsc + '</TD>'
		                        	+'<TD>' + sLcnsNo + '</TD>'
		                        	+'<TD>' + sHostNm + '</TD>'
		                        	+'<TD>' + sMacAdres + '</TD>'
		                        	+'<TD>' + sInstlAsset + '</TD>'

		                        	+'<TD>' + buld + '</TD>'
		                        	+'<TD>' + floor + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','SW 라이선스 폐기완료 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownCommAssetDsuseComplete(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>통신장비 폐기완료 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               		+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

       	 			+'</COLGROUP>'
           	 				+ '<TBODY>'
           	 				 	+ '<TR>'
	               	 				+'<TH>폐기 완료일</TH>'
		               	 			+'<TH>최종 변경자 이름</TH>'
		               	 			+'<TH>IT자산 번호</TH>'
		               	 			+'<TH>제품명</TH>'
		               	 			+'<TH>제품 시리얼 번호</TH>'

		               	 			+'<TH>대구분</TH>'
		               	 			+'<TH>중구분</TH>'
		               	 			+'<TH>소구분</TH>'
		               	 			+'<TH>용도구분</TH>'
		               	 			+'<TH>업무 구분</TH>'

		               	 			+'<TH>제조사</TH>'
		               	 			+'<TH>납품사</TH>'
		               	 			+'<TH>기술지원사</TH>'
		               	 			+'<TH>유지보수사</TH>'
		               	 			+'<TH>도입 일자</TH>'

		               	 			+'<TH>제품 W/I</TH>'
		               	 			+'<TH>기술 지원 W/I</TH>'
		               	 			+'<TH>유지보수 필요 여부</TH>'
		               	 			+'<TH>유지보수 일자</TH>'
		               	 			+'<TH>도입 금액</TH>'

		               	 			+'<TH>유지보수 요율</TH>'
		               	 			+'<TH>유지보수 금액</TH>'
		               	 			+'<TH>자산취득번호</TH>'
		               	 			+'<TH>사원 번호</TH>'
		               	 			+'<TH>위치</TH>'

		               	 			+'<TH>IP 주소</TH>'
		               	 			+'<TH>구매 구분</TH>'
		               	 			+'<TH>자산상태</TH>'
			                 		+'<TH>장비번호 출력여부</TH>'
		               	 			+'<TH>비고</TH>'

		               	 			+'<TH>모델이름</TH>'
				               	 	+'<TH>CPU</TH>'
				               	 	+'<TH>메모리</TH>'
				               	 	+'<TH>O/S</TH>'
				               	 	+'<TH>디스크용량/개수</TH>'
				               	 	+'<TH>NIC카드</TH>'
				               	 	+'<TH>포트</TH>'
				               	 	+'<TH>성능/속도</TH>'

		               	 			+'<TH>건물</TH>'
		               	 			+'<TH>층수</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

	   		var dsuseComptDy 		= data[i].dsuseComptDy; 	if(dsuseComptDy == undefined){dsuseComptDy = ""}
	   		var lstInputEmplNoNm 	= data[i].lstInputEmplNoNm; if(lstInputEmplNoNm == undefined){lstInputEmplNoNm = ""}
	   		var itAssetNo 			= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	   		var prodtNm 			= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
	   		var prodtSnNo 			= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}

	   		var lrgeFg 				= data[i].lrgeFg; 			if(lrgeFg == undefined){lrgeFg = ""}
	   		var middlFg 			= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
	   		var smallFg 			= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
	   		var prposFg 			= data[i].prposFg; 			if(prposFg == undefined){prposFg = ""}
	   		var jobFg 				= data[i].jobFg; 			if(jobFg == undefined){jobFg = ""}

	   		var mnfCmpny	 		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
	   		var dvyfgCmpny 			= data[i].dvyfgCmpny; 		if(dvyfgCmpny == undefined){dvyfgCmpny = ""}
	   		var techSupptCmpny 		= data[i].techSupptCmpny; 	if(techSupptCmpny == undefined){techSupptCmpny = ""}
	   		var mntCmpny 			= data[i].mntCmpny; 		if(mntCmpny == undefined){mntCmpny = ""}
	   		var indcDy 				= data[i].indcDy; 			if(indcDy == undefined){indcDy = ""}

	   		var prodtWrtin 			= data[i].prodtWrtin; 		if(prodtWrtin == undefined){prodtWrtin = ""}
	   		var techSupptWrtin 		= data[i].techSupptWrtin; 	if(techSupptWrtin == undefined){techSupptWrtin = ""}
	   		var mntNeedYn 			= data[i].mntNeedYn; 		if(mntNeedYn == undefined){mntNeedYn = ""}
	   		var mntDy 				= data[i].mntDy; 			if(mntDy == undefined){mntDy = ""}
	   		var indcAmont 			= data[i].indcAmont; 		if(indcAmont == undefined){indcAmont = ""}

	   		var mntTarif 			= data[i].mntTarif; 		if(mntTarif == undefined){mntTarif = ""}
	   		var mntAmont 			= data[i].mntAmont; 		if(mntAmont == undefined){mntAmont = ""}
	   		var assetAcqsNo 		= data[i].assetAcqsNo; 		if(assetAcqsNo == undefined){assetAcqsNo = ""}
	   		var emplNo 				= data[i].emplNo; 			if(emplNo == undefined){emplNo = ""}
	   		var loc 				= data[i].loc; 				if(loc == undefined){loc = ""}

	   		var ipAdres 			= data[i].ipAdres; 			if(ipAdres == undefined){ipAdres = ""}
	   		var purchsFg 			= data[i].purchsFg; 		if(purchsFg == undefined){purchsFg = ""}
	   		var assetSttus 			= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
	   		var assetNoPrintng 		= data[i].assetNoPrintng; 	if(assetNoPrintng == undefined){assetNoPrintng = ""}
	   		var rm 					= data[i].rm; 				if(rm == undefined){rm = ""}

	   		var cModelNm 			= data[i].cModelNm; 		if(cModelNm == undefined){cModelNm = ""}
	   		var cCpu 				= data[i].cCpu; 			if(cCpu == undefined){cCpu = ""}
	   		var cMory 				= data[i].cMory; 			if(cMory == undefined){cMory = ""}
	   		var cOs 				= data[i].cOs; 				if(cOs == undefined){cOs = ""}
	   		var cDiskCpctyCo 		= data[i].cDiskCpctyCo; 	if(cDiskCpctyCo == undefined){cDiskCpctyCo = ""}
	   		var cNicCard 			= data[i].cNicCard; 		if(cNicCard == undefined){cNicCard = ""}
	   		var cPort 				= data[i].cPort; 			if(cPort == undefined){cPort = ""}
	   		var cPrfmc 				= data[i].cPrfmc; 			if(cPrfmc == undefined){cPrfmc = ""}

	   		var buld 				= data[i].buld; 			if(buld == undefined){buld = ""}
	   		var floor 				= data[i].floor; 			if(floor == undefined){floor = ""}

                    str += 		 '<TR>'
			                    	+'<TD>' + dsuseComptDy 		+ '</TD>'
			       	 				+'<TD>' + lstInputEmplNoNm 	+ '</TD>'
			                 		+'<TD>' + itAssetNo 		+ '</TD>'
			                 		+'<TD>' + prodtNm 			+ '</TD>'
			                 		+'<TD>' + prodtSnNo 		+ '</TD>'

			                 		+'<TD>' + lrgeFg 			+ '</TD>'
			                 		+'<TD>' + middlFg 			+ '</TD>'
			                 		+'<TD>' + smallFg			+ '</TD>'
			                 		+'<TD>' + prposFg 			+ '</TD>'
			                 		+'<TD>' + jobFg 			+ '</TD>'

			       	 				+'<TD>' + mnfCmpny 			+ '</TD>'
			       	 				+'<TD>' + dvyfgCmpny 		+ '</TD>'
			                 		+'<TD>' + techSupptCmpny 	+ '</TD>'
			                 		+'<TD>' + mntCmpny	 		+ '</TD>'
			                 		+'<TD>' + indcDy 			+ '</TD>'

			                 		+'<TD>' + prodtWrtin 		+ '</TD>'
			                 		+'<TD>' + techSupptWrtin 	+ '</TD>'
			                 		+'<TD>' + mntNeedYn 		+ '</TD>'
			                 		+'<TD>' + mntDy 			+ '</TD>'
			                 		+'<TD>' + indcAmont 		+ '</TD>'

			       	 				+'<TD>' + mntTarif 			+ '</TD>'
			       	 				+'<TD>' + mntAmont			+ '</TD>'
			                 		+'<TD>' + assetAcqsNo 		+ '</TD>'
			                 		+'<TD>' + emplNo 			+ '</TD>'
			                 		+'<TD>' + loc 				+ '</TD>'

			                 		+'<TD>' + ipAdres 			+ '</TD>'
			                 		+'<TD>' + purchsFg 			+ '</TD>'
			                 		+'<TD>' + assetSttus 		+ '</TD>'
			                 		+'<TD>' + assetNoPrintng 	+ '</TD>'
			                 		+'<TD>' + rm 				+ '</TD>'

		                        	+'<TD>' + cModelNm + '</TD>'
		                        	+'<TD>' + cCpu + '</TD>'
		                        	+'<TD>' + cMory + '</TD>'
		                        	+'<TD>' + cOs + '</TD>'
		                        	+'<TD>' + cDiskCpctyCo + '</TD>'
		                        	+'<TD>' + cNicCard + '</TD>'
		                        	+'<TD>' + cPort + '</TD>'
		                        	+'<TD>' + cPrfmc + '</TD>'

		                        	+'<TD>' + buld + '</TD>'
		                        	+'<TD>' + floor + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','통신장비 폐기완료 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownEtcsubAssetDsuseComplete(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>기반설비 폐기완료 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'
		               	+'<COL width="200px">'

	               	 	+'<COL width="200px">'
	               	 	+'<COL width="200px">'

       	 			+'</COLGROUP>'
           	 				+ '<TBODY>'
           	 				 	+ '<TR>'
	               	 				+'<TH>폐기 완료일</TH>'
		               	 			+'<TH>최종 변경자 이름</TH>'
		               	 			+'<TH>IT자산 번호</TH>'
		               	 			+'<TH>제품명</TH>'
		               	 			+'<TH>제품 시리얼 번호</TH>'

		               	 			+'<TH>대구분</TH>'
		               	 			+'<TH>중구분</TH>'
		               	 			+'<TH>소구분</TH>'
		               	 			+'<TH>용도구분</TH>'
		               	 			+'<TH>업무 구분</TH>'

		               	 			+'<TH>제조사</TH>'
		               	 			+'<TH>납품사</TH>'
		               	 			+'<TH>기술지원사</TH>'
		               	 			+'<TH>유지보수사</TH>'
		               	 			+'<TH>도입 일자</TH>'

		               	 			+'<TH>제품 W/I</TH>'
		               	 			+'<TH>기술 지원 W/I</TH>'
		               	 			+'<TH>유지보수 필요 여부</TH>'
		               	 			+'<TH>유지보수 일자</TH>'
		               	 			+'<TH>도입 금액</TH>'

		               	 			+'<TH>유지보수 요율</TH>'
		               	 			+'<TH>유지보수 금액</TH>'
		               	 			+'<TH>자산취득번호</TH>'
		               	 			+'<TH>사원 번호</TH>'
		               	 			+'<TH>위치</TH>'

		               	 			+'<TH>IP 주소</TH>'
		               	 			+'<TH>구매 구분</TH>'
		               	 			+'<TH>자산상태</TH>'
			                 		+'<TH>장비번호 출력여부</TH>'
		               	 			+'<TH>비고</TH>'

		               	 			+'<TH>모델이름</TH>'
				               	 	+'<TH>전압</TH>'
				               	 	+'<TH>소비전력</TH>'
				               	 	+'<TH>냉매</TH>'
				               	 	+'<TH>디스크용량/개수</TH>'
				               	 	+'<TH>배터리 정보</TH>'

		               	 			+'<TH>건물</TH>'
		               	 			+'<TH>층수</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

	   		var dsuseComptDy 		= data[i].dsuseComptDy; 	if(dsuseComptDy == undefined){dsuseComptDy = ""}
	   		var lstInputEmplNoNm 	= data[i].lstInputEmplNoNm; if(lstInputEmplNoNm == undefined){lstInputEmplNoNm = ""}
	   		var itAssetNo 			= data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
	   		var prodtNm 			= data[i].prodtNm; 			if(prodtNm == undefined){prodtNm = ""}
	   		var prodtSnNo 			= data[i].prodtSnNo; 		if(prodtSnNo == undefined){prodtSnNo = ""}

	   		var lrgeFg 				= data[i].lrgeFg; 			if(lrgeFg == undefined){lrgeFg = ""}
	   		var middlFg 			= data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
	   		var smallFg 			= data[i].smallFg; 			if(smallFg == undefined){smallFg = ""}
	   		var prposFg 			= data[i].prposFg; 			if(prposFg == undefined){prposFg = ""}
	   		var jobFg 				= data[i].jobFg; 			if(jobFg == undefined){jobFg = ""}

	   		var mnfCmpny	 		= data[i].mnfCmpny; 		if(mnfCmpny == undefined){mnfCmpny = ""}
	   		var dvyfgCmpny 			= data[i].dvyfgCmpny; 		if(dvyfgCmpny == undefined){dvyfgCmpny = ""}
	   		var techSupptCmpny 		= data[i].techSupptCmpny; 	if(techSupptCmpny == undefined){techSupptCmpny = ""}
	   		var mntCmpny 			= data[i].mntCmpny; 		if(mntCmpny == undefined){mntCmpny = ""}
	   		var indcDy 				= data[i].indcDy; 			if(indcDy == undefined){indcDy = ""}

	   		var prodtWrtin 			= data[i].prodtWrtin; 		if(prodtWrtin == undefined){prodtWrtin = ""}
	   		var techSupptWrtin 		= data[i].techSupptWrtin; 	if(techSupptWrtin == undefined){techSupptWrtin = ""}
	   		var mntNeedYn 			= data[i].mntNeedYn; 		if(mntNeedYn == undefined){mntNeedYn = ""}
	   		var mntDy 				= data[i].mntDy; 			if(mntDy == undefined){mntDy = ""}
	   		var indcAmont 			= data[i].indcAmont; 		if(indcAmont == undefined){indcAmont = ""}

	   		var mntTarif 			= data[i].mntTarif; 		if(mntTarif == undefined){mntTarif = ""}
	   		var mntAmont 			= data[i].mntAmont; 		if(mntAmont == undefined){mntAmont = ""}
	   		var assetAcqsNo 		= data[i].assetAcqsNo; 		if(assetAcqsNo == undefined){assetAcqsNo = ""}
	   		var emplNo 				= data[i].emplNo; 			if(emplNo == undefined){emplNo = ""}
	   		var loc 				= data[i].loc; 				if(loc == undefined){loc = ""}

	   		var ipAdres 			= data[i].ipAdres; 			if(ipAdres == undefined){ipAdres = ""}
	   		var purchsFg 			= data[i].purchsFg; 		if(purchsFg == undefined){purchsFg = ""}
	   		var assetSttus 			= data[i].assetSttus; 		if(assetSttus == undefined){assetSttus = ""}
	   		var assetNoPrintng 		= data[i].assetNoPrintng; 	if(assetNoPrintng == undefined){assetNoPrintng = ""}
	   		var rm 					= data[i].rm; 				if(rm == undefined){rm = ""}

	   		var eModelNm 			= data[i].eModelNm; 		if(eModelNm == undefined){eModelNm = ""}
	   		var eVltge 				= data[i].eVltge; 			if(eVltge == undefined){eVltge = ""}
	   		var eCnsmpPower 		= data[i].eCnsmpPower; 		if(eCnsmpPower == undefined){eCnsmpPower = ""}
	   		var eRfgrt 				= data[i].eRfgrt; 			if(eRfgrt == undefined){eRfgrt = ""}
	   		var eCpctyCo 			= data[i].eCpctyCo; 		if(eCpctyCo == undefined){eCpctyCo = ""}
	   		var eBtryInfo 			= data[i].eBtryInfo; 		if(eBtryInfo == undefined){eBtryInfo = ""}

	   		var buld 				= data[i].buld; 			if(buld == undefined){buld = ""}
	   		var floor 				= data[i].floor; 			if(floor == undefined){floor = ""}

                    str += 		 '<TR>'
			                    	+'<TD>' + dsuseComptDy 		+ '</TD>'
			       	 				+'<TD>' + lstInputEmplNoNm 	+ '</TD>'
			                 		+'<TD>' + itAssetNo 		+ '</TD>'
			                 		+'<TD>' + prodtNm 			+ '</TD>'
			                 		+'<TD>' + prodtSnNo 		+ '</TD>'

			                 		+'<TD>' + lrgeFg 			+ '</TD>'
			                 		+'<TD>' + middlFg 			+ '</TD>'
			                 		+'<TD>' + smallFg			+ '</TD>'
			                 		+'<TD>' + prposFg 			+ '</TD>'
			                 		+'<TD>' + jobFg 			+ '</TD>'

			       	 				+'<TD>' + mnfCmpny 			+ '</TD>'
			       	 				+'<TD>' + dvyfgCmpny 		+ '</TD>'
			                 		+'<TD>' + techSupptCmpny 	+ '</TD>'
			                 		+'<TD>' + mntCmpny	 		+ '</TD>'
			                 		+'<TD>' + indcDy 			+ '</TD>'

			                 		+'<TD>' + prodtWrtin 		+ '</TD>'
			                 		+'<TD>' + techSupptWrtin 	+ '</TD>'
			                 		+'<TD>' + mntNeedYn 		+ '</TD>'
			                 		+'<TD>' + mntDy 			+ '</TD>'
			                 		+'<TD>' + indcAmont 		+ '</TD>'

			       	 				+'<TD>' + mntTarif 			+ '</TD>'
			       	 				+'<TD>' + mntAmont			+ '</TD>'
			                 		+'<TD>' + assetAcqsNo 		+ '</TD>'
			                 		+'<TD>' + emplNo 			+ '</TD>'
			                 		+'<TD>' + loc 				+ '</TD>'

			                 		+'<TD>' + ipAdres 			+ '</TD>'
			                 		+'<TD>' + purchsFg 			+ '</TD>'
			                 		+'<TD>' + assetSttus 		+ '</TD>'
			                 		+'<TD>' + assetNoPrintng 	+ '</TD>'
			                 		+'<TD>' + rm 				+ '</TD>'

		                        	+'<TD>' + eModelNm + '</TD>'
		                        	+'<TD>' + eVltge + '</TD>'
		                        	+'<TD>' + eCnsmpPower + '</TD>'
		                        	+'<TD>' + eRfgrt + '</TD>'
		                        	+'<TD>' + eCpctyCo + '</TD>'
		                        	+'<TD>' + eBtryInfo + '</TD>'

		                        	+'<TD>' + buld + '</TD>'
		                        	+'<TD>' + floor + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','기반설비 폐기완료 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownAssetLossSttus(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>손망실 접수 및 현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				/*+'<COL width="200px">'
       	 				+'<COL width="200px">'*/
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 		+ '<TR>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>도입일자</TH>'
			                 		+'<TH>신청자</TH>'
			                 		+'<TH>직급/직위</TH>'
			                 		+'<TH>신청일자</TH>'
			                 		+'<TH>접수일자</TH>'
			                 		+'<TH>검토일자</TH>'
			                 		/*+'<TH>신청 사유</TH>'
			                 		+'<TH>검토 결과</TH>'*/
	                 			+'</TR>' ;
   	 $.each(data , function(i){

   		var itAssetNo 			= data[i].itAssetNo; 	if(itAssetNo == undefined){itAssetNo = ""}
   		var prodtNm 			= data[i].prodtNm; 		if(prodtNm == undefined){prodtNm = ""}
   		var indcDy 				= data[i].indcDy; 		if(indcDy == undefined){indcDy = ""}
   		var nm 					= data[i].nm; 			if(nm == undefined){nm = ""}
   		var ofcps 				= data[i].ofcps; 		if(ofcps == undefined){ofcps = ""}
   		var applDy 				= data[i].applDy; 		if(applDy == undefined){applDy = ""}
   		var rceptDy 			= data[i].rceptDy; 		if(rceptDy == undefined){rceptDy = ""}
   		var exmnDy 				= data[i].exmnDy; 		if(exmnDy == undefined){exmnDy = ""}
   		/*var applResn 			= data[i].applResn; 	if(applResn == undefined){applResn = ""}
   		var exmnResn 			= data[i].exmnResn; 	if(exmnResn == undefined){exmnResn = ""}*/

                    str += 		 '<TR>'
                   	 				+'<TD>' + itAssetNo + '</TD>'
                   	 				+'<TD>' + prodtNm + '</TD>'
	                         		+'<TD>' + indcDy + '</TD>'
	                         		+'<TD>' + nm + '</TD>'
	                         		+'<TD>' + ofcps + '</TD>'
	                         		+'<TD>' + applDy + '</TD>'
	                         		+'<TD>' + rceptDy + '</TD>'
	                         		+'<TD>' + exmnDy + '</TD>'
	                         		/*+'<TD>' + applResn + '</TD>'
	                         		+'<TD>' + exmnResn + '</TD>'*/
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','손망실 접수 및 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownAssetMntSttus(result){
		var data  = result.rows;
   	 	var str =   '<TABLE>'
       	 			+'<CAPTION>유지보수 계약현황</CAPTION>'
       	 			+'<COLGROUP>'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 				+'<COL width="200px">'
       	 			+'</COLGROUP>'
       	 				+ '<TBODY>'
       	 				 	+ '<TR>'
       	 				 			+'<TH>M/A 여부</TH>'
            	 					+'<TH>IT자산번호</TH>'
            	 					+'<TH>제품명</TH>'
			                  		+'<TH>기관명</TH>'
			                 		+'<TH>지사명</TH>'
			                 		+'<TH>부서명</TH>'
			                 		+'<TH>도입일자</TH>'
			                 		+'<TH>대구분</TH>'
			                 		+'<TH>중구분</TH>'
			                 		+'<TH>소구분</TH>'
			                 		+'<TH>도입금액</TH>'
			                 		+'<TH>유지보수 발생일자</TH>'
			                 		+'<TH>유지보수 요율</TH>'
			                 		+'<TH>유지보수 금액</TH>'
	                 			+'</TR>' ;
   	 $.each(data , function(i){

   		var mntNeedYn 		= data[i].mntNeedYn; 	if(mntNeedYn == undefined){mntNeedYn = ""}
   		var itAssetNo 		= data[i].itAssetNo; 	if(itAssetNo == undefined){itAssetNo = ""}
   		var prodtNm 		= data[i].prodtNm; 		if(prodtNm == undefined){prodtNm = ""}
   		var insttNm 		= data[i].insttNm; 		if(insttNm == undefined){insttNm = ""}
   		var brffcNm 		= data[i].brffcNm; 		if(brffcNm == undefined){brffcNm = ""}
   		var deptNm 			= data[i].deptNm; 		if(deptNm == undefined){deptNm = ""}
   		var indcDy 			= data[i].indcDy; 		if(indcDy == undefined){indcDy = ""}
   		var lrgeFg 			= data[i].lrgeFg; 		if(lrgeFg == undefined){lrgeFg = ""}
   		var middlFg 		= data[i].middlFg; 		if(middlFg == undefined){middlFg = ""}
   		var smallFg 		= data[i].smallFg; 		if(smallFg == undefined){smallFg = ""}
   		var indcAmont 		= data[i].indcAmont; 	if(indcAmont == undefined){indcAmont = ""}
   		var mntDy 			= data[i].mntDy; 	if(mntDy == undefined){mntDy = ""}
   		var mntTarif 		= data[i].mntTarif; 	if(mntTarif == undefined){mntTarif = ""}
   		var mntAmont 		= data[i].mntAmont; 	if(mntAmont == undefined){mntAmont = ""}

                    str += 		 '<TR>'
                    				+'<TD>' + mntNeedYn + '</TD>'
                   	 				+'<TD>' + itAssetNo + '</TD>'
                   	 				+'<TD>' + prodtNm + '</TD>'
	                         		+'<TD>' + insttNm + '</TD>'
	                         		+'<TD>' + brffcNm + '</TD>'
	                         		+'<TD>' + deptNm + '</TD>'
	                         		+'<TD>' + indcDy + '</TD>'
	                         		+'<TD>' + lrgeFg + '</TD>'
	                         		+'<TD>' + middlFg + '</TD>'
	                         		+'<TD>' + smallFg + '</TD>'
	                         		+'<TD>' + indcAmont + '</TD>'
	                         		+'<TD>' + mntDy + '</TD>'
	                         		+'<TD>' + mntTarif + '</TD>'
	                         		+'<TD>' + mntAmont + '</TD>'
                         		+'</TR>';
       });
                 str +=   '</TBODY>'
          				+'</TABLE>';
       $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
       fnExcelReport('excelList','유지보수 계약현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownUserRegisterSttus(result){
		var data  = result.rows;
    	var str =   '<TABLE>'
        	 			+'<CAPTION>사용자 등록현황</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
             	 					+'<TH>사원번호</TH>'
             	 					+'<TH>이름</TH>'
				                  		+'<TH>직급/직위</TH>'
				                 		+'<TH>기관명</TH>'
				                 		+'<TH>지사</TH>'
				                 		+'<TH>부서명</TH>'
				                 		+'<TH>사용자 권한</TH>'
				                 		+'<TH>전화번호</TH>'
				                 		+'<TH>내선번호</TH>'
				                 		+'<TH>이메일</TH>'
		                 			+'</TR>' ;
    	 $.each(data , function(i){

    		 var emplNo 		= data[i].emplNo; 		if(emplNo == undefined){emplNo = ""}
    		 var nm 			= data[i].nm; 			if(nm == undefined){nm = ""}
    		 var ofcps 			= data[i].ofcps; 		if(ofcps == undefined){ofcps = ""}
    		 var insttNm 		= data[i].insttNm; 		if(insttNm == undefined){insttNm = ""}
    		 var brffcNm 		= data[i].brffcNm; 		if(brffcNm == undefined){brffcNm = ""}
    		 var deptNm 		= data[i].deptNm; 		if(deptNm == undefined){deptNm = ""}
    		 var userAuthr 		= data[i].userAuthr;	if(userAuthr == undefined){userAuthr = ""}
    		 var telNo 			= data[i].telNo; 		if(telNo == undefined){telNo = ""}
    		 var lxtnNo 		= data[i].lxtnNo; 		if(lxtnNo == undefined){lxtnNo = ""}
    		 var emailAddr 		= data[i].emailAddr;	if(emailAddr == undefined){emailAddr = ""}

                     str += 		 '<TR>'
                    	 				+'<TD>' + emplNo + '</TD>'
                    	 				+'<TD>' + nm + '</TD>'
		                         		+'<TD>' + ofcps + '</TD>'
		                         		+'<TD>' + insttNm + '</TD>'
		                         		+'<TD>' + brffcNm + '</TD>'
		                         		+'<TD>' + deptNm + '</TD>'
		                         		+'<TD>' + userAuthr + '</TD>'
		                         		+'<TD>' + telNo + '</TD>'
		                         		+'<TD>' + lxtnNo + '</TD>'
		                         		+'<TD>' + emailAddr + '</TD>'
	                         		+'</TR>';
        });
                  str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','사용자 등록현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownCodeReader(result){
		var data  = result.rows;
    	var str =   '<TABLE>'
        	 			+'<CAPTION>코드 관리</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
             	 					+'<TH>구분</TH>'
             	 					+'<TH>구분명</TH>'
				                  		+'<TH>코드</TH>'
				                 		+'<TH>코드명</TH>'
		                 			+'</TR>' ;
    	 $.each(data , function(i){

    		 var fg 		= data[i].fg; 			if(fg == undefined){fg = ""}
    		 var fgNm 		= data[i].fgNm; 		if(fgNm == undefined){fgNm = ""}
    		 var code 		= data[i].code; 		if(code == undefined){code = ""}
    		 var desc 		= data[i].desc; 		if(desc == undefined){desc = ""}

                     str += 		 '<TR>'
                    	 				+'<TD>' + fg + '</TD>'
                    	 				+'<TD>' + fgNm + '</TD>'
		                         		+'<TD>' + code + '</TD>'
		                         		+'<TD>' + desc + '</TD>'
	                         		+'</TR>';
        });
                  str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','코드 관리'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}
	
	function excelDownVirtualCodeReader(result){
		var data  = result;
console.log("########### data : " + JSON.stringify(data));	
    	var str =   '<TABLE>'
        	 			+'<CAPTION>가상화코드관리</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
             	 					+'<TH>구분</TH>'
             	 					+'<TH>구분명</TH>'
				                  	+'<TH>코드</TH>'
				                 	+'<TH>코드명</TH>'
				                 	+'<TH>적용일</TH>'
		                 		+'</TR>' ;
    	 $.each(data , function(i){

    		 var fg 		= data[i].fg; 			if(fg == undefined){fg = ""}
    		 var fgNm 		= data[i].fgNm; 		if(fgNm == undefined){fgNm = ""}
    		 var code 		= data[i].code; 		if(code == undefined){code = ""}
    		 var desc 		= data[i].desc; 		if(desc == undefined){desc = ""}
    		 var applyDy    = data[i].applyDy;      if(applyDy == undefined){applyDy = ""}
                     str += 		 '<TR>'
                    	 				+'<TD>' + fg + '</TD>'
                    	 				+'<TD>' + fgNm + '</TD>'
		                         		+'<TD>' + code + '</TD>'
		                         		+'<TD>' + desc + '</TD>'
		                         		+'<TD>'  + applyDy + '<TD>'
	                         		+'</TR>';
        });
                  str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','가상화 코드'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownDsplyAdministrate(result){
		var data  = result.rows;
    	var str =   '<TABLE>'
        	 			+'<CAPTION>화면 관리</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
             	 					+'<TH>화면 ID</TH>'
             	 					+'<TH>화면 종류</TH>'
			                  		+'<TH>메뉴 표출여부</TH>'
			                 		+'<TH>엑셀 기능여부</TH>'
	                 			+'</TR>' ;
    	 $.each(data , function(i){

    		 var dsplyNo 		= data[i].dsplyNo; 			if(dsplyNo == undefined){dsplyNo = ""}
    		 var dsplyTy 		= data[i].dsplyTy; 			if(dsplyTy == undefined){dsplyTy = ""}
    		 var hderUrlYn 		= data[i].hderUrlYn; 		if(hderUrlYn == undefined){hderUrlYn = ""}
    		 var excelFnct 		= data[i].excelFnct; 		if(excelFnct == undefined){excelFnct = ""}

                     str += 		 '<TR>'
                    	 				+'<TD>' + dsplyNo + '</TD>'
                    	 				+'<TD>' + dsplyTy + '</TD>'
		                         		+'<TD>' + hderUrlYn + '</TD>'
		                         		+'<TD>' + excelFnct + '</TD>'
	                         		+'</TR>';
        });
                  str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','화면 관리'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownAuthrDsplyAdministrate(result){
		var data  = result.rows;
    	var str =   '<TABLE>'
        	 			+'<CAPTION>사용자 권한별 화면 관리</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'

        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'

        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 				+'<COL width="200px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
             	 					+'<TH>사용자 권한</TH>'
             	 					+'<TH>화면 DEPTH</TH>'
             	 					+'<TH>화면 종류</TH>'
			                  		+'<TH>상위화면 ID</TH>'
			                 		+'<TH>상위화면 이름</TH>'

			                 		+'<TH>상위화면 주소</TH>'
             	 					+'<TH>화면 ID</TH>'
			                  		+'<TH>화면 이름</TH>'
			                 		+'<TH>화면 주소</TH>'
			                 		+'<TH>데이터 운용권한</TH>'

             	 					+'<TH>다운 권한</TH>'
			                  		+'<TH>검색 권한</TH>'
			                 		+'<TH>업로드 권한</TH>'
			                 		+'<TH>상세보기 권한</TH>'
	                 			+'</TR>' ;
    	 $.each(data , function(i){

    		 var userAuthr 		= data[i].userAuthr; 	if(userAuthr == undefined){userAuthr = ""}
    		 var dsplyDp 		= data[i].dsplyDp; 		if(dsplyDp == undefined){dsplyDp = ""}
    		 var dsplyTy 		= data[i].dsplyTy; 		if(dsplyTy == undefined){dsplyTy = ""}
    		 var upperDsplyNo 	= data[i].upperDsplyNo; if(upperDsplyNo == undefined){upperDsplyNo = ""}
    		 var upperDsplyNm 	= data[i].upperDsplyNm; if(upperDsplyNm == undefined){upperDsplyNm = ""}
    		 var upperDsplyUrl 	= data[i].upperDsplyUrl;if(upperDsplyUrl == undefined){upperDsplyUrl = ""}
    		 var dsplyNo 		= data[i].dsplyNo; 		if(dsplyNo == undefined){dsplyNo = ""}
    		 var dsplyNm 		= data[i].dsplyNm; 		if(dsplyNm == undefined){dsplyNm = ""}
    		 var dsplyUrl 		= data[i].dsplyUrl; 	if(dsplyUrl == undefined){dsplyUrl = ""}
    		 var crudAuthr 		= data[i].crudAuthr; 	if(crudAuthr == undefined){crudAuthr = ""}
    		 var dwldAuthr 		= data[i].dwldAuthr; 	if(dwldAuthr == undefined){dwldAuthr = ""}
    		 var searchAuthr 	= data[i].searchAuthr;	if(searchAuthr == undefined){searchAuthr = ""}
    		 var uploadAuthr 	= data[i].uploadAuthr;	if(uploadAuthr == undefined){uploadAuthr = ""}
    		 var clickAuthr 	= data[i].clickAuthr; 	if(clickAuthr == undefined){clickAuthr = ""}


                     str += 		 '<TR>'
                    	 				+'<TD>' + userAuthr + '</TD>'
                    	 				+'<TD>' + dsplyDp + '</TD>'
		                         		+'<TD>' + dsplyTy + '</TD>'
		                         		+'<TD>' + upperDsplyNo + '</TD>'
		                         		+'<TD>' + upperDsplyNm + '</TD>'
                    	 				+'<TD>' + upperDsplyUrl + '</TD>'
		                         		+'<TD>' + dsplyNo + '</TD>'
		                         		+'<TD>' + dsplyNm + '</TD>'
		                         		+'<TD>' + dsplyUrl + '</TD>'
                    	 				+'<TD>' + crudAuthr + '</TD>'
		                         		+'<TD>' + dwldAuthr + '</TD>'
		                         		+'<TD>' + searchAuthr + '</TD>'
		                         		+'<TD>' + uploadAuthr + '</TD>'
		                         		+'<TD>' + clickAuthr + '</TD>'
	                         		+'</TR>';
        });
                  str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','사용자 권한별 화면 관리'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownamB_DeptAssetSttus(result){
		var data  = result.rows;
			var str =   '<TABLE id="excelList">'
						+'<CAPTION>부서 자산 현황</CAPTION>'
						+'<COLGROUP>'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
 						+'<COL width="200px">'
						+'</COLGROUP>'
							+ '<TBODY>'
								+ '<TR>'
									+'<TH>일치 여부</TH>'
								+'<TH>IT자산 번호</TH>'
								+'<TH>제품명</TH>'
								+'<TH>기관명</TH>'
								+'<TH>지사명</TH>'
								+'<TH>부서명</TH>'
								+'<TH>대구분</TH>'
								+'<TH>중구분</TH>'
								+'<TH>소구분</TH>'
								+'<TH>사용자</TH>'
								+'<TH>직급/직위</TH>'
								+'<TH>사원 기관명</TH>'
								+'<TH>사원 지사명</TH>'
								+'<TH>사원 부서명</TH>'
							+'</TR>' ;
		 $.each(data , function(i){

			var result = data[i].result;			if(result == undefined){result = ""}
			var itAssetNo = data[i].itAssetNo; 		if(itAssetNo == undefined){itAssetNo = ""}
			var prodtNm = data[i].prodtNm;			if(prodtNm == undefined){prodtNm = ""}
			var mstInsttNm = data[i].mstInsttNm; 	if(mstInsttNm == undefined){mstInsttNm = ""}
			var mstBrffcNm = data[i].mstBrffcNm; 	if(mstBrffcNm == undefined){mstBrffcNm = ""}
			var mstDeptNm = data[i].mstDeptNm; 		if(mstDeptNm == undefined){mstDeptNm = ""}
			var lrgeFg = data[i].lrgeFg; 			if(lrgeFg == undefined){lrgeFg = ""}
			var middlFg = data[i].middlFg; 			if(middlFg == undefined){middlFg = ""}
			var smallFg = data[i].smallFg;			if(smallFg == undefined){smallFg = ""}
			var nm = data[i].nm; 					if(nm == undefined){nm = ""}
			var ofcps = data[i].ofcps; 				if(ofcps == undefined){ofcps = ""}
			var userInsttNm = data[i].userInsttNm; 	if(userInsttNm == undefined){userInsttNm = ""}
			var userBrffcNm = data[i].userBrffcNm; 	if(userBrffcNm == undefined){userBrffcNm = ""}
			var userDeptNm = data[i].userDeptNm; 	if(userDeptNm == undefined){userDeptNm = ""}

					str += 		 '<TR>'
	 							+'<TD>' + result + '</TD>'
								+'<TD>' + itAssetNo + '</TD>'
								+'<TD>' + prodtNm + '</TD>'
								+'<TD>' + mstInsttNm + '</TD>'
								+'<TD>' + mstBrffcNm + '</TD>'
								+'<TD>' + mstDeptNm + '</TD>'
								+'<TD>' + lrgeFg + '</TD>'
								+'<TD>' + middlFg + '</TD>'
								+'<TD>' + smallFg + '</TD>'
								+'<TD>' + nm + '</TD>'
								+'<TD>' + ofcps + '</TD>'
								+'<TD>' + userInsttNm + '</TD>'
								+'<TD>' + userBrffcNm + '</TD>'
								+'<TD>' + userDeptNm + '</TD>'
								+'</TR>';
		   });
				     str +=   '</TBODY>'
							+'</TABLE>';
		   $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
		   fnExcelReport('excelList','부서 자산 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}

	function excelDownVirtualCode(result){
		var data  = result;
		var str =   '<TABLE>'
        	 			+'<CAPTION>가상화 코드</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
	        	 				 	+'<TH>구분</TH>'
	         	 					+'<TH>구분명</TH>'
			                  		+'<TH>코드</TH>'
			                 		+'<TH>코드명</TH>'
			                 		+'<TH>적용일</TH>'
		                 		+'</TR>' ;
    	 $.each(data , function(i){
    		 var fg 		= data[i].fg; 			if(fg == undefined){fg = ""}
    		 var fgNm 		= data[i].fgNm; 		if(fgNm == undefined){fgNm = ""}
    		 var code 		= data[i].code; 		if(code == undefined){code = ""}
    		 var desc 		= data[i].desc; 		if(desc == undefined){desc = ""}
    		 var applyDy 	= data[i].applyDy; 		if(applyDy == undefined){applyDy = ""}

                     str += 		 '<TR>'
				                    	+'<TD>' + fg + '</TD>'
				     	 				+'<TD>' + fgNm + '</TD>'
				                  		+'<TD>' + code + '</TD>'
				                  		+'<TD>' + desc + '</TD>'
				                  		+'<TD>' + applyDy + '</TD>'
	                         		+'</TR>';
        });
                  	str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','가상화 코드'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}
	
	function excelDownVirtualAsset(result){
		var data  = result;
		var str =   '<TABLE>'
        	 			+'<CAPTION>가상화 현황</CAPTION>'
        	 			+'<COLGROUP>'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 				+'<COL width="400px">'
        	 			+'</COLGROUP>'
        	 				+ '<TBODY>'
        	 				 	+ '<TR>'
             	 					+'<TH>서비스</TH>'
             	 					+'<TH>가상화서버</TH>'
				                  	+'<TH>물리서버</TH>'
				                 	+'<TH>스토리지</TH>'
		                 		+'</TR>' ;
    	 $.each(data , function(i){
    		 var svcNm 				= data[i].svcNm; 			if(svcNm == undefined){svcNm = ""}
    		 var vtServerNm 		= data[i].vtServerNm; 		if(vtServerNm == undefined){vtServerNm = ""}
    		 var physiclServerNm 	= data[i].physiclServerNm; 	if(physiclServerNm == undefined){physiclServerNm = ""}
    		 var strgeNm 			= data[i].strgeNm; 			if(strgeNm == undefined){strgeNm = ""}

                     str += 		 '<TR>'
                    	 				+'<TD>' + svcNm + '</TD>'
                    	 				+'<TD>' + vtServerNm + '</TD>'
		                         		+'<TD>' + physiclServerNm + '</TD>'
		                         		+'<TD>' + strgeNm + '</TD>'
	                         		+'</TR>';
        });
                  	str +=   '</TBODY>'
           				+'</TABLE>';
        $("#excelList").append(str); /* excelList id를 가진 div에다가 동적인 테이블을 생성 */
        fnExcelReport('excelList','가상화 현황'); /* function fnExcelReport()에다가 excelList를 가진 table과 엑셀 업로드 결과라는 타이틀 파라미터를 던짐 */
	}