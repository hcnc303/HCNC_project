<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/admin/header.jsp" %>

<script src="/project/script/jquery-1.12.4.js"></script>
<script src="/project/script/jquery-ui.js"></script>

<style>
	body {font-size: 15px;}
	button {font-size: 9px}
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
	.textarea{
		width: 98%;
		height: 70px;
	}
</style>


	
<script>

$(function() {
	
	$("#p_name").val("이름 입력");
	
});

	function fn_submit(){
		
		if($("#p_name").val() == "") {
			alert("프로젝트 이름을 입력해주세요!");
			$("p_name").focus();
			return false;
		}
	
	var formData = $("#frm").serialize();
	
	// ajax : 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
	$.ajax({ 
		
		 type : "POST", // 타입 
		 data : formData,
		 url : "projectWriteSave.do",
		 dataType : "text",	// 리턴타입
		 success :function(data) { // controller -> "ok","fail"
			if(data == "ok"){
				alert("저장완료");
				location="projectList.do";
			} else {
				alert("저장실패");
			}
		 },
		 error :function() { // 장애발생
			 alert("오류발생");
		 } 
		
	});
}
	
</script>



<form name="frm" id="frm">
	<table>
		<caption>프로젝트 등록</caption>
		<tr>
			<th width="20%"><label for="p_id">프로젝트 번호</label></th>
			<td width="80%"><input type="text" name="p_id" id="p_id"></td>
		</tr>
		<tr>
			<th><label for="p_name">프로젝트 이름</label></th>
			<td><input type="text" name="p_name" id="p_name" class="input1"></td>
		</tr>
		<tr>
			<th>프로젝트 시작일</th>
			<td><input type="text" name="p_startdate" id="p_startdate"></td>
		</tr>
		<tr>
			<th>프로젝트 종료일</th>
			<td><input type="text" name="p_enddate" id="p_enddate"></td>
		</tr>
		<tr>
			<th>사업 장소</th>
			<td><input type="text" name="p_place" id="p_place"></td>
		</tr>
		<tr>
			<th>발주처</th>
			<td><input type="text" name="p_buyer" id="p_buyer"></td>
		</tr>
		<tr>
			<th>영업담당자</th>
			<td><input type="text" name="p_salesman" id="p_salesman"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" name="p_tell" id="p_tell"></td>
		</tr>
		<tr>
			<th>진행과정</th>
			<td><input type="text" name="p_progress" id="p_progress"></td>
		</tr>
		<tr>
			<th>비고</th>
			<td><textarea name="p_note" id="p_note" class="textarea"></textarea></td>
		</tr>
		<tr>
			<th colspan="2">
				<button type="submit" onclick="fn_submit();return false;">저장</button>
				<button type="reset">취소</button>
			</th>
		</tr>
	</table>
</form>
</body>
</html>