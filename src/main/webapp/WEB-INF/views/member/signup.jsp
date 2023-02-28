<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책하루 회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	box-sizing: border-box;
	font-family: 'NanumSquareNeo-Variable';
}
img {
	width: 25%;
}

.container {
	margin: auto;
	margin-top:100px;
	margin-bottom:100px;
	text-align: center;
	width: 500px;
	height: fit-content;
}

.header {
	margin-top: 10%;
	margin-bottom: 10%;
}

input {
	border: 1px solid #d5d5d5;
	border-radius: 8px;
	padding-left: 10px;
	width: 70%;
	height: 50px;
	outline: none;
	box-shadow:3px 3px #80808050;
}

/*체크 표시 스타일*/
.box{
position:relative;}

#check_icon1,#check_icon2,#check_icon3,#check_icon4,#check_icon5{
display: none;
position:absolute;
	top: 10px;
  	bottom: 5px;
  	right: 85px;
  	
}

#phone_box, #vcode_box{
	position:relative;
}

#verfi_btn, #check_btn {
	position:absolute;
	top: 4px;
  	bottom: 0;
  	right: 80px;
	transition-duration: 0.1s;
	border: 1px solid #5397fc;
	outline: none;
	box-shadow:3px 3px #80808050;
	background-color: white;
	height: 40px;
	border-radius: 8px;
	color:#5397fc;
}

#ph_result, #nk_result, #pw_result {
	width: 85%;
	margin-top:2%;
	text-align: right;
}

.signup_form>div {
	margin-top: 5%;
}

.signup_btn {
	margin: auto;
	width: 70%;
	margin-top: 20%;
	margin-bottom: 20%;
}

#signup_btn {
	color:white;
	transition-duration: 0.1s;
	border: 1px solid #d5d5d5;
	outline: none;
	box-shadow:3px 3px #80808050;
	background-color: #5397fc;
	border-radius: 8px;
	width: 100%;
	height: 40px;
}

#signup_btn:active {
	margin-left: 5px;
	margin-top: 5px;
	box-shadow: none;
}

</style>
<body>
	<div class="container">
		<div class="header">
			<a href="/"><img src="/resources/bookday_logo_ver1(kor).png" /></a>
		</div>

		<form action="/member/signUp" method="post">
			<div class="signup_form">

				<div class="phone_box">
					<div id="phone_box">
						<input type="text" placeholder="휴대폰 번호 (-제외)" name="phone" id="phone" maxlength="11">
						<button type="button" id="verfi_btn">인증</button>
					</div>
				</div>
				<div class="vcode_box">
					<div id="vcode_box">
						<input type="text" placeholder="인증 번호" name="verifi_code" id="verifi_code">
						<button type="button" id="check_btn">확인</button>
					</div>
					<div id="ph_result"></div>
				</div>
				<div class="box">
					<input type="text" placeholder="이름(5자 이내)" name="name" id="name"
						maxlength="5">
						<span class="material-symbols-outlined" id="check_icon1">check</span>
				</div>
				<div class="box">
					<input type="text" placeholder="이메일" name="email" id="email" maxlength="25">
					<span class="material-symbols-outlined" id="check_icon2">check</span>
				</div>
				<div class="box">
					<input type="text" placeholder="닉네임(2-5자 이내)" name="nickname" id="nickname"
						minlength="2" maxlength="5">
						<span class="material-symbols-outlined" id="check_icon3">check</span>
					<div id="nk_result"></div>
				</div>
				<div class="box">
					<div>
						<input type="password" placeholder="비밀번호(영문자 및 특수문자 ! @ $ % - 16자 이내)" name="pw" id="pw"
							minlength="8" maxlength="16">
							<span class="material-symbols-outlined" id="check_icon4">check</span>
							<div id="pw_result"></div>
						<!-- <span class="material-symbols-outlined">visibility</span> -->
					</div>
				</div>
				<div class="box">
					<div>
						<input type="password" placeholder="비밀번호 확인" name="check_pw"
							id="check_pw" maxlength="16">
						<span class="material-symbols-outlined" id="check_icon5">check</span>
						<!-- <span class="material-symbols-outlined">visibility</span> -->
					</div>
				</div>
				<div class="signup_btn">
					<button id="signup_btn">회원가입</button>
				</div>
			</div>
		</form>

	</div>
<script>

$(document).ready(function(){
	
	//기본적으로 버튼 비활성화
	$("#signup_btn").attr("disabled", true);
	//인증번호 입력 창도 비활성화
	$("#verifi_code").attr("readonly", true); 
	
	$("#name, #nickname, #phone,#verifi_code,#email,#pw,#check_pw")
    .on("keyup",function(){
    	
	let name= $("#name").val();
     let nickname=$("#nickname").val();
     let phone=$("#phone").val();
     let verifi_code=$("#verifi_code").val();
     let email=$("#email").val();
     let pw=$("#pw").val();
     let check_pw=$("#check_pw").val();

     let nameRegex=/[가-힣]{2,5}/;
     let nicknameRegex=/[가-힣 a-z A-Z 0-9]{2,5}/;
     let phoneRegex=/^01\d{1}\d{3,4}\d{4}$/;
     let emailRegex=/^[a-z 0-9 A-Z]{3,12}@[A-Z a-z]{3,7}(.[a-zA-Z]{2,3})?.[a-zA-Z]{2,3}$/;
     let pwRegex=/^[A-Z a-z 0-9 ! @ $ % -]{8,16}$/;
	
     if(name=="" || nickname=="" || phone=="" || 
    	verifi_code=="" || email=="" || pw=="" || check_pw==""
    	|| !nameRegex.test(name) || !nicknameRegex.test(nickname) 
        || !phoneRegex.test(phone) || !emailRegex.test(email) 
        || !pwRegex.test(pw)){
           //위의 값이 안 맞으면 로그인 버튼 아예 못 누름
           $("#signup_btn").attr("disabled", true);
           console.log("버튼 비활성화");
           }else{
        	   console.log("버튼 활성화");
        	   $("#signup_btn").attr("disabled", false);
           }
     
     console.log(name+":"+nickname+":"+phone+":"+verifi_code+":"+email+":1"+pw+":2"+check_pw);
    });
	
	$("#phone").on("blur",function(){

		let phone=$("#phone").val();
		let phoneRegex=/^01\d{1}\d{3,4}\d{4}$/;

		if(!phoneRegex.test(phone) && phone != ""){
      $("#phone, #verifi_code").css("border-color", "red");
          }else if(phone == ""){
        	  $("#phone").css("border-color","#d5d5d5");
          }else{

            //핸드폰 중복 검사
            $.ajax({
              url: "/member/checkByPhone",
              data: { "phone": phone },
              async : false

            }).done(function (resp){

              console.log(resp);

              if (resp == true) {//휴대폰이 존재하므로 사용할 수 없는 경우
                $("#phone").css("border-color", "red");
                alert("이미 사용 중인 번호입니다.");
                $("#phone").val("");
                
              } else { //휴대폰이 존재하지 않으므로 사용할 수 있는 경우
                $("#phone").css("border-color", "#5397fc");
              
                //$("#phone").attr("readonly", true); 
                
                $("#phone").on("input",function(){
                	alert("핸드폰 번호를 다시 입력합니다.");
                	location.reload();
                });
              
                $("#verfi_btn").on("click", function(){	
                	
                	/* if(confirm("인증하시겠습니까?")){ */
                		//인증 번호 발송되는 에이작스
                		 $.ajax({
                            url: "/member/createAuthNum",
                             data: {"phone": phone },
                		 	async : false


                           }).done(function (resp) {
                        	   
                        	   if(resp == true){ 
                        		   alert("인증번호가 발송되었습니다.");
                        		   $("#verfi_btn").attr("disabled", true); 
                        		   $("#verifi_code").attr("readonly", false); 
                        		   
                        		   $("#phone").on("input",function(){
                        			   $("#verfi_btn").attr("disabled", false); 
                        			   location.reload();
                        			   
                                       		   });
                        		   
                        		    //확인 버튼 눌렀을 때
                                   $("#check_btn").on("click",function(){
                        			   
                        			   let verifi_code=$("#verifi_code").val();
                        			   
                        			   $.ajax({
                                           url: "/member/doAuthNumMatch",
                                           data: {"code": verifi_code}

                                          }).done(function (resp) {
                                        	  
                                        	  console.log(resp);
                                        	  
                                        	  //입력 값 수정 불가 & 버튼 2번 클릭 못하게 해야 될듯
                                        	  if(resp == false){
                                        		  alert("인증번호가 일치합니다.")
                                        		  $("#verifi_code").css("border-color", "#5397fc");
                                        		  
                                        		   $("#phone").on("input",function(){
                                                   	location.reload();
                                                   });
                                        		  
                                        		  //$("#phone").attr("readonly",true);
                                        		  $("#verifi_code").attr("readonly",true);
                                        		  $("#verfi_btn").attr("disabled", true); 
                                        		  $("#check_btn").attr("disabled", true);
                                        		  $("#signup_btn").attr("disabled", false);
                                        		   
                                        	  }else{
                                        		  alert("인증번호가 틀립니다.");
                                        		  $("#verifi_code").css("border-color", "red");
                                        		  $("#signup_btn").attr("disabled", true);
                                        	  }
                                          });
                        		   });
                        	   }
                           });
                	/* }else{
                		$("#phone").val("");
                		location.reload();
                		} */
                })
            
              }

            })
          }

	});
			
      	$("#name").on("keyup",function(){

		 let name= $("#name").val();
         let nameRegex=/[가-힣]{2,5}/;

		    //이름 유효성 검사
			if(!nameRegex.test(name) && name != ""){
           $("#name").css("border-color","red");
          }else if(name == ""){
        	  $("#check_icon1").css("display","hidden");
        	  $("#name").css("border-color","#d5d5d5");
          }else{
        $("#check_icon1").css("display","block");
        $("#name").css("border-color","#5397fc");
   			 
       }

		});
      	
    	$("#email").on("keyup",function(){

			let email=$("#email").val();
			let emailRegex=/^[a-z 0-9 A-Z]{3,12}@[A-Z a-z]{3,7}(.[a-zA-Z]{2,3})?.[a-zA-Z]{2,3}$/;

			   //이메일 유효성 검사
			   if(!emailRegex.test(email) && email != ""){
                $("#email").css("border-color","red");
              }else if(email == ""){
            	  $("#email").css("border-color","#d5d5d5");
              }else{
            	$("#email").css("border-color","#5397fc");
            	$("#check_icon2").css("display","block");
            	}
              
		});

		$("#nickname").on("keyup",function(){
			let nickname=$("#nickname").val();
			let nicknameRegex=/[가-힣 a-z A-Z 0-9]{2,5}/;

			   //닉네임 유효성 검사      
			if(!nicknameRegex.test(nickname) && nickname != ""){
           $("#nickname").css("border-color","red");
           $("#nk_result").html("최소 2자 이상");
           $("#nk_result").css("color","red");
          }else if(nickname == ""){
        	  $("#nickname").css("border-color","#d5d5d5");
          }else{

          //닉네임 중복 검사
          $.ajax({
				url:"/member/checkByNickname",
				data:{"nickname":nickname}
			
			}).done(function(resp){
				
				console.log(resp);
				
				if(resp == true){//닉네임이 존재하므로 사용할 수 없는 경우
				$("#nickname").css("border-color","red");	
          		$("#nk_result").html("이미 사용 중인 닉네임입니다.");
          		$("#nk_result").css("color","red");
    
				}else { //닉네임이 존재하지 않으므로 사용할 수 있는 경우
         $("#nickname").css("border-color","#5397fc");
         $("#nk_result").html("사용 가능한 닉네임입니다.");
         $("#nk_result").css("color","#5397fc");
         $("#check_icon3").css("display","block");
        // $("#nickname").attr("readonly",true);
        }
				
			}) //여기까지 중복 검사 로직
      
    }

		});
       
		$("#pw,#check_pw").on("keyup",function(){

		let pw=$("#pw").val();
		let check_pw=$("#check_pw").val();
        
		   let pwRegex=/^[A-Z a-z 0-9 ! @ $ % -]{8,16}$/;

		   //비밀번호 유효성 검사 및 중복 검사
		   if(!pwRegex.test(pw) && pw != ""){
                $("#pw").css("border-color","red");
                $("#pw_result").css("color","red");
                $("#pw_result").html("유효하지 않은 비밀번호입니다.");
              }else if(pw == ""){
            	  $("#pw").css("border-color","#d5d5d5");
              }else{ 
            	  $("#pw").css("border-color","#5397fc");
            	  $("#pw_result").html("");
            	  $("#check_icon4").css("display","block");
            	  console.log("여기까지 오는지 확인");

            	  //일치 확인
            	  if($("#pw").val()==$("#check_pw").val()){
                      $("#check_pw").css("border-color","#5397fc");
                      $("#check_icon5").css("display","block");
                      
                      }else{  
                    	 $("#check_pw").css("border-color","red");
                      	$("#signup_btn").attr("disabled", true);
                      	
                      }
            	  }

		});
		
});
</script>
</body>
</html>