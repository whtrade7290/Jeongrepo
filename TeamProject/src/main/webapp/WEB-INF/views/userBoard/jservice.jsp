<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="utf-8">

<head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/jservice.css">
</head>
<body>
   <div id="main">
      <div id="content">
         <div class="page_aticle aticle_type2">
            <jsp:include page="/WEB-INF/views/include/left_.jsp" />
            <div class="page_section">
               <div class="head_aticle">
                  <h2 class="tit">
                     자주하는 질문 <span class="tit_sub">고객님들께서 가장 자주하시는 질문을 모두
                        모았습니다.</span>
                  </h2>
               </div>

               <div class="xans-element- xans-myshop xans-myshop-couponserial ">
                  <table width="100%" class="xans-board-listheader">
                     <tbody>
                        <tr>
                           <th width="70" class="input_txt">번호</th>
                           <th width="135" class="input_txt">카테고리</th>
                           <th class="input_txt">제목</th>
                        </tr>
                     </tbody>
                  </table>
                  <div id="app">
                     <div>
                        <c:choose>
                           <c:when test="${ not empty jquestionList }">
                              <c:forEach var="jquestion" items="${ jquestionList }" varStatus="roop">
                                 <table width="100%" class="table_faq" id="faq_7">
                                    <tbody>
                                       <tr>
                                          <td width="70" align="center">${ jquestion.num }</td>
                                          <td width="135" align="center">${ jquestion.category }</td>
                                             <td style="cursor: pointer" onclick="toggleServiceList(${roop.index});">${ jquestion.title }
                                          </td>
                                       </tr>
                                       <!-- 자주하는 질문 토글  -->
                                    </tbody>
                                 </table>
                                 <div name="toggleServiceView" id="toggleServiceView" style="display: none; padding: 30px; border-top: 1px solid rgb(230, 230, 230);">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                       <tbody>
                                          <tr valign="top">
                                             <th style="color: #0000bf; width: 40px; padding-top: 1px;"></th>
                                             <td>
                                                A : ${ jquestion.content }
                                             </td>
                                             <ul style="float: right">
                                                <li style="border: 1px solid gray; margin-bottom: 5px; width: 30px"><input style="cursor: pointer;" type="text" readonly="readonly" value="수정" onclick="location.href='/userBoard/jnoticeModifyForm?num=${ jnoticeVo.num }&pageNum=${ pageNum }'"></li> 
                                                <li style="border: 1px solid gray; width: 30px"><input type="text" style="cursor: pointer;" readonly="readonly" value="삭제" onclick="remove()"></li>
                                             </ul>
                                          </tr>
                                       </tbody>
                                    </table>
                                 </div>
                              </c:forEach>
                           </c:when>
                           <c:otherwise>
                               <td style="padding: 150px 0 148px; border-top: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; font-size: 12px; color: #4c4c4c">
                                 검색한 질문이 존재하지 않습니다.
                              </td>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
               </div>
               <div style="padding: 1px; border-top: 1px solid #e6e6e6"></div>

               <table class="xans-board-search xans-board-search2">
                  <tbody>
                     <div>
                        <%-- 글갯수가 0보다 크면 페이지블록 계산해서 출력하기 --%>
                        <c:if test="${ pageDto.count gt 0 }">
                           <%-- 이전 --%>
                           <c:if test="${ pageDto.startPage gt pageDto.pageBlock }">
                              <a href="/userBoard/jservice?pageNum=${ pageDto.startPage - pageDto.pageBlock }&category=${ pageDto.category }&search=${ pageDto.search }">이전</a>
                           </c:if>

                           <%-- 시작페이지 ~ 끝페이지 --%>
                           <c:forEach var="i" begin="${ pageDto.startPage }"
                              end="${ pageDto.endPage }" step="1">
                              <c:choose>
                                 <c:when test="${ i eq pageNum }">
                                    <a href="/userBoard/jservice?pageNum=${ i }&category=${ pageDto.category }&search=${ pageDto.search }"
                                       class="active">[${ i }]</a>
                                 </c:when>
                                 <c:otherwise>
                                    <a href="/userBoard/jservice?pageNum=${ i }&category=${ pageDto.category }&search=${ pageDto.search }">[${ i }]</a>
                                 </c:otherwise>
                              </c:choose>
                           </c:forEach>

                           <%-- 다음 --%>
                           <c:if test="${ pageDto.endPage lt pageDto.pageCount }">
                              <a href="/userBoard/jservice?pageNum=${ pageDto.startPage + pageDto.pageBlock }&category=${ pageDto.category }&search=${ pageDto.search }">[다음]</a>
                           </c:if>
                        </c:if>
                     </div>
                     <div id="table_search">
                        <form action="/userBoard/jservice" method="get">
                           <select name="category">
                              <option value="category"
                                 ${ pageDto.category eq 'category' ? 'selected' : '' }>카테고리</option>
                              <option value="title"
                                 ${ pageDto.category eq 'title' ? 'selected' : '' }>제목</option>
                           </select> <input type="text" class="input_box" name="search"
                              value="${ pageDto.search }"> <input type="submit"
                              value="검색" class="btn">

                           <%-- 로그인 했을때만 [글쓰기] 버튼 보이기 --%>
                           <c:if test="${ sessionScope.id eq 'admin' }">
                              <input type="button" value="질문쓰기" class="btn"
                                 onclick="location.href='/userBoard/jserviceWriteForm?pageNum=${ pageNum }'">
                           </c:if>
                        </form>
                     </div>
                  </tbody>
               </table>
            </div>
         </div>
         
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp"/>
   <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
<script src="/script/jquery-3.5.1.js"></script>
<script>

   function toggleServiceList(index) {
      $("[name='toggleServiceView']:eq("+index+")").toggle();

   }

   function remove() {
      var result = confirm('정말 삭제하시겠습니까?');
      console.log(typeof result);

      if (result == false) {
         return;
      }

      location.href = '/userBoard/jserviceDelete?num=${ jquestion.num }';
   }

//    $("[name='toggleServiceView']:eq("+index+")").toggle();
      

</script>
</body>
</html>