<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Board Write</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
    crossorigin="anonymous">
 
<!-- Optional theme -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
    integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
    crossorigin="anonymous">
 
<!-- Latest compiled and minified JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
    integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
    crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
</head>

<body>
<br/>
    <h1 class="text-center">Board Write</h1>
<br/>
<br/>
<div class="container">
        <form id="form_code" action="insertCode.do" method="post"
            encType="multiplart/form-data">
            <table class="table table-bordered">
                <tbody>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" placeholder="코드를 입력하세요."
                            name="type_code" class="form-control" /></td>
                        <th>내용</th>
                        <td><input type="text" placeholder="내용을 입력하세요 ."
                            name="type_cont" class="form-control" /></td>
                    </tr>
                    <!-- <tr>
                        
                    </tr> -->
                    <tr>
                        <td colspan="2">
                            <button id="btn_register" type="button" class="btn_register">등록</button>
                            <button id="btn_previous" type="button" class="btn_previous">이전</button>
                    </tr>
 
                </tbody>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript">
    //글쓰기
    $(document).on('click', '#btn_register', function(e) {
        $("#form_code").submit();
    });
 
    //이전 클릭 시 codeList로 이동
    $("#btn_previous").click(function previous() {
        $(location).attr('href', 'codeList.do');
 
    });
</script>
</html>