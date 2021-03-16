<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JollyStore</title>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<link rel="stylesheet" href="/css/OneByOneWriteForm.css">
</head>
<body>
   <div id="main">
      <div id="content">
         <div class="page_aticle aticle_type2">
            <jsp:include page="/WEB-INF/views/include/left_.jsp" />
            <div class="page_section section_qna">
               <div class="head_aticle">
                  <h2 class="tit">1:1 문의 쓰기</h2>
               </div>

               <div class="xans-board-write">
                  <form name="fm" id="fm" method="post" action="/userBoard/OneByOneWriteForm" enctype="multipart/form-data"
                     style="height: 100%;">
                     <input type="hidden" name="mode" value="add_qna"> 
                     <input type="hidden" name="itemcd" value=""> 
                     <input type="hidden" name="sno" value="0">
                     <input type="hidden" name="id" value="${ id }">
                     <table id="table_after" class="boardWrite2" width="100%">
                        <colgroup>
                           <col width="14%" align="right">
                        </colgroup>
                        <tbody>
                           <tr>
                              <th class="input_txt">제목</th>
                              <td>
                                 <select name="category" required label="질문유형" class="select">
                                       <option value="">선택해주세요.</option>
                                       <option value="배송지연/불만">배송지연/불만</option>
                                       <option value="졸리패스 (무료배송)">졸리패스 (무료배송)</option>
                                       <option value="반품문의">반품문의</option>
                                       <option value="A/S문의">A/S문의</option>
                                       <option value="환불문의">환불문의</option>
                                       <option value="주문결제문의">주문결제문의</option>
                                       <option value="회원정보문의">회원정보문의</option>
                                       <option value="취소문의">취소문의</option>
                                       <option value="교환문의">교환문의</option>
                                       <option value="상품정보문의">상품정보문의</option>
                                       <option value="기타문의">기타문의</option>
                                 </select><br> 
                                 <input type="text" name="title" style="width: 100%" required label="제목" value="">
                              </td>
                           </tr>
                              <tr>
                                 <th class="input_txt">이메일</th>
                                 <td>
                                    <input type="text" name="email" value="${ memberVo.email }" size="26" readonly="readonly" class="read_only"> 
                                    <span class="noline smalle" style="padding-left: 10px">
                                       <input type="checkbox" name="emailchk">
                                       <span style="font-size: 8pt;">답변수신을 이메일로 받겠습니다.</span>
                                    </span>
                                 </td>
                              </tr>
                              <tr>
                                 <th class="input_txt">문자메시지</th>
                                 <td>
                                 <input type="text" name="tel" value="${ memberVo.tel }" readonly="readonly" class="read_only">
                                    <span class="noline smalle" style="padding-left: 10px">
                                       <input type="checkbox" name="telchk">
                                       <span style="font-size: 8pt;">답변수신을 문자메시지로 받겠습니다.</span>
                                    </span>
                                 </td>
                              </tr>
                           
                           <tr>
                              <th class="input_txt">내용</th>
                              <td class="edit_area" style="position: relative;">
                                 <div id="qnaNotice">
                                    <div class="inner_qnaNotice">
                                       <div class="notice_qna">
                                          <strong class="tit qna_public">1:1 문의 작성 전 확인해주세요!</strong>

                                          <dl class="list qna_public">
                                             <dd>현재 문의량이 많아 답변이 지연되고 있습니다. 문의 남겨 주시면 2일 이내 순차적으로
                                                답변 드리겠습니다.</dd>
                                          </dl>

                                          <dl class="list qna_public">
                                             <dt>반품 / 환불</dt>
                                             <dd>
                                                <span>제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인
                                                   내용을 남겨주세요.</span>
                                             </dd>
                                          </dl>

                                          <dl class="list" id="branchByVersion15">
                                             <dt>주문취소</dt>
                                             <dd class="old" style="display: none">
                                                <!-- 구버전 분기처리 -->
                                                <span>샛별 지역 : 배송일 전날 19시까지 <br> 택배 지역 : 배송일
                                                   전날 18시까지 <br> 고객행복센터(1644-1107)/ 1:1문의 게시판/
                                                   카카오톡(졸리) 으로 취소 요청 바랍니다.
                                                </span> <span>생산이 시작된 이후에는 취소가 불가능 한 점 고객님의 양해 부탁드립니다.</span> 
                                                <span>일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> 
                                                <span>주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span> 
                                                <span>비회원 주문건의 경우 1:1문의 게시판 접수가 불가하기에 고객행복센터(1644-1107), 카카오톡(졸리) 로 취소
                                                   요청 부탁드립니다.</span>
                                             </dd>
                                             <dd class="new">
                                                <span> 배송 단계별로 주문취소 방법이 상이합니다. <br> [입금확인]
                                                   단계 : [졸리 &gt; 주문내역 상세페이지] 에서 직접 취소 가능 <br>
                                                   [입금확인] 이후 단계 : 고객행복센터로 문의
                                                </span> 
                                                <br> 
                                                <span>생산이 시작된 [상품 준비중] 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.</span>
                                                 <span>비회원은 모바일 App 또는 모바일 웹사이트에서 [졸리 &gt; 비회원 주문 조회 페이지] 에서 취소가 가능합니다.</span>
                                                  <span>일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> 
                                                  <span>주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span>
                                             </dd>
                                          </dl>

                                          <dl class="list">
                                             <dt>배송</dt>
                                             <dd>
                                                <span>주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.</span> <span>배송일
                                                   및 배송시간 지정은 불가능합니다. (예약배송 포함)</span>
                                                <p class="info">※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가 문의
                                                   내용에 저장되지 않도록 주의해 주시기 바랍니다.</p>
                                             </dd>
                                          </dl>
                                       </div>
                                    </div>
                                 </div> 
                                 <textarea name="content" style="width: 100%; height: 474px;" class="editing_area"
                                    required label="내용">
                                 </textarea>
                              </td>
                           </tr>
                           <tr>
                              <th scope="col" class="ttitle">파일</th>
                              <td class="left">
                                 <input type="button" value="첨부파일 추가" id="btnAddFile" class="btn">
                                 <div id="fileBox">
                                    <div>
                                       <input type="file" name="filename">
                                       <span class="file-delete" style="border: 1px solid gray; cursor: pointer;">파일추가 취소</span>
                                    </div>
                                 </div>
                              </td>
                           </tr>

                        </tbody>
                     </table>

                     <table width="100%">
                        <tbody>
                           <tr>
                              <td align="right" style="padding-top: 5px; border: none;" id="avoidDbl">
                                 <input type="submit" class="bhs_button yb" value="저장" style="float: none;">
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </form>
               </div>

            </div>
         </div>
      </div>
   </div>
<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
<script>
let fileCount = 1;

// 정적 이벤트 연결
$('#btnAddFile').on('click', function () {
   if (fileCount >= 5) {
      alert('첨부파일은 최대 5개 까지만 첨부할 수 있습니다.');
      return;
   }
   
   let str = `
      <div>
         <input type="file" name="filename">
         <span class="file-delete" style="border: 1px solid gray; cursor: pointer;">파일추가 취소</span>
      </div>
   `;

   $('#fileBox').append(str);

   fileCount++;
});


// 동적 이벤트 연결 (이벤트 등록을 위임하는 방식)
$('div#fileBox').on('click', 'span.file-delete', function () {
   //alert('span X 클릭됨');

   //$(this).closest('div').remove();
   $(this).parent().remove();
   
   fileCount--;
});
</script>
</body>
</html>