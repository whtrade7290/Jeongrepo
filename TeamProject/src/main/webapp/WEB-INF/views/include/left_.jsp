<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/notice.css">
</head>
<body>
   <div id="snb" class="snb_cc">
      <h2 class="tit_snb">고객센터</h2>
      <div class="inner_snb">
         <ul class="list_menu">
            <li class="on"><a href="/userBoard/jnotice">공지사항</a></li>
            <li><a href="/userBoard/jservice">자주하는 질문</a></li>
            <li><a href="/userBoard/OneByOne" onclick="OneByOne(event)">1:1 문의</a></li>
         </ul>
      </div>
   </div>
</body>
<script>
function OneByOne(event) {
   var id ='<%=(String)session.getAttribute("id")%>';
   console.log('id = ' + id);
   
   if (id == 'null') {
      event.preventDefault();
      alert("로그인 후 사용가능합니다.");
      location.href="/member/login";
   }   
}
</script>
</html>