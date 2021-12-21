<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
		width:900px;
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
	<caption>프로젝트 목록</caption>
	
	<tr>
		<th>프로젝트 코드</th>
		<th>프로젝트 이름</th>
		<th>프로젝트 시작일</th>
		<th>프로젝트 종료일</th>
		<th>사업장소</th>
		<th>발주처</th>
		<th>영업담당자</th>
		<th>연락처</th>
		<th>진행과정</th>
		<th>비고</th>
	</tr>
	
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr>
			<td>${result.pId }</td>
			<td><a href="projectDetail.do?p_id=${result.pId }">${result.pName }</a></td>
			<td>${result.pStartdate }</td>
			<td>${result.pEnddate }</td>
			<td>${result.pPlace }</td>
			<td>${result.pBuyer }</td>
			<td>${result.pSalesman }</td>
			<td>${result.pTell }</td>
			<td>${result.pProgress }</td>
			<td>${result.pNote }</td>
		</tr>
	</c:forEach>

</table>


</body>
</html>