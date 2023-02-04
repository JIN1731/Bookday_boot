<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	text-align: center;
}

div {
	/* border: 1px solid black; */
	
}

.container {
	margin: auto;
	margin-top: 170px;
	overflow: hidden;
	width: 978px;
}

.header {
	text-align: center;
}

.title {
	font-size: 35px;
	color: #5397fc;
	padding-top: 20px;
}

.main {
	font-size: 20px;
	padding-bottom: 10px;
}

.btn {
	margin-top: 20px;
	margin-left: 15px;
	width: 130px;
	height: 40px;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	background-color: #5397fc;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<img src="/resources/bookday_logotitle.png">
		</div>
		<div class="body">
			<div class="title">죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</div>
			<br>
			<div class="main">페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.</div>
			<div class="main">주소가 올바른지 다시 한번 확인해 주세요.</div>
			<div class="main">문제가 반복되어 발생하면 고객센터에 문의해 주시기 바랍니다.</div>
			<div class="main">감사합니다.</div>
			<button class="btn" id="home-btn">메인으로</button>
			<button class="btn" id="back-btn">이전페이지</button>
		</div>
	</div>
	<script>
		$("#home-btn").on("click", function() {
			location.href = "/";
		})
		$("#back-btn").on("click", function() {
			history.back();
		})
	</script>
</body>
</html>