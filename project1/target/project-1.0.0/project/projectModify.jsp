<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@include file="../includes/admin/header.jsp" %>

<style>
	table {
		width:400px;
		border-collapse:collapse; /* cell 간격 없앰*/
	}
	
	th,td {
		border:1px solid #cccccc;
		padding:5px;
	}
</style>

<form name="frm" method="post" action="projectModifySave.do">
	<table>
		<tr>
			<th>프로젝트 번호</th>
			<td><input type="text" name="p_id" value="${vo.p_id}" readonly></td>
		</tr>
		<tr>
			<th>프로젝트 이름</th>
			<td><input type="text" name="p_name" value="${vo.p_name}"></td>
		</tr>
		<tr>
			<th>프로젝트 시작일</th>
			<td><input type="text" name="p_startdate" value="${vo.p_startdate}"></td>
		</tr>
		<tr>
			<th>프로젝트 종료일</th>
			<td><input type="text" name="p_enddate" value="${vo.p_enddate}"></td>
		</tr>
		<tr>
			<th>사업 장소</th>
			<td><input type="text" name="p_place" value="${vo.p_place}"></td>
		</tr>
		<tr>
			<th>발주처</th>
			<td><input type="text" name="p_buyer" value="${vo.p_buyer}"></td>
		</tr>
		<tr>
			<th>영업담당자</th>
			<td><input type="text" name="p_salesman" value="${vo.p_salesman}"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="p_tell" value="${vo.p_tell}"></td>
		</tr>
		<tr>
			<th>진행과정</th>
			<td><input type="text" name="p_progress" value="${vo.p_progress}"></td>
		</tr>
		<tr>
			<th>비고</th>
			<td><input type="text" name="p_note" value="${vo.p_note}"></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit">저장</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>