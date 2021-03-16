<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.section_login {
   width: 340px;
   margin: 0 auto;
   padding-top: 90px;
   letter-spacing: -.6px;
}

.section_login .tit_login {
   font-weight: 800;
   font-size: 20px;
   line-height: 20px;
   text-align: center;
}

.section_login {
   font-family: noto sans;
   color: #333;
}

.section_login .find_view {
   padding-top: 26px;
   text-align: center;
}

.section_login .find_view .tit_label {
   display: block;
   padding: 11px 0 7px;
   font-size: 12px;
   line-height: 18px;
   text-align: left;
}

strong {
   font-weight: 700;
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

.section_login .find_view .btn_type1 {
   margin-top: 30px;
}

.btn_type1 {
   border: 1px solid #ea97ad;
   background-color: #ea97ad;
}

.btn_type1 {
   display: block;
   width: 100%;
   height: 54px;
   border-radius: 3px;
   font-size: 20;
   text-align: center;
}
.btnRandomNum{
   display: block;
   overflow: hidden;
   border: 1px solid #ea97ad;
   width: 332px;
   height: 44px;
   border-radius: 3px;
   text-align: center;
}
.pwEmailNo{
   display: inline-block;
   height: 100%;
   color: #ea97ad;
   font-weight: 700;
   font-size: 14px;
   line-height: 40px;
   background-size: 25px 24px;
   vertical-align: top;
}
</style>
</head>

<body>

   <div class="section_login">
      <h3 class="tit_login">비밀번호 찾기</h3>
      <div class="write_form find_view">
         <form method="post" id="frm" name="fm" action="/member/getCountFindPw">
            <strong class="tit_label">이름</strong> 
            <input name="name" placeholder="이름을 입력해주세요" type="text" size="29" tabindex="2"required>
             <strong class="tit_label">아이디</strong>
              <input name="id" type="text" size="29" placeholder="4자 이상의 영문 혹은 영문과 숫자를 조합" tabindex="2"required>
            <strong class="tit_label">이메일</strong> 
            <input name="email" type="text" size="29" v-model="inputEmail"
             placeholder="예: marketJolly@Jolly.com" tabindex="5" required>
            <br>
            <span id="successSpan" style="color: green;">※ 이메일이 인증 되었습니다.</span>
            <br>
            <a href="#" class="btnRandomNum" id="btnRandomNum" v-on:click="pwEmailChk"> 
               <span class="pwEmailNo">인증번호 발송</span>
            </a>
            <div id="randomNumDiv">
               <strong class="tit_label">인증번호 입력</strong>
               <input type="text" v-model="inputRandomNum"name="randomInput" maxlength="16" placeholder="인증번호를 입력하세요.">
               <br><br>
               <a href="#" class="btnRandomNum" id="btnRandomNum" v-on:click="randomNumChk($event)">
                  <span class="pwEmailNo">인증번호 확인</span>
               </a>
               <span id="randomNumspan">※ 이메일 인증번호를 확인해주세요.</span>
               <input type="text" name="checked_email" value="" id="submitEmailChk">
            </div>
            <button type="button" class="btn_type1" v-on:click="btnSubmit">
               <span class="txt_type">찾기</span>
            </button>
         </form>


      </div>



   </div>

   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
   <script>
      $('span#successSpan').css('opacity', '0');
      $('#randomNumDiv').css('opacity', '0');
      
      new Vue({
         el : '#frm',
         data : {
            inputEmail : '',
            inputRandomNum: ''
         },
         
         methods : {
            pwEmailChk : function() {

               event.preventDefault(); // 스크롤바 이동 방지

               let vm = this;

               let email = vm.inputEmail;

               $.ajax({
                  url : '/mail/doSend',
                  data : {
                     email : email
                  },
                  success : function(response) {

                     console.log(typeof response);
                     console.log(response);

                     if (response) {
                        alert('메일 전송 성공 !');
                        $('#randomNumDiv').css('opacity', '1');
                     }

                  },
                  error : function() {
                     alert('메일 전송 실패 !');
                  }

               }); // email 아작스
            }, // pwEmailChk-ajax
            
            randomNumChk: function (){
                   
                   event.preventDefault(); // 스크롤바 이동 방지
                   
                   let vm = this;
                   
                   let randomNum = vm.inputRandomNum;
                   
                   
                   $.ajax({ 
                      url: '/member/randomNum',
                     data: {randomNum : randomNum},
                     success: function (response) {
                        console.log(typeof response);
                        console.log(response);
                  
                           if (response.isIdDup) {
                              $('span#randomNumspan').html('인증번호 확인 완료!').css('color', 'green');
                              $('input[name="checked_email"]').val('y');
                              $('#randomNumDiv').css('opacity', '0');
                              $('#btnRandomNum').css('opacity', '0');
                              $('span#successSpan').css('opacity', '1');
                              
                           } else {
                              $('span#randomNumspan').html('인증번호가 맞지 않습니다.').css('color', 'red');
                              $('input[name="checked_email"]').val('n');
                           }

                     },
                     error: function(){
                        alert('인증번호확인 실패...');
                        $('span#randomNumspan').html('인증번호가 맞지 않습니다.').css('color', 'red');
                        $('input[name="checked_email"]').val('n');
                     }
                     
                   });// ajax
                   
                }, //randomNumChk
                
                btnSubmit: function(){
                   
                   let emailCheck = $('input[name="checked_email"]').val();
                   let nameCheck = $('input[name="name"]').val();
                   let idCheck = $('input[name="id"]').val();
                   
                   if(nameCheck == ''){
                        alert('이름을 적어주세요.');
                        $("input[name=name]").focus();
                        return;
                     }
                   
                   if(idCheck == ''){
                        alert('아이디를 적어주세요.');
                        $("input[name=id]").focus();
                        return;
                     }
                   
                   if(emailCheck == ''){
                        alert('메일을 중복확인을 해주세요.');
                        $("input[name=email]").focus();
                        return;
                     }
                   
                   if(emailCheck == 'n'){
                        alert('인증번호가 맞지 않습니다.');
                        $("input[name=email]").focus();
                        return;
                     }
                   
                   $("#frm").submit();
                }
         }
      });
   </script>
   
</body>
</html>