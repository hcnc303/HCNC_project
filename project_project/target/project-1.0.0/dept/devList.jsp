<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>developers information</title>
</head>
<body>
	<h1>developers information</h1>
	<button onclick="loadJson()">개발자목록 가져오기</button>
	<table border="1">
			<tr>
				<td>사번</td>
				<td>개발자성명</td>
				<td>실력등급</td>
				<td>역할</td>
				<td>직급</td>
				<td>직원구분여부</td>
			</tr>
			<c:forEach var="vo" items="${list}" >
				<tr>
					<td>${vo.d_id}</td>
					<td>${vo.d_name}</td>
					<td>${vo.d_tier}</td>
					<td>${vo.d_role}</td>
					<td>${vo.d_jobgrade}</td>
					<td>${vo.d_type}</td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>