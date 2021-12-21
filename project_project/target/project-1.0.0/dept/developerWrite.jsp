<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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

<body>
<form name="frm" method="post" action="devWriteSave.do">
<table>
	<tr>
		<th>사번</th>
		<td><input type="text" name="d_id"></td>
	</tr>
	<tr>
		<th>개발자이름</th>
		<td><input type="text" name="d_name"></td>
	</tr>
	<tr>
		<th>등급</th>
		<td><input type="text" name="d_tier"></td>
	</tr>
	<tr>
		<th>역할</th>
		<td><input type="text" name="d_role"></td>
	</tr>
	<tr>
		<th>직급</th>
		<td><input type="text" name="d_jobgrade"></td>
	</tr>
	<tr>
		<th>직원구분여부</th>
		<td><input type="text" name="d_type"></td>
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