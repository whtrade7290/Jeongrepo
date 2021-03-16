<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<meta charset="EUC-KR">
<link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootStrap/kfonts2.css" rel="stylesheet">
<script src="/js/jquery-3.5.1.js"></script>
<script src="/js/bootstrap.min.js"></script>
</head>
<body>
	
	<div style="margin: 50px 0 30px 0px;">
		<h1 class="text-center" style="color: #ea97ad;">STORE JOLLY</h1>
		<h3 class="text-center" style="color: #333333;">회원가입하고, 할인혜택 받으세요!</h3>
	</div>
	
	
	<div class="container"> 

        <div id="carousel-example-generic" class="carousel slide">
            <!-- Indicators -->
            <ol class="carousel-indicators">
              <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>
                 <!-- Carousel items -->
             <div class="carousel-inner">
                <div class="item active">
                   <img src="/images/cimg1.png" alt="First slide">
                </div>
                <div class="item">
                   <img src="/images/cimg2.png" alt="Second slide">               
                </div>
                <div class="item">
                   <img src="/images/cimg3.png" alt="Third slide">                 
                </div>
                <div class="item">
                   <img src="/images/cimg4.png" alt="Fourth slide">                 
                </div>
             </div>
            <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
              </a>
          </div>
  </div>
	
	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
	<script>
      $('.carousel').carousel({ interval: 2500 })
    </script>
</body>
</html>