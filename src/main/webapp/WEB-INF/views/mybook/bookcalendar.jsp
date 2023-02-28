<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookCalendar</title>
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
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 35
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
/*contents*/
.bookCal, .bookYear{
	cursor:pointer;
}
.rap {
	max-width: 700px;
	margin: auto;
	margin-bottom: 50px;
}

.dateHead {
	margin: .4rem 0;
}

.dateHead div {
	background: #5397fc50;
	color: #fff;
	text-align: center;
	border-radius: 5px;
}

.grid {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	grid-gap: 5px;
}

.grid div {
	padding: 7px;
	font-size: 14px;
}

.dateBoard div {
	color: #222;
	font-weight: bold;
	height: 158px;
	border-radius: 5px;
	border: 1px solid #eee;
	display: flex;
	flex-wrap: wrap;
	width: 95.71px;
	overflow-y: scroll;
}
.dateBoard div::-webkit-scrollbar {
display:none;
}
.bookCal {
	width: 80px;
	height: 120px;
	border-radius: 2%;
}

.noColor {
	background: #eee;
}

.calHeader {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 1rem 2rem;
}

.calHeader * {
	font-size: 18px;
}

/* 좌우 버튼 */
.btn {
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	cursor: pointer;
}

.prevDay {
	transform: rotate(-135deg);
}

.nextDay {
	transform: rotate(45deg);
}
/* 연 */
.chart_box ul, li {
	list-style: none;
}

.vertical_chart_box {
	position: relative;
	width: 700px;
	height: 700px;
	margin: auto;
}

.vertical_chart_box .chart_box {
	position: relative;
	box-sizing: border-box;
	height: 600px;
	margin-top: 20px;
}

.vertical_chart_box .axis_x {
	display: -webkit-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	justify-content: center;
	position: relative;
	padding: 0;
	box-sizing: border-box;
	height: 100%;
	border-bottom: 1px solid #d3d3d3;
	margin-top:0px;
}

.vertical_chart_box .month {
	flex: 1;
	position: relative;
}

.vertical_chart_box .month .text_box {
	position: absolute;
	bottom: -35px;
	left: 50%;
	text-align: center;
	-webkit-transform: translate(-50%, 0);
	-ms-transform: translate(-50%, 0);
	-o-transform: translate(-50%, 0);
	transform: translate(-50%, 0);
	width: 40px;
	font-size:15px;
}

.vertical_chart_box .month_book {
	display: -webkit-flex;
	display: -ms-flex;
	display: -o-flex;
	display: flex;
	flex-direction: column-reverse;
	position: relative;
	margin: 0 auto;
	padding: 0;
	width: 40px;
	height: 100%;
	overflow-y: scroll;
}

.vertical_chart_box .month_book::-webkit-scrollbar {
display:none;
}

.month_book span {
	display: contents;
	position: relative;
	box-sizing: content-box;
	width: 100%;
}

.vertical_chart_box .month_book {
	border: 0;
}

.bookYear{
	width: 40px;
	height: 60px;
	border-radius: 2%;
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
					<li class="selected"><span class="material-symbols-outlined size-35" id="snCalendar">calendar_month</span></li>
					<li><span
						class="material-symbols-outlined size-35" id="snStatistics">equalizer</span></li>
					<li><span class="material-symbols-outlined size-35"
						id="snBookmark">book</span></li>
					<li><span class="material-symbols-outlined size-35"
						id="snBooknote">edit</span></li>
				</ul>
			</div>
			<div class="contents">
				<div class="contentsHeader">
					<div id="contentsHeaderImg">
						<img src="/resources/profile/${dto.sysprofname}" width="100"
							height="100" id="profile">
					</div>
					<div id="contentsHeaderTxt">${dto.nickname }님&nbsp책하루와&nbsp함께한&nbsp${dto.signup_date
						} 하루</div>
				</div>
				<div class="contentsBody">
					<div class="title">
						<div class="titleTxt">책달력</div>
						&nbsp <span class="material-symbols-outlined size-30">calendar_month</span>
					</div>
					
					<div class="explanation">
						<span class="material-symbols-outlined size-20">cloud </span>
						해당 일에서 스크롤 시 더 많은 책들을 볼 수 있습니다
						<span class="material-symbols-outlined size-20">cloud </span>
					</div>
					<div class="calendar">
						<div class='rap'>
							<div class="calHeader">
								<div class="btn prevDay"></div>
								<h2 class='dateTitle'></h2>
								<div class="btn nextDay"></div>
							</div>

							<div class="grid dateHead">
								<div>일</div>
								<div>월</div>
								<div>화</div>
								<div>수</div>
								<div>목</div>
								<div>금</div>
								<div>토</div>
							</div>

							<div class="grid dateBoard"></div>
						</div>
					</div>
					<div class="explanation">
						<span class="material-symbols-outlined size-20">cloud </span>
						해당 월에서 스크롤 시 더 많은 책들을 볼 수 있습니다
						<span class="material-symbols-outlined size-20">cloud </span>
					</div>
					<div class="vertical_chart_box">
						<div class="chart_box">
							<ul class="axis_x">
								<li class="month">
									<div class="text_box prevMonth">1월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="01"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">2월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="02"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">3월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="03"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">4월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="04"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">5월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="05"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">6월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="06"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">7월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="07"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">8월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="08"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">9월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="09"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">10월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="10"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box prevMonth">11월</div>
									<div type="div" class="month_book">
										<span class="bookImg" month="11"></span>
									</div>
								</li>
								<li class="month">
									<div class="text_box thisMonth"></div>
									<div type="div" class="month_book">
										<span class="bookImg" month="12"></span>
									</div>
								</li>
							</ul>
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
			$(document).on("click", ".bookCal, .bookYear", function(){
				let b_isbn = $(this).attr("isbn");
				location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
			})

			const makeCalendar = (date) => {
				  // 현재 년도와 월 받아오기
				  const currentYear = new Date(date).getFullYear(); //2023
				  const currentMonth = new Date(date).getMonth() + 1; //1월 [0]+1
				console.log(currentYear);
				  // 첫날의 요일 구하기 - 초기 시작위치를 위해서
				  const firstDay = new Date(date.setDate(1)).getDay();//0->일
				  console.log(new Date(date.setDate(7)).getDay());
				  // 마지막 날짜 구하기
				  const lastDay = new Date(currentYear, currentMonth, 0).getDate(); // 2023, [0]->1월, 31일
				console.log(new Date(currentYear, currentMonth, 0).getDate());
				  // 남은 박스만큼 다음달 날짜 표시
				  const limitDay = firstDay + lastDay; //0+31
				      console.log(limitDay)
				  const nextDay = Math.ceil(limitDay / 7) * 7; //31/7=4...3->올림->5*7= 35 5주 즉 35칸이 나온다

				  let htmlDummy = '';

				  // 한달전 날짜 표시하기
				  for (let i = 0; i < firstDay; i++) {// 0이니까 없지
				    htmlDummy += `<div class="noColor"></div>`;
				  }

				  // 이번달 날짜 표시하기
				  for (let i = 1; i <= lastDay; i++) {    // 31일이니까 31일까지
				    htmlDummy += '<div class="date" year="'+ currentYear +'" month="'+ currentMonth+'" day='+i+'>'+i+'</div>';
				  }

				  // 다음달 날짜 표시하기
				  for (let i = limitDay; i < nextDay; i++) { // 31,32,33,34[]
				    console.log(i)
				    htmlDummy += `<div class="noColor"></div>`;
				  }

				  document.querySelector(`.dateBoard`).innerHTML = htmlDummy;
				  document.querySelector(`.dateTitle`).innerText = currentYear+'년'+' '+currentMonth+'월';
				  document.querySelector(`.thisMonth`).innerText = currentMonth+'월';
				  document.querySelector(`.thisMonth`).setAttribute("year", currentYear);
				  document.querySelector(`.thisMonth`).setAttribute("month", currentMonth);
				  
				  let month = new Date(date).getMonth() + 1;
				  let year = new Date(date).getFullYear();
				  document.querySelectorAll(`.prevMonth`).forEach(item=>{
					  
					  if(++month>12){
						  month = 1;
						  year++
					  }
					  item.innerText= month+'월';
					  item.setAttribute("year", year-1);
					  item.setAttribute("month", month);
				  })
			}


				const date = new Date();

				makeCalendar(date);

				// 이전달 이동
				document.querySelector(`.prevDay`).onclick = () => {
				makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
				getBookCal();
				}

				// 다음달 이동
				document.querySelector(`.nextDay`).onclick = () => {
				    let year = $(".dateTitle").html().substring(0,4);
				let month = $(".dateTitle").html().slice(-3,-1).replace(" ", "");
				console.log(year+month)
				console.log(new Date().getFullYear());
				console.log(new Date().getMonth()+1);
				if(Number(year) == new Date().getFullYear() && Number(month) == new Date().getMonth()+1){
				    return false;
				    // 넘어가는 버튼 안보이게는 시간나면 하자
				}
				makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
				getBookCal();

				}
				function getBookCal(){
					$.getJSON("/bookstatistics/selectBookCalbyId")
			        .done(res => {
			            if (res != null) {
			            	console.log(res)
			                setCalAppend(res);
			                setYearAppend(res);
			            }
			        })
				}
				
				
				function setCalAppend(res) {

				let year = $(".date").attr("year");
				let month = $(".date").attr("month");
				let days = document.querySelectorAll(".date");
				res.forEach(list=>{

					let start = new Date(list.dyst_read).getTime()/86400000;
					let finish = new Date(list.dyfn_read).getTime()/86400000;

					days.forEach(day=>{
						let cal = new Date(year+'-'+month.padStart(2, '0')+'-'+$(day).attr("day").padStart(2, '0')+' '+'00:00:00')
						getTimeDate = cal.getTime()/86400000
						
						for(let j = start; j <= finish; j++){
							console.log('j : '+j+'gt : ' + getTimeDate + '=' +(j==getTimeDate))
						  if(getTimeDate == j){
							  $(day).append('<img src='+list.b_img_url+' class="bookCal" isbn='+list.b_isbn+'>');
						  }					
						}
							
						
					})
					
				})
				
				}

			    function setYearAppend(res) {
			    	$(".bookYear").remove();
			        let arr = document.querySelectorAll(".text_box");
			        arr.forEach(i=>{
			        	let year = $(i).attr("year");
			        	let month = $(i).attr("month").padStart(2, '0');
		
			        res.forEach(list => {
			        	let yrfn_read = list.dyfn_read.substring(0, 4);
			            let mnfn_read = list.dyfn_read.substring(5, 7);
			        	console.log(mnfn_read)
			            console.log(year == yrfn_read && month == mnfn_read)
			            if (year == yrfn_read && month == mnfn_read) {
			                $(i).siblings(".month_book").append('<img src="' + list.b_img_url + '" class="bookYear"  isbn='+list.b_isbn+'>');
			            }

			        })
			        })
			    }
				$(function(){
					 getBookCal();						


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