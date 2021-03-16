<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="myPageTop" class="page_aticle mypage_top">
					<div class="mypagetop_user">
						<div class="inner_mypagetop">
							<div class="grade_user">
								<div class="grade">
									<span class="screen_out">등급</span> 
									<span class="ico_grade class0">
										<span class="inner_grade">
											<span class="in_grade">일반</span>
										</span>
									</span>
									<div class="grade_bnenfit">
										<div class="user">
											<strong class="name">${ memberVo.name }</strong> 
											<span class="txt">님</span>
										</div>
										<div class="benefit">
											<strong class="tit">첫구매 우대 - </strong>적립 5%
										</div>
										<div class="benefit">
											<strong class="tit">첫구매 우대 - </strong>20,000원 이상 무료 배송
										</div>
										<div class="benefit"></div>
									</div>
								</div>
								<div class="next">
									<a href="#" class="total_grade">전체등급 보기</a> 
									<a href="#" class="next_month">다음 달 예상등급 보기</a>
								</div>
							</div>
							<ul class="list_mypage">
								<li class="user_reserve">
									<div class="link">
										<div class="tit">적립금
										</div>
										<a href="#" class="info"> ${ memberVo.jmembership } 원
											<span class="date">소멸 예정 0 원</span>
										</a>
									</div>
								</li>
								<li class="user_coupon"><div class="link">
									<div class="tit">쿠폰	</div>
										<a href="#" class="info">1 개
										</a>
									</div>
								</li>
								<li class="user_kurlypass"><div class="link">
										<div class="tit">컬리패스</div>
										<a href="#" class="info info_link">	알아보기 
										</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>