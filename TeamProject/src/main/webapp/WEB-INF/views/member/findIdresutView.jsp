<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">



</head>
<style>

        .idBox{
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
<body>


<div class="idBox">
        <div class="messageBox">
           <div class="titleBox">
              <h3>아이디 찾기</h3>
               <div class="laterBox">
                 <i class="far fa-user"></i>    
                 </div>
                 <div class="textBox">
                    찾으시는 아이디는 [${ id }]입니다.<br><br>
                    감사합니다.
                 </div>
           </div>

           
        </div>
    </div>

   


   <%-- footer 영역 --%>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />

</body>
</html>