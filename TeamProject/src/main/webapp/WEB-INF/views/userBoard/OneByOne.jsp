<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JollyStore</title>
</head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<link rel="stylesheet" href="/css/OneByOne.css">

<body>
   <div id="main">
      <div id="content">
         <div class="page_aticle aticle_type2">
            <jsp:include page="/WEB-INF/views/include/left_.jsp"/>
            <div class="page_section section_qna">
               <div class="head_aticle">
                  <h2 class="tit">1:1 문의</h2>
               </div>
               <table class="xans-board-listheader" width="100%">
                  <tbody>
                     <tr class="input_txt">
                        <th width="8%">번호</th>
                        <th width="15%">카테고리</th>
                        <th>제목</th>
                        <th width="12%">작성자</th>
                        <th width="12%">작성일</th>
                     </tr>
                  </tbody>
               </table>
               <c:choose>
               <c:when test="${ not empty oneNoticeList }">
               <c:forEach items="${ oneNoticeList }" var="oneNotice">
               <div class="mypage_wrap" style="float: none; width: 100%">
                  <table class="table_faq" width="100%">
                     <tbody>
                        <tr>
                           <td width="8%" align="center">${ oneNotice.num}</td>
                           <td width="15%" align="center" class="stxt"><b>${ oneNotice.category}</b></td>
                           <td style="padding-top: 5px; padding-bottom: 5px;">
                           <a href="/userBoard/OneByOneContent?num=${ oneNotice.num }&pageNum=${ pageNum }">
                              ${ oneNotice.title }</a>
                           </td>
                           <td width="12%" align="center">${ oneNotice.id }</td>
                           <td width="12%" align="center">
                           <fmt:formatDate value="${ oneNotice.regDate }" pattern="yyyy.MM.dd"/></td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               </c:forEach>
               </c:when>
               
               <c:otherwise>
                  <div class="no_data" style="padding: 150px 0 148px; border-top: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; font-size: 12px; color: #4c4c4c">
                     1:1 문의 내역이 존재하지 않습니다.
                  </div>
               </c:otherwise>
               </c:choose>
               <c:if test="${ pageDto.count gt 0 }">
                  <%-- [이전] --%>
                  <c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
                     <a href="/userBoard/OneByOne?pageNum=${ pageDto.startPage - pageDto.pageBlock }&category=${ pageDto.category }&search=${ pageDto.search }">[이전]</a>
                  </c:if>
                  
                  <%-- 시작페이지 ~ 끝페이지 --%>
                  <c:forEach var="i" begin="${ pageDto.startPage }" end="${ pageDto.endPage }" step="1">
                     
                     <c:choose>
                     <c:when test="${ i eq pageNum }">
                        <a href="/userBoard/OneByOne?pageNum=${ i }&category=${ pageDto.category }&search=${ pageDto.search }" class="active">[${ i }]</a>
                     </c:when>
                     <c:otherwise>
                        <a href="/userBoard/OneByOne?pageNum=${ i }&category=${ pageDto.category }&search=${ pageDto.search }">[${ i }]</a>
                     </c:otherwise>
                     </c:choose>
                     
                  </c:forEach>
                  
                  <%-- [다음] --%>
                  <c:if test="${ pageDto.endPage lt pageDto.pageCount }">
                     <a href="/userBoard/OneByOne?pageNum=${ pageDto.startPage + pageDto.pageBlock }&category=${ pageDto.category }&search=${ pageDto.search }">[다음]</a>
                  </c:if>
               </c:if>

               <div id="table_search">
                        <%-- 로그인 했을때만 [문의쓰기] 버튼 보이기 --%>
                        <c:if test="${ not empty sessionScope.id }">
                           <input type="button" value="문의쓰기" class="btn"
                              onclick="location.href='/userBoard/OneByOneWriteForm'">
                        </c:if>
                  </div>
               <div class="layout-pagination">
                  <div class="pagediv"></div>
               </div>

            </div>
         </div>
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
<script src="/script/jquery-3.5.1.js"></script>
<script>
</script>
</html>