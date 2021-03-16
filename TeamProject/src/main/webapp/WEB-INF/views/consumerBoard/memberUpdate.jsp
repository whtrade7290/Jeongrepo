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
.JlineHeaderS{
   margin-top: 20px;
   font-weight: bold;
}


</style>
</head>
<body>
   <div id="main">
      <div id="content">
         <div class="page_aticle aticle_type2">
         
               <!-- 멤버 정보 -->
            <jsp:include page="/WEB-INF/views/include/memberInfo_.jsp" />
            
               <!-- 사이드메뉴  -->
            <jsp:include page="/WEB-INF/views/include/sideMenu_.jsp" />
            
            
            <div class="page_section">
               <div class="head_aticle Jline">
                  <h2 class="tit Jlineheader">
                     개인 정보 수정<br><br>
                     <h2 class="JlineHeaderS">비밀번호재확인</h2><br>
                     <span class="tit_sub">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</span>
                  </h2>
               </div>
               <form name="frmList" action="#" onsubmit="">
                  <input type="hidden" name="id" value="notice">
                  <table width="100%" align="center" cellpadding="0" cellspacing="0">
                     <tbody>
                        <tr>
                           <td>
                              <div
                                 class="xans-element- xans-myshop xans-myshop-couponserial ">
                                 <table width="100%" class="xans-board-listheader jh"
                                    cellpadding="0" cellspacing="0">
                                    <thead>
                                       <tr>
                                          <th>번호</th>
                                          <th>제목</th>
                                          <th>작성자</th>
                                          <th>작성일</th>
                                          <th>조회</th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <c:choose>
                                          <c:when test="${ not empty jnoticeList }">

                                             <c:forEach var="jnotice" items="${ jnoticeList }">
                                                <tr>
                                                   <td width="50" align="center">공지</td>
                                                   <td
                                                      style="padding-left: 10px; text-align: left; color: #999">
                                                      <a href="#"><b>${ jnotice.title }</b></a>

                                                   </td>
                                                   <td width="100" align="center">${ jnotice.id }</td>
                                                   <td width="100" align="center" class="eng2"><fmt:formatDate
                                                         value="${ jnotice.regDate }" pattern="yyyy.MM.dd" /></td>
                                                   <td width="30" align="center" class="eng2">${ jnotice.readcount }</td>
                                                </tr>
                                             </c:forEach>
                                          </c:when>
                                       </c:choose>
                                    </tbody>
                                 </table>
                              </div>
                           </td>
                        </tr>
                     </tbody>
                  </table>

               </form>
            </div>
         </div>

      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>