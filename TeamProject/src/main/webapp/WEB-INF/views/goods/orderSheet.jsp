<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- head 컨텐트 영역 --%>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="/css/bootStrap/bootstrap.min.css" rel="stylesheet">
<link href="/css/bootStrap/kfonts2.css" rel="stylesheet">
<title>Jolly</title>
<style type="text/css">
#main {
	border-bottom: 1px solid #f7f7f7;
}
/* div { */
/*    word-break: break-all; */
/* } */
/* *{ */
/* box-sizing: border-box; */
/* margin: 0; */
/* padding: 0; */
/* } */
body {
	font-family: noto sans, malgun gothic, AppleGothic, dotum;
	line-height: 1;
	letter-spacing: -.05em;
	color: #4c4c4c;
	font-size: 12px;
	max-width: 100%;
}

#content {
	min-width: 1050px;
	padding-bottom: 120px;
}

#content {
	position: relative;
}

element.style {
	min-height: 563px;
}

.only_pc {
	/*    width: 1050px; */
	margin: 100px;
}

.only_pc .cart_item {
	float: left;
	width: 742px;
}

.cart_item .no_item {
	overflow: visible;
}

.only_pc * {
	font-family: Noto Sans;
	letter-spacing: 0;
}

.cart_item {
	position: relative;
	z-index: 1;
}

.only_pc .empty .cart_result, .only_pc .empty .cart_select {
	display: block;
}

.only_pc .cart_select {
	position: static;
	height: auto;
}

.cart_select {
	z-index: 2;
}

.only_pc .cart_select
.inner_select {
	position: static;
	padding: 0 10px 0 2px;
	border-bottom: none;
}

.cart_select .inner_select {
	overflow: hidden;
	left: 0;
	top: 0;
	width: 100%;
}

.only_pc .cart_select .check {
	padding: 18px 0 17px;
	font-weight: 700;
	font-size: 14px;
	letter-spacing: -.3px;
}

.cart_select .check {
	float: left;
}

label {
	line-height: 24px;
}
/* button[disabled], html input[disabled] { */
/*     cursor: default; */
/* } */
/* .skin_checkbox input[type=radio], input[type=checkbox] { */
/*     position: absolute; */
/*     z-index: -1; */
/*     opacity: 0; */
/* } */
/* input[type=checkbox], input[type=radio] { */
/*     box-sizing: border-box; */
/*     padding: 0; */
/* } */
/* .skin_checkbox input:disabled[type=radio]+.ico, input[type=checkbox]:disabled+.ico { */
/*     background-image: url(https://res.kurly.com/mobile/service/common/2003/ico_checkbox_disabled.png); */
/*     background-color: transparent; */
/*     background-repeat: no-repeat; */
/*     background-size: 24px 24px; */
/*     background-position: 50% 50%; */
/* } */
/* .skin_checkbox input[type=radio]+.ico, input[type=checkbox]+.ico { */
/*     display: inline-block; */
/*     position: relative; */
/*     width: 24px; */
/*     height: 24px; */
/*     margin-right: 12px; */
/*     border: 0; */
/*     background-image: url(https://res.kurly.com/mobile/service/common/2006/ico_checkbox.svg); */
/*     background-color: transparent; */
/*     background-repeat: no-repeat; */
/*     background-size: 24px 24px; */
/*     background-position: 50% 50%; */
/*     vertical-align: -7px; */
/* } */
/* .only_pc .cart_select .btn_delete { */
/*     float: left; */
/*     padding: 18px 0 17px 20px; */
/*     font-weight: 700; */
/*     line-height: 25px; */
/* } */
/* .cart_select .btn_delete { */
/*     float: right; */
/*     padding: 11px 0 10px; */
/*     font-weight: 600; */
/*     font-size: 14px; */
/*     line-height: 24px; */
/* } */
a {
	background-color: transparent;
	text-decoration: none;
	color: inherit;
}

.only_pc .empty .inner_empty {
	border-top: 1px solid #333;
	border-bottom: 1px solid #f4f4f4;
}

.only_pc .empty .inner_empty .bg {
	display: none;
}

.empty .inner_empty .bg {
	display: block;
	height: 10px;
	border-top: 1px solid #ccc;
	background-color: #f4f4f4;
}

.only_pc .empty .inner_empty .txt {
	width: 100%;
	margin-top: 0;
	padding: 115px 0 116px;
	font-weight: 700;
	font-size: 16px;
	color: #333;
}

.empty .inner_empty .txt {
	width: 100%;
	margin-top: 49%;
	font-size: 16px;
	color: #999;
	line-height: 24px;
	text-align: center;
}
/* .only_pc .empty .inner_empty .btn_submit { */
/*     display: none; */
/* } */
/* .only_pc .btn_submit { */
/*     position: static; */
/*     padding: 20px 0 0; */
/*     background: 0 0; */
/* } */
/* .btn_submit { */
/*     position: fixed; */
/*     z-index: 2; */
/*     left: 0; */
/*     bottom: 0; */
/*     width: 100%; */
/*     padding: 12px; */
/*     background: linear-gradient(180deg,hsla(0,0%,100%,0),#fff); */
/*     --safe-area-inset-bottom: env(safe-area-inset-bottom); */
/*     padding-bottom: calc(12px + var(--safe-area-inset-bottom)); */
/* } */
/* .only_pc .btn_submit .btn { */
/*     height: 56px; */
/*     padding-bottom: 2px; */
/*     line-height: 54px; */
/* } */
/* .btn_submit .btn.disabled, .btn_submit .btn:disabled { */
/*     color: #fff; */
/* } */
/* .btn.disabled, .btn:disabled { */
/*     background-color: #ddd; */
/*     color: #fff; */
/*     cursor: default; */
/* } */
.only_pc .empty .cart_result, .only_pc .empty .cart_select {
	display: block;
}

.only_pc .cart_select {
	position: static;
	height: auto;
}

.only_pc .cart_select .inner_select {
	position: static;
	padding: 0 10px 0 2px;
	border-bottom: none;
}

.cart_select .inner_select {
	overflow: hidden;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	padding: 0 20px;
	border-bottom: 1px solid #ccc;
	background-color: #fff;
}

.only_pc .cart_select .check {
	padding: 18px 0 17px;
	font-weight: 700;
	font-size: 14px;
	letter-spacing: -.3px;
}
/* button[disabled], html input[disabled] { */
/*     cursor: default; */
/* } */
/* .skin_checkbox input[type=radio], input[type=checkbox] { */
/*     position: absolute; */
/*     z-index: -1; */
/*     opacity: 0; */
/* } */
/* input[type=checkbox], input[type=radio] { */
/*     box-sizing: border-box; */
/*     padding: 0; */
/* } */
/* .skin_checkbox input:disabled[type=radio]+.ico, input[type=checkbox]:disabled+.ico { */
/*     background-image: url(https://res.kurly.com/mobile/service/common/2003/ico_checkbox_disabled.png); */
/*     background-color: transparent; */
/*     background-repeat: no-repeat; */
/*     background-size: 24px 24px; */
/*     background-position: 50% 50%; */
/* } */
/* .skin_checkbox input[type=radio]+.ico, input[type=checkbox]+.ico { */
/*     display: inline-block; */
/*     position: relative; */
/*     width: 24px; */
/*     height: 24px; */
/*     margin-right: 12px; */
/*     border: 0; */
/*     background-image: url(https://res.kurly.com/mobile/service/common/2006/ico_checkbox.svg); */
/*     background-color: transparent; */
/*     background-repeat: no-repeat; */
/*     background-size: 24px 24px; */
/*     background-position: 50% 50%; */
/*     vertical-align: -7px; */
/* } */
/* .only_pc .cart_select .btn_delete { */
/*     float: left; */
/*     padding: 18px 0 17px 20px; */
/*     font-weight: 700; */
/*     line-height: 25px; */
/* } */
/* .cart_select .btn_delete { */
/*     float: right; */
/*     padding: 11px 0 10px; */
/*     font-weight: 600; */
/*     font-size: 14px; */
/*     line-height: 24px; */
/* } */
.only_pc .empty .cart_result, .only_pc .empty .cart_select {
	display: block;
}

.only_pc .cart_result {
	position: relative;
	float: right;
	width: 284px;
}
/* element.style { */
/*     top: 60px; */
/* } */
.only_pc .cart_result .inner_result {
	position: absolute;
	right: 0;
	top: 60px;
	width: 284px;
	background-color: #fff;
}

.only_pc .cart_delivery {
	padding: 23px 19px 20px;
	border: 1px solid #f2f2f2;
	border-bottom: 0;
}

.cart_delivery {
	position: relative;
	z-index: 3;
}

.only_pc .cart_delivery .tit {
	padding-left: 24px;
	font-weight: 700;
	font-size: 16px;
	line-height: 20px;
	letter-spacing: -.3px;
	background-image:
		url(https://res.kurly.com/pc/service/cart/2007/ico_location.svg);
	background-color: transparent;
	background-repeat: no-repeat;
	background-size: 20px 20px;
	background-position: 0 50%;
}

.only_pc .cart_delivery .no_address {
	position: static;
	padding: 11px 0 0;
	font-weight: 700;
	font-size: 16px;
	color: #333;
	line-height: 24px;
}

.cart_delivery .no_address {
	display: block;
	position: relative;
	padding: 12px 20px;
	font-size: 16px;
	color: #5f0080;
	line-height: 20px;
}

.only_pc .cart_delivery .no_address .emph {
	color: #5f0080;
}
/* .only_pc .cart_delivery .no_address .btn { */
/*     margin-top: 17px; */
/* } */
/* .only_pc .cart_delivery .btn { */
/*     display: block; */
/*     width: 100%; */
/*     height: 36px; */
/*     font-weight: 700; */
/*     font-size: 12px; */
/*     line-height: 34px; */
/* } */
/* .btn.default { */
/*     border: 1px solid #5f0080; */
/*     background-color: #fff; */
/*     color: #5f0080; */
/* } */
/* .only_pc .cart_delivery .btn .ico { */
/*     display: inline-block; */
/*     width: 21px; */
/*     height: 20px; */
/*     margin-left: -14px; */
/*     background-image: url(https://res.kurly.com/pc/service/cart/2007/ico_search.svg); */
/*     background-color: transparent; */
/*     background-repeat: no-repeat; */
/*     background-size: 21px 20px; */
/*     background-position: 0 50%; */
/*     vertical-align: -5px; */
/* } */
.only_pc .amount_view {
	padding: 9px 18px 18px 20px;
	border: 1px solid #f2f2f2;
	background-color: #fafafa;
}

.amount_view {
	padding: 13px 20px 90px;
	border-top: 10px solid #f4f4f4; -
	-safe-area-inset-bottom: env(safe-area-inset-bottom);
	padding-bottom: calc(90px + var(- -safe-area-inset-bottom));
}

.only_pc .amount_view .amount {
	padding-top: 9px;
}

.amount_view .amount {
	overflow: hidden;
	padding-top: 9px;
}

.only_pc .amount_view .amount .tit {
	float: left;
	width: 96px;
	font-weight: 400;
	letter-spacing: -.5px;
}

.amount_view .amount .tit {
	float: left;
	width: 90px;
	font-size: 16px;
	line-height: 24px;
	white-space: nowrap;
}

.only_pc .amount_view .amount .price {
	float: right;
}

.amount_view .amount .price {
	float: right;
	line-height: 24px;
	text-align: right;
}

.only_pc .amount_view .amount .price .num {
	letter-spacing: -.5px;
}

.amount_view .amount .price .num {
	font-size: 18px;
}

.amount_view .amount .price .won {
	padding-left: 2px;
	font-size: 16px;
	vertical-align: 1px;
}

.only_pc .amount_view .amount.lst {
	margin: 17px 0 0;
	padding-top: 17px;
	border-top: 1px solid #eee;
}

.only_pc .amount_view .reserve {
	padding-top: 9px;
}

.amount_view .reserve {
	padding-top: 6px;
	font-size: 12px;
	color: #666;
	line-height: 16px;
	text-align: right;
}
/* .only_pc .btn_submit { */
/*     position: static; */
/*     padding: 20px 0 0; */
/*     background: 0 0; */
/* } */
/* .btn_submit { */
/*     position: fixed; */
/*     z-index: 2; */
/*     left: 0; */
/*     bottom: 0; */
/*     width: 100%; */
/*     padding: 12px; */
/*     background: linear-gradient(180deg,hsla(0,0%,100%,0),#fff); */
/*     --safe-area-inset-bottom: env(safe-area-inset-bottom); */
/*     padding-bottom: calc(12px + var(--safe-area-inset-bottom)); */
/* } */
/* .only_pc .btn_submit .btn { */
/*     height: 56px; */
/*     padding-bottom: 2px; */
/*     line-height: 54px; */
/* } */
/* .btn_submit .btn.disabled, .btn_submit .btn:disabled { */
/*     color: #fff; */
/* } */
/* .btn_submit .btn { */
/*     height: 56px; */
/*     line-height: 58px; */
/* } */
/* .btn.disabled, .btn:disabled { */
/*     background-color: #ddd; */
/*     color: #fff; */
/*     cursor: default; */
/* } */
/* .btn { */
/*     width: 100%; */
/*     height: 48px; */
/*     border: 0; */
/*     border-radius: 4px; */
/*     font-weight: 600; */
/*     font-size: 16px; */
/*     line-height: 50px; */
/*     text-align: center; */
/*     outline: none; */
/* } */
/* [type=submit] { */
/*     border-radius: 0; */
/* } */
/* button { */
/*     outline: none; */
/* } */
/* body, input, select, textarea, button { */
/*     font-family: noto sans,malgun gothic,AppleGothic,dotum; */
/*     line-height: 1; */
/*     letter-spacing: -.05em; */
/*     color: #4c4c4c; */
/*     font-size: 12px; */
/*     max-width: 100%; */
/* } */
/* button, html input[type=button], input[type=reset], input[type=submit] { */
/*     -webkit-appearance: button; */
/*     cursor: pointer; */
/* } */

/* button, select { */
/*     text-transform: none; */
/* } */
/* button { */
/*     overflow: visible; */
/*     border-radius: 0; */
/* } */
/* button, input, optgroup, select, textarea { */
/*     color: inherit; */
/*     font: inherit; */
/*     margin: 0; */
/* } */
.only_pc .cart_result .notice {
	padding-top: 34px;
}

.only_pc * {
	font-family: Noto Sans;
	letter-spacing: 0;
}
/* div, th, td, li, dt, dd, p { */
/*     word-break: break-all; */
/* } */
*, *:after, *:before {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.only_pc .cart_result .notice .txt {
	display: block;
	position: relative;
	padding: 6px 0 0 10px;
	font-size: 12px;
	color: #666;
	line-height: 18px;
	letter-spacing: -.5px;
}

.only_pc .cart_result .notice .txt .ico {
	position: absolute;
	left: 0;
	top: 6px;
}

input[type=checkbox] {
	zoom: 1.5;
}
</style>
</head>
<body>
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/js/bootstrap.min.js"></script>
	<div class="row">
	  <div class="col-md-12 text-center">
	  	<h1 style="margin-top: 70px; font-weight: 700;">주문서</h1>
	  </div>
	</div>
	<form method="post" action="/kakaoPay">
		<div id="main">
			<div id="content">
				<div id="cartItemList" class="only_pc" style="min-height: 563px;">
					<div class="empty">
						<div id="y_contained_goods" class="row" style="min-width: 1400px;">
<!-- 						<input type="hidden" id="order_link" name="order_link"> -->
						<input type="hidden" name="id" value="${ sessionScope.id }">
						<input type="hidden" name="total_price" v-model="getTotalPrice">
							<div class="col-lg-9">
								<table class="table">
									<thead>
										<tr>
											<th style="font-size: 24px; font-weight: 600;">
												주문상품
											</th>
										</tr>
									</thead>
									<tbody>
										<tr v-for="(basketVo, index) in basketVos" v-bind:key="index">
											<th class="col-md-2"><a
												v-bind:href="'/goods/productDetail?goodsName=' + basketVo.goodsName">
													<img
													v-bind:src="'/upload/' + basketVo.uploadpath + '/' + basketVo.uuid + '_' + basketVo.filename1"
													style="width: 70px; height: 90px; object-fit: cover;"
													alt="">
											</a></th>
											<th class="col-md-6"
												style="vertical-align: middle; font-size: 19px; font-weight: 700;">
												<a
												v-bind:href="'/goods/productDetail?goodsName=' + basketVo.goodsName"
												style="text-decoration: none; color: black;"> {{
													basketVo.goodsName }} </a>
											</th>
											<th class="col-md-2" style="vertical-align: middle ">
												<label style="font-size: 14px;">{{ basketVo.amount }}개</label>
											</th>
											<th class="col-md-2"
												style="vertical-align: middle; font-weight: 700; font-size: 20px; text-align: right;">
												{{ basketVo.salePrice * basketVo.amount | comma }}원
											</th>
										</tr>
									</tbody>
								</table>
								
								
								<table class="table" style="margin-top: 50px;">
									<thead>
										<tr>
											<th style="font-size: 24px; font-weight: 600;">
												주문자 정보
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th class="col-md-3" style="vertical-align: middle; font-size: 19px; font-weight: 700;">
												보내는 분<br><br>
												휴대폰<br><br>
												이메일
											</th>
											<th class="col-md-9" style="vertical-align: middle; font-size: 19px; font-weight: 500; ">
												${ memberVo.id }<br><br>
												${ memberVo.tel }<br><br>
												${ memberVo.email }
											</th>
										</tr>
									</tbody>
								</table>
								
								
								<table class="table" style="margin-top: 50px;">
									<thead>
										<tr>
											<th style="font-size: 24px; font-weight: 600;">
												배송 정보
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th class="col-md-3" style="vertical-align: middle; font-size: 19px; font-weight: 700;">
												배송지
											</th>
											<th class="col-md-9" style="vertical-align: middle; font-size: 19px; font-weight: 500; ">
												${ memberVo.address }
											</th>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-lg-3">
								<div class="cart_result">
									<div class="inner_result" style="top: 60px;">
										<!--                               <div class="cart_delivery"> -->
										<!--                                  <h3 class="tit">배송지</h3> -->
										<!--                                  <div class="no_address"> -->
										<!--                                     <span class="emph">배송지를 입력</span>하고 <br>배송유형을 확인해 보세요! -->
										<!--                                     <a href="#" class="btn default"> <span class="ico"></span>주소 -->
										<!--                                        검색 -->
										<!--                                     </a> -->
										<!--                                  </div> -->
										<!--                               </div> -->
										<div class="amount_view">
											<dl class="amount">
												<dt class="tit">상품금액</dt>
												<dd class="price">
													<span class="num">{{ getTotalOriginPrice | comma }}</span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">상품할인금액</dt>
												<dd class="price">
													<span v-if="getDiscountTotalPrice > 0">
														<span class="num">-{{ getDiscountTotalPrice | comma }}</span><span class="won">원</span>
													</span>
													<span v-else>
														<span class="num">0</span><span class="won">원</span>
													</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount lst">
												<dt class="tit">결제예정금액</dt>
												<dd class="price">
													<span class="num" style="font-weight: 700; font-size: 22px;">{{ getTotalPrice | comma }}</span><span
														class="won">원</span>
												</dd>
											</dl>
											<div class="reserve"></div>
										</div>
										<div class="btn_submit">
											<button v-if="basketVos.length > 0" type="submit"
												class="btn Sbtn-primary btn-lg" style="padding: 20px 110px;">결제하기</button>
											<button v-else type="button"
												class="btn Sbtn-primary btn-lg" style="padding: 20px 70px;"
												disabled>상품을 담아주세요</button>
										</div>
										<div class="notice">
											<span class="txt"> <span class="ico">·</span>‘입금확인’
												상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.
											</span> <span class="txt"> <span class="ico">·</span>‘입금확인’
												이후 상태에는 고객센터로 문의해주세요.
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

	<script>


// Vue /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
   let app = new Vue({
      el: '#y_contained_goods',

      data: {
         basketVos: ${ strbasketVos },
      },

      computed: {
         getTotalPrice: function () {
            let totalPrice = 0;
            for (let i=0; i<this.basketVos.length; i++) {
               totalPrice += this.basketVos[i].salePrice * this.basketVos[i].amount;
            }
            return totalPrice;
         }, 

         getDiscountTotalPrice: function () {
             let discountTotalPrice = 0;
             for (let i=0; i<this.basketVos.length; i++) {
            	 if (this.basketVos[i].originPrice !== 0) {
                	 discountTotalPrice += (this.basketVos[i].originPrice - this.basketVos[i].salePrice) * this.basketVos[i].amount;
                 }
             }
             return discountTotalPrice;
          },

          getTotalOriginPrice: function () {
              let originTotalPrice = 0;
              for (let i=0; i<this.basketVos.length; i++) {
            	  originTotalPrice += this.basketVos[i].originPrice * this.basketVos[i].amount;
              }
              return originTotalPrice;
           }
      },

      filters:{
         comma(val) {
            return String(val).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
         }
      }
      
   });
</script>

</body>
</html>