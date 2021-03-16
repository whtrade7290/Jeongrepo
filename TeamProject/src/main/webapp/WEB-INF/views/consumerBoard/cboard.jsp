<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/notice.css">
<style type="text/css">
.mypage_top {
    width: 100%;
    padding: 50px 0;
    margin-bottom: -20px;
    background-color: #f7f7f7;
}
.page_aticle {
    width: 1050px;
    margin: 0 auto;
}
.mypage_top .mypagetop_user {
    overflow: hidden;
    width: 1050px;
    margin: 0 auto;
}
.page_aticle button, .page_aticle input, .page_aticle select, .page_aticle * {
    font-family: noto sans;
    font-weight: 400;
    letter-spacing: 0;
}
.mypage_top .inner_mypagetop {
    overflow: hidden;
    width: 100%;
    background: url(https://res.kurly.com/pc/service/common/1904/bg_mypagetop.png) repeat-y 0 0;
}
.mypage_top .grade_user {
    float: left;
    width: 444px;
    height: 100%;
    padding: 28px 0 30px 30px;
    background-color: #fff;
}
.mypage_top .grade_user .grade {
    overflow: hidden;
    width: 100%;
    padding-right: 26px;
}

.mypage_top .grade_user .class0 {
    border: 1px solid #ea97ad;
    background-color: #fff;
    color: #ea97ad;
}
.mypage_top .grade_user .ico_grade {
    float: left;
    width: 64px;
    height: 64px;
    margin: 2px 20px 0 0;
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    text-align: center;
    word-break: break-all;
}
.mypage_top .grade_bnenfit {
    overflow: hidden;
}
.mypage_top .grade_user .user {
    overflow: hidden;
    padding: 2px 0 14px;
}
.mypage_top .name {
    overflow: hidden;
    float: left;
    max-width: 263px;
    font-weight: 700;
    font-size: 20px;
    color: #333;
    line-height: 28px;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.mypage_top .txt {
    float: left;
    padding-left: 5px;
    font-size: 16px;
    line-height: 28px;
}
.mypage_top .grade_user .benefit {
    padding-top: 2px;
}
.mypage_top .benefit {
    font-size: 12px;
    line-height: 18px;
    color: #333;
}
.mypage_top .total_grade {
    width: 121px;
}
.mypage_top .benefit .tit {
    color: #ea97ad;
}
.mypage_top .next {
    overflow: hidden;
    width: 100%;
    padding: 22px 0 0 84px;
}
.mypage_top .next a {
    float: left;
    height: 30px;
    padding-top: 4px;
    margin-right: 10px;
    border: 1px solid #f4f4f3;
    border-radius: 15px;
    background-color: #f4f4f4;
    font-size: 14px;
    color: #333;
    line-height: 18px;
    text-align: center;
}
.mypage_top .next_month {
    width: 169px;
}
.mypage_top .list_mypage {
    float: right;
    width: 602px;
}
.mypage_top .list_mypage li {
    float: left;
    width: 198px;
    margin-right: 4px;
    background-color: #fff;
}
.mypage_top .list_mypage .link {
    float: left;
    width: 100%;
    padding: 29px 0 0 30px;
}
.mypage_top .list_mypage li {
    float: left;
    width: 198px;
    margin-right: 4px;
    background-color: #fff;
}
.mypage_top .list_mypage .tit {
    padding-bottom: 26px;
    font-size: 14px;
    line-height: 18px;
    color: #333;
}
.mypage_top .list_mypage .info {
    font-weight: 700;
    font-size: 20px;
    color: #ea97ad;
    line-height: 28px;
}
.mypage_top .list_mypage .info .date {
    display: block;
    padding-top: 12px;
    font-size: 12px;
    color: #999;
    line-height: 16px;
}
.mypage_top .list_mypage .user_kurlypass {
    margin-right: 0;
}
.mypage_top .bnr_event {
    display: block;
    overflow: hidden;
    width: 100%;
    height: 60px;
    margin-top: 20px;
    background-size: 1050px 60px;
    background-repeat: no-repeat;
    background-position: 50% 50%;
}

.Jline {
   margin-top: 20px;
}
.Jlineheader{
   font-weight: bold;
   font-size: 25px;
}


.JlineUl {
   padding-top: 10px;
   border-top: 2px solid #ea97ad;
}

.Jdate {
   padding-top: 20px;
   font-size: 16px;
   line-height: 24px;
   font-weight: 700;
   color: #666;
}

.Jgoods {
   position: relative;
   margin-top: 10px;
   padding: 0 20px;
   border: 1px solid #dddfe1;
}

.JgoodsName {
   padding: 20px 0 13px;
   border-bottom: 1px solid #dddfe1;
}
.Jgoodsname {
   display: block;
   overflow: hidden;
   /* background: url(""); */
   font-size: 16px;
   line-height: 24px;
   font-weight: 700;
   color: #000;
   cursor: pointer;
}
.order_info {
    overflow: hidden;
    padding: 14px 0 20px;
}
.goodsImg {
   float:left;
   width: 60px;
   margin-right: 20px;
}
.goodsImg img {
   width: 60px;
   height: auto;
}
.Jex {
   overflow: hidden;
   padding-top: 1px;
}
.order_info:first-child {
   padding-top: 3px;
}
.order_info dl {
   overflow: hidden;
}
.order_info dt {
   float: left;
   padding-right: 15px;
   font-size: 12px;
   color: #000;
   line-height: 20px;
}
.order_info dd {
   float: left;
   font-size: 14px;
   line-height: 20px;
   font-weight: 700;
   color: #000;
}
.order_info .order_end {
   color: #ea97ad;
}
.order_status {
   display: table;
   position: absolute;
   right: 20px;
   bottom: 0;
   height: 114px;
   vertical-align: middle;
}
.inner_status {
   display: table-cell;
   vertical-align: middle;
}
.order_status .link {
   display: block;
   width: 100px;
   height: 34px;
   border: 1px solid #ea97ad;
   background-color: #fff;
   font-size: 12px;
   color: #ea97ad;
   line-height: 32px;
   text-align: center;
   cursor: pointer;
}
</style>
</head>
<body>
   <div id="main">
      <div id="content">
         <div class="page_aticle aticle_type2">
         
            <!-- 멤버 정보 -->
            <jsp:include page="/WEB-INF/views/include/memberInfo_.jsp" />
            
            <!-- 사이드메뉴 -->
            <jsp:include page="/WEB-INF/views/include/sideMenu_.jsp" />
            
            <div class="page_section">
               <div class="head_aticle Jline">
                  <h2 class="tit Jlineheader">
                     주문내역 <span class="tit_sub">주문 내역을 확인하세요</span>
                  </h2>
               </div>
               
               <c:forEach var="orderDetailsVo" items="${ orderDetailsVos }">
                  
                  <div>
                     <ul class="JlineUl">
                        <li>
                           <div class="Jdate">
                              <fmt:formatDate value="${ orderDetailsVo.regDate }" type="both" dateStyle="long"/>
                           </div>
                           <div class="Jgoods">
                              <div class="JgoodsName">
                                 <a class="Jgoodsname" onclick="viewOrderDetail('${ id }', '${ orderDetailsVo.orderId }')">${ orderDetailsVo.orderDetailTitle }</a>
                              </div>
                              <div class="order_info">
   <!--                               <div class="goodsImg"> -->
   <!--                                  <img alt="상품이미지" src=""> -->
   <!--                               </div> -->
                                 <div class="Jex">
                                    <dl>
                                       <dt>주문번호</dt>
                                       <dd>${ orderDetailsVo.orderId }</dd>
                                    </dl>
                                    <dl>
                                       <dt>결제금액</dt>
                                       <dd>
                                          <fmt:formatNumber value="${ orderDetailsVo.totalPrice }" pattern="#,###원" />
                                       </dd>
                                    </dl>
                                 </div>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </div>
                  
               </c:forEach>
               
            </div>
         </div>

      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
   
   <script>
      function viewOrderDetail(id, orderId) {
           let url = "/member/orderDetail?id=" + id + "&orderId=" + orderId;
           let name = "popup test";
           let option = "width = 500, height = 500, top = 100, left = 200, location = no"
           window.open(url, name, option);
       }
   </script>
</body>
</html>