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
.new_address {
   position: relative;
}
.Jbtn {
   position: absolute;
   right: 3px;
   bottom: 7px;
   border: 0 none;
   background-color: #fff;
   font-weight: 700;
   font-size: 16px;
   color: #333;
   line-height: 24px;
   letter-spacing: -0.5px;
   text-align: right;
   outline: none;
}
.ico {
   margin-right: 2px;
   vertical-align: -2px;
   width: 15px;
   height: 15px;
}
.tbl {
   border-bottom: 1px solid #f4f4f4;
   width: 100%;
   border-collapse: collapse;
   border-spacing: 0;
}
.tblhead {
   display: table-header-group;
   vertical-align: middle;
   border-color: inherit;
}
.tblhead th {
   padding: 17px 0 20px;
   vertical-align: top;
   border-top: 2px solid #333;
   font-weight: 700;
   font-size: 14px;
   line-height: 20px;
   color: #333;
   letter-spacing: -.5px;
}
.tit_select {
   display: table-cell;
   width: 60px;
}
.tit_address {
   padding-left: 0;
   text-indent: -8px;
   width: auto;
}
.tit_receive {
   width: 120px;
}
.tit_phone {
   width: 100px;
}
.tit_delivery {
   width: 100px;
}
.tit_modify {
   width: 60px;
}
.tbl td {
   height: 90px;
   font-size: 14px;
   color: #333;
   line-height: 22px;
   letter-spacing: -0.4px;
   vertical-align: middle;
   text-align: center;
   padding: 0;
}
.tbl tr:first-child td {
   border-top: 1px solid #333;
}
.select {
   display: table-cell;
}
.type_radio {
   font-size: 14px;
   line-height: 22px;
}
.type_radio input[type="radio"] {
   position: absolute;
   z-index: -1;
   opacity: 0;
   font-weight: 400;
   letter-spacing: 0;
   box-sizing: border-box;
   padding: 0;
   color: #4c4c4c;
   font-size: 12px;
   max-width: 100%;
   margin: 0;
}
.tbl .type_radio input[type="radio"] + .C_ico {
   margin: 0;
   vertical-align: middle;
}
.type_radio input[type="radio"]:checked + .C_ico {
   background-image : url("images/plus.jpg");
   background-size: 24px 24px;
   background-repeat: no-repeat;
}
.type_radio input[type="radio"] + C.ico {
   display: inline-block;
   position: relative;
   width: 24px;
   border: 0 none;
   background-image: url("images/plus.jpg");
   background-size: 24px 24px;
}
.type_select .address {
   padding-left: 2px;
}
.tbl_type1 .address {
   padding: 20px 10px 20px 20px;
}
.badge_default {
   display: block;
   width: 74px;
   height: 22px;
   margin-bottom: 7px;
   border-radius: 11px;
   background-color: #f7f7f7;
   font-weight: 700;
   font-size: 12px;
   color: #666;
   line-height: 22px;
   letter-spacing: 0;
   text-align: center;
}
.addr {
   padding: 0;
   font-size: 16px;
   color: #333;
   line-height: 24px;
   letter-spacing: -0.3px;
   text-align: left;
}
.regular {
   color: #666;
}
.modify {
   width: 24px;
   height: 24px;
   border: 0 none;
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
                     배송지 관리 <span class="tit_sub">배송지에 따라 상품정보가 달라질 수 있습니다.</span>
                  </h2>
               </div>
               <div id="tblParent" class="type_select">
                  <table class="tbl tbl_type1">
                     <thead class="tblhead">
                        <tr>
                           <th class="tit_address">아이디</th>
                           <th class="tit_address">주소</th>
                           <th class="tit_receive">받으실 분</th>
                           <th class="tit_phone">연락처</th>
                        </tr>
                     </thead>
                     <tbody id="addrList">
                        <tr>
                           <td class="name">${ memberVo.id }</td>
                           <td class="address">
                              <span class="badge_default">기본 배송지</span>
                              <p class="addr">
                                 ${ memberVo.address }
                              </p>
                           </td>
                           <td class="name">${ memberVo.name }</td>
                           <td class="phone">${ memberVo.tel }</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>

      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>