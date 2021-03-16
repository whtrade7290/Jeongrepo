<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<jsp:include page="/WEB-INF/views/include/header_.jsp" />

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마켓컬리 :: 내일의 장보기, 마켓컬리</title>
<style>
.section_login {
	width: 340px;
	margin: 0 auto;
	padding-top: 90px;
	padding-bottom: 90px;
	letter-spacing: -.6px;
}

.section_login .tit_login {
	font-weight: 800;
	font-size: 20px;
	line-height: 20px;
	text-align: center;
}

.section_login * {
	font-family: noto sans;
	color: #333;
}

.section_login .find_view {
	padding-top: 15px;
	text-align: center;
}

.section_login input[type=text] {
	width: 100%;
	height: 54px;
	padding: 0 19px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff;
	font-size: 14px;
	line-height: 20px;
	outline: none;
}

.section_login .find_view .tit_label {
	display: block;
	padding: 11px 0 7px;
	font-size: 12px;
	line-height: 18px;
	text-align: left;
}

.section_login .find_view .btn_type1 {
	margin-top: 30px;
}

.btn_type1 {
	border: 1px solid #ea97ad;
	background-color: #ea97ad;
}

.btn_type1 {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 54px;
	border-radius: 3px;
	font-size: 0;
	text-align: center;
}

button {
	color: inherit;
	font: inherit;
	margin: 0;
}

.btn_type1 .txt_type {
	color: #fff;
}

.btn_type1 .txt_type {
	display: inline-block;
	height: 100%;
	font-weight: 500;
	font-size: 16px;
	color: #fff;
	line-height: 51px;
	text-align: center;
}
</style>
</head>

<body>
	<div class="section_login">
		<h3 class="tit_login">아이디찾기</h3>
		<div class="write_form find_view">
			<div class="write_vew login_view">
				<form id="form" name="fm" method="POST" action="/member/loginfind">
					<input type="hidden" name="act" value="Y"> <input
						type="hidden" name="rncheck" value="none"> <input
						type="hidden" name="dupeinfo" value=> <strong
						class="tit_label">이름</strong> <input type="text" name="name"
						tabindex="2" size="29" required="required"
						placeholder="고객님의 이름을 입력해 주세요 "> <strong class="tit_label">이메일</strong>
					<input type="text" name="email" tabindex="2" size="29"
						required="required" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
					<button type="submit" class="btn_type1">
						<span class="txt_type">확인</span>

					</button>


				</form>



			</div>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>

</html>