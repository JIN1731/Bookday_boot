<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>selectPostList</title>
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
			width: 978px !important;
			padding-left: 0px;
			padding-right: 0px;
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

		.contents hr{
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
		}

		/* contentHeader */
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

		/* contentdBody */
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

		/* contentsBodySearchPost */
		.postSandIBtn {
			overflow: hidden;
		}

		.postSearch {
			float: left;
			height: 50px;
			width: 50%;
			display: flex;
			align-items: center;
		}

		.postSearchTitle {
			font-size: 15px;
			margin-right: 10px;
			padding-bottom: 10px;
		}

		.postSearchBox {
			position: relative;
			bottom: 5px;
			overflow: hidden;
			height: 40px;
			width: 244.5px;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		.postSearchTxt {
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

		.postSearchBtn {
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

		/* contentsBodyInsertPostBtn */
		.insertPostBtn {
			float: left;
			width: 50%;
			height: 50px;
			position: relative;
		}

		#insertPostBtn {
			position: absolute;
			top: 50%;
			transform: translate(0%, -50%);
			right: 8px;
			width: 50px;
			height: 30px;
			font-size: 15px;
			color: rgb(47, 47, 47);
			background-color: #5397fc50;
			border: none;
			border-radius: 5px;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		/* contentsBodyPostContents */
		.bodyHr{
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
			margin-top: 13px;
			margin-bottom: 20px;
		}
		.emptyPostContents {
			font-size: 15px;
			text-align: center;
			line-height: 200px;
			width: 100%;
			height: 200px;
		}

		.postContents {
			width: 100%;
			height: auto;
			display: flex;
			margin-bottom: 20px;
			flex-wrap: wrap;
		}

		.postContentsImg {
			width: 15%;
		}

		.postBookImg {
			width: 100%;
			height: 100%;
			display: flex;
			align-items: center;
		}

		.postBookImg>img {
			height: 180px;
			width: 120px;
			border-radius: 2%;
			cursor: pointer;
		}

		.postContentsTxt {
			display: inline-block;
			height: auto;
			width: 85%;
		}

		.postBookInfo {
			font-size: 15px;
			margin-bottom: 20px;
			cursor: pointer;
		}
		.pBWriter{
			font-size: 13px;
			color: #808080;
		}
		.postHeader {
			display: flex;
			align-items: flex-end;
		}

		.postTitle {
			width: 84%;
			font-size: 17px;
			font-weight: 200;
			word-wrap: break-word;
		}

		a {
			text-decoration: none;
			color: black;
		}

		.postCommentCount {
			color: #5397fc;
		}

		.postWritedate {
			width: 16%;
			font-size: 12px;
			display: flex;
			justify-content: flex-end;
		}

		.postContent {
			width: 85%;
			height: auto;
			font-size: 14px;
			height: auto;
			display: flex;
			flex-wrap: wrap;
			text-overflow: ellipsis;
			overflow: hidden;
			word-break: break-word;
			display: -webkit-box;
			-webkit-line-clamp: 7;
			-webkit-box-orient: vertical;
		}

		.postContent>p>span {
			font-size: 14px !important;
		}

		.postBody {
			height: 106.4px;
			display: flex;
		}

		.pLike {
			width: 15%;
			display: flex;
			justify-content: center;
		}

		.postLike {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			color: #80808050;
		}

		.postLikeIcon {
			display: inline-block;
			width: auto;
			cursor: pointer;
		}

		span.size-45 {
			cursor: pointer;
			font-size: 45px;
			font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 35
		}

		.postLikeCount {
			display: inline-block;
			width: auto;
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
						<a href="/member/logOut"><p class="user" id="logout">로그아웃</p></a>
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
				<li><span class="material-symbols-outlined size-35"
						  id="snCalendar">calendar_month</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snStatistics">equalizer</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snBookmark">book</span></li>
				<li class="selected"><span
						class="material-symbols-outlined size-35" id="snBooknote">edit</span></li>
			</ul>
		</div>
		<div class="contents">
			<div class="contentsHeader">
				<div id="contentsHeaderImg">
					<img src="/resources/profile/${dto.sysprofname}" width="100" height="100"
						 id="profile">

				</div>
				<div id="contentsHeaderTxt">${dto.nickname}님&nbsp책하루와&nbsp함께한&nbsp${dto.signup_date
						} 하루</div>
			</div>
			<div class="contentsBody">
				<div class="title">
					<div class="titleTxt">POST</div>
					&nbsp <span class="material-symbols-outlined size-30">edit</span>
				</div>
				<div class="postSandIBtn">
					<div class="postSearch">
						<div class="postSearchTitle">포스트 검색</div>
						<div class="postSearchBox">

							<input class="postSearchTxt" type="text"
								   placeholder="검색어를 입력해 주세요" id="postSearchWord"
								   name="postSearchWord" maxlength="100">
							<button class="postSearchBtn" type="button">
								<span class="material-symbols-outlined"> search </span>
							</button>
						</div>
					</div>
					<div class="insertPostBtn">
						<button id="insertPostBtn">작성</button>
					</div>
				</div>
				<hr class="bodyHr">
				<div class="selectPostList">
					<c:choose>
					<c:when test="${empty list}">
						<div class="emptyPostContents">포스트가 없습니다.</div>
					</c:when>
					<c:otherwise>
					<c:forEach var="i" items="${list}" varStatus="status">
						<div class="postContents">
							<div class="postContentsImg">
								<div class="postBookImg">
									<img src="${i.b_img_url }" isbn="${i.b_isbn }"
										 class="bookImg">
								</div>
							</div>
							<div class="postContentsTxt">
								<div class="postBookInfo" isbn="${i.b_isbn }"><span class="pBTitle">${i.b_title
										}</span>&nbsp<span class="pBWriter">${i.b_writer }</span></div>
								<div class="postHeader">
									<div class="postTitle">
										<a href="/booknote/selectPostByPseq?p_seq=${i.p_seq }">${i.p_title }</a>
										<span class="postCommentCount">[${i.p_comment_count }]</span>
									</div>
									<div class="postWritedate">
										<fmt:formatDate value="${i.p_write_date }"
														pattern="yyyy.MM.dd HH:mm" />
									</div>
								</div>
								<hr class="postlistHr">
								<div class="postBody">
									<div class="postContent">${i.p_content }</div>
									<div class="pLike">
										<c:set var="doneLoop" value="false" />
										<c:set var="existFlag" value="false" />

										<c:forEach var="like" items="${llist}">
											<c:if test="${i.p_seq == like.p_seq}">
												<c:set var="existFlag" value="true" />
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${existFlag}">
												<c:forEach var="like" items="${llist}">
													<c:if test="${not doneLoop}">
														<c:choose>
															<c:when test="${i.p_seq == like.p_seq}">

																<div class="postLike" pseq="${i.p_seq }"
																	 lseq="${like.p_seq }" isbn="${i.b_isbn }"
																	 like="true" style="color: #5397fc">

																	<div class="postLikeIcon">
																		<span class="material-symbols-outlined size-45">thumb_up</span>
																	</div>
																	<div class="postLikeCount">${i.p_like_count }</div>
																</div>
																<c:set var="doneLoop" value="true" />
															</c:when>

														</c:choose>
													</c:if>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<div class="postLike" pseq="${i.p_seq }"
													 lseq="${like.p_seq }" isbn="${i.b_isbn }" like="false"
													 style="color: #80808050">

													<div class="postLikeIcon">
														<span class="material-symbols-outlined size-45">thumb_up</span>
													</div>
													<div class="postLikeCount">${i.p_like_count }</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				</c:otherwise>
				</c:choose>
				<hr class="bodyHr">

				<div class="postPage"></div>
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
	})

	$("#searchWord").on("keydown", function(e) {
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
			location.href = "/member/toLogin";
			return false;
		}else {
			location.href = "/member/toMypage";
		}
	})
	$("#snBookshelves").on("click", function() {
		location.href = "/bookshelves/selectBookshelvesListById";
	})
	$("#snCalendar").on("click",function(){
		location.href = "/bookcalendar/toCalendar";
	})
	$("#snStatistics").on("click", function() {
		location.href = "/bookstatistics/toStatistics";
	})
	$("#snBookmark").on("click", function() {
		location.href = "/bookmark/selectBookmarkListById";
	})
	$("#snBooknote").on("click", function() {
		location.href = "/booknote/selectPostListRev";
	})
	$("#insertPostBtn").on("click", function() {
		location.href = "/booknote/toInsertPost";
	})




	$(".postLike").on("click", function(){
		let p_like = $(this).attr("like");
		let p_seq = $(this).attr("pseq");
		let b_isbn = $(this).attr("isbn");
		let tmp = event.target
		console.log(p_like);
		if(p_like == "false"){
			console.log("good");
			$.ajax({
				url: "/booknote/insertPostLike",
				type: "post",
				data: {
					"p_seq": p_seq,
					"b_isbn": b_isbn
				}
			}).done(function(data){
				console.log(data);

// 						console.log()
// 						$(tmp).attr("like","true");
// 						$(tmp).attr("style", "color:blue;");
				location.reload();

			})
		}else{
			$.ajax({
				url: "/booknote/deletePostLike",
				type: "post",
				data: {
					"p_seq": p_seq,
					"b_isbn": b_isbn
				}
			}).done(function(data){
				console.log(data);


// 							$(tmp).attr("like","false");
// 							$(tmp).attr("style", "color:grey;");
				location.reload();

			})
		}
	})

	$(function(){
		$(".postSearchTxt").on("keydown", function (e) {
			console.log("asdf");
			if (e.keyCode == 13) {
				let searchWord = $(".postSearchTxt").val();
				$(".postSearchTxt").val("");
				location.href="/booknote/selectSearchPostList?searchWord="+searchWord;
			}
		});
		$(".postSearchBtn").on(
				"click",
				function () {
					let searchWord = $(".postSearchTxt").val();
					$(".postSearchTxt").val("");
					location.href="/booknote/selectSearchPostList?searchWord="+searchWord;
				});

	})


	$(".bookImg").on("click", function(){
		let b_isbn = $(this).attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
	});

	$(".pBTitle").on("click", function(){
		let b_isbn = $(this).closest(".postBookInfo").attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
	});

	$(".pBWriter").on("click", function(){
		let pBWriter = $(this).html();
		location.href = "/search/toSearch?searchWord="+pBWriter;
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