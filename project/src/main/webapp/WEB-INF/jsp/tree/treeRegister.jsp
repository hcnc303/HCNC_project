<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../header/header.jsp" %>

<br/>
    <h1 class="text-center">Board Write</h1>
<br/>
<br/>
<div class="container">
        <form id="form_tree" action="insertTree.do" method="post" encType="multipart/form-data">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th>구분</th>                       
                        <td>
			                <select class="cate1" name="type">
								<option selected value="none">선택</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" placeholder="제목을 입력하세요." name="title" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td><textarea placeholder="내용을 입력하세요 ." name="cont"
                                class="form-control" style="height: 200px;"></textarea></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td><input type="file" name="uploadFile"></td>    
                    </tr>
                    <tr>
                        <td colspan="2">
                            <button id="btn_register" type="button" class="btn_register">등록</button>
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                        </td>
                    </tr>
 
                </tbody>
            </table>
        </form>
    </div>
</body>

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
	

	
    //글쓰기
    $(document).on('click', '#btn_register', function(e) {
        $("#form_tree").submit();
    });
 
    //이전 클릭 시 testList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'treeList.do');
 
    });
</script>
</html>
