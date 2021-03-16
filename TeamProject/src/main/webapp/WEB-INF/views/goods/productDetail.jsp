<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootStrap/kfonts2.css" rel="stylesheet">
<title>Jolly</title>
</head>
<body style="padding: 0px 200px;">
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
   <!-- Include all compiled plugins (below), or include individual files as needed -->
   <script src="/js/bootstrap.min.js"></script>

   <script>
        function fnMove(seq) {
            var offset = $("#t" + seq).offset();
            $('html, body').animate({ scrollTop: offset.top }, 400);
        }
    </script>

   <div class="row" style="min-width: 1300px;">
      <div class="col-lg-5">
         <c:if test="${ not empty attachList }">
            <c:forEach var="attach" items="${ attachList }">
               <c:choose>
                  <c:when test="${ attach.image eq 'I' }">
                     <c:choose>
                        <c:when test="${ attach.main eq 'O' }">
                           <img src="/upload/${ attach.uploadpath }/${ attach.uuid }_${ attach.filename1 }"
                           style="width: 500px; height: 650px; object-fit: cover;" alt="">
                        </c:when>
                     </c:choose>
                  </c:when>
               </c:choose>
            </c:forEach>
         </c:if>
      </div>
      <div class="col-lg-7">
         <table class="table" id="y_product_table">
            <tr>
               <th scope="col" colspan="2"><span style="font-size: 32px;">${ goodsVo.goodsName }</span><br>
                  <span style="color: #999; font-size: 16px;">${ goodsVo.subGoods }</span><br>
               <br> <span id="salePrice" style="font-size: 34px;">
                     <c:choose>
                        <c:when test="${ goodsVo.originPrice > 0 }">
                           <fmt:formatNumber pattern="#,###" value="${ goodsVo.originPrice }" />
                        </c:when>
                        <c:otherwise>
                           <fmt:formatNumber pattern="#,###" value="${ goodsVo.salePrice }" />
                        </c:otherwise>
                     </c:choose>
                  </span>
               <span style="font-size: 20px;">원</span><br><br>
               <div id="discountDiv">
                  <span style="font-size: 45px; color:#333333;">
                     <fmt:formatNumber pattern="#,###" value="${ goodsVo.salePrice }" />
                  </span>
                  <span style="font-size: 20px; padding-right: 30px;">원</span>
                  <span style="font-size: 30px; color: #fa622f;" id="dicountRate"></span><br><br>
                  <span style="font-size: 30px; color: #ea97ad;">할인상품</span><br><br>
               </div>
               <br></th>
            </tr>
            <tr>
               <th scope="row"
                  style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
                  판매단위<br>
               <br> 중량/용량
               </th>
               <th style="font-size: 16px; padding: 25px 0px;">${ goodsVo.salesUnit }<br>
               <br> ${ goodsVo.volume }
               </th>
            </tr>
            <tr>
               <th scope="row"
                  style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
                  배송구분</th>
               <th style="font-size: 16px; padding: 25px 0px;">${ goodsVo.delClassification }
               </th>
            </tr>
            <tr>
               <th scope="row"
                  style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
                  포장타입<br>
               <br>
               </th>
               <th style="font-size: 16px; padding: 25px 0px;">${ goodsVo.packingType }<br>
                  <span style="font-size: 14px; color: #666;">택배배송은 에코포장이
                     스티로폼으로 대체됩니다.</span>
               </th>
            </tr>
            <tr>
               <th scope="row"
                  style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
                  알레르기정보</th>
               <th style="font-size: 16px; padding: 25px 0px;">${ goodsVo.allergy }
               </th>
            </tr>
            <tr>
               <th scope="row"
                  style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
                  유통기한</th>
               <th style="font-size: 16px; padding: 25px 0px;">출고일 기준, 유통기한
                  만기 8일 이상 남은 상품을 보내드립니다.(총유통기<br> 한:${ goodsVo.shelfLife })
               </th>
            </tr>
            <tr>
               <th scope="row"
                  style="font-size: 16px; color: #666; width: 150px; padding: 25px 8px;">
                  구매수량</th>
               <th style="padding: 25px 0px;"><input type="number" readonly
                  style="height: 30px; width: 80px; text-align: center; font-size: 15px;"
                  v-model="amount">
                  <div class="btn-group" role="group" aria-label="...">
                     <button type="button" class="btn btn-default"
                        v-on:click="decreaseQuantity">➖</button>
                     <button type="button" class="btn btn-default"
                        v-on:click="increaseQuantity">➕</button>
                  </div></th>
            </tr>
            <tr>
               <th class="text-right" scope="col" colspan="2"
                  style="padding: 25px 0px;"><span
                  style="font-size: 16px; font-weight: bold;">총 상품금액:</span> <span
                  style="font-size: 45px; font-weight: bolder;"> {{price |
                     comma}} </span> <span style="font-size: 25px; font-weight: bold;">원</span><br>
                  <h4>
                     <span class="label label-warning">적립</span> <span
                        style="font-size: 16px; font-weight: bold;">로그인 후, 적립혜택
                        제공</span><br>
                     <br>
                  </h4>
                  <button type="button" class="btn btn-danger btn-lg"
                     v-on:click="addCart"
                     style="font-size: 20px; font-weight: bold; padding: 15px 70px;">
                     장바구니 담기</button></th>
            </tr>
         </table>
      </div>
   </div>
   <span class="navbar-text navbar-right"> </span>

   <div class="container">

      <!--   <div class="clearfix"></div> -->
      
      <ul class="nav nav-tabs nav-justified" id="t1">
         <li class="active" onclick="fnMove('1')"><a href="#"
            onclick="return false;">상품설명</a></li>
         <li onclick="fnMove('2')"><a href="#" onclick="return false;">상품이미지</a></li>
         <li onclick="fnMove('3')"><a href="#" onclick="return false;">고객후기 (***)</a></li>
         <li onclick="fnMove('4')"><a href="#" onclick="return false;">상품문의 (***)</a></li>
      </ul>
      <div>
      ${ goodsVo.contents1 }
      </div>
   </div>
   <div class="container">

      <!--   <div class="clearfix"></div> -->
      
      <ul class="nav nav-tabs nav-justified" id="t2">
         <li onclick="fnMove('1')"><a href="#" onclick="return false;">상품설명</a></li>
         <li class="active" onclick="fnMove('2')"><a href="#"
            onclick="return false;">상품이미지</a></li>
         <li onclick="fnMove('3')"><a href="#" onclick="return false;">고객후기 (***)</a></li>
         <li onclick="fnMove('4')"><a href="#" onclick="return false;">상품문의 (***)</a></li>
      </ul>
      <div>
      ${ goodsVo.contents2 }
      </div>
   </div>
   <div id="review" class="container">

      <!--   <div class="clearfix"></div> -->
      
      <ul class="nav nav-tabs nav-justified" id="t3">
         <li onclick="fnMove('1')"><a href="#" onclick="return false;">상품설명</a></li>
         <li onclick="fnMove('2')"><a href="#" onclick="return false;">상품이미지</a></li>
         <li class="active" onclick="fnMove('3')"><a href="#"
            onclick="return false;">고객후기 (***)</a></li>
         <li onclick="fnMove('4')"><a href="#" onclick="return false;">상품문의
               (***)</a></li>
      </ul>
      <div class="Sboard">
         <div class="SboardTitle">
            <div class="SboardTitle-mini">
               <h4>PRODUCT REVIEW</h4>
               <br>
               <pre>
   ▶ 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
   ▶ 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이Jolly 내 1:1 문의에 남겨주세요.</pre>
            </div>
            <div class="Soption">
               <select>
                  <option>최근등록순</option>
                  <option>좋아요많은순</option>
                  <option>조회많은순</option>
               </select>
            </div>
            <div>
               <small>글갯수 {{ totalcount }} 개</small>
            </div>
         </div>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th>번 호</th>
                  <th class="SboardTitle">제 목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>도움</th>
                  <th>조회</th>
               </tr>
            </thead>
            <tr v-if="productreviewList == null">
               <td>게시물이 존재하지 않습니다..</td>
            </tr>
            <tr v-else-if="productreviewList != null"
               v-for="(productreview, index) in productreviewList"
               v-bind:key="productreview.num">
               <td>{{ productreview.num }}</td>
               <td><a href="">{{ productreview.title }}</a></td>
               <td>{{ productreview.writer }}</td>
               <td>{{ getDate(productreview.dateCreated) }}</td>
               <td>{{ productreview.help }}</td>
               <td>{{ productreview.lookup }}</td>
            </tr>
         </table>
         <div>
            <button class="btn Sbtn-primary" style="float: right;">후기쓰기</button>
         </div>


      </div>

      <div class="Spage text-center">
         <ul v-if="totalcount > 0" class="pagination">
            <li v-bind:class="{ 'disabled': !isPrevOk}"><a href="#"
               v-on:click="setPageNo(prevBlockPage)">«</a></li>
            <li v-for="item in pageBlockList" v-bind:key="item.pageNum"
               v-bind:class="{'active': item.isCurrentPage}"><a href="#"
               v-on:click="setPageNo(item.pageNum)">{{item.pageNum}}</a></li>
            <li v-bind:class="{'disabled': !isNextOk}"><a href="#"
               v-on:click="setPageNo(nextBlockPage)">»</a></li>
         </ul>
      </div>

   </div>

   <div class="container">

      <!--   <div class="clearfix"></div> -->
      
      <ul class="nav nav-tabs nav-justified" id="t4">
         <li onclick="fnMove('1')"><a href="#" onclick="return false;">상품설명</a></li>
         <li onclick="fnMove('2')"><a href="#" onclick="return false;">상품이미지</a></li>
         <li onclick="fnMove('3')"><a href="#" onclick="return false;">고객후기
               (***)</a></li>
         <li class="active" onclick="fnMove('4')"><a href="#"
            onclick="return false;">상품문의 (***)</a></li>
      </ul>
      <div class="Sboard">
         <div class="SboardTitle">
            <div class="SboardTitle-mini">
               <h4>PRODUCT Q&amp;A</h4>
               <br>
               <pre>
   ▶ 상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.<br>
   ▶ 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이Jolly 내 1:1 문의에 남겨주세요.</pre>
            </div>
         </div>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th>번 호</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>카테고리</th>
               </tr>
            </thead>
            <tr>
               <td>1</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>홍길동</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>2</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>임꺽정</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
            <tr>
               <td>3</td>
               <td>테이블 테스트 테이블 테스트 테이블 테스트</td>
               <td>성춘향</td>
               <td>오늘</td>
               <td></td>
            </tr>
         </table>
         <div>
            <button class="btn Sbtn-primary"
               style="float: right; margin-left: 10px">상품문의</button>
            <button class="btn Sbtn-primary" style="float: right;">전체보기</button>
         </div>
      </div>
   </div>
   <div class="Spage text-center">
      <ul class="pagination">
         <li><a href="#">«</a></li>
         <li class="active"><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>
         <li><a href="#">4</a></li>
         <li><a href="#">5</a></li>
         <li><a href="#">6</a></li>
         <li><a href="#">7</a></li>
         <li><a href="#">8</a></li>
         <li><a href="#">9</a></li>
         <li><a href="#">10</a></li>
         <li><a href="#">»</a></li>
      </ul>
   </div>

   <%-- footer 영역 --%>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
   
   <script src="../js/jquery-3.5.1.js"></script>
   <script>
   
   let discountRate = '';
   let salePrice = '';
   let originPrice = '';
   
   $(function() {
      
      originPrice = '${ goodsVo.originPrice }';
      salePrice = '${ goodsVo.salePrice }';
      
      discountRate = (salePrice / originPrice)*100;
      
      discountRate = Math.floor(discountRate);
      
      discountRate = 100 - discountRate;
      
      $("span#dicountRate").text(discountRate + '%');
      
      
      
      if(originPrice != 0){
         $("span#salePrice").css('text-decoration', 'line-through');
         $("span#salePrice").css('color', 'lightgray');
         
      } else {
         $("#discountDiv").css('display', 'none');
      }
      
   });
   
   
   new Vue({
      el: '#y_product_table',
      data: {
         amount: 0,
         price: 0
         
         },

      
      methods: {
         
         increaseQuantity: function () {
            if (this.amount < 100) {
               this.amount++;

               this.price = this.amount * ${ goodsVo.salePrice };
            }
         },

         decreaseQuantity: function () {
            if (this.amount > 0) {
               this.amount--;

               this.price = this.amount * ${ goodsVo.salePrice };
            }
         },

         addCart: function () {

            if (this.amount == 0) {
               alert('수량을 1개 이상으로 설정해주세요.');
               return;
            }
            
            let cartObj = {
               goodsName: '${ goodsVo.goodsName }',
               amount: this.amount,
               totalPrice: this.price
            };

            let str = JSON.stringify(cartObj);
            
            let vm = this;

            $.ajax({
               url:'/basket/add',
               data: str,
               method: 'POST',
               contentType: 'application/json; charset=UTF-8',
               success: function (response) {
                  console.log(response);

                  alert('장바구니에 담았습니다.');
               },
               error: function (req, status, err) {
                  console.log('code: ' + req.status + '\n message: ' + req.responseText + '\n error: ' + err);
                  
                  let obj = JSON.parse(req.responseText);

                  if (obj.isLogin == false) {
                     alert('로그인 후, 구매하실 수 있습니다.');
                     location.href = '/member/login';
                  }
                  
               }
            });
            
         }

      },

      
      filters:{
         comma(val) {
            return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         }
      }
      
   });

   
   new Vue({
      el: '#review',

      data: {
         
         loginId: 'sin',
         productreviewList: [], // 상품리뷰게시글
         pageNo: 1, // 사용자 요청 페이지 번호
         showListArea: true, // 리스트 영역 보이기 여부 스위치
         totalcount:0, // 전체 글 갯수
         
         // 페이지 블록
         numOfRows: 10, // 한 페이지당 보여지는 댓글 갯수
         pageCount: 0, // 댓글의 총 페이지 갯수
         pageBlock: 5, // 페이지블록 내의 페이지 갯수
         startPage: 0, // 페이지블록 내의 시작페이지
         endPage: 0,    // 페이지블록 내의 끝페이지
         pageBlockList:[] // 페이지블록 리스트( 시작페이지부터 끈페이지까지의 페이지번화가 요소)
   
      },

      
      methods: {

         getReviewList: function () {
            let vm = this;

            $.ajax({ // 나중에 상품 구현하면 url에 직접 값 넣지말고 const name을 쓰자
               // + '/' + this.loginId,
               url: '/ProductReview/Review/list/말린 오렌지',
               method: 'GET',
               success: function (response){
                  console.log(typeof response);
                  console.log(response);

                  vm.productreviewList = response.productReviewList;
                  vm.totalcount = response.totalCount;
               },
               error: function () {
                  alert('에러')
               }            
               
            });
         }, // getReviewList

         
         getDate: function (str) {
            console.log(typeof str);
            console.log(str);

            let today = new Date(); //  현재시점 날짜시간
            let date = new Date(str); // new Date('2021-01-09T02:44:32.000+00:00');

            let gap = today.getTime() - date.getTime(); // 밀리초 차이값
            let oneDay = 1000 * 60 * 60 * 24; // 밀리초 하루

            let result;
            if (gap > oneDay) { // 년월일
               result = moment(str).format('YYYY-MM-DD');
            } else { // gap <= oneDay 시분초
               result = moment(str).format('a hh:mm:ss');
            }
            return result;
            
         }, // getDate

         
         setPageNo: function (pageNum) {
            if(pageNum < 1 || pageNum > this.pageCount) {
               return;
            }
            this.pageNo = pageNum;
            this.getReviewList();
         }, // setpageNo

         
         makePageBlock: function () {
            // 글의 총 페이지 갯수 구하기
            this.pageCount = Math.ceil(this.totalcount / this.numOfRows);

            this.startPage = Math.floor((this.pageNo -1) / this.pageBlock) * this.pageBlock + 1;

            this.endPage = this.startPage + this.pageBlock -1;
            if (this.endPage > this.pageCount) {
               this.endPage = this.pageCount;
            }

            this.pageBlockList.splice(0);

            for (let i=this.startPage; i<=this.endPage; i++){
               let obj = {
                     pageNum: i,
                     isCurrentPage: (this.pageNo == i) ? true : false
               };
               this.pageBlockList.push(obj); 
            } // for
         } // makePageBlock
         
      },

      
      computed: {
         isPrevOk: function () { // 이전 페이지블록 존재 여부
            return this.startPage > this.pageBlock;
         },
         isNextOk: function () { // 다음 페이지블록 존재 여부
            return this.endPage < this.pageCount;
         },
         prevBlockPage: function () {
            return this.startPage - this.pageBlock;
         },
         nextBlockPage: function () {
            return this.startPage + this.pageBlock;
         }
      },

      
      mounted: function () {
         this.getReviewList();
      }
      
   });
</script>
</body>
</html>