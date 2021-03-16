<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JollyStore</title>
<link rel="stylesheet" href="/css/jcontent.css">
</head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<body>
   <div class="tit_page">
      <h2 class="tit">공지사항</h2>
      <p class="sub">비밀공간</p>
   </div>
   <div id="main">
      <div id="content">
         <div class="layout-wrapper">
            <div class="xans-element- xans-myshop xans-myshop-couponserial ">
               <table width="100%" align="center" cellpadding="0" cellspacing="0">
                  <tbody>
                     <tr>
                        <td>
                           <table width="100%">
                              <tbody>
                                 <tr>
                                    <td>
                                       <table class="boardView" width="100%" id="jnotice">
                                          <tbody>
                                             <tr>
                                                <th scope="row" style="border: none;">제목</th>
                                                <td>${ jnoticeVo.title }</td>
                                             </tr>
                                             <tr>
                                                <th scope="row">작성자</th>
                                                <td>${ jnoticeVo.id }</td>
                                             </tr>
                                             <tr class="etcArea">
                                                <td colspan="2">
                                                   <ul>
                                                      <li class="date "><strong class="th">작성일</strong>
                                                         <span class="td"><fmt:formatDate
                                                               value="${ jnoticeVo.regDate }" pattern="yyyy.MM.dd" /></span></li>
                                                      <li class="hit "><strong class="th">조회수</strong>
                                                         <span class="td">${ jnoticeVo.readcount }</span></li>
                                                   </ul>
                                                </td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td align="right" class="eng" style="padding: 5px;"></td>
                                 </tr>
                                 <tr>
                                    <td style="padding: 10px;" height="200" valign="top"
                                       id="contents">
                                       <table width="100%" style="table-layout: fixed">
                                          <tbody>
                                             <tr>
                                                <!-- 공지 내용 -->
                                                <td class="board_view_content"
                                                   style="word-wrap: break-word; word-break: break-all"
                                                   id="contents_820" valign="top">${ jnoticeVo.content }</td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                                 <tr>
                                    <td height="1" bgcolor="#f4f4f4"></td>
                                 </tr>
                              </tbody>
                           </table> <br>
                           <table width="100%" style="table-layout: fixed" cellpadding="0"
                              cellspacing="0">
                              <tbody>
                                 <tr>
                                    <td align="center" style="padding-top: 10px;">
                                       <table width="100%">
                                          <tbody>
                                             <c:if test="${ not empty sessionScope.id }">
                                                <tr>
                                                   <td align="right"><input type="button"
                                                      value="공지삭제" class="bhs_button yb"
                                                      style="float: none;" onclick="remove()"></td>
                                                </tr>
                                                <tr>
                                                   <td align="right"><input type="button"
                                                      value="공지수정" class="bhs_button yb"
                                                      style="float: none;"
                                                      onclick="location.href= '/userBoard/jnoticeModifyForm?num=${ jnoticeVo.num }&pageNum=${ pageNum }'">
                                                   </td>
                                                </tr>
                                             </c:if>
                                             <tr>
                                                <!-- 목록 -->
                                                <td align="right"><a
                                                   href="/userBoard/jnotice?pageNum=${ pageNum }"><span
                                                      class="bhs_button yb" style="float: none;">목록</span></a></td>
                                             </tr>
                                          </tbody>
                                       </table>
                                    </td>
                                 </tr>
                              </tbody>
                           </table>
                           <div
                              class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
                              <ul>
                                 
                                 <br>
                                 <table width="100%" cellpadding="5" cellspacing="0">
                                    <colgroup>
                                       <col width="100" align="right" bgcolor="#f7f7f7"
                                          style="padding-right: 10px">
                                       <col style="padding-left: 10px">
                                    </colgroup>
                                 </table>
                              </ul>
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
   <script>
      function remove() {
         var result = confirm('정말 삭제하시겠습니까?');
         console.log(typeof result);

         if (result == false) {
            return;
         }

         location.href = '/userBoard/delete?num=${ jnoticeVo.num }&pageNum=${ pageNum }';
      }

   </script>
</body>
</html>