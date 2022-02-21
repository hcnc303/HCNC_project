<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../header/header.jsp" %>
    <br />
    <h1 class="text-center">Board Detail</h1>
    <br />
    <br />
    <div class="container">
        <form action="updateTree.do" id="viewForm" method="post" encType="multipart/form-data">
            <table class="table table-bordered">
                <tbody>
                    <tr style="display:none">
                        <th>글번호</th>
                        <td><input name="no" type="text" value="${vo.no}" class="form-control" readonly /></td>
                    </tr>
                    <tr style="display:none">
                        <th>년도</th>
                        <td><input name="year" type="text" value="${vo.year}" class="form-control" readonly /></td>
                    </tr>
                    <tr>
                        <th>구분</th>                       
                        <td>
			                <select class="cate1" name="type">
								<option selected>선택</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" value="${vo.title}" name="title" class="form-control" /></td>
                    </tr>
                    <tr>
                        <c:if test="${vo.fileName ne null}">
                            <tr>
                                <th>다운로드</th>
                                <td><a href="fileDownload.do?fileName=${vo.fileName}">
                                    <input type="text" id="filename" value="${vo.fileName}" name="fileName" class="form-control" readonly="readonly" /></a>
                                    <button id="filedelete" type="button" class="btn_previous" style="float: right">파일삭제</button>
                            </tr>
                        </c:if>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="uploadFile"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: right;">
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                            <button id="btn_modify" type="button" class="btn_register">수정</button>
                            <button id="btn_delete" type="button" class="btn_delete">삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">

let cateList = JSON.parse('${cateList}');
let cate1Array = new Array();
let cate1Obj = new Object();
let cateSelect1 = $(".cate1");

for(let i = 0; i < cateList.length; i++){
	
		cate1Obj = new Object();
		
		cate1Obj.type_code = cateList[i].type_code;
		cate1Obj.type_cont = cateList[i].type_cont;
		
		cate1Array.push(cate1Obj);				
		
}	

$(document).ready(function(){
	console.log(cate1Array);
});

for(let i = 0; i < cate1Array.length; i++){
	cateSelect1.append("<option value='"+cate1Array[i].type_code+"'>" + cate1Array[i].type_cont + "</option>");
}



$(document).ready(function(){
	console.log('${cateList}');
});




    $(document).on('click', '#btn_modify', function(e) {
        if (confirm("정말 수정하시겠습니까 ?") == true) {
            $("#viewForm").submit();
        } else {
            return;
        }
    });
    $(document).on('click', '#btn_delete', function(e) {
        
        var no = ${vo.no};
        
        if (confirm("정말 삭제하시겠습니까 ?") == true) {
            $("#viewForm").attr("action", "deleteTree.do?no="+no);
            $("#viewForm").submit();
        } else {
            return;
        }
    });
 
    //이전 클릭 시 testList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'treeList.do');
 
    });
    
    $("#filedelete").click(function deletefile() {
        $('#filename').val(null);
 
    });
</script>
</body>
</html>