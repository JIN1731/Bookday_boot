<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Address Input</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

div {
	/* 	border: 1px solid black; */
	text-align: center;
}

.container {
	margin: auto;
}

.logo-img {
	padding-bottom: 25px;
}

#logo-img {
	width: 130px;
	height: auto;
}

#postcode {
	width: 183px;
	height: 40px;
	border-radius: 4px;
	border: 1px solid rgb(194, 193, 193);
}

.input {
	width: 280px;
	height: 40px;
	border-radius: 4px;
	border: 1px solid rgb(194, 193, 193);
}

#search-btn, #save-btn {
	height: 40px;
	border-radius: 4px;
	border: 1px solid rgb(194, 193, 193);
	background-color: #5397fc;
	color: #ffffff;
}

#search-btn, #save-btn:hover {
	cursor: pointer;
}

</style>
<body>
	<div class="container">
		<div class="header">
			<div class="logo-img">
				<img src="/resources/bookday_logo_ver1(kor).png" id="logo-img">
			</div>
		</div>
		<div class="body">
			<div style="padding-bottom: 13px;">
				<input type="text" id="postcode" name="postcode" placeholder="우편번호"
					readonly value="${dto.postcode }">
				<button type="button" id="search-btn">우편번호 찾기</button>
			</div>
			<div style="padding-bottom: 13px;">
				<input class="input" type="text" id="address1" name="address1"
					placeholder="주소" readonly value="${dto.address1 }">
			</div>
			<div style="padding-bottom: 13px;">
				<input class="input" type="text" id="address2" name="address2"
					placeholder="상세주소" value="${dto.address2 }" maxlength="25">
			</div>
			<div style="padding-bottom: 13px;">
				<input class="input" type="text" id="reciver" name="reciver"
					placeholder="받으실 분" value="${dto.reciver }" maxlength="10">
			</div>
			<div style="padding-bottom: 13px;">
				<input class="input" type="text" id="reciver_phone"
					name="reciver_phone" placeholder="휴대폰 번호" value="${dto.reciver_phone }" maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			<div>
				<button type="button" id="save-btn" style="width: 280px;">저장</button>
			</div>
		</div>
	</div>

	<script>
		document.getElementById("search-btn").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address1").value = data.roadAddress;
						}
					}).open({
				left : '500',
				top : '150'
			});
		}
		document.getElementById("address1").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address1").value = data.roadAddress;
						}
					}).open({
				left : '500',
				top : '150'
			});
		}
		document.getElementById("postcode").onclick = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address1").value = data.roadAddress;
						}
					}).open({
				left : '500',
				top : '150'
			});
		}
		
		$("#logo-img").on("click", function() {
			opener.location.href="/"; 
			window.close();
		})

		$("#save-btn").on("click",function() {
					if ($("#postcode").val() == ""
							|| $("#address1").val() == ""
							|| $("#address2").val() == ""
							|| $("#reciver").val() == ""
							|| $("#reciver_phone").val() == "") {
						alert("정보를 모두 입력해주세요.");
						return false;
					}

					let phone = $("#reciver_phone").val();
					let phoneRegex = /^01\d{1}\d{3,4}\d{4}$/;
					if (!phoneRegex.test(phone)) {
						alert("휴대폰 번호를 정확히 입력해주세요.");
						return false;
					}

					$.ajax({
						url : "/delivery/updateMemberAddressById",
						data : {
							"id" : "${loginID }",
							"postcode" : $("#postcode").val(),
							"address1" : $("#address1").val(),
							"address2" : $("#address2").val(),
							"reciver" : $("#reciver").val(),
							"reciver_phone" : $("#reciver_phone").val()
						},
						success : function(resp) {
							alert("배송지가 저장되었습니다.");
							opener.parent.location.reload();
							window.close();
						}
					});
				})
	</script>
</body>
</html>