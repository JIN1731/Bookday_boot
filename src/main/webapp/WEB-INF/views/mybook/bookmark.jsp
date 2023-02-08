<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Bookmark</title>
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

		/*     header */
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

		span.size-40 {
			cursor: pointer;
		}

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
			text-decoration-color: #5397fc;
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

		/* headerHr */
		#headerHr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
			margin-top: 15px;
			margin-bottom: 15px;
		}
		/*     header */

		/* navi */
		.navi {
			width: 100%;
			height: 50px;
		}

		/* body */
		.body {
			overflow: hidden;
		}

		/* sidenavi */
		.sideNavi {
			width: 10%;
			float: left;
		}

		ul {
			list-style-type: none;
			margin-top: 20px;
			padding-left: 0px;
		}

		li {
			margin-top: 10px;
			width: 40px;
			height: 40px;
			text-align: center;
			border-radius: 50%;
		}

		span.size-35 {
			line-height: 40px;
			font-size: 35px;
			color: gray;
			font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 35
		}

		.selected {
			background-color: #5397fc50;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		span.size-35 {
			cursor: pointer;
		}

		/* contents */
		.contents {
			width: 90%;
			float: left;
			overflow: hidden;
		}

		/* contentsHeader */
		.contentsHeader {
			width: 100%;
			margin-bottom: 30px;
			font-size: 25px;
			display: flex;
			justify-content: center;
			align-items: flex-end;
		}

		#contentsHeaderImg {
			height: 100px;
			width: 100px;
		}

		#profile {
			border-radius: 50%;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		/* contentsBody */
		.title {
			height: 50px;
			margin-bottom: 20px;
			display: flex;
			align-items: flex-end;
		}

		.titleTxt {
			line-height: 30px;
			font-size: 20px;
		}

		span.size-30 {
			font-size: 30px;
			color: gray;
			font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 30
		}

		/* contentsBodyInsertBookmark */
		.insertBookmark {
			width: 100%;
		}

		.bookmarkBookSearch {
			height: 50px;
			width: 100%;
			display: flex;
			align-items: center;
		}

		.bookmarkBookSearchTitle {
			font-size: 15px;
			margin-right: 10px;
			padding-bottom: 10px;
		}

		.bookmarkBookSearchBox {
			position: relative;
			bottom: 5px;
			overflow: hidden;
			height: 40px;
			width: 244.5px;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		.bookmarkBookSearchTxt {
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

		.bookmarkBookSearchBtn {
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

		.searchResultBookInfo td {
			padding: 15px 15px 15px 15px;
		}

		.bookCover img {
			width: 80px;
			height: 120px;
		}

		.bookInfo {
			padding-top: 13px;
		}

		.bookGenre {
			font-size: 13px;
		}

		.bookTitle>a {
			font-size: 16px;
			text-decoration: none;
			color: black;
		}

		.bookWriter {
			font-size: 16px;
		}

		.bookPublisher, .between, .bookPublicationDate {
			font-size: 13px;
		}

		.insertBookmark {
			display: inline-block;
		}

		.insertBookmarkContent {
			margin-top: 10px;
			width: 100%;
			display: flex;
			justify-content: center;
		}

		.insertbookmarkContentBox {
			height: 120px;
			width: 871px;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
			overflow: hidden;
			position: relative;
			overflow-y: auto;
		}

		.insertBookmarkBtn {
			width: 100%;
			height: 65px;
			position: relative;
		}

		#insertBookmarkBtn {
			position: absolute;
			top: 55%;
			transform: translate(0%, -50%);
			right: 5px;
			width: 50px;
			height: 30px;
			font-size: 15px;
			color: rgb(47, 47, 47);
			background-color: #5397fc50;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		.middleHr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
			margin-top: 15px;
			margin-bottom: 15px;
		}

		/* contentsBodySearchBookmark */
		.bookmarkSearch {
			height: 50px;
			width: 100%;
			display: flex;
			align-items: center;
			margin-top: 25px;
			margin-bottom: 25px;
		}

		.bookmarkSearchTitle {
			font-size: 15px;
			margin-right: 10px;
			padding-bottom: 10px;
		}

		.bookmarkSearchBox {
			position: relative;
			bottom: 5px;
			overflow: hidden;
			height: 40px;
			width: 244.5px;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		.bookmarkSearchTxt {
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

		.bookmarkSearchBtn {
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

		/* contentsBodyBookmarkContents */
		.emptyContents {
			font-size: 15px;
			text-align: center;
			line-height: 200px;
			width: 100%;
			height: 200px;
		}

		.bookmarkContents {
			width: 100%;
			height: auto;
			display: flex;
			margin-bottom: 20px;
			flex-wrap: wrap;
			padding: 5px;
		}

		.bookmarkContentsImg {
			width: 15%;
		}

		.bookmarkBookImg {
			width: 100%;
			height: 100%;
			display: flex;
			align-items: center;
		}

		.bookmarkBookImg>img {
			height: 180px;
			width: 120px;
			border-radius: 2%;
			cursor: pointer;
		}
		.bookmarkContentsTB{
			display: flex;
			flex-direction: column;
			width: 85%;
		}
		.bookmarkContentsTxt {
			display: inline-block;
			height: auto;
			width: 100%;
		}
		.bmBWriter{
			font-size: 13px;
			color: #808080;
		}
		.bookmarkHr{
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
		}
		.bookmarkBookInfo {
			display:flex;
			justify-content: space-between;
			align-items: end;
		}
		.bookmarkBookTxt{
			font-size: 15px;
			cursor: pointer;
		}
		.bookmarkWritedate {
			font-size: 12px;
			min-width: max-content;
		}

		.bookmarkContent {
			height: auto;
			font-size: 14px;
			height: fit-content;
			min-height: 100px;
		}

		.bookmarkContentsBtn {
			float: right;
			width: 100%;
			height: 30px;
			display: flex;
			align-items: end;
			justify-content: end;
		}

		.bookmarkContentsBtn>button {
			width: 45px;
			height: 25px;
			font-size: 13px;
			color: rgb(47, 47, 47);
			background-color: #5397fc50;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
			margin-left: 5px;
		}

		/*footerHr*/
		.footerHr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
			margin-top: 50px;
			margin-bottom: 15px;
		}

		/* footer */
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
			<img src="/resources/bookday_logotitle.png" id="logoImg">
		</div>
		<div class="search">
			<div class="searchBox">
				<form action="/search/toSearch" id="search" method="post">
					<input class="searchTxt" type="text" placeholder="검색어를 입력해 주세요"
						   id="searchWord" name="searchWord" maxlength="100">
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
		<div class="sideNavi">
			<ul>
				<li><span class="material-symbols-outlined size-35"
						  id="snBookshelves">shelves</span></li>
				<li><span class="material-symbols-outlined size-35" id="snCalendar">calendar_month</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snStatistics">equalizer</span></li>
				<li class="selected"><span
						class="material-symbols-outlined size-35" id="snBookmark">book</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snBooknote">edit</span></li>
			</ul>
		</div>
		<div class="contents">
			<div class="contentsHeader">
				<div id="contentsHeaderImg">
					<img src="/resources/profile/${dto.sysprofname}" width="100" height="100"
						 id="profile">
				</div>
				<div id="contentsHeaderTxt">${dto.nickname }님&nbsp책하루와&nbsp함께한&nbsp${dto.signup_date
						} 하루</div>
			</div>
			<div class="contentsBody">
				<div class="title">
					<div class="titleTxt">책갈피</div>
					&nbsp <span class="material-symbols-outlined size-30">book</span>
				</div>
				<div class="insertBookmark">
					<div class="insertBookmarkBookInfo">
						<div class="bookmarkBookSearch">
							<div class="bookmarkBookSearchTitle">책 검색</div>
							<div class="bookmarkBookSearchBox">
								<input class="bookmarkBookSearchTxt" type="text"
									   placeholder="검색어를 입력해 주세요" id="bookmarkBookSearchWord"
									   name="bookmarkBookSearchWord">
								<button class="bookmarkBookSearchBtn">
									<span class="material-symbols-outlined"> search </span>
								</button>
							</div>
						</div>
					</div>
					<div class="insertBookmarkContent">
						<div class="insertbookmarkContentBox" contenteditable="true"></div>
					</div>
					<div class="insertBookmarkBtn">
						<button id="insertBookmarkBtn" type="button">입력</button>
					</div>
				</div>
				<hr class="middleHr">
				<div class="bookmarkSearch">
					<div class="bookmarkSearchTitle">책갈피 검색</div>
					<div class="bookmarkSearchBox">
						<input class="bookmarkSearchTxt" type="text"
							   placeholder="검색어를 입력해 주세요" id="bookmarkSearchWord"
							   name="bookmarkSearchWord" maxlength="100">
						<button class="bookmarkSearchBtn">
							<span class="material-symbols-outlined"> search </span>
						</button>
					</div>
				</div>
				<div class="selectBookmarkList">
					<c:choose>
						<c:when test="${empty list}">
							<div class="empty">
								<hr class="bookmarkHr">
								<div class="emptyContents">북마크가 없습니다.</div>
								<hr class="bookmarkHr">
							</div>
						</c:when>
						<c:otherwise>

							<c:forEach var="bm" items="${list}">


								<div class="bookmarkContents" seq="${bm.bm_seq }"
									 writer="${bm.bm_writer_id }">
									<div class="bookmarkContentsImg">
										<div class="bookmarkBookImg">
											<img src="${bm.b_img_url }" isbn="${bm.b_isbn }" class="bookImg">
										</div>
									</div>
									<div class="bookmarkContentsTB">
										<div class="bookmarkContentsTxt">
											<div class="bookmarkBookInfo">
												<div class="bookmarkBookTxt" isbn="${bm.b_isbn }">
													<span class="bmBTitle">${bm.b_title}</span>
													<br>
													<span class="bmBWriter">${bm.b_writer }</span>
												</div>
												<span class="bookmarkWritedate"><fmt:formatDate value="${bm.bm_write_date }"
																								pattern="yyyy.MM.DD HH:mm" /></span></div>
											<hr class="bookmarkHr">
											<div class="bookmarkContent">${bm.bm_content}</div>

										</div>
										<div class="bookmarkContentsBtn">
											<button class="updBookmarkBtn">수정</button>
											<button class="delBookmarkBtn">삭제</button>
										</div>
									</div>
								</div>

							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<!--             	검색할거면 bms로 다시 리스트 출력 c when otherwise 쓰기 -->
				<div class="bookmarkContentsListPage"></div>
				<div class="page"></div>
			</div>
		</div>
	</div>
	<hr class="footerHr">

	<div class="footer">
		<div class="f_header">
			<a href="/"><img src="/resources/bookday_logotitle.png"></a>

			<div class="sns_icon">
				<a href="#"><img src="/resources/instagram.png" id="insta"></a>
				<a href="#"><img src="/resources/facebook.png" id="facebook"></a>
				<a href="#"><img src="/resources/twitter_black.png"
								 id="twitter"></a> <a href="#"><img
					src="/resources/youtube.png" id="youtube"></a>
			</div>

		</div>
		<div class="business_info">
			<div class="inline_info">
				<div id="business_info_title">사업자 정보</div>
				<span class="arrow_icon material-symbols-outlined" id="arrow_down2">keyboard_arrow_down</span>
				<span class="arrow_icon material-symbols-outlined" id="arrow_up2">keyboard_arrow_up</span>
			</div>

			<div id="business_info_text">
				<span>대표자 성태조 </span> <span> | </span> <span> 사업자 등록번호
						01-20-22015</span>
				<p>주소 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F</p>
				<span>대표전화 1544-9970 </span> <span> | </span> <span> 이메일
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
		<!-- <p class="copyright">©BOOKDAY Corp.</p> -->
	</div>
</div>
<script>

	$("#logoImg").on("click", function() {
		location.href = "/";
	});

	$("#searchWord").on("keydown", function(e) {
		if (e.keyCode == 13) {
			$("#search").submit();
		}
	});

	$("#notifications").on("click", function() {
		let today = new Date();

		let hours = ('0' + today.getHours()).slice(-2);
		let minutes = ('0' + today.getMinutes()).slice(-2);
		let seconds = ('0' + today.getSeconds()).slice(-2);

		let timeString = hours + ':' + minutes  + ':' + seconds;
		alert("현재 시간은 "+timeString);

	});

	$("#bookbag").on("click", function() {
		if(${loginID == null}) {
			location.href = "/member/toLogin";
		}else {
			location.href = "/delivery/selectBookbagListById";
		}
	})

	$("#bookshelves").on("click", function() {
		location.href = "/bookshelves/selectBookshelvesListById";
	});

	$("#mypage").on("click", function() {
		if (${loginID == null}) {
			location.href = "/member/toLogin";
			return false;
		}else {
			location.href = "/member/toMypage";
		}
	})

	$("#snBookshelves").on("click", function() {
		location.href = "/bookshelves/selectBookshelvesListById";
	});

	$("#snCalendar").on("click",function(){
		location.href = "/bookcalendar/toCalendar";
	})

	$("#snStatistics").on("click", function() {
		location.href = "/bookstatistics/toStatistics";
	});

	$("#snBookmark").on("click", function() {
		location.href = "/bookmark/selectBookmarkListById";
	});

	$("#snBooknote").on("click", function() {
		location.href = "/booknote/selectPostListRev";
	});

	$("#bookmarkBookSearchWord").on("keydown", function(e){
		if(e.keyCode == 13) {
			let searchWord = $("#bookmarkBookSearchWord").val();
			$("#bookmarkBookSearchWord").val("");
			window.open("/book/toBookSearchPop?searchWord=" + searchWord, "", "width=600,height=600");
		}
	});

	$(".bookmarkBookSearchBtn").on("click", function() {
		let searchWord = $("#bookmarkBookSearchWord").val();
		$("#bookmarkBookSearchWord").val("");
		window.open("/book/toBookSearchPop?searchWord=" + searchWord, "", "width=600,height=600");
	});

	$("#bookmarkSearchWord").on("keydown", function(e){
		if(e.keyCode == 13) {
			let searchWord = $("#bookmarkSearchWord").val();
			location.href = "/bookmark/selectBookmarkListBySw?searchWord=" + searchWord;
		}
	});

	$(".bookmarkSearchBtn").on("click", function() {
		let searchWord = $("#bookmarkSearchWord").val();
		location.href = "/bookmark/selectBookmarkListBySw?searchWord=" + searchWord;
	});

	$(document).on("click",".updBookmarkBtn",function () {
		$(this).closest(".bookmarkContents").find(".bookmarkContent").attr("contenteditable", "true").focus();

		$(this).css("display", "none");
		$(this).siblings(".delBookmarkBtn").css("display", "none");

		let updComplete = $("<button>");
		updComplete.text("완료");
		updComplete.addClass("updComplete");
		updComplete.attr("type", "button");

		updComplete.addClass("updBmBtn");

		let updCancel = $("<button>");
		updCancel.attr("type", "button");
		updCancel.text("취소");
		updCancel.addClass("updCancel");


		$(this).closest(".bookmarkContentsBtn").append(updComplete).append(updCancel);
	});

	function showBtn (btnName) {

		let updBookmarkBtn = $("<button>");
		updBookmarkBtn.text("수정");
		updBookmarkBtn.addClass("updBookmarkBtn");
		updBookmarkBtn.attr("type", "button");

		let delBookmarkBtn = $("<button>");
		delBookmarkBtn.attr("type", "button");
		delBookmarkBtn.text("삭제");
		delBookmarkBtn.addClass("delBookmarkBtn");

		btnName.closest(".bookmarkContentsBtn").append(updBookmarkBtn).append(delBookmarkBtn);
	}

	$(document).on("click", ".updCancel", function () {

		$(this).closest(".bookmarkContents").find(".bookmarkContent").attr("contenteditable", "false");
		$(this).css("display", "none");
		$(this).siblings(".updComplete").css("display", "none");

		showBtn($(this));

	});

	$(document).on("click", ".updComplete", function () {

		let bm_seq = $(this).closest(".bookmarkContents").attr("seq");
		let bm_writer_id = $(this).closest(".bookmarkContents").attr("writer");
		let bm = $(this).closest(".bookmarkContents").find(".bookmarkContent");
		let bmc = $(this).closest(".bookmarkContents").find(".bookmarkContent").html();
		let updComplete = $(this);
		let updCancel = $(this).siblings(".updCancel");

		if(`${loginID == bm_writer_id}`) {
			$.ajax({
				url: "/bookmark/updateBookmark",
				type: "post",
				data: {
					"bm_seq": bm_seq,
					"bm_content": bmc
				}
			}).done(function () {

				bm.attr("contenteditable", "false");
				updComplete.css("display", "none");
				updCancel.css("display", "none");

				showBtn(updComplete);

			})
		}
	});

	$(document).on("click", ".delBookmarkBtn", function () {
		let bm_seq = $(this).closest(".bookmarkContents").attr("seq");
		let bm = $(this).closest(".bookmarkContents");
		if (confirm("북마크를 삭제하시겠습니까?")) {
			$.ajax({
				url: "/bookmark/deleteBookmark",
				type: "post",
				data: {"bm_seq": bm_seq}
			}).done(function (data) {
				if (data) {
					bm.remove();
					$.ajax({
						url: "/bookmark/selectBookmark"
					}).done(function (res){
						console.log(res);
						if(res==0){
							location.reload();
						}
					})
				} else {
					location.href = "error";
				}
			})
		}
	});

	$('.insertbookmarkContentBox').keyup(function () {
		let bookmark = $(this).html();

		// 글자수 세기
		if (bookmark.length == 0 || bookmark == '') {
			$('.textCount').text('0자');
		} else {
			$('.textCount').text(bookmark.length + '자');
		}
		// 글자수 제한
		if (bookmark.length > 200) {
			// 200자 부터는 타이핑 되지 않도록
			$(this).html($(this).html().substring(0, 200));
			// 200자 넘으면 알림창 뜨도록
			alert('북마크는 200자까지 입력 가능합니다.');
		}
	});

	$(document).on("click", ".bookImg", function(){
		let b_isbn = $(this).attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
	});

	$(document).on("click", ".bmBTitle", function(){
		let b_isbn = $(this).closest(".bookmarkBookTxt").attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
	});
	$(document).on("click", ".bmBWriter", function(){
		let searchWord = $(this).html();
		console.log(searchWord);
		location.href = "/search/toSearch?searchWord="+searchWord;
	});

	function initSearchBook(b_isbn, b_genre, b_img_url, b_title,
							b_writer, b_publisher, b_publication_date) {

		$(".searchResultBookInfo *").remove();

		let tdBookCover = $("<td>").addClass("bookCover");
		let tdBookCoverA = $("<a>").attr("href","#");
		let tdBookCoverImg = $("<img>").attr("src", b_img_url).attr("id", "b_img_url");

		tdBookCoverA.append(tdBookCoverImg);
		tdBookCover.append(tdBookCoverA);

		let spanBookGenre = $("<span>").addClass("bookGenre").html(b_genre);

		let p2 = $("<p>");
		let spanBookTitle = $("<span>").addClass("bookTitle");
		let aBookTitle = $("<a>").attr("href","#").attr("id", "b_title").html(b_title);

		let p3 = $("<p>");
		let spanBookWriter = $("<span>").addClass("bookWriter").html(b_writer);

		let spanBookPublisher = $("<span>").addClass("bookPublisher").html(b_publisher);
		let spanBetween = $("<span>").addClass("between").html("&nbsp|&nbsp");
		let spanBookPublicationDate = $("<span>").addClass("bookPublicationDate").html(b_publication_date);

		spanBookTitle.append(aBookTitle);
		p2.append(spanBookTitle);

		p3.append(spanBookWriter);

		let tdBookInfo = $("<td>").addClass("bookInfo");
		tdBookInfo.append(spanBookGenre);
		tdBookInfo.append(p2);
		tdBookInfo.append(p3);
		tdBookInfo.append(spanBookPublisher).append(spanBetween).append(spanBookPublicationDate);

		let tr = $("<tr>");
		tr.append(tdBookCover);
		tr.append(tdBookInfo);

		let table = $("<table>");
		table.append(tr);

		let divSearchResultBookInfo = $("<div>").addClass("searchResultBookInfo").attr("isbn", b_isbn);
		divSearchResultBookInfo.append(table);

		$(".insertBookmarkBookInfo").append(divSearchResultBookInfo);

	}

	function bookmarkList(lastBm_seq) {

		$.getJSON("/bookmark/selectBmListByBmseq", { "bm_seq": lastBm_seq })
				.done(res => {
					if (res != null) {
						setBookmarkPrepend(res);
					}
				})

	}

	function getDateFormat (unformedDate) {
		const date = new Date(unformedDate)
		let month = date.getMonth() + 1
		let day = date.getDate()
		let hour = date.getHours()
		let minute = date.getMinutes()

		month = month >= 10 ? month : '0' + month
		day = day >= 10 ? day : '0' + day
		hour = hour >= 10 ? hour : '0' + hour
		minute = minute >= 10 ? minute : '0' + minute

		return date.getFullYear() + '.' + month + '.' + day + ' ' + hour + ':' + minute
	}

	function setBookmarkPrepend(res) {

		for (let i = 0; i < res.length; i++) {
			$(".empty").remove();
			let bookmarkContents = $("<div>").addClass("bookmarkContents").attr("seq", res[i].bm_seq).attr("writer", res[i].bm_writer_id);

			let bookmarkContentsImg = $("<div>").addClass("bookmarkContentsImg");
			let bookmarkBookImg = $("<div>").addClass("bookmarkBookImg");
			let img = $("<img>").attr("src", res[i].b_img_url).addClass("bookImg").attr("isbn", res[i].b_isbn);

			bookmarkBookImg.append(img);
			bookmarkContentsImg.append(bookmarkBookImg);

			let bookmarkContentsTB = $("<div>").addClass("bookmarkContentsTB");

			let bookmarkContentsTxt = $("<div>").addClass("bookmarkContentsTxt");

			let bookmarkBookInfo = $("<div>").addClass("bookmarkBookInfo");
			let bookmarkBookTxt =  $("<div>").addClass("bookmarkBookTxt").html("<span class=bmBTitle>"+res[i].b_title
					+"</span><br><span class=bmBWriter>"+res[i].b_writer+"</span>").attr("isbn", res[i].b_isbn);
			let bookmarkWritedate = $("<span>").addClass("bookmarkWritedate").html(getDateFormat(res[i].bm_write_date));
			let hr = $("<hr>").addClass("bookmarkHr");

			let bookmarkContent = $("<div>").addClass("bookmarkContent").html(res[i].bm_content);
			bookmarkBookInfo.append(bookmarkBookTxt).append(bookmarkWritedate);
			bookmarkContentsTxt.append(bookmarkBookInfo).append(hr).append(bookmarkContent);
			bookmarkContentsTB.append(bookmarkContentsTxt);

			let bookmarkContentsBtn = $("<div>").addClass("bookmarkContentsBtn");
			let updBookmarkBtn = $("<button>").addClass("updBookmarkBtn").html("수정");
			let delBookmarkBtn = $("<button>").addClass("delBookmarkBtn").html("삭제");

			bookmarkContentsBtn.append(updBookmarkBtn).append(delBookmarkBtn);
			bookmarkContentsTB.append(bookmarkContentsBtn);

			bookmarkContents.append(bookmarkContentsImg).append(bookmarkContentsTB);

			$(".selectBookmarkList").prepend(bookmarkContents);
		}
	}


	function insertBookmark(){

		let bm_content = $(".insertbookmarkContentBox").html();
		let b_isbn = $(".searchResultBookInfo").attr("isbn");
		let b_img_url = $("#b_img_url").attr("src");
		let b_title = $("#b_title").html();
		let b_writer = $(".bookWriter").html();
		let b_genre = $(".bookGenre").html();
		let arrBM = document.querySelectorAll(".bookmarkContents");
		let lastBm_seq = $(arrBM[0]).attr("seq");


		$.ajax({
			url: "/bookmark/insertBookmark",
			type: "post",
			data: {
				"bm_content": bm_content,
				"b_isbn": b_isbn,
				"b_img_url": b_img_url,
				"b_title": b_title,
				"b_writer": b_writer,
				"b_genre": b_genre
			}, success:function(data){
				bookmarkList(lastBm_seq);
				$(".insertbookmarkContentBox").html("");
			}
		})
	}


	$(".insertbookmarkContentBox").on("keydown", function(e){
		if(e.keyCode == 13 && e.shiftKey == false) {
			if($(".searchResultBookInfo").attr("isbn") == null){
				alert("책을 검색해주세요.");
				return false;
			}
			if($(".insertbookmarkContentBox").html()==""){
				alert("책갈피 내용을 입력해주세요.");
				return false;
			}
			insertBookmark()
			$(".insertbookmarkContentBox").html("");
			$(".searchResultBookInfo *").remove();
		}
	});
	$("#insertBookmarkBtn").on("click", function() {
		if($(".searchResultBookInfo").attr("isbn") == null){
			alert("책을 검색해주세요.");
			return false;
		}
		if($(".insertbookmarkContentBox").html()==""){
			alert("책갈피 내용을 입력해주세요.");
			return false;
		}
		insertBookmark();
		$(".insertbookmarkContentBox").html("");
		$(".searchResultBookInfo *").remove();
	});


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