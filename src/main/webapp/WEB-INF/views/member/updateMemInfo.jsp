<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<head profile="http://www.w3.org/2005/10/profile">
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
		<script
				src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script
				src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
		<link rel="stylesheet"
			  href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
		<link rel="stylesheet"
			  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
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
			/* div {
               border: 1px solid black;
            } */
			.container {
				margin: auto;
				overflow: hidden;
				width: 978px;
			}
			button:hover {
				cursor: pointer;
			}
			/* header */
			.header {
				height: 150px;
				overflow: hidden;
			}
			/* logo */
			.logo {
				float: left;
				position: relative;
				height: 100%;
				width: 55%;
			}
			#logoImg {
				height: 50%;
				position: absolute;
				bottom: 0px;
				left: 0px;
			}
			#logoImg:hover {
				cursor: pointer;
			}
			/* search */
			.search {
				float: left;
				position: relative;
				height: 100%;
				width: 25%;
			}
			.searchBox {
				position: absolute;
				bottom: 5px;
				left: 0px;
				overflow: hidden;
				height: 40px;
				width: 100%;
				border: none;
				border-radius: 5px;
				box-shadow: 2px 2px 2px 2px #80808050;
			}
			.searchTxt {
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
			.searchBtn {
				position: absolute;
				right: 0px;
				line-height: 100px;
				border: none;
				background-color: #ffffff;
				color: #5397fc50;
				width: 40px;
				height: 40px;
				border-radius: 50%;
				display: flex;
				align-items: center;
				justify-content: center;
			}
			/* member */
			.member {
				float: left;
				position: relative;
				width: 20%;
				height: 100%;
			}
			/* icon */
			.iconBox {
				position: absolute;
				bottom: 0px;
				right: 0px;
			}
			span.size-40 {
				font-size: 40px;
				color: black;
				font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 40
			}
			span, #logoImg:hover {
				cursor: pointer;
			}
			/* headerHr */
			#headerHr {
				display: block;
				height: 1px;
				border: 0;
				border-top: 1px solid rgb(216, 216, 216);
				margin-top: 15px;
				margin-bottom: 15px;
			}
			/* header */
			/* login */
			.signBox {
				display: flex;
				justify-content: flex-end;
				text-align-last: end;
			}
			.signBox>a {
				margin: 5px;
				text-decoration: none;
				text-underline-offset: 5px;
				color: black;
			}
			.signBox>a:hover {
				color: #5397fc;
			}
			#login {
				width: 100px;
				text-align: right;
			}
			#nick {
				text-decoration: none;
				width: 100px;
			}
			#nick:hover {
				color: black;
				cursor: default;
			}
			.login_form {
				margin-top: 200px;
			}
			/* navi */
			.navi {
				width: 100%;
				height: 50px;
			}
			/* body */
			.body {
				width: 700px;
				margin: auto;
				overflow: hidden;
			}
			.body-hr {
				margin-bottom: 15px;
				border-top: 1px solid rgb(216, 216, 216);
			}
			.body-top {
				height: 50px;
				text-align: center;
				font-size: 33px;
			}
			.prof_img {
				padding-bottom: 20px;
				text-align: center;
			}
			#profile {
				border-radius: 50%;
				width: 120px;
				height: 120px;
				border: 1px solid #d5d5d5;
				box-shadow: 3px 3px #80808050;
			}
			.body-title-mem {
				height: 50px;
				padding-top: 25px;
				font-size: 20px;
				color: #5397fc;
			}
			.body-title {
				height: 70px;
				padding-top: 45px;
				font-size: 20px;
				color: #5397fc;
			}
			.info {
				overflow: hidden;
			}
			.body-left {
				float: left;
				width: 20%;
				height: 33px;
				padding-bottom: 15px;
				font-weight: bold;
				padding-bottom: 5px;
				line-height: 30px;
			}
			.body-right {
				width: 80%;
				height: 33px;
				float: right;
				padding-bottom: 10px;
			}
			.body-btn-div {
				text-align: center;
			}
			.body-btn {
				width: 180px;
				height: 40px;
				margin-top: 50px;
				color: #ffffff;
				border: none;
				border-radius: 5px;
				background-color: #5397fc;
			}
			.mem_info {
				margin-bottom: 50px;
			}
			.input-file-button {
				padding: 6px 25px;
				border-radius: 4px;
				background-color: white;
				border: 1px solid #5397fc;
				color: #5397fc;
				cursor: pointer;
				position: relative;
				left: 310px;
			}
			.input, .pw_input {
				border-radius: 4px;
				border: 1px solid #d5d5d5;
				height: 33px;
			}
			.body_btn, input[type=button] {
				border: 1px solid #5397fc;
				outline: none;
				box-shadow: 3px 3px #80808050;
				background-color: white;
				height: 30px;
				border-radius: 8px;
				color: #5397fc;
			}
			.btns {
				margin-bottom: 10px;
				position: relative;
				top: 5px;
				left: 600px;
			}
			#input_btn {
				width: 10%; /
			margin-top: 10px;
			}
			.must {
				color: red;
				cursor: default;
			}
			.hidden {
				color: white;
				cursor: default;
			}
			#pw_result, #n_result, #nk_result, #email_result, #check_pw_result {
				font-size: x-small;
			}
			/* footer */
			.footerHr {
				display: block;
				height: 1px;
				border: 0;
				border-top: 1px solid rgb(216, 216, 216);
				margin-top: 50px;
				margin-bottom: 15px;
				opacity: inherit;
			}
			.footer {
				margin: 5px;
			}
			.f_header {
				display: inline-flex;
				margin-top: 10px;
			}
			.f_header>a>img {
				width: 200px;
			}
			.sns_icon {
				position: relative;
				top: 1px;
				left: 595px;
			}
			.sns_icon>a>img {
				height: 20px;
			}
			.business_info {
				margin-top: 30px;
			}
			#business_info_title {
				font-size: x-small;
				color: #808080d6;
			}
			.business_info>span {
				margin-top: 5px;
			}
			.f_intro {
				margin-top: 15px;
				margin-bottom: 20px;
				font-size: small;
			}
			.f_intro>span {
				color: #4d4b4bc1;
			}
			.f_line {
				color: #808080d6;
			}
			.business_info {
				margin-top: 20px;
			}
			#business_info_text {
				margin-top: 10px;
				font-size: x-small;
				color: #808080d6;
			}
			.inline_info {
				display: inline-flex;
			}
			#arrow_down2, #arrow_up2 {
				position: relative;
				bottom: 6px;
				color: #808080d6;
			}
			#arrow_up2 {
				display: none;
			}
			.sns_icon>a>img {
				width: 40px;
				height: 40px;
			}
			.copyright {
				margin-top: 5px;
				font-size: x-small;
			}
		</style>
	</head>
<body>
<div class="container">

	<div class="header">
		<div class="logo">
			<a href="/"><img src="/resources/bookday_logotitle.png"
							 id="logoImg"></a>
		</div>
		<div class="search">
			<div class="searchBox">
				<form action="/search/toSearch" id="search" method="post">
					<input class="searchTxt" type="text" placeholder="???????????? ????????? ?????????"
						   id="searchWord" name="searchWord">
					<button class="searchBtn" type="submit">
						<span class="material-symbols-outlined"> search </span>
					</button>
				</form>
			</div>
		</div>
		<div class="member">
			<div class="signBox">
				<c:choose>
					<c:when test="${empty loginID}">
						<a href="/member/toLogin"><p class="user" id="login">?????????</p></a>
						<a href="/member/toSignup"><p class="user" id="signup">????????????</p></a>
					</c:when>
					<c:otherwise>
						<a id="nick"><p class="user" id="user">${nickname}???</p></a>
						<a href="/member/logout"><p class="user" id="logout">????????????</p></a>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="iconBox">
				<span class="material-symbols-outlined size-40" id="notifications">notifications</span>
				<span class="material-symbols-outlined size-40" id="bookbag">shopping_bag</span>
				<span class="material-symbols-outlined size-40" id="bookshelves">shelves</span>
				<span class="material-symbols-outlined size-40" id="mypage">person</span>
			</div>
		</div>
	</div>

	<hr id="headerHr">
	<div class="navi"></div>

	<div class="body">

		<form action="/member/updateMemInfo" method="post"
			  enctype="multipart/form-data" id="updateMemInfo">

			<div class="prof_img">
				<img src="/resources/profile/${dto.sysprofname}" id="profile" />
			</div>

			<!-- ?????? dto ??? ???????????? ????????? ????????? ??? ?????? ???????????? ?????? -->
			<input type="hidden" name="sys" value="${dto.sysprofname}">
			<input type="hidden" name="ori" value="${dto.oriprofname}">
			<label class="input-file-button" for="img_upload"
				   id="input_file_btn">??????</label> <input type="file" name="prof_img"
														 class="input_file" id="img_upload"
														 accept=".png,.jpg,.jpeg,.gif,.JPG" style="display: none" }/>

			<div class="mem_info">
				<div class="body-title-mem">????????????</div>
				<hr class="body-hr">

				<div class="body-left">
					<span class="must">*</span>??????
				</div>
				<div class="body-right">
					<input type="text" name="name" value="${dto.name}" class="input"
						   id="name" maxlength="5" required> <span id="n_result"></span>
				</div>

				<div class="body-left">
					<span class="must">*</span>?????????
				</div>
				<div class="body-right">
					<input type="text" name="nickname" value="${dto.nickname}"
						   class="input" id="nickname" minlength="2" maxlength="5" required> <span
						id="nk_result"></span>
				</div>
				<div class="body-left">
					<span class="must">*</span>????????? ??????
				</div>
				<div class="body-right">
					<input type="text" name="phone" value="${dto.phone}" class="input"
						   id="phone" maxlength="11" required>
					<button type="button" class="body_btn" id="phone_btn">??????</button>

				</div>
				<div class="body-left" id="code">
					<span class="hidden">*</span>????????????
				</div>
				<div class="body-right">
					<input type="text" name="check_phone" placeholder="????????????"
						   id="verifi_code" class="input">
					<button type="button" class="body_btn" id="check_btn">??????</button>
				</div>

				<div class="body-left">
					<span class="must">*</span>?????????
				</div>
				<div class="body-right">
					<input type="text" name="email" value="${dto.email}" class="input"
						   id="email"> <span id="email_result"></span>
				</div>

				<div class="body-left">
					<span class="must">*</span>????????????
				</div>
				<div class="body-right">

					<input type="password" name="pw" placeholder="??? ????????????"
						   class="pw_input" id="pw" maxlength="16"> <input
						type="password" name="new_pw_check" placeholder="??? ???????????? ??????"
						class="pw_input" id="check_pw" maxlength="16"> <span
						id="pw_result"></span> <span id="check_pw_result"></span>
				</div>

				<div class="body-left">
					<span class="hidden">*</span>??????
				</div>
				<div class="body-right">
					<input type="text" id="address1" name="address1"
						   value="${dto.address1}" placeholder="????????? ??????" class="input">
					<button type="button" id="search_btn" class="body_btn"
							onclick="execDaumPostcode()">??????</button>
				</div>
				<div class="body-left">
					<span class="hidden">*</span>????????????
				</div>
				<div class="body-right">
					<input type="text" name="address2" value="${dto.address2}"
						   placeholder="?????? ??????" class="input">
				</div>
				<div class="body-left">
					<span class="hidden">*</span>????????????
				</div>
				<div class="body-right">
					<input type="text" name="postcode" value="${dto.postcode}"
						   placeholder="????????????" class="input" id="postcode">
				</div>

			</div>
			<hr style="border-top: 1px rgb(216, 216, 216);">
			<div class="btns">
				<button type="button" class="body_btn" id="fin_btn">??????</button>
				<button type="button" class="body_btn" id="cancel_btn">??????</button>
			</div>
		</form>
	</div>
	<!-- body -->

	<div class="footer">
		<hr class="footerHr">
		<div class="f_header">
			<a href="/"><img src="/resources/bookday_logotitle.png"></a>

			<div class="sns_icon">
				<a href="#"><img src="/resources/instagram.png" class="sns"></a>
				<a href="#"><img src="/resources/facebook.png" class="sns"></a>
				<a href="#"><img src="/resources/twitter_black.png" class="sns"></a>
				<a href="#"><img src="/resources/youtube.png" class="sns"></a>
			</div>

		</div>
		<div class="business_info">
			<div class="inline_info">
				<div id="business_info_title">????????? ??????</div>
				<span class="arrow_icon material-symbols-outlined" id="arrow_down2">keyboard_arrow_down</span>
				<span class="arrow_icon material-symbols-outlined" id="arrow_up2">keyboard_arrow_up</span>
			</div>

			<div id="business_info_text">
				<span>????????? ????????? </span> <span> | </span> <span> ????????? ????????????
						01-20-22015</span>
				<p>?????? ??????????????? ?????? ???????????? 120 ???????????? ??????(??? ????????????) 3F</p>
				<span>???????????? 1544-9970 </span> <span> | </span> <span> ?????????
						help@bookday.com</span>
			</div>
		</div>

		<div class="f_intro">
			<span>????????????</span> <span class="f_line">|</span> <span>????????????</span> <span
				class="f_line">|</span> <span>????????????????????????</span> <span class="f_line">|</span>
			<span>?????????????????????</span> <span class="f_line">|</span> <span>??????
					??????</span>
		</div>
		<p class="copyright">Copyright ?? 2022 ????????? All Rights Reserved.</p>
		<!-- <p class="copyright">??BOOKDAY Corp.</p> -->
	</div>
</div>
<script>



	$("#logo_img").on("click", function() {
		location.href = "/";
	})
	$("#searchword").on("keydown", function(e) {
		if (e.keyCode == 13) {
			$("#search").submit();
		}
	})
	$("#notifications").on("click", function() {
		let today = new Date();
		let hours = ('0' + today.getHours()).slice(-2);
		let minutes = ('0' + today.getMinutes()).slice(-2);
		let seconds = ('0' + today.getSeconds()).slice(-2);
		let timeString = hours + ':' + minutes  + ':' + seconds;
		alert("?????? ????????? "+timeString);
	})
	$("#bookbag").on("click", function() {
		if(${loginID == null}) {
			location.href = "/member/toLogin";
		}else {
			location.href = "/delivery/selectBookbagListById";
		}
	})
	$("#bookshelves").on("click", function() {
		location.href = "/bookshelves/selectBookshelvesListById";
	})
	$("#mypage").on("click", function() {
		if (${loginID == null}) {
			location.href = "/member/tologin";
			return false;
		}else {
			location.href = "/member/toMypage";
		}
	})

	//????????? ??????
	let nameRegex=/[???-???]{2,5}/;
	let nicknameRegex=/[???-??? a-z A-Z 0-9]{2,5}/;
	let phoneRegex=/^01\d{1}\d{3,4}\d{4}$/;
	let emailRegex=/^[a-z 0-9 A-Z]{3,12}@[A-Z a-z]{3,7}(.[a-zA-Z]{2,3})?.[a-zA-Z]{2,3}$/;
	let pwRegex=/^[A-Z a-z 0-9 ! @ $ % -]{8,16}$/;

	//????????? ?????? ??????
	$("#nickname").on("input",function(){
		let nickname=$("#nickname").val();
		//????????? ????????? ??????
		if(!nicknameRegex.test(nickname) && nickname != ""){
			$("#nk_result").html("?????? 2??? ??????");
			$("#nk_result").css("color","red");
			// $("#fin_btn").attr("disabled", true);
		}else if(nickname == ""){
			$("#nk_result").html("");
		}else{
			//????????? ?????? ??????
			$.ajax({
				url:"/member/checkByNickname",
				data:{"nickname":nickname}

			}).done(function(resp){

				console.log(resp);

				if(resp == "true"){//???????????? ??????????????? ????????? ??? ?????? ??????
					$("#nk_result").html("?????? ?????? ?????? ??????????????????.");
					$("#nk_result").css("color","red");
					//$("#fin_btn").attr("disabled",true);

				}else{ //???????????? ???????????? ???????????? ????????? ??? ?????? ??????
					$("#nk_result").html("?????? ????????? ??????????????????.");
					$("#nk_result").css("color","#5397fc");
					//$("#fin_btn").attr("disabled",false);

				}

			}) //???????????? ?????? ?????? ??????

		}
	});

	$("#pw,#check_pw").on("keyup",function(){
		let pw=$("#pw").val();
		let check_pw=$("#check_pw").val();
		//???????????? ????????? ?????? ??? ?????? ??????
		if(!pwRegex.test(pw) && pw != ""){
			$("#pw_result").css("color","red");
			$("#pw_result").html("???????????? ?????? ?????????????????????.");
			// $("#fin_btn").attr("disabled", true);
		}else if(pw == ""){
			$("#pw_result").html("");
		}else{
			$("#pw_result").css("color","#5397fc");
			$("#pw_result").html("?????? ????????? ?????????????????????.");
			//?????? ??????
			if($("#pw").val()==$("#check_pw").val()){
				$("#pw_result").css("color","#5397fc");
				$("#pw_result").html("??????????????? ???????????????.");
			}else{
				$("#pw_result").css("color","red");
				$("#pw_result").html("??????????????? ???????????? ????????????.");
				//$("#fin_btn").attr("disabled", true);

			}
		}
	});

	//?????????
	$("#email").on("input",function(){
		let email=$("#email").val();
		//????????? ????????? ??????
		if(!emailRegex.test(email) && email != ""){
			$("#email_result").css("color","red");
			$("#email_result").html("???????????? ?????? ??????????????????.");
			//  $("#fin_btn").attr("disabled", true);
		}else if(email == ""){
			$("#email_result").css("border-color","#d5d5d5");
			//  $("#fin_btn").attr("disabled", true);
		}else{
			$("#email_result").css("color","#5397fc");
			$("#email_result").html("?????? ????????? ??????????????????.");

		}

	});


	$("#name").on("input",function(){
		let name= $("#name").val();

		console.log(name);
		//?????? ????????? ??????
		if(!nameRegex.test(name) && name != ""){
			$("#n_result").css("color","red");
			$("#n_result").html("???????????? ?????? ???????????????.");
			//$("#fin_btn").attr("disabled", true);
		}else if(name == ""){
			$("#n_result").html("");
			// $("#fin_btn").attr("disabled", true);
		}else{
			$("#n_result").css("color","#5397fc");
			$("#n_result").html("?????? ????????? ???????????????.");
			//$("#fin_btn").attr("disabled", false);
		}
	});

	//????????? ?????? ?????? ?????????
	$("#phone_btn").on("click", function() {

		let phone=$("#phone").val();

		console.log($("#phone").val());


		if(phone=="" || !phoneRegex.test(phone)){
			alert("????????? ????????? ????????? ??????????????????.");
		}else if(phone == "${dto.phone}"){
			alert("?????? ????????? ????????? ???????????????.");
			return;
		}else{
			alert("??????????????? ?????????????????????.");
			$("#verifi_code,#check_btn").css("display","inline");

			//?????? ?????? ???????????? ????????????
			$.ajax({
				url: "/member/createAuthNum",
				data: {"phone": phone },
				async : false
			}).done(function (resp) {

				//?????? ?????? ????????? ???
				$("#check_btn").on("click",function(){

					let verifi_code=$("#verifi_code").val();

					$.ajax({
						url: "/member/doAuthNumMatch",
						data: {"code": verifi_code}
					}).done(function (resp) {

						console.log(resp);

						//?????? ??? ?????? ?????? & ?????? 2??? ?????? ????????? ?????? ??????
						if(resp == false){
							alert("??????????????? ???????????????.")
						}else{
							alert("??????????????? ????????????.");
							$("#input_btn").attr("disabled", true);
						}
					});
				});
			});
		}
	});


	//?????? ??????
	$("#fin_btn").on("click",function(){

		let pw=$("#pw").val();
		let name=$("#name").val();
		let nickname=$("#nickname").val();
		let phone=$("#phone").val();
		let email=$("#email").val();
		console.log(name+nickname+phone+email+pw+check_pw);

		if(pw=="" || name == "" || nickname == "" || phone == "" || email ==""){

			console.log(name+nickname+phone+email+pw+check_pw);
			alert("???????????? ??????????????????.");
		}else if(!pwRegex.test(pw) || !nameRegex.test(name) || !nicknameRegex.test(nickname) || !emailRegex.test(email) || !phoneRegex.test(phone)){
			alert("????????? ?????? ??????????????????.");
		}else{
			alert("?????????????????????.");
			$("#updateMemInfo").submit();
		}
	});

	//?????? ??????
	$("#cancel_btn").on("click",function(){
		history.back();

	});

	//footer: ????????? ?????? ?????? ??????
	$("#business_info_text").hide();
	$("#business_info_title, #arrow_down2").click(function() {
		$("#business_info_text").slideToggle(200);
		$("#arrow_up2").css("display", "block");
		$("#arrow_down2").css("display", "none");
	});
	$("#arrow_up2").click(function() {
		$("#business_info_text").slideToggle(200);
		$("#arrow_down2").css("display", "block");
		$("#arrow_up2").css("display", "none");
	});



	//???????????? ????????? ??????(api)
	function execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						let roadAddr = data.roadAddress; // ????????? ?????? ??????
						// ??????????????? ?????? ????????? ?????? ????????? ?????????.
						document.getElementById("postcode").value = data.zonecode;
						document.getElementById("address1").value = roadAddr;
					}
				}).open();
	}


	//byte???????????? stream ???????????? string ???????????? ??????
	function fileToBase64(file){
		const reader = new FileReader();
		reader.readAsDataURL(file)
		reader.onload = () => {
			$("#profile").attr("src", reader.result)
			console.dir(reader.result)   // base64
		}
	}
	$("#img_upload").on("change", function(){

		console.log($("#img_upload").val());

		if($("#img_upload").val() == ""){
			$("#profile").attr("src","/resources/profile/basic.png");
			return;
		}

		let ext = $("#img_upload").val().split(".").pop().toLowerCase(); //?????? ???????????? ????????? ??????.
		let accept = [".png", ".jpg",".jpeg",".gif"];
		let result=$.inArray(ext,accept); //????????? ???????????? ????????? ?????? ?????? ?????? ??????????????? 0, ???????????? ???????????? -1??? ??????
		//console.log(result); //accept??? ?????? ???????????? ????????? ??? ????????? ?????? ??? ??????.

		if(result == 1){
			alert("????????? ????????? ?????? ???????????????.");
			$("#img_upload").val(""); //?????? ?????? ??????
		}

		fileToBase64(document.getElementById("img_upload").files[0]);
	});

</script>
</body>
</html>
