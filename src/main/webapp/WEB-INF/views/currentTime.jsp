%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
	text-align:center;
}

.header>img{
width:100px;
}

</style>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
	
<div class="contanier">
		<div class="header">
			<img src="/resources/bookday_logo_ver1(kor).png">
		</div>
	<p>현재 시간은</p>
	<h2><fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh:mm:ss" /></h2>
	<p>입니다.</p>
</div>




	

</body>
</html>