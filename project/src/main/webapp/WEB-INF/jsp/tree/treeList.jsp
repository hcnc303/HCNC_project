<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board List</title>
<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
    crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style type="text/css">
a {
    text-decoration: auto;
}
.row>*{
    width:auto;
}
</style>
</head>
<body>
    <br />
    <h1 class="text-center">Board List</h1>
    <br />
    <br />
    <div class="container">
        <table class="table table-hover table-striped text-center"
            style="border: 1px solid;">
            <colgroup>
                <col width="20%" />
                <col width="20%" />
                <col width="40%" />
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
                        <td><a href="treeDetail.do?no=${result.no}">${result.title}</a></td>
                        <td>${result.edate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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
        <hr />
        
        <a class="btn btn-outline-info" style="float: right" href="treeRegister.do">글쓰기</a>
 
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
    
    </div>
    <br>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
 
    <script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"
        integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU"
        crossorigin="anonymous"></script>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"
        integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj"
        crossorigin="anonymous"></script>
</body>
    <script type="text/javascript">
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
 
    </script>
</html>
