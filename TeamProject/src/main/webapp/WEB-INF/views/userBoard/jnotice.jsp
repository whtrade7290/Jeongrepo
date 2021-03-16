<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/notice.css">
</head>
<body>
   <div id="main">
      <div id="content">
         <div class="page_aticle aticle_type2">
            <jsp:include page="/WEB-INF/views/include/left_.jsp" />
            <div class="page_section">
               <div class="head_aticle">
                  <h2 class="tit">
                     공지사항 <span class="tit_sub">졸리 스또</span>
                  </h2>
               </div>
               <form name="frmList" action="#" onsubmit="">
                  <table width="100%" align="center" cellpadding="0" cellspacing="0">
                     <tbody>
                        <tr>
                           <td>
                              <div
                                 class="xans-element- xans-myshop xans-myshop-couponserial ">
                                 <table width="100%" class="xans-board-listheader jh"
                                    cellpadding="0" cellspacing="0" id="jnotice">
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
                                                      <a href="/userBoard/jcontent?num=${ jnotice.num }&pageNum=${ pageNum }">${ jnotice.title }</a>
                                                   </td>
                                                   <td width="100" align="center">${ jnotice.id }</td>
                                                   <td width="100" align="center" class="eng2"><fmt:formatDate
                                                         value="${ jnotice.regDate }" pattern="yyyy.MM.dd" /></td>
                                                   <td width="30" align="center" class="eng2">${ jnotice.readcount }</td>
                                                </tr>
                                             </c:forEach>
                                          </c:when>
                                          <c:otherwise>
                                             <td class="no_data" style="padding: 150px 0 148px; border-top: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; font-size: 12px; color: #4c4c4c">
                                    검색한 공지가 존재하지 않습니다.
                                 </td>
                                          </c:otherwise>
                                       </c:choose>
                                    </tbody>
                                 </table>
                              </div>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <div>
                     <%-- 글갯수가 0보다 크면 페이지블록 계산해서 출력하기 --%>
                     <c:if test="${ pageDto.count gt 0 }">
                        <%-- 이전 --%>
                        <c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
                           <a
                              href="/userBoard/jnotice?pageNum=${ pageDto.startPage - pageDto.pageBlock }&category=${ pageDto.category }&search=${ pageDto.search }">이전</a>
                        </c:if>

                        <%-- 시작페이지 ~ 끝페이지 --%>
                        <c:forEach var="i" begin="${ pageDto.startPage }"
                           end="${ pageDto.endPage }" step="1">
                           <c:choose>
                              <c:when test="${ i eq pageNum }">
                                 <a
                                    href="/userBoard/jnotice?pageNum=${ i }&category=${ pageDto.category }&search=${ pageDto.search }"
                                    class="active">[${ i }]</a>
                              </c:when>
                              <c:otherwise>
                                 <a
                                    href="/userBoard/jnotice?pageNum=${ i }&category=${ pageDto.category }&search=${ pageDto.search }">[${ i }]</a>
                              </c:otherwise>
                           </c:choose>
                        </c:forEach>

                        <%-- 다음 --%>
                        <c:if test="${ pageDto.endPage lt pageDto.pageCount }">
                           <a
                              href="/userBoard/jnotice?pageNum=${ pageDto.startPage + pageDto.pageBlock }&category=${ pageDto.category }&search=${ pageDto.search }">[다음]</a>
                        </c:if>
                     </c:if>
                  </div>

                  <div id="table_search">
                     <form action="/userBoard/jnotice" method="get">
                        <select name="category">
                           <option value="title" ${ pageDto.category eq 'title' ? 'selected' : '' }>글제목</option>
                           <option value="content" ${ pageDto.category eq 'content' ? 'selected' : '' }>글내용</option>
                           <option value="id" ${ pageDto.category eq 'id' ? 'selected' : '' }>작성자ID</option>
                        </select> 
                        <input type="text" class="input_box" name="search" value="${ pageDto.search }"> 
                        <input type="submit" value="검색" class="btn">

                        <%-- 로그인 했을때만 [글쓰기] 버튼 보이기 --%>
                        <c:if test="${ sessionScope.id eq 'admin' }">
                           <input type="button" value="공지쓰기" class="btn"
                              onclick="location.href='/userBoard/jnoticeWrite?pageNum=${ pageNum }'">
                        </c:if>
                     </form>
                  </div>
               </form>
            </div>
         </div>

      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>