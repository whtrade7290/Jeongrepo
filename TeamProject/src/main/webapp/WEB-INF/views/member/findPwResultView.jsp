<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        .pwBox{
            display: flex;
            justify-content:space-around;
            align-items: center;
            width: auto;
            height: auto;
            margin: 50px;
        }

 .messageBox {
            color: black;
            width: 400px;
            height: 400px;
            margin: auto;
            font-size: 20px;
            text-align: center;
            
            display: flex;
            justify-content:space-around;
            align-items: center;
        }
 .titleBox{
       width: 800px;
        height: 300px;
        
 }
 .laterBox{
       margin: 20px;
       font-size: 60px;
       color: #ea97ad;
 }

    </style>
</head>
<body>
    <!-- 비밀번호는 <span id="test">${ pw }</span>입니다. -->
    <div class="pwBox">
        <div class="messageBox">
           <div class="titleBox">
              <h3>비밀번호 찾기</h3>
               <div class="laterBox">
                 <i class="fas fa-envelope-open-text"></i>       
                 </div>
                 <div class="textBox">
                    찾으시는 비밀번호는 [${ email }]로 발송 되었습니다.<br><br>
                    감사합니다.
                 </div>
           </div>

           
        </div>
    </div>

<script src="../js/jquery-3.5.1.js"></script>
<script src="https://kit.fontawesome.com/d6fd3b6ecc.js" crossorigin="anonymous"></script>
   <script>

   
      $(function() {

         let pw = '${pw}';
         let email = '${email}';

         $.ajax({
            url : '/mail/pwFindSend',
            data : {
               email : email,
               pw : pw
            },
            success : function(response) {

               console.log(typeof response);
               console.log(response);

            },

         }); // email 아작스

      });
   </script>
   <%--      footer 영역 --%>
<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

</body>
</html>