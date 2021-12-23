<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>디테일 코드입력</title>
		<link rel="stylesheet" type="text/css" href="/css/admin/all.css">
		<link rel="stylesheet" type="text/css" href="/css/admin/reset.css">
		<link rel="stylesheet" type="text/css" href="/css/admin/member_list.css">
		<script type="text/javascript" src="/js/admin/jquery.js"></script>
		<script type="text/javascript" src="/js/admin/all.js"></script>
	</head>
	<body>
		<header id="header">
	        <div class="topbar" style="position: absolute; top:0;">
	            <!-- 왼쪽 메뉴 -->
	            <div class="left side-menu">
	                <div class="sidebar-inner">
	                    <div id="sidebar-menu">
	                        <ul>
	                            <li class="has_sub"><a href="javascript:void(0);" class="waves-effect">
	                                <i class="fas fa-bars"></i>
	                            </a></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	            <!-- 왼쪽 서브 메뉴 -->
	            <div class="left_sub_menu">
	                <div class="sub_menu">
	                    <input type="search" name="SEARCH" placeholder="SEARCH">
	                    <h2>분류</h2>
	                    <ul class="big_menu">
	                        <li>코드 관리 <i class="arrow fas fa-angle-right"></i></li>
	                        <ul class="small_menu">
	                            <a href="codeList.do"><li>코드목록</li></a>
	                            <a href="MsCodeWrite.do"><li>대분류 코드 작성</li></a>
	                            <a href="DtCodeWrite.do"><li>소분류 코드 작성</li></a>
	                        </ul>
	                    </ul>
	                    <ul class="big_menu">
	                        <li>개발자 관리 <i class="arrow fas fa-angle-right"></i></li>
	                        <ul class="small_menu">
	                            <a href=""><li>소메뉴2-1</li></a>
	                            <a href=""><li>소메뉴2-2</li></a>
	                        </ul>
	                    </ul>
	                    <ul class="big_menu">
	                        <li>프로젝트 관리 <i class="arrow fas fa-angle-right"></i></li>
	                        <ul class="small_menu">
	                            <a href=""><li>소메뉴2-1</li></a>
	                            <a href=""><li>소메뉴2-2</li></a>
	                        </ul>
	                    </ul>
	                    <ul class="big_menu">
	                        <li><a href="#">메인</a></li>
	                    </ul>
	                </div>
	            </div>
	        </div>
	        <div class="headerIn">
	            <h1 class="title"><a href="#">관리자</a></h1> 
	            <ul>
	                <li><a href="#">내정보</a></li>
	                <li><a href="#">로그아웃</a></li>
	            </ul>     
	        </div>
	    </header>
	    <div id="container">
	        <h2>소분류 코드 작성</h2>
			<form name="frm" method="post" action="DtCodeWriteSave.do">
				<table border="1" width="900px" height="150px">
					<tr>
						<th>대분류 코드</th>
						<td><input type="text" name="masterCd"></td>
					</tr>
					<tr>
						<th>소분류 코드</th>
						<td><input type="text" name="detailCd"></td>
					</tr>
					<tr>
						<th>소분류 명</th>
						<td><input type="text" name="detailNm"></td>
					</tr>
					<tr>
						<th colspan="2">
							<button type = "submit" onclick="fn_submit(); return false;">저장</button>
							<button type = "reset">취소</button>
						</th>
					</tr>
				</table>
			</form>
		</div>
	</body>
	<script type="text/javascript" src="/js/admin/member_list.js"></script>
	<script>
		function fn_submit() {
			
			if(document.frm.masterCd.value == "" && document.frm.detailCd.value == "" && document.frm.detailNm.value == "") {
				alert("저장되었습니다.")
			} else if(document.frm.masterCd.value == "") {
				alert("대분류 코드를 입력해주세요")
				document.frm.masterCd_focus();
				return false;
			} else if(document.frm.detailCd.value == "") {
				alert("소분류 코드를 입력해주세요")
				document.frm.detailCd_focus();
				return false;
			} else if(document.frm.detailNm.value == "") {
				alert("소분류명를 입력해주세요")
				document.frm.detailNm_focus();
			}
			document.frm.sumit();
		}
	</script>
</html>