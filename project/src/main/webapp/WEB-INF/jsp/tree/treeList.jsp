<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="../header/header.jsp" %>

<script>
	function onDisplay() {
		$('#insert').show();
		$('#onDisplay').hide();
		$('#offDisplay').show();
	}
	
	function offDisplay() {
		$('#insert').hide();
		$('#onDisplay').show();
		$('#offDisplay').hide();
	}
</script>


    <br />
    <h4 class="text-center"><a href="/treeList.do">안전 보건 조직도 리스트</a></h4>
    <br />
    <br />
    <div class="container">
        <!-- search start -->
        <div class="form-group row">
 
            <div class="w100" style="padding-right: 10px">
                <select class="form-control form-control-sm" name="searchType" id="searchType">
                    <option value="year">년도</option>
                    <option value="type_cont">구분</option>
                    <option value="title">제목</option>
                </select>
            </div>
 
            <div class="w300" style="padding-right: 10px">
                <input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
            </div>
 
            <div>
                <button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
            </div>
 
        </div>
        <!-- search end -->
        <br />
    	<form id="viewForm" method="post" encType="multiplart/form-data">
	        <table class="table table-hover table-striped text-center" style="border: 1px solid;">
	            <colgroup>
	                <col width="10%" />
	                <col width="20%" />
	                <col width="50%" />
	                <col width="20%" />
	            </colgroup> 
	            <thead>
	                <tr>
	                    <th style="display:none">번호</th>
	                    <th>년도</th>
	                    <th>구분</th>
	                    <th>제목</th>                  
	                    <th>등록일자</th>
	                </tr>
	            </thead>
	 
	            <tbody>
	                <c:forEach items="${list }" var="result">
	                    <tr>
	                        <td style="display:none">${result.no}</td>
	                        <td>${result.year}</td>
	                        <td>${result.typeCont}</td>
	                        <td><a href="treeList.do?no=${result.no}">${result.title}</a></td>
	                        <td>${result.edate}</td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </form>
        <!-- pagination start -->
        <div id="paginationBox" class="pagination1">
            <ul class="pagination" style="justify-content: center;">
 
                <c:if test="${pagination.prev}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">이전</a></li>
                </c:if>
 
                <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="no">
                    <li class="page-item <c:out value="${pagination.page == no ? 'active' : ''}"/> ">
                    <a class="page-link" href="#"
                        onClick="fn_pagination('${no}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                     ,'${search.searchType}', '${search.keyword}')">
                            ${no} </a></li>
                </c:forEach>
 
                <c:if test="${pagination.next}">
                    <li class="page-item"><a class="page-link" href="#"
                        onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.listSize}'
                    ,'${search.searchType}', '${search.keyword}')">다음</a></li>
                </c:if>
            </ul>
        </div>
        <!-- pagination end -->
        
        <button id="onDisplay" class="btn btn-outline-info" style="float: right" onclick="onDisplay()">등록하기</button>
        <button id="offDisplay" class="btn btn-outline-info" style="float: right; display:none;" onclick="offDisplay()">숨기기</button>

        
        <br />
        <br />
        <hr />
        
        <div id="insert" style="display:none">
	       <form id="form_tree" action="insertTree.do" method="post" encType="multipart/form-data">
		       <table class="table table-hover table-striped text-center" style="border: 1px solid;">
		            <colgroup>
		                <col width="10%" />
		                <col width="20%" />
		                <col width="50%" />
		                <col width="20%" />
		            </colgroup>
		             
		            <thead>
		                <tr>
		                    <th style="display:none">번호</th>
		                    <th>년도</th>
		                    <th>구분</th>
		                    <th>제목</th>                  
		                    <th>등록일자</th>
		                </tr>
		            </thead>
		 
		            <tbody>
		                    <tr>
		                        <td name="no" style="display:none"></td>
		                        <td name="year"></td>
		                        <td>
		                        	<select class="cate1" name="type">
										<option selected>선택</option>
									</select>
								</td>
		                        <td><input type="text" placeholder="제목을 입력하세요." name="title" class="form-control" /></td>
		                        <td name="edate"></td>
		                    </tr>
		            </tbody>
		        </table> 
		   		<input type="file" name="uploadFile">
	       		<button id="btn_register" type="button" class="btn_register btn btn-success">등록</button>
	       </form>
        </div>
        <br>
        <br>
        <br>
        <br>
        
        <div id="detail">
	        <form action="updateTree.do" id="viewDetail" method="post" encType="multipart/form-data">
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
				                <select id="cate1" class="cate1" name="type">
									<option vlaue="${vo.type}"selected>${vo.type}</option>
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
	                                    <button id="filedelete" type="button" class="btn_previous btn btn-danger" style="float: right">파일삭제</button>
	                            </tr>
	                        </c:if>
	                    </tr>
	                    <tr>
	                        <th>첨부파일</th>
	                        <td><input type="file" name="uploadFile"></td>
	                    </tr>
	                    <tr>
	                        <td colspan="2" style="text-align: right;">
	                            <button id="btn_previous" type="button" class="btn_previous btn btn-secondary">이전</button>
	                            <button id="btn_modify" type="button" class="btn_register btn btn-warning">수정</button>
	                            <button id="btn_delete" type="button" class="btn_delete btn btn-danger" onclick="location='deleteTree.do?no=${vo.no}'">삭제</button>
	                        </td>
	                    </tr>
	                </tbody>
	            </table>
	        </form>
        </div>
        
        

       </div>  
            
    <br>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
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
    
    
    
    //이전 버튼 이벤트
    //5개의 인자값을 가지고 이동 testList.do
    //무조건 이전페이지 범위의 가장 앞 페이지로 이동
    function fn_prev(page, range, rangeSize, listSize, searchType, keyword) {
            
        var page = ((range - 2) * rangeSize) + 1;
        var range = range - 1;
            
        var url = "/treeList.do";
        url += "?page=" + page;
        url += "&range=" + range;
        url += "&listSize=" + listSize;
        url += "&searchType=" + searchType;
        url += "&keyword=" + keyword;
        location.href = url;
        }
 
 
    //페이지 번호 클릭
    function fn_pagination(page, range, rangeSize, listSize, searchType, keyword) {
 
        var url = "/treeList.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword; 
 
            location.href = url;    
        }
 
    //다음 버튼 이벤트
    //다음 페이지 범위의 가장 앞 페이지로 이동
    function fn_next(page, range, rangeSize, listSize, searchType, keyword) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;            
        var url = "/treeList.do";
            url += "?page=" + page;
            url += "&range=" + range;
            url += "&listSize=" + listSize;
            url += "&searchType=" + searchType;
            url += "&keyword=" + keyword;
            location.href = url;
        }
        
    // 검색
    $(document).on('click', '#btnSearch', function(e){
        e.preventDefault();
        var url = "/treeList.do";
        url += "?searchType=" + $('#searchType').val();
        url += "&keyword=" + $('#keyword').val();
        location.href = url;
        console.log(url);
 
    });  
    
    
    //글쓰기
    $(document).on('click', '#btn_register', function(e) {
        $("#form_tree").submit();
    });
    
    
    $(document).on('click', '#btn_modify', function(e) {
        if (confirm("정말 수정하시겠습니까 ?") == true) {
            $("#viewDetail").submit();
        } else {
            return;
        }
    });
    

    
    $("#filedelete").click(function deletefile() {
        $('#filename').val(null);
 
    });
    

    
    
 
    </script>
</html>
