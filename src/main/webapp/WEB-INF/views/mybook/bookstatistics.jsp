<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookStatistics</title>
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
/* 	border: 1px solid black; */
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

.sideNavi ul {
	list-style-type: none;
	margin-top: 20px;
	padding-left: 0px;
}

.sideNavi li {
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

/*contents*/
.statistics {
	width: 100%;
}

.favorite {
	width: 100%;
}
.statTitle{
margin-top: 40px;
    margin-bottom: 20px;
    font-size: 20px;
}

.statTitle span.size-27 {
	font-size: 27px;
	color: #5397fc;
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 27
}
.statCont {
	display: flex;
	width: 100%;
	justify-content: space-between;
}

.fvrBox {
	width: 30%;
}

.fvrTxt {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
}

.fvrTxt span.size-25 {
	font-size: 25px;
	color: gray;
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 25
}

.fvrCon {
	height: 180px;
	text-align: center;
		overflow-y: scroll;
}
.fvrCon::-webkit-scrollbar {
display:none;
}


.fvrCon .fvrBook{
	width: 80px;
	height: 120px;
	border-radius: 2%;
}

.fvrBook, .fvrWriter, .fvrGenre{
	cursor:pointer;
}


.explanation{
	line-height: 80px;
	height : 70px;
	font-size: 15px;
	text-align: center;
	color: #80808050;
}
.explanation span.size-20 {
	color: #5397fc50;
	font-size: 20px;
	font-variation-settings: 'FILL' 1, 'wght' 200, 'GRAD' 200, 'opsz' 20
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
					<li><span
						class="material-symbols-outlined size-35" id="snCalendar">calendar_month</span></li>
					<li class="selected"><span class="material-symbols-outlined size-35"
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
							id="profile">

					</div>
					<div id="contentsHeaderTxt">${dto.nickname}님&nbsp책하루와&nbsp함께한&nbsp${dto.signup_date
						} 하루</div>
				</div>
				<div class="contentsBody">
					<div class="title">
						<div class="titleTxt">통계</div>
						&nbsp <span class="material-symbols-outlined size-30">equalizer</span>
					</div>
					<div class="statistics">
						<div class="favorite">
							<div class="statTitle">
								favorite<span
									class="material-symbols-outlined size-27">cloud</span>
							</div>
							<div class="statCont">
								<div class="fvrBox">
									<div class="fvrTxt">
										책<span class="material-symbols-outlined size-25">import_contacts</span>
									</div>
									<hr class="fvrHr">
									<c:choose>
										<c:when test="${empty data}">
											<div class="fvrCon">
												<p>가장 좋아하는 책이 아직 없습니다.</p>
												<p>책을 읽고 포스트를 작성해보세요.</p>
											</div>
										</c:when>
										<c:otherwise>
											<div class="fvrCon">
											<c:forEach var="i" items="${data }">
												<p>
													<img src="${i.B_IMG_URL }" isbn="${i.B_ISBN}" class="fvrBook">
												</p>
											</c:forEach>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="fvrBox">
									<div class="fvrTxt">
										작가<span class="material-symbols-outlined size-25">history_edu</span>
									</div>
									<hr class="fvrHr">
									<c:choose>
										<c:when test="${empty fvrWriter}">
											<div class="fvrCon">
												<p>가장 좋아하는 작가가 아직 없습니다.</p>
												<p>책을 읽고 포스트를 작성해보세요.</p>
											</div>
										</c:when>
										<c:otherwise>
											<div class="fvrCon">
											<c:forEach var="w" items="${fvrWriter }">
												<p><span class="fvrWriter">${w.B_WRITER }</span></p>
											</c:forEach>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="fvrBox">
									<div class="fvrTxt">
										장르<span class="material-symbols-outlined size-25">web_stories</span>
									</div>
									<hr class="fvrHr">
									<c:choose>
										<c:when test="${empty fvrGenre}">
											<div class="fvrCon">
												<p>가장 좋아하는 장르가 아직 없습니다.</p>
												<p>책을 읽고 포스트를 작성해보세요.</p>
											</div>
										</c:when>
										<c:otherwise>
											<div class="fvrCon">
											<c:forEach var="g" items="${fvrGenre }">
												<p><span class="fvrGenre">${g.B_GENRE }</span></p>
											</c:forEach>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
																<div class="explanation">
						<span class="material-symbols-outlined size-20">cloud </span>
						해당 항목에서 스크롤 시 더 많은 데이터를 볼 수 있습니다
						<span class="material-symbols-outlined size-20">cloud </span>
					</div>
<!-- 						<div class="related"> -->
<!-- 						<div class="statTitle"> -->
<!-- 						popular<span -->
<!-- 									class="material-symbols-outlined size-27">cloud</span> -->
<!-- 						</div> -->
<!-- 						<div class="statCont"> -->
<!-- 						<div class="popPost"></div> -->
<!-- 						<div class="popBook"></div> -->
						</div>
						</div>
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
				if (loginID == null) {
					location.href = "/member/login";
				}
				location.href = "/member/toMypage";
			});
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

			$(document).on("click", ".fvrBook", function(){
				let b_isbn = $(this).attr("isbn");
				location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
			})
			$(document).on("click", ".fvrWriter", function(){
				let writer = $(this).html();
				location.href = "/search/toSearch?searchWord="+writer;
			})
			$(document).on("click", ".fvrGenre", function(){
				let genre = $(this).text();
				location.href = "/search/toSearch?searchWord="+genre;
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