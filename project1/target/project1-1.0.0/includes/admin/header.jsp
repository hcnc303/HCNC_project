<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./css/admin/all.css">
	<link rel="stylesheet" type="text/css" href="./css/admin/reset.css">
	<link rel="stylesheet" type="text/css" href="./css/admin/member_list.css">
	<script type="text/javascript" src="./js/admin/jquery.js"></script>
	<script type="text/javascript" src="./js/admin/all.js"></script>
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
                            <a href="projectList.do"><li>프로젝트 목록</li></a>
                            <a href="projectWrite.do"><li>프로젝트 작성</li></a>
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
