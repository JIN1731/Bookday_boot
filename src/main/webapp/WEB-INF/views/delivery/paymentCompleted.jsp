<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Completed</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
	text-align: center;
	font-weight: bold;
	font-family: 'NanumSquareNeo-Variable';
}

div {
	/* border: 1px solid black; */
	
}

.container {
	margin: auto;
}

.logo-img {
	padding-bottom: 30px;
}

#logo-img {
	width: 100px;
	height: auto;
}

.title {
	padding-bottom: 10px;
}

.sub-date {
	padding-bottom: 15px;
}

.btn-div {
	padding-bottom: 15px;
}

.btn {
	height: 35px;
    margin-right: 10px;
	border-radius: 4px;
	border: 1px solid rgb(194, 193, 193);
	background-color: #ffffff;
	color: #5397fc;
}

.btn:hover {
	cursor: pointer;
}
</style>
<body>
	<div class="container">
		<div class="main">
			<div class="logo-img">
				<img src="/resources/bookday_logo_ver1(kor).png" id="logo-img">
			</div>
			<div class="title">30일 구독권이 결제 완료되었습니다!</div>
			<div class="sub-date">구독기간 : ${dto.formedStartDate } ~ ${dto.formedEndDate }</div>
			<div class="btn-div">
				<button class="btn" id="bookbag" style="width: 120px;">책가방으로 이동</button>
				<button class="btn" id="close" style="width: 70px;">닫기</button>
			</div>
		</div>
	</div>
	<script>
		$("#bookbag").on("click", function() {
			opener.location.href="/delivery/selectBookbagListById"; 
			window.close();
		})
		$("#close").on("click", function() {
			opener.parent.location.reload();
			window.close();
		})
		$(window).bind("beforeunload", function (e){
            opener.parent.location.reload();
        });
	</script>
</body>
</html>