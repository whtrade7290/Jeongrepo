<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%-- head 컨텐트 영역 --%>
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
	padding-top: 100px;
	padding-bottom: 150px;
	letter-spacing: -.6px;
}

.html, .body {
	height: 100%;
}

.section_login .tit_login {
	font-weight: 800;
	font-size: 20px;
	line-height: 40px;
	text-align: center;
	padding-bottom: 20px;
}

.section_login .login_search {
	float: right;
	padding-top: 10px;
}

.section_login .login_view {
	text-align: center;
}

.section_login .checkbox_save {
	overflow: hidden;
	padding-bottom: 28px;
}

label {
	cursor: default;
}

.section_login input[type=number], .section_login input[type=text],
	.section_login input[type=password] {
	width: 100%;
	height: 47px;
	padding: 0 19px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff;
	font-size: 14px;
	line-height: 20px;
	outline: none;
}

.section_login [name=password], .section_login [name=srch_id] {
	margin-top: 10px;
}

.section_login * {
	font-family: noto sans;
	color: #333;
}

.section_login .checkbox_save .label_checkbox {
	float: left;
	margin-top: 7px;
}

#bar {
	color: #333333;
	font-size: 10;
}

body, input, select, textarea, button {
	font-family: noto sans, malgun gothic, AppleGothic, dotum;
	line-height: 1;
	letter-spacing: -.05em;
	color: #4c4c4c;
	font-size: 12px;
	max-width: 100%;
}

.btn_type1 {
	border: 1px solid #ea97ad;
	background-color: #ea97ad;
}

.btn_type1, .btn_type2 {
	display: block;
	overflow: hidden;
	width: 100%;
	height: 47px;
	border-radius: 3px;
	font-size: 0;
	text-align: center;
}

.btn_type2 {
	border: 1px solid #ea97ad;
	background-color: #fff;
}

.btn_type1 .txt_type, .btn_type2 .txt_type {
	display: inline-block;
	height: 100%;
	font-weight: 500;
	font-size: 16px;
	color: #fff;
	line-height: 44px;
	text-align: center;
	width: 100%;
}

.section_login .btn_member {
	margin-top: 10px;
}

.btn_type2 .txt_type {
	color: #ea97ad;
}
</style>
</head>

<body>
	<div id="content">
		<div id="qnb" class="quick-navigation"></div>
		<div class="section_login">
			<h3 class="tit_login">로그인</h3>
			<div class="write_form">
				<div class="write_vew login_view">
					<form method="post" name="form" id="form" action="/member/login">
						<input type="text" name="id" size="20" tabindex="1"
							placeholder="아이디를입력해주세요" required> <input type="password"
							name="pw" size="20" tabindex="2" placeholder="비밀번호를입력해주세요"
							required>
						<div class="checkbox_save">
							<label class="label_checkbox"> <input
								type="checkbox" id="chk_security" name="chk_security"
								value="true"> 로그인유지
							</label>
							<div class="login_search">
								<a href="/member/loginupdate" class="link">아이디 찾기</a> <span
									id="bar">|</span> <a href="/member/Findpass" class="link">비밀번호
									찾기</a>
							</div>
						</div>
						<button type="submit" class="btn_type1">
							<span class="txt_type">로그인</span>
						</button>
					</form>
					<a href="/member/joinView" class="btn_type2 btn_member"> <span
						class="txt_type">회원가입</span>
					</a>


				</div>
			</div>
		</div>
	</div>
	<%-- footer 영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer_.jsp" />

</body>
</html>