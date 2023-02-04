<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책하루 비밀번호 재설정</title>
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
.container {
	text-align: center;
	width: 400px;
	height: fit-content;
	margin: auto;
	margin-top:200px;
}

.header {
	margin-top: 10%;
	margin-bottom: 10%;
}

.header>a>img {
	width: 40%;
}

input {
	border: 1px solid #d5d5d5;
    outline: none;
	box-shadow:3px 3px #80808050;
	border-radius: 8px;
	margin-bottom: 5%;
	outline: none;
	border-radius: 8px;
	padding-left: 10px;
	width: 70%;
	height: 40px;
}

#pw{
	position:relative;
	left:58px;
	display:none;
	padding:0px;
	
} 

button, .find_btn>input{
	color:#5397fc;
	transition-duration: 0.1s;
	border: 1px solid #5397fc;
	outline: none;
	background-color: white;
	box-shadow:3px 3px #80808050;
	border-radius: 8px;
	width: 70%;
	height: 40px;
}

button,.find_btn>input:active {
	margin-left: 5px;
	margin-top: 5px;
	box-shadow: none;
}
</style>
<body>
	<div class="container">
		<div class="header">
			<a href="/"><img src="/resources/bookday_logo_ver1(kor).png"></a>
			<p class="title">사용자 찾기</p>
		</div>
		<!-- <form action="/member/findUser"> -->
			<div class="inputbox">
				<input type="text" placeholder="휴대폰 번호를 입력하세요." id="phone"
					name="phone">
				<input type="password" placeholder="비밀번호(영문자, 특수문자 ! @ $ % - 16자 이내)" id="pw"
					name="pw" maxlength="16">
			</div>
			<div class="result"></div>
			<div class="find_btn">
				<button type="button" id="find_btn">확인</button>
			</div>
		<!--</form> -->
	</div>
</body>
<script>
	$("#find_btn").on("click", function(){
		
		let phone = $("#phone").val();
		
		 //휴대폰 번호 여부 에이작스로 확인한 다음에 비밀번호 재설정 페이지로 이동 
        $.ajax({
				url:"/member/findUser",
				data:{"phone":phone}
			
			}).done(function(resp){
				
				console.log(resp);
				
                if(resp == false){
                	
                    if(confirm("가입된 회원이 아닙니다.\n 회원가입하시겠습니까?")){
                    	location.href="/member/toSignup";
                    }else{
                    	$("#phone").val("");
                    }
                    
                }else{ 
                    if(confirm("회원입니다. 인증하시겠습니까?")){
                    	
                    	alert("인증번호를 발송하였습니다.");
                    	$("#phone").attr("readonly",true);
                    	
                    	//인증번호 받을 input창 만들기
                    	 $(".inputbox").append(
                    		    $("<input>").prop({
                    		    	type:"text",
                    		           id: "checkPhone",
                    		           placeholder: "인증번호",
                    		      		name:"checkPhone"
                    		        })
                    		    );
                    	
                    	//인증번호 발송
                    	$.ajax({
                    		url:"/member/createAuthNum",
                    		data:{"phone":$("#phone").val()}
                    	
                    	}).done(function(resp){
                    		
                    		 $("#find_btn").remove();
                        	 
                        	 $(".find_btn").append(
                        			 $("<input>").prop({
                        				 type:"button",
                        				 id:"check_btn",
                        				 value:"확인"
                        			 })
                        			 );
                    		
                    		$("#check_btn").on("click",function(){
                 			   
                 			   let checkPhone=$("#checkPhone").val();
                 			   
                 			   $.ajax({
                                    url: "/member/doAuthNumMatch",
                                     data: {"code": checkPhone }

                                   }).done(function (resp) {
                                 	  
                                 	  console.log(resp);
                                 	  
                                 	  //입력 값 수정 불가 & 버튼 2번 클릭 못하게 해야 될듯
                                 	  if(resp == false){
                                 		  
                                 			$("#phone").attr("readonly",false);
                                 			$("#phone").css("display","none");
                                 			$("#pw").css("display","block");
                                 		 	
                                 		 	$("#checkPhone").remove();	 
                                 		 	$("#check_btn").remove();

                                        	 $(".find_btn").append(
                                        			 $("<input>").prop({
                                        				 type:"button",
                                        				 id:"update_btn",
                                        				 value:"확인"
                                        			 	})
                                        			 );
                                        	 
                                        	$(".title").text("비밀번호 재설정");
                                        	
                                        	 $(".inputbox").append(
                                        		    $("<input>").prop({
                                        		    	type:"password",
                                        		           id: "updatePw",
                                        		           placeholder: "비밀번호 확인",
                                        		      		name:"updatePw",
                                        		      		maxlength:"16"
                                        		        })
                                        		    );
                                        	 
     
                                        	 $("#updatePw").on("keyup",function(){
                                     			
                                        		let pwRegex=/^[A-Z a-z 0-9 ! @ $ % -]{8,16}$/;
                                             	let pw=$("#pw").val();
                                     			let check_pw=$("#updatePw").val();

                                               if(pwRegex.test(pw) && $("#pw").val() == $("#updatePw").val()){
                                               $("#pw, #updatePw").css("border-color","#5397fc");
                                               $("#update_btn").attr("disabled", false);
                                               }else{  
                                            	 $("#pw, #updatePw").css("border-color","red");
                                               	$("#update_btn").attr("disabled", true);
                                               }
                                               
                                               });
                                        	 
                                        	 
                                        	 $("#update_btn").on("click", function(){
                                        			
                                        		 	let phone= $("#phone").val();
                                        			let updatePw = $("#updatePw").val();
                                        			
                                        			console.log(phone+":"+updatePw);
                                        			
                                        			if(phone == "" || updatePw == ""){
                                        				alert("비밀번호를 입력해주세요.");
                                        			}else{
                                        				 //휴대폰 번호 여부 에이작스로 확인한 다음에 비밀번호 재설정 페이지로 이동 
                                        	        $.ajax({
                                        					url:"/member/updatePw",
                                        					data:{"updatePw":updatePw,
                                        						"phone":phone}
                                        				
                                        				}).done(function(resp){
                                        					
                                        					console.log(resp);
                                        					
                                        	                if(resp == "true"){
                                        	                	
                                        	                  alert("비밀번호가 변경되었습니다.");
                                        	                  location.href="/member/toLogin";
                                        				}

                                        				})
                                        			}
                                        			
                                        		});
  
											
                                 	  }else{
                                 		 alert("인증번호가 틀립니다.");
                                 		 location.relode();
                                 	  }
                                   });
                 		   });
                    		
                    	});
                    	
                    }else{
                    	location.relode();
                    }
                
                	//회원이면 비밀번호 재설정 페이지로 이동
                	//location.href="/member/toUpdatePw?phone="+$("#phone").val();
                	
                }
			});

	});
</script>
</html>