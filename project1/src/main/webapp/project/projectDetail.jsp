<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="../includes/admin/header.jsp" %>

<style>
	body {
		font-size: 15px;
	}
	
	button {
		font-size: 9px
	}

	table {
		width:600px;
		border-collapse:collapse; /* cell 간격 없앰*/
	}
	
	th,td {
		border:1px solid #cccccc;
		padding:5px;
	}
	
	.input1{
		width: 98%;
	}
</style>


	<table>
		<tr>
			<th>프로젝트 번호</th>
			<td>${projectVO.p_id}</td>
		</tr>
		<tr>
			<th>프로젝트 이름</th>
			<td>${projectVO.p_name}</td>
		</tr>
		<tr>
			<th>프로젝트 시작일</th>
			<td>${projectVO.p_startdate}</td>
		</tr>
		<tr>
			<th>프로젝트 종료일</th>
			<td>${projectVO.p_enddate}</td>
		</tr>
		<tr>
			<th>사업 장소</th>
			<td>${projectVO.p_place}</td>
		</tr>
		<tr>
			<th>발주처</th>
			<td>${projectVO.p_buyer}</td>
		</tr>
		<tr>
			<th>영업담당자</th>
			<td>${projectVO.p_salesman}</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${projectVO.p_tell}</td>
		</tr>
		<tr>
			<th>진행과정</th>
			<td>${projectVO.p_progress}</td>
		</tr>
		<tr>
			<th>비고</th>
			<td>${projectVO.p_note}</td>
		</tr>
		<tr>
			<th colspan="2">
			<button type="button" onclick="location='projectModifyWrite.do?p_id=${projectVO.p_id}'">수정</button>
			<button type="button" onclick="location='projectDelete.do?p_id=${projectVO.p_id}'">삭제</button>
			</th>
		</tr>
	</table>

</body>
</html>