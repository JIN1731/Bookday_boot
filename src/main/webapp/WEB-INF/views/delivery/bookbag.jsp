<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookbag</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
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
   right: 40px;
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

#login{
width:100px;
text-align:right;
}

#nick {
	text-decoration: none;
	width:100px;
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
/* 	width: 100%; */
/* 	height: 50px; */
}

/* body */
.body {
	overflow: hidden;
}

.body-span {
	cursor: text;
}

.bookbag-count {
	padding-top: 50px;
	padding-bottom: 15px;
	font-weight: bold;
	font-size: 18px;
	text-shadow: 1px 1px #80808050;
}

.bookbag-top-checkbox-div {
	margin-top: 10px;
	width: 50%;
	float: left;
}

#check-all {
	width: 17px;
	height: 17px;
}

#label {
	position: relative;
	bottom: 4.5px;
	margin-left: 5px;
}

.bookbag-top-btn-div {
	width: 50%;
	float: left;
	text-align: right;
}

.bookbag-top-btn {
	width: 100px;
	height: 30px;
	margin-right: 16px;
	margin-bottom: 10px;
	border-radius: 4px;
	border: 1px solid rgb(194, 193, 193);
	background-color: #ffffff;
}

.body-left {
	width: 70%;
	overflow: hidden;
	float: left;
}

.bookbag-top {
	height: 30px;
	/* 	padding-top: 25px; */
	/* 	padding-left: 15px; */
	padding-right: 18px;
}

.bookbag-main {
	overflow: hidden;
	width: 100%;
	height: 170px;
	margin-top: 15px;
}

.bookbag-main-checkbox {
	float: left;
	width: 5%;
	height: 100%;
	line-height: 150px;
	/* 	padding-left: 15px; */
}

.check {
	width: 17px;
	height: 17px;
}

.book-img-div {
	width: 16%;
	height: 100%;
	float: left;
}

#book-img {
	width: 93px;
	height: 140px;
}

.bookbag-detail-div {
	width: 75%;
	height: 100%;
	float: left;
}

.bookbag-detail-text {
	height: 60%;
}

.bookbag-detail-btn {
	height: 40%;
	padding-top: 8px;
}

.detail-btn {
	height: 30px;
	margin-right: 5px;
	border: 1px solid rgb(194, 193, 193);
	border-radius: 4px;
	background-color: #ffffff;
	border: 1px solid rgb(194, 193, 193);
}

.body-right {
	width: 27%;
	overflow: hidden;
	float: right;
}

.sub-rental-info {
	border: 1px solid rgb(194, 193, 193);
	border-radius: 5px;
}

.rental-detail {
	padding-left: 15px;
	padding-top: 18px;
	padding-bottom: 18px;
	padding-right: 15px;
}

.address {
	padding-left: 15px;
	padding-top: 18px;
	padding-bottom: 18px;
	padding-right: 15px;
}

.rental-detail-title, .address-title {
	font-weight: 600;
	font-size: 17px;
	color: #5397fc;
	text-align: center;
}

.address-btn-div {
	overflow: hidden;
	text-align: center;
}

.address-btn {
	width: 170px;
	height: 35px;
	text-align: center;
	border-radius: 4px;
	border: 1px solid rgb(194, 193, 193);
	background-color: #ffffff;
	color: #5397fc;
	border-radius: 4px;
}

.sub-rental-btn-div {
	height: 60px;
}

.sub-rental-btn {
	margin-top: 10px;
	width: 100%;
	height: 45px;
	color: #ffffff;
	border: none;
	border-radius: 4px;
	background-color: #5397fc;
}

/* footer */
.footer {
	margin: 5px;
}

.footerHr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid rgb(216, 216, 216);
	margin-top: 50px;
	margin-bottom: 15px;
	opacity: inherit;
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
	height: 50px;
	width:200px;
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

/* body */
</style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();"
	onunload="">
	<div class="container">
		<div class="header">
			<div class="logo">
				<img src="/resources/bookday_logotitle.png" id="logoImg">
			</div>
			<div class="search">
				<div class="searchBox">
					<form action="/search/toSearch" id="search" method="post">
						<input class="searchTxt" type="text" placeholder="검색어를 입력해 주세요"
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
							<a href="/member/toLogin"><p class="user" id="login">로그인</p></a>
							<a href="/member/toSignup"><p class="user" id="signup">회원가입</p></a>
						</c:when>
						<c:otherwise>
							<a id="nick"><p class="user" id="user">${nickname}님</p></a>
							<a href="/member/logout"><p class="user" id="logout">로그아웃</p></a>
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
			<c:choose>
				<c:when test="${fn:length(list) == 0}">
					<div class="body-top">
						<div class="bookbag-count">책가방 (${fn:length(list)})</div>
					</div>
					<div class="body-left">
						<div class="bookbag-top"></div>
						<div class="bookbag-main"
							style="text-align: center; line-height: 130px;">책가방에 담긴 작품이
							없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="body-top">
						<div class="bookbag-count">책가방 (${fn:length(list)})</div>
					</div>
					<div class="body-left">
						<div class="bookbag-top">
							<div class="bookbag-top-checkbox-div">
								<input type="checkbox" id="check-all" checked> <label
									id="label">전체 선택</label>
							</div>
							<div class="bookbag-top-btn-div">
								<button class="bookbag-top-btn" id="select-delete">선택
									삭제</button>
							</div>
						</div>
						<hr
							style="width: 95%; border-top: 1px solid rgb(216, 216, 216); text-align: left; margin-left: 0px;">
						<c:forEach var="bookbag" items="${list}">
							<div class="bookbag-main">
								<div class="bookbag-main-checkbox">
									<input type="checkbox" class="check" checked name="checkbox"
										value="${bookbag.bookbag_seq }">
								</div>
								<div class="book-img-div">
									<a href="/book/selectBookinfo?b_isbn=${bookbag.b_isbn }"><img
										src="${bookbag.b_img_url }" id="book-img"></a>
								</div>
								<div class="bookbag-detail-div">
									<div class="bookbag-detail-text">
										<div>${bookbag.b_title }</div>
										<div style="font-size: 14px; padding-top: 10px;">${bookbag.b_writer }</div>
										<input type="hidden" value="${bookbag.b_isbn }"> <input
											type="hidden" value="${bookbag.b_genre }">
									</div>
									<div class="bookbag-detail-btn">
										<button class="detail-btn" type="button"
											id="w${bookbag.bookbag_seq }" style="width: 140px;">위시리스트에
											담기</button>
										<button class="detail-btn" type="button"
											id="d${bookbag.bookbag_seq }" style="width: 60px;">삭제</button>
									</div>
								</div>
							</div>
							<hr
								style="width: 95%; margin-top: -14px; border-top: 1px solid rgb(216, 216, 216); text-align: left; margin-left: 0px;">

							<script>
								// 삭제 버튼 기능
								$(function() {
									$("#d${bookbag.bookbag_seq }").on("click",function() {
										if (confirm("<${bookbag.b_title }> 작품을 삭제하시겠습니까?")) {
											location.href = "/delivery/deleteBookbagBySeq?bookbag_seq="+ ${bookbag.bookbag_seq}
											alert("삭제되었습니다.");
									      	location.reload();
										}
									});
								})
								
								// 위시리시트에 담기 버튼 기능
								$(function () {
						            $("#w${bookbag.bookbag_seq }").on("click", function () {
						                $.ajax({
						                    url: "/delivery/selectWishlistByIdBisbn",
						                    data: {
						                        "id": "${loginID }",
						                        "b_isbn": "${bookbag.b_isbn }"
						                    }, success: function (result) {
						                        if (result == "false") {
						                            alert("이미 위시리스트에 있는 책입니다.");
						                        } else {
						                            $.ajax({
						                                url: "/delivery/insertWishlist",
						                                data: {
						                                    "id": "${loginID }",
						                                    "b_isbn": "${bookbag.b_isbn }",
						                                    "b_img_url": "${bookbag.b_img_url }",
						                                    "b_title": "${bookbag.b_title }",
						                                    "b_writer": "${bookbag.b_writer }",
						                                    "b_genre": "${bookbag.b_genre }"
						                                }, success: function (resp) {
						                                    alert("위시리스트에 담았습니다.");
						                                }
						                            });
						                        }
						                    }
						                });
						           	});
					        	});
							</script>
						</c:forEach>
					</div>
					<script>
					// 체크박스 기능
				    $(document).on('click', '#check-all', function () {
				        if ($('#check-all').is(':checked')) {
				            $('.check').prop('checked', true);
				        } else {
				            $('.check').prop('checked', false);
				        }
				        let checkCount = $('input[class=check]:checked').length;
				        document.getElementById("check-count-result").innerText = checkCount;
				    });
				    
					$(document).on('click', '.check', function () {
				        if ($('input[class=check]:checked').length == $('.check').length) {
				            $('#check-all').prop('checked', true);
				        } else {
				            $('#check-all').prop('checked', false);
				        }
				        let checkCount = $('input[class=check]:checked').length;
				        document.getElementById("check-count-result").innerText = checkCount;
				    });
					
					// 선택 삭제 버튼 기능
					$("#select-delete").on("click", function() {
						let checkBoxArr = [];
						  $("input:checkbox[name='checkbox']:checked").each(function() {
						  	checkBoxArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
						})
						
						if(checkBoxArr.length == 0) {
							alert("선택된 책이 없습니다.");
						}else {
							if (confirm("정말 삭제하시겠습니까?")) {
							  $.ajax({
							      url    : "/delivery/deleteAllBookbagBySeq",
							      type  : "POST",
							      traditional : true,
							      data: {
							      "checkBoxArr" : checkBoxArr // bookbag_seq 값을 가지고 있음
							      },
							      success: function(result){
							      	alert("삭제되었습니다.");
							      	location.reload();
							      }
							   });
							}
						}
					})
					</script>
				</c:otherwise>
			</c:choose>

			<c:choose>
				<c:when test="${dto.grade eq '미구독'}">
					<div class="body-right">
						<div class="sub-rental-info"
							style="height: 170px; text-align: center; line-height: 170px;">
							종이책 구독 서비스를 이용해보세요!</div>
						<div class="sub-rental-btn-div">
							<button class="sub-rental-btn" id="sub-btn">구독하기</button>
						</div>
					</div>
					<script>
					// 구독하기 버튼 기능
					$("#sub-btn").on("click", function() {
						location.href = "/delivery/toPayment";
					})
					</script>
				</c:when>
				<c:otherwise>
					<c:set var="arrivalDate"
						value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000 * 2)%>" />
					<c:set var="returnDate"
						value="<%=new Date(new Date().getTime() + (60 * 60 * 24 * 1000 * 12))%>" />
					<div class="body-right">
						<div class="sub-rental-info">
							<div class="rental-detail">
								<div class="rental-detail-title">대여 내역</div>
								<br>
								<div style="padding-bottom: 9px;">
									<span class="body-span">대여할 책</span> : <span class="body-span"
										id="check-count-result" style="font-weight: bold;"></span> 권
								</div>
								<div style="padding-bottom: 9px;">
									<span class="body-span">남은 배송 횟수</span> : <span
										class="body-span" style="font-weight: bold;">${sdto.delivery_count }</span>
									번
								</div>
								<div style="padding-bottom: 9px;">
									<span class="body-span">남은 대여 권수</span> : <span
										class="body-span" style="font-weight: bold;">${sdto.rental_count }</span>
									권
								</div>
								<div style="padding-bottom: 9px;">
									<span class="body-span">도착예정일</span> : <span class="body-span"
										style="font-weight: bold;"><fmt:formatDate
											value="${arrivalDate}" pattern="yyyy-MM-dd(E)" /></span>
								</div>
								<div>
									<span class="body-span">반납일</span> : <span class="body-span"
										style="font-weight: bold;"><fmt:formatDate
											value="${returnDate}" pattern="yyyy-MM-dd(E)" /></span>
								</div>
							</div>
							<hr
								style="margin-top: 0px; margin-bottom: 0px; width: 92%; border-top: 1px solid rgb(216, 216, 216);">
							<div class="address">
								<div class="address-title">배송지 정보</div>
								<br>
								<div style="padding-bottom: 5px; font-weight: bold;">우편번호</div>
								<div style="padding-bottom: 10px; font-size: 14px;">${dto.postcode }</div>
								<div style="padding-bottom: 5px; font-weight: bold;">주소</div>
								<div style="padding-bottom: 10px; font-size: 14px;">${dto.address1 }</div>
								<div style="padding-bottom: 5px; font-weight: bold;">상세주소</div>
								<div style="padding-bottom: 10px; font-size: 14px;">${dto.address2 }</div>
								<div style="padding-bottom: 5px; font-weight: bold;">받으실 분</div>
								<div style="padding-bottom: 10px; font-size: 14px;">${dto.reciver }</div>
								<div style="padding-bottom: 5px; font-weight: bold;">휴대폰
									번호</div>
								<div style="font-size: 15px;">${dto.reciver_phone }</div>
								<br>
								<div class="address-btn-div">
									<c:choose>
										<c:when test="${dto.postcode eq null}">
											<button class="address-btn">주소검색</button>
										</c:when>
										<c:otherwise>
											<button class="address-btn">주소변경</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="sub-rental-btn-div">
							<button class="sub-rental-btn" id="rental-btn">대여하기</button>
						</div>
					</div>
					<script>
					// 체크박스 카운트 기능
					let checkCount = $('input[class=check]:checked').length;
					console.log(checkCount);
				    document.getElementById("check-count-result").innerText = checkCount;
				    
					// 주소검색, 주소변경 버튼 기능
					$(".address-btn").on("click", function() {
						window.open("/delivery/toAddressInput", "_blank", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=500, height=500, left=500, top=150");
					})
					
					// 대여하기 버튼 기능
					$("#rental-btn").on("click", function() {
						if(${sdto.delivery_count < 1}) {
							alert("구독 기간 내 신청 가능한 배송 횟수를 모두 사용하였습니다.");
						}else if(${sdto.rental_count < 1}) {
							alert("구독 기간 내 대여 가능한 권수를 초과하였습니다.");
						}else if(${sdto.rental_count } < $("#check-count-result").text()) {
							alert("구독 기간 내 대여 가능한 권수를 초과하였습니다.");
						}else if(${fn:length(list) == 0}) {
							alert("대여할 책이 없습니다.");
						}else if (${dto.postcode eq null}) {
							alert("배송지 정보를 입력해주세요.");
						}else if($("#check-count-result").text() == 0) {
							alert("대여할 책을 선택해주세요.");
						}else {
							 if(confirm("대여하시겠습니까?")){
								 
								// 대여한 책 대여테이블에 입력 후 책가방테이블에서 삭제
								let checkBoxArr = [];
								  $("input:checkbox[name='checkbox']:checked").each(function() {
								  	checkBoxArr.push($(this).val()); // 체크된 것만 값을 뽑아서 배열에 push
								})
								$.ajax({
								      url    : "/delivery/insertRentalAfterdeleteBookbagBySeq",
								      type  : "POST",
								      traditional : true,
								      data: {
								      "checkBoxArr" : checkBoxArr // bookbag_seq 값을 가지고 있음
								      },
								      success: function(){
								    	  location.href = "/delivery/toRentalCompleted";
								      }
								   });
								  
								  // 월 구독 회원 남은 배송 횟수, 남은 대여 권수 계산
								  let rentalCountCal = ${sdto.rental_count } - $("#check-count-result").text();
								  
								  $.ajax({
								      url    : "/delivery/updateMonthSubMemberById",
								      data: {
								      "id" : "${loginID }",
								      "rental_count" : rentalCountCal
								      }
								 });
							 } 
						}
					})
					</script>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="footer">
			<hr class="footerHr">
			<div class="f_header">
				<a href="/"><img src="/resources/bookday_logotitle.png"></a>

				<div class="sns_icon">
					<a href="#"><img src="/resources/instagram.png" id="insta"></a>
					<a href="#"><img src="/resources/facebook.png" id="facebook"></a>
					<a href="#"><img src="/resources/twitter_black.png" id="twiter"></a>
					<a href="#"><img src="/resources/youtube.png" id="youtube"></a>
				</div>

			</div>
			<div class="business_info">
				<div class="inline_info">
					<div id="business_info_title">사업자 정보</div>
					<span class="arrow_icon material-symbols-outlined" id="arrow_down2">keyboard_arrow_down</span>
					<span class="arrow_icon material-symbols-outlined" id="arrow_up2">keyboard_arrow_up</span>
				</div>

				<div id="business_info_text">
					<span>대표자 성태조 </span><span>|</span><span> 사업자 등록번호
						01-20-22015</span>
					<p>주소 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F</p>
					<span>대표전화 1544-9970 </span><span>|</span><span> 이메일
						help@bookday.com</span>
				</div>
			</div>

			<div class="f_intro">
				<span>회사소개</span> <span class="f_line">|</span> <span>이용약관</span> <span
					class="f_line">|</span> <span>개인정보처리방침</span> <span class="f_line">|</span>
				<span>청소년보호정책</span> <span class="f_line">|</span> <span>제휴
					문의</span>
			</div>
			<p class="copyright">Copyright © 2022 책하루 All Rights Reserved.</p>
			<!--  <p class="copyright">©BOOKDAY Corp.</p> -->
		</div>
	</div>
	<script>
		// 대여완료페이지에서 뒤로가기 막기 기능
		window.history.forward(); function noBack(){ 
		  window.history.forward();
		}
		
		$("#logoImg").on("click", function() {
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
			 alert("현재 시간은 "+timeString);
		})
		$("#bookbag").on("click", function() {
			location.href = "/delivery/selectBookbagListById";
		})
		$("#bookshelves").on("click", function() {
			location.href = "/bookshelves/selectBookshelvesListById";
		})
		 $("#mypage").on("click", function() {
         if (${loginID == null}) {
            location.href = "/member/toLogin";
            return false;
         }else {
         location.href = "/member/toMypage";
         }
      })
      
       //footer: 사업자 정보 토글 기능
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
	</script>
</body>
</html>