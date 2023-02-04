<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책하루 로그인</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

.contanier {
	text-align: center;
	padding-top: 100px;
	margin-top: 500px;
	width: 400px;
	height: 600px;
	margin: auto;
}

.header {
	margin-top: 10%;
	margin-bottom: 10%;
}

.search {
	float: left;
	position: relative;
	height: 100%;
	width: 25%;
}

.search-box {
	position: absolute;
	bottom: 5px;
	left: 0px;
	overflow: hidden;
	height: 40px;
	width: 100%;
	border: none;
	border-radius: 5px;
	box-shadow: 3px 3px 3px 3px #80808050;
}

.search-txt {
	float: left;
	padding: 0;
	background: none;
	border: none;
	outline: none;
	font-size: 15px;
	line-height: 40px;
	position: absolute;
	left: 10px;
}

.search-btn {
	position: absolute;
	right: 0px;
	line-height: 100px; #80808050
	border: none;
	background-color: #ffffff;
	color: #5397fc;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.icons {
	float: left;
	position: relative;
	width: 20%;
	height: 100%;
}

.header>a>img {
	width: 40%;
}

#phone, #pw {
	margin-top: 2%;
}

input {
	border: 1px solid #d5d5d5;
	outline: none;
	box-shadow: 3px 3px #80808050;
	border-radius: 8px;
	padding-left: 10px;
	width: 70%;
	height: 40px;
}

#result {
	text-align: left;
}

.login_btn {
	margin: auto;
	width: 70%;
	margin-top: 5%;
	cursor:pointer;
}

button {
	color: #5397fc;
	outline: none;
	border: 1px solid #5397fc;
	transition-duration: 0.1s;
	box-shadow: 3px 3px #80808050;
	background-color: white;
	border-radius: 8px;
	width: 100%;
	height: 40px;
}

button:active {
	margin-left: 5px;
	margin-top: 5px;
	box-shadow: none;
}

button:disabled {
	color: black;
}

.links {
	margin-top: 5%;
	display: inline-flex;
}

.links>a {
	margin: 10px;
}

a {
	font-size: smaller;
	color: grey;
	text-decoration: none;
	margin-bottom: 5%;
}

#line {
	color: grey;
}

hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid rgb(216, 216, 216);
	margin-top: 15px;
	margin-bottom: 15px;
	width: 285px;
}

.kakao_login {
	margin-top: 5%;
}

.kakao_login>a>img {
	transition-duration: 0.1s;
	border-radius: 8px;
	box-shadow: 3px 3px #80808050;
	width: 70%;
	height: 40px;
}

.kakao_login>a>img:active {
	margin-left: 5px;
	margin-top: 5px;
	box-shadow: none;
}
</style>
<body>
	<div class="contanier">
		<div class="header">
			<a href="/" /><img src="/resources/bookday_logo_ver1(kor).png"></a>
		</div>

		<div class="login_form">
			<!-- <form id="login" action="/member/login"> -->
				<div class="phone">
					<input type="text" placeholder="휴대폰 번호를 입력해주세요." id="phone"
						name="phone" maxlength="11" numberOnly />
				</div>
				<div class="pw">
					<input type="password" placeholder="비밀번호를 입력해주세요." id="pw"
						name="pw" maxlength="20" />
				</div>
				<div class="login_btn">
					<button id="login_btn" style="color: #5397fc;">로그인</button>
				</div>
			<!-- </form> -->

			<div class="links">
				<a href="/member/toSignup"><p>회원가입</p></a> <a
					href="/member/toUpdatePw"><p>비밀번호 재설정</p></a>
			</div>

			<hr id="hr">
			<div class="kakao_login">
				<a class="p-2"
					href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=5d39c4a90d2cd9ef1649a8e6108ba988&redirect_uri=http://13.125.80.112/member/kakaoLogin">
					<img src="/resources/kakao_login_large_wide.png">
				</a>
			</div>
		</div>
	</div>
	<script>
		//휴대폰 번호 형식에서 벗어난 문자를 잡는 정규표현식
		let replacePhone = /[^0-9]/;

		//비밀번호 기본 형식에서 벗어난 문자를 잡는 정규표현식
		//비번 기본 형식: ^[A-Z a-z 0-9 ! @ %]
		let replacePW = /^[가-힣 # $ ^ & * ( ) = - ]$/;

		$(document).ready(function() {

			//디폴트로 로그인 버튼 누르지 못하게 하기
			$("#login_btn").attr("disabled", true);

			//휴대폰 번호 숫자 외 입력 제한
			$("#phone").on("focusout", function() {
				let x = $(this).val();
				if (x.length > 0) {
					if (x.match(replacePhone)) {
						x = x.replace(replacePhone, "");
					}
					$(this).val(x);
				}
				//아예 입력부터 제한
			}).on("input", function() {
				$(this).val($(this).val().replace(replacePhone, ""));
			});

			//비밀번호 숫자, 영어 및 특수문자 외 입력 제한
			$("#pw").on("focusout", function() {
				let x = $(this).val();
				if (x.length > 0) {
					if (x.match(replacePW)) {
						x = x.replace(replacePW, "");
					}
					$(this).val(x);
				}
				//아예 입력부터 제한
			}).on("input", function() {
				$(this).val($(this).val().replace(replacePW, ""));
			});

			//해당 값들을 넣지 않고 post했을 때
			$("#phone, #pw").on("keyup", function() {
				let phone = $("#phone").val();
				let pw = $("#pw").val();
				let phoneRegex = /^01\d{1}\d{3,4}\d{4}$/;

				if (phone == "" || pw == "" || !phoneRegex.test(phone)) {
					//비어 있거나 유효하지 못한 값을 넣으면 로그인 버튼 아예 못 누름
					$("#login_btn").attr("disabled", true);
					return;
					//유효한 값이 들어 있으면 로그인 버튼 누르게 해줌.
				} else {
					$("#login_btn").attr("disabled", false);
					return;
				}

			});
			
			//로그인 버튼 클릭시 확인
			$("#login_btn").on("click", function() {
				login();

			});
			
			//엔터키 눌렀을 때 로그인 확인
			$(document).on("keydown",function(key){
				if(key.keyCode == 13){
					login();
				}
			});

		});
		
		function login(){
			
			let phone = $("#phone").val();
			let pw = $("#pw").val();

			$.ajax({ //페이지 이동 없이 값을 얻어 냄
				url : "/member/login",
				data : {
					"phone" : phone,
					"pw" : pw
				}

			}).done(function(resp) {

				console.log(resp);

				if (resp == false) {//휴대번호 및 비번이 존재하지 않을 때,
					alert("휴대폰 번호 혹은 비밀번호가 존재하지 않습니다.");
					$('#phone').val('');
					$('#pw').val('');
				} else if (resp == true) { //휴대번호 및 비번이 존재할 때,
					location.href = "/";
				}
			}).fail(function() {
				alert("요청 실패");
			});
			
		}
		
		
	</script>
</body>
</html>