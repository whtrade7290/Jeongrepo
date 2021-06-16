<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">


<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
   for (Cookie cookie : cookies) {
      if (cookie.getName().equals("id")) {
         String id = cookie.getValue();
         
         // 로그인 인증 처리(세션에 id값 추가)
         session.setAttribute("id", id);
      }
   }
}

String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/header.css">
<title>JollyStore</title>

<script src="https://kit.fontawesome.com/d6fd3b6ecc.js"
   crossorigin="anonymous"></script>
<link rel="shortcut icon" href="/images/jolly-pavi.png">
</head>


<body>
   <header>
      <div id="header">
         <div id="userMenu">
            <ul class="list_menu">
               <li class="menu none_sub menu_join">
                 <c:choose>
                      <c:when test="${ sessionScope.name ne null }">
                            <span class="ico6">웰컴</span> <a href="#"
                           class="link_menu">${ sessionScope.name } 님▼</a>
                           <ul class="sub">
                        <li><a href="/consumerBoard/cboard?id=${id}">주문내역</a></li>
                              <li><a href="/consumerBoard/shipping">배송지관리</a></li>
<!--                               <li><a href="/consumerBoard/alwaysLiving">늘 사는것</a></li> -->
<!--                               <li><a href="/consumerBoard/goodsReview">상품 후기 </a></li> -->
<!--                               <li><a href="/consumerBoard/savings">적립금</a></li> -->
<!--                               <li><a href="/consumerBoard/coupon">쿠폰</a></li> -->
                              <li><a href="/consumerBoard/memberUpdate">개인 정보 수정</a></li>
                        <li><a href="/member/logout">로그아웃</a></li>
                     </ul> 
                   </c:when>
                   <c:otherwise>
                     <a href="/member/joinView" class="link_menu">회원가입</a>
                     <li class="menu none_sub">
                        <a href="/member/login" class="link_menu">로그인</a>
                     </li>
                   </c:otherwise>
               </c:choose>      




               <li class="menu lst"><a href="/userBoard/jnotice"
                  class="link_menu">고객센터▼</a>
                  <ul class="sub">
                     <li><a href="/userBoard/jnotice">공지사항</a></li>
                     <li><a href="/userBoard/jservice">자주하는 질문</a></li>
                     <li><a href="/userBoard/OneByOne" onclick="OneByOne(event)">1:1 문의</a></li>
                     <c:if test="${ sessionScope.id eq 'admin' }">
                        <li><a href="/goods/writer">관리자 모드</a> <!-- 로그인 만들면 수정 --></li>
                     </c:if>                     
                  </ul></li>
            </ul>
         </div>
         <div id="headerLogo" class="layout-wrapper">
            <h1 class="logo">
               <a href="/" class="link_main"> <span id="gnbLogoContainer"></span>
                  <img src="/images/jolly-main.png" alt="졸리스토어 로고"
                  style="display: block; margin-bottom: 40px; width: 200px; height: 200px;">
               </a>
            </h1>
         </div>
         <div id="gnb">
            <h2 class="screen_out">메뉴</h2>
            <div id="gnbMenu" style="margin-top: 100px;" class="gnb_kurly">
               <div class="inner_gnbkurly">
                  <div class="gnb_main">
                     <div class="gnb_mainul">
                        <ul class="gnb">
                           <li class="menu1">
                              <!-- <div class="dropdown"> --> <a href="#none"
                              style="width: 168px; padding-left: 19px;"> <span
                                 class="ico"></span> <span class="txt" onclick="location.href='/goods/newGoods?newGoods=X'">전체 카테고리</span></a>

                             <ul class="ksub_menu">
                                 <li><a href="/goods/goodsMainCategory?mainCategory=정육">정육</a>
                                    <ul class="kssub">
                                       <li><a href="/goods/goodsSubCategory?mainCategory=정육&subCategory=닭·오리고기">닭·오리고기</a></li>
                                       <li><a href="/goods/goodsSubCategory?mainCategory=정육&subCategory=돼지고기">돼지고기</a></li>
                                       <li><a href="/goods/goodsSubCategory?mainCategory=정육&subCategory=소고기">소고기</a></li>
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
                                    </ul></li>
                                 <li><a href="/goods/goodsMainCategory?mainCategory=채소">채소</a>
                                    <ul class="kssub">
                                       <li><a href="/goods/goodsSubCategory?mainCategory=채소&subCategory=고구마·감자·당근">고구마·감자·당근</a></li>
                                       <li><a href="/goods/goodsSubCategory?mainCategory=채소&subCategory=브로콜리·파프리카·양배추">브로콜리·파프리카·양배추</a></li>
                                       <li><a href="/goods/goodsSubCategory?mainCategory=채소&subCategory=오이·호박·고추">오이·호박·고추</a></li>
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
                                    </ul></li>
                                 <li><a href="/goods/goodsMainCategory?mainCategory=해산물">해산물</a>
                                    <ul class="kssub">
                                       <li><a href="/goods/goodsSubCategory?mainCategory=해산물&subCategory=건어물">건어물</a></li>
                                       <li><a href="/goods/goodsSubCategory?mainCategory=해산물&subCategory=생선류">생선류</a></li>
                                       <li><a href="/goods/goodsSubCategory?mainCategory=해산물&subCategory=해산물·조개류">해산물·조개류</a></li>
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
                                    </ul></li>
<!--                                  <li><a href="#">소금물</a> -->
<!--                                     <ul class="kssub"> -->
<!--                                        <li><a href="#">제품명4</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                     </ul></li> -->
<!--                                  <li><a href="#">뜨거운 맥주</a> -->
<!--                                     <ul class="kssub"> -->
<!--                                        <li><a href="#">제품명5</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                        <li><a href="#">제품명</a></li> -->
<!--                                     </ul></li> -->

                              </ul>

                           </li>
                           <li><a href="/goods/newGoods?newGoods=O" class="link new "> <span class="txt">신상품</span>
                           </a></li>
                           <li><a href="/goods/bestGoods?newGoods=B" class="link best "> <span class="txt">베스트</span>
                           </a></li>
                           <li><a href="/goods/getDiscountPriceGoods?newGoods=D" class="link bargain "> <span
                                 class="txt">알뜰쇼핑</span>
                           </a></li>
                           <li class="lst"><a href="/member/check" class="link event "> <span
                                 class="txt">금주혜택</span>
                           </a></li>
                        </ul>
                     </div>
                     <div id="side_search" class="gnb_search">
                        <form action="/goods/goodsSerch" method="get">
                           <input type="text" id="sword" name="serchGoods" v-model="searchBar"  class="inp_search"> 
                           <input type="image"   src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" v-on:click="searchBtn"
                              class="btn_search">
                              <input type="hidden" name="newGoods" value="S">
                           <div class="init">
                              <button type="button" id="searchInit" v-on:click="delText" class="btn_delete">검색어삭제하기</button>
                           </div>
                        </form>
                     </div>
                     <div class="cart_count">
                        <div class="inner_cartcount">
                           <a href="/member/cart?id=${ id }" class="btn_cart"> <span
                              class="screen_out">장바구니</span> <span id="cart_item_count"
                              class="num realtime_cartcount" style="display: none;"></span>
                           </a>
                        </div>
                        <div id="addMsgCart" class="msg_cart">
                           <span class="point"></span>
                           <div class="inner_msgcart">
                              <img src="https://res.kurly.com/images/common/bg_1_1.gif"
                                 alt="" class="thumb">
                              <p id="msgReaddedItem" class="desc">
                                 <span class="tit"></span> <span class="txt"> 장바구니에 상품을
                                    담았습니다. <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
                                 </span>
                              </p>
                           </div>
                        </div>
                     </div>
                     <div class="location_set">
                        <button type="button" class="btn_location on">배송지 설정하기</button>
<!--                         <div class="layer_location"> -->
<!--                            <div class="no_address"> -->
<!--                               <span class="emph">배송지를 등록</span>하고<br> 구매 가능한 상품을 확인하세요! -->
<!--                               <div class="group_button double"> -->
<!--                                  <button type="button" class="btn default login" onclick="location.href='/member/login'">로그인</button> -->
<!--                                  <button type="button" class="btn active searchAddress" onclick="DaumAddress()"> -->
<!--                                     <span class="ico"></span>주소검색 -->
<!--                                  </button> -->
<!--                               </div> -->
<!--                            </div> -->

<!--                         </div> -->
                     </div>
                  </div>
                  <div class="gnb_sub" style="display: none; width: 219px;">
                     <div class="inner_sub"></div>
                  </div>
               </div>

            </div>

         </div>
      </div>
   </header>
     
</body>
<script src="/script/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.5.17/dist/vue.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
new Vue({
      el: '#header',
      data: {
         searchBar:''
         
      },      
      watch:{
         searchBar: function() {

            let searchBar = this.searchBar;

            if(searchBar.length != 0) {
               $('#searchInit').css('opacity', '1');
            } else{
               $('#searchInit').css('opacity', '0');

            }
         } //searchBar
      }, // watch
      methods:{
         delText: function(){
            $('#sword').val('');
            $('#searchInit').css('opacity', '0');
         },
         searchBtn: function(){
            
         } 
        
      }
      
      
   })

</script>

<script>
function DaumAddress() {
    event.preventDefault(); // 스크롤바 이동 방지
    
    new daum.Postcode({
       oncomplete: function(data) {
         
       }   
    }).open();
          
 }
 
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
</html>