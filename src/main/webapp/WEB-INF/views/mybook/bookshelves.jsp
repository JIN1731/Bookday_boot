<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Bookshelves</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet"
		  href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
			rel="stylesheet"
			integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
			crossorigin="anonymous">
	<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
			crossorigin="anonymous"></script>
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

		body {
			margin: 8px;
			line-height: inherit;
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
			min-width: 978px;
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

		.signBox>a>p {
			margin-block-start: 1em;
			margin-block-end: 1em;
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
			opacity: inherit;
		}
		/*     header */

		/* navi */
		.navi {
			width: 100%;
			height: 50px;
		}

		/* body */
		.body {
			display: flex;
		}

		/* sidenavi */
		.sideNavi {
			width: 10%;
			min-width: 97.8px;
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
			min-width: 880.2px;
			width: 90%;
			overflow: hidden;
		}

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

		#profile_img {
			border-radius: 50%;
			box-shadow: 2px 2px 2px 2px #80808050;
		}

		.rental {
			width: 100%;
		}

		.wishlist {
			width: 100%;
		}

		.posted {
			width: 100%;
		}

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

		#wishlist {
			margin-top: 70px;
		}

		#posted {
			margin-top: 30px;
		}

		span.size-30 {
			font-size: 30px;
			color: gray;
			font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 30
		}
		.count{
			margin-left:auto;
		}
		span.size-27 {
			font-size: 27px;
			color: #5397fc;
			font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 27
		}
		.bookshelvesHr {
			height: 10px;
			border: 0;
			box-shadow: 0 10px 10px -10px #bbb inset;
			opacity: inherit;
			margin-top: 5px;
			margin-bottom: 5px;
		}

		.book {
			width: 80px;
			height: 120px;
			box-shadow: 2px 2px 2px 2px #80808050;
			cursor: pointer;
			margin-right: 3px;
			margin-left: 3px;
		}

		.rentalBooks {
			height: 140px;
			display: flex;
			justify-content: space-evenly;
			align-items: flex-end;
			padding-bottom: 4px;
		}

		.wishlistBooks {
			position: relative;
			height: 200px;
		}

		.carousel-inner {
			height: 140px;
		}

		.carousel-item {
			height: 100%;
		}

		.item-page {
			height: 100%;
			display: flex;
			justify-content: space-evenly;
			align-items: flex-end;
			padding-bottom: 4px;
		}

		.carousel-indicators {
			position: relative;
			margin: 0;
		}

		.carousel-indicators [data-bs-target] {
			border-radius: 50%;
			width: 10px;
			height: 10px;
			background-color: #80808050;
		}

		* .postedBooks {
			height: 140px;
			display: flex;
			justify-content: space-evenly;
			align-items: flex-end;
			padding-bottom: 4px;
		}

		/*footerHr*/
		.footerHr {
			display: block;
			height: 1px;
			border: 0;
			border-top: 1px solid rgb(216, 216, 216);
			margin-top: 50px;
			margin-bottom: 15px;
			opacity: inherit;
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
						   id="searchWord" name="searchWord" maxlength="200">
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
				<li class="selected"><span
						class="material-symbols-outlined size-35" id="snBookshelves">shelves</span></li>
				<li><span class="material-symbols-outlined size-35" id="snCalendar">calendar_month</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snStatistics">equalizer</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snBookmark">book</span></li>
				<li><span class="material-symbols-outlined size-35"
						  id="snBooknote">edit</span></li>
			</ul>
		</div>
		<div class="contents">
			<div class="contentsHeader">
				<div id="contentsHeaderImg">
					<img src="/resources/profile/${dto.sysprofname}" width="100" height="100"
						 id="profile_img">
				</div>
				<div id="contentsHeaderTxt">${dto.nickname }님&nbsp책하루와&nbsp함께한&nbsp${dto.signup_date
						} 하루</div>
			</div>
			<div class="contentsBody">
				<div class="rental">
					<div class="title">
						<div class="titleTxt">대여 중</div>
						&nbsp <span class="material-symbols-outlined size-30">auto_stories</span>
						&nbsp<span class="count"><span class="material-symbols-outlined size-27">cloud</span>책하루에서 ${rcount }권의 책을 대여중입니다.</span>
					</div>
					<div class="rentalBooks">
						<c:forEach var="rental" items="${rlist}">
							<div class="rentalBook">
								<img src="${rental.b_img_url }" class="book"
									 isbn="${rental.b_isbn }">
							</div>
						</c:forEach>
					</div>
					<hr class="bookshelvesHr">
				</div>
				<div class="wishlist">
					<div class="title" id="wishlist">
						<div class="titleTxt">위시리스트</div>
						&nbsp <span class="material-symbols-outlined size-30">favorite</span>
						&nbsp<span class="count"><span class="material-symbols-outlined size-27">cloud</span>${wcount }권의 책이 위시리스트에 담겨있습니다.</span>
					</div>
					<div class="wishlistBooks"
						 style="min-width: 880.2px; max-width: 880.2px;">
						<div id="carouselExampleSlidesOnly" class="carousel slide"
							 data-bs-interval="false">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<div class="item-page">
										<c:forEach var="wishlist" items="${wlist }"
												   varStatus="wstatus">
										<div class="wishlistBook" id="${wstatus.count }">
											<img src="${wishlist.b_img_url }" class="book"
												 isbn="${wishlist.b_isbn }">
										</div>
										<c:if test="${wstatus.count%10==0 }">
									</div>
								</div>
								<div class="carousel-item">
									<div class="item-page">
										</c:if>
										</c:forEach>
									</div>
								</div>

							</div>

							<hr class="bookshelvesHr">
							<div class="carousel-indicators">

								<c:forEach var="i" begin="0"  end="${((fn:length(wlist)/10)-0.1) }"
										   step="1">

									<button type="button"
											data-bs-target="#carouselExampleSlidesOnly"
											data-bs-slide-to="${i }"
											<c:if test="${i==0}">class="active"</c:if>
											aria-label="Slide ${i }" aria-current="true"></button>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>

				<div class="posted">
					<div class="title" id="posted">
						<div class="titleTxt">내 책장</div>
						&nbsp <span class="material-symbols-outlined size-30">shelves</span>
						&nbsp<span class="count"><span class="material-symbols-outlined size-27">cloud</span>${pcount }권의 책의 포스트를 작성하셨습니다.</span>
					</div>
					<c:choose>
						<c:when test="${empty plist}">
							<div class="postedBooks"></div>
							<hr class="bookshelvesHr">
						</c:when>
						<c:otherwise>
							<c:forEach var="post" items="${plist }" varStatus="status">
								<c:if test="${status.count%10==1 }">
									<div class="postedBooks">
								</c:if>
								<div class="postedBook" id="${status.count }">
									<img src="${post.b_img_url }" class="book"
										 isbn="${post.b_isbn }">
								</div>
								<c:if
										test="${status.count%10==0 || status.count == fn:length(plist)}">
									</div>
									<hr class="bookshelvesHr">
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
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
	$("#bookbag").on("click", function() {
		if(${loginID == null}) {
			location.href = "/member/toLogin";
		}else {
			location.href = "/delivery/selectBookbagListById";
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

	$(document).on("click", ".book", function(){
		let b_isbn = $(this).attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
	})





	// <!-- Ajax Infinite Scroll -->
	// 	    let count = 1
	// 	    $(window).scroll(function () {
	// 	        let isScrollBottom = window.innerHeight + window.scrollY >= document.body.offsetHeight
	// 	        console.log(isScrollBottom)
	// 	        if (isScrollBottom) {
	// 	            $.getJSON("/bookshelves/nextList", {count: count})
	// 	                .done(res => {
	// 	                    console.log(res)

	// 	                    if (res != null) {

	// 	                        let postedbooks = $("<div>").addClass("postedBooks");
	// 	                        let postedbook = $("<div>").addClass("postedBook");
	// 	                        let book = $("<img>").addClass("book").attr("src","res[i].b_img_url").attr("isbn", "res[i].b_isbn");

	// 	                        function getPostedbook(index) {
	// 	                            return "<div class='postedBook'>" +
	// 	                                "<img src='" + res[index].b_img_url +
	// 	                                "' class='book' isbn='" + res[index].b_isbn + "'></div>"
	// 	                        }

	// 	                        for (let i = 0; i < res.length; i++) {
	// 	                        	postedbook.append(book);

	// 	                        	if(i == 10){
	// 	                        		postedbooks.append(postedbook);
	// 	                        		postedbooks.after("<hr class='bookshelvesHr'>");
	// 	                        	}
	// 	                        }
	// 	                            if (i == 10) {
	// 	                            	postedbook.append(book);
	// 	                            	postedbooks.append(postedbook);
	// 	                            }


	// 	                            $('.posted').append(getPostedbook(i));
	// 	                            if (i % 10 === 9 || i === res.length - 1) {
	// 	                                $('.posted').append("</div><hr class='bookshelvesHr'>")
	// 	                            }
	// 	                        }

	// 	                    }
	// 	                    count++
	// 	                })
	// 	        }
	<!-- Ajax Infinite Scroll -->

	let count = 1
	//     let timer;
	//     $(window).scroll(function () {
	//         let isScrollBottom = (window.innerHeight + window.scrollY) >= document.body.offsetHeight - 30;
	//         if (!timer) {
	//             timer = setTimeout(() => {
	//                 timer = null;
	//                 console.log(isScrollBottom);
	//                 if (isScrollBottom) {
	//                     infinityScroll()
	//                     $(window).scrollTop($(window).scrollTop());
	//                 }
	//             }, 100);
	//         }
	//     })

	var _throttleTimer = null;
	var _throttleDelay = 100;
	$(window).on('scroll', function (e) {
		//throttle event:
		clearTimeout(_throttleTimer);
		let element = $(window);
		_throttleTimer = setTimeout(function () {
			if(Math.ceil(document.documentElement.scrollHeight - element.scrollTop()) === element.height())  {
				infinityScroll();
				$(window).scrollTop($(window).scrollTop());
			}
		}, _throttleDelay);
	});


	function infinityScroll() {
//     	let postedBooks = document.querySelectorAll(`.postedBook`);
//         let lastBookCount = $(postedBooks[postedBooks.length-1]).attr("id");
//         console.log(lastBookCount);
// 		if(lastBookCount == 20){
		$.getJSON("/bookshelves/nextList", {count: count})
				.done(res => {
					console.log(res)
					if (res != null) {
						setPostedAppend(res)
					}
				})
//     }
	}

	function setPostedAppend(res) {
		let postedBooks = $("<div>").addClass("postedBooks");
		console.log(count);
		for (let i = 0; i < res.length; i++) {
			let postedbook = $("<div>").addClass("postedBook");
			let img = $("<img class='book'>").attr("src", res[i].b_img_url).attr("isbn", res[i].b_isbn);
			postedbook.append(img);
			postedBooks.append(postedbook);

			if (i % 10 === 9 || i === res.length - 1) {
				let hr = $("<hr class='bookshelvesHr'>");
				$('.posted').append(postedBooks).append(hr);
				postedBooks = $("<div>").addClass("postedBooks");
			}
		}

		count++
	}

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