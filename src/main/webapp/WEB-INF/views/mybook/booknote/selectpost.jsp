<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>selectPost</title>
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
a{
	text-decoration: none;
	color: black;
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

.postBtns {
	margin-left: auto;
}

.postBtns * {
	margin-left: 10px;
	margin-right: 3px;
	border: none;
	height: 28px;
	border-radius: 10%;
	box-shadow: 2px 2px 2px 2px #80808050;
	background-color: #5397fc50;
}

.postBtns *:hover {
	background-color: #5397fc50;
}

.selectPost {
	border: 1px solid #80808050;
	padding: 10px 10px 10px 10px;
}

.selectPHeader {
	padding: 10px 10px 10px 10px;
}

.postInfo {
	display: flex;
	justify-content: flex-end;
}

.bookInfo {
	display: flex;
}

.postTitle {
	text-align: center;
	font-size: 22px;
	margin-top: 30px;
	margin-bottom: 30px;
}

.postInfo>* {
	font-size: 15px;
}

.bookInfo {
	display: flex;
	padding: 10px 10px 10px 10px;
	justify-content: space-between;
}

.book {
	display: flex;
}

.bookInfo .img {
	width: 80px;
	display: flex;
	justify-content: center;
	margin-right: 10px;
}

.bookInfo img {
	height: 120px;
	width: 80px;
	border-radius: 2%;
	cursor: pointer;
}

.bookGenre {
	font-size: 13px;
}

.bookTitle {
	font-size: 16px;
	cursor: pointer;
}

.bookWriter {
	font-size: 16px;
}

.bookPublish {
	font-size: 13px;
}

.dates {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.datesTitle {
	font-size: 16px;
	text-align: end;
	margin-bottom: 10px;
}

.dyStFnRead {
	font-size: 13px;
}

.postContent {
	padding: 10px 10px 10px 10px;
}

.postLike {
	color: #80808050;
	text-align: center;
}

.postLikeCount {
	padding: 10px 10px 10px 10px;
}

span.size-45 {
	cursor: pointer;
	font-size: 45px;
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 200, 'opsz' 35
}

.pcCountTitle {
	font-size: 16px;
	padding: 10px 10px 10px 10px;
}

.pcCount {
	color: #5397fc;
}

.pcContents {
	width: 100%;
	display: flex;
	align-content: center;
	padding: 10px 10px 10px 10px;
}

.pcWriterImg {
	width: 6%;
	display: flex;
	align-items: center;
	margin-right: 15px;
}

.pcWriterImg img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	box-shadow: 2px 2px 2px 2px #80808050;
}

.pcContentsTxt {
	width: 94%;
}

.pcContentsInfo {
	display: flex;
	margin-bottom: 10px;
}

.pcWriter {
	font-size: 16px;
	display: flex;
	align-items: flex-end;
}

span.size-20 {
	color: #5397fc50;
	font-size: 20px;
	font-variation-settings: 'FILL' 1, 'wght' 200, 'GRAD' 200, 'opsz' 20
}

.pcWriteDate {
	font-size: 13px;
	display: flex;
	align-items: flex-end;
}

.pcBtn {
	margin-left: auto;
}

.insertPc {
	padding: 10px 10px 10px 10px;
	display: flex;
}

.insertPcContent {
	width: 100%;
}

.insertPcContentBox {
	height: 90px;
	width: 750px;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
	overflow: hidden;
	position: relative;
	overflow-y: auto;
	resize: none;
}

.insertPcBtn {
	width: 100%;
	position: relative;
	display: flex;
	align-self: center;
}

#insertPcBtn {
	position: absolute;
	top: 55%;
	transform: translate(0%, -50%);
	right: 8px;
	width: 70px;
	height: 90px;
	font-size: 15px;
	color: #808080;
	background-color: #5397fc50;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
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
							<a href="/member/toLogin">
								<p class="user" id="login">로그인</p>
							</a>
							<a href="/member/toSignup">
								<p class="user" id="signup">회원가입</p>
							</a>
						</c:when>
						<c:otherwise>
							<a id="nick">
								<p class="user" id="user">${nickname}님</p>
							</a>
							<a href="/member/logout">
								<p class="user" id="logout">로그아웃</p>
							</a>
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
					<li><span class="material-symbols-outlined size-35"
						id="snBookmark">book</span></li>
					<li class="selected"><span
						class="material-symbols-outlined size-35" id="snBooknote">edit</span></li>
				</ul>
			</div>
			<div class="contents">
				<div class="contentsHeader">
					<div id="contentsHeaderImg">
						<img src="/resources/profile/${mdto.sysprofname }" width="100"
							height="100" id="profile">
					</div>
					<div id="contentsHeaderTxt">${mdto.nickname }님&nbsp책하루와&nbsp함께한&nbsp${mdto.signup_date
						} 하루</div>
				</div>
				<div class="contentsBody">
					<div class="title">
						<div class="titleTxt">포스트</div>
						&nbsp <span class="material-symbols-outlined size-30">edit</span>

						<div class="postBtns">
							<c:choose>
								<c:when test="${loginID == dto.p_writer_id}">

									<button type="button" id="updPBtn">수정하기</button>
									<button type="button" id="delPBtn">삭제하기</button>
									<button type="button" id="toList">목록으로</button>
								</c:when>
								<c:otherwise>
									<button type="button" id="toList">목록으로</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="selectPost">
						<input type="hidden" id="p_seq" name="p_seq" value="${dto.p_seq }"
							p_writer_id="${dto.p_writer_id }">
						<div class="selectPHeader">
							<div class="postTitle">${dto.p_title }</div>
							<div class="postInfo">
								<div class="dyPostWrite">
									작성&nbsp
									<fmt:formatDate value="${dto.p_write_date }"
										pattern="yyyy.MM.DD HH:mm" />
								</div>
								<span>&nbsp|&nbsp</span>
								<div class="postViewCount">조회수&nbsp${dto.p_view_count }</div>
							</div>
						</div>
						<hr class="selectPHr">
						<div class="selectPBody">
							<div class="bookInfo">
								<div class="book">
									<div class="img">
										<img src="${dto.b_img_url }" alt="" isbn="${dto.b_isbn }" id="postBook">
									</div>
									<div class="txt">
										<div class="bookGenre">${dto.b_genre }</div>
										<p>
										<div class="bookTitle" isbn="${dto.b_isbn }">${dto.b_title }</div>
										</p>
										<p></p>
										<div class="bookWriter">${dto.b_writer }</div>
										</p>
										<div class="bookPublish">${dto.b_publisher }&nbsp|&nbsp${dto.b_publication_date
											}</div>
									</div>
								</div>
								<div class="dates">
									<div class="datesTitle">읽은 기간</div>
									<div class="dyStFnRead">
										<fmt:parseDate value="${dto.dyst_read }" var="dyst_read"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${dyst_read}" pattern="yyyy.MM.dd" />
										&nbsp~&nbsp
										<fmt:parseDate value="${dto.dyfn_read }" var="dyfn_read"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${dyfn_read}" pattern="yyyy.MM.dd" />
									</div>
								</div>
							</div>
							<hr class="selectPHr">
							<div class="postContent">${dto.p_content }</div>
							<div class="postLike" pseq="${dto.p_seq }" isbn=${dto.b_isbn }
								like="${result}"
								<c:if test="${result}">style="color: #5397fc;"</c:if>>
								<div class="postLikeIcon">
									<span class="material-symbols-outlined size-45">
										thumb_up </span>
								</div>
								<div class="postLikeCount">${dto.p_like_count }</div>
							</div>
						</div>
						<hr class="selectPHr">
						<div class="selectPFooter">
							<div class="postComment">
								<div class="pcCountTitle">댓글 <span class="pcCount">${dto.p_comment_count }</span></div>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${empty list}"> --%>
<!-- 										<div class="emptyPostComments">댓글이 없습니다.</div> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>

										<div class="postComments">
											<c:forEach var="i" items="${list}">
												<div class="pcContents" seq="${i.pc_seq }">
													<div class="pcWriterImg">
														<img src="/resources/profile/${i.sysprofname }">
													</div>
													<div class="pcContentsTxt">
														<div class="pcContentsInfo">
															<div class="pcWriter">
																<span class="material-symbols-outlined size-20">
																	cloud </span><span class="pcWriterNn">${i.pc_writer_nn }</span><span
																	class="material-symbols-outlined size-20"> cloud
																</span>
															</div>
															<div class="pcWriteDate">&nbsp&nbsp${i.pc_write_date
																}</div>
															<c:if test="${loginID == i.pc_writer_id }">
																<div class="pcBtn">
<!-- 																	<button class="updCBtn">수정</button> -->
																	<button class="delCBtn">삭제</button>
																</div>
															</c:if>
														</div>
														<div class="pcContent">${i.pc_content }</div>
													</div>
												</div>
											</c:forEach>
										</div>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
								<hr class="selectPCHr">
								<div class="insertPc">
									<div class="insertPcContent">
<!-- 										<textarea class="insertPcContentBox" maxlength="200"></textarea> -->
										<div class="insertPcContentBox" contenteditable="true"></div>
									</div>
									<div class="insertPcBtn">
										<button id="insertPcBtn">입력</button>
									</div>
								</div>
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
                $("#logoImg").on("click", function () {
                    location.href = "/";
                });

                $("#searchWord").on("keydown", function (e) {
                    if (e.keyCode == 13) {
                        $("#search").submit();
                    }
                });
                $("#notifications").on("click", function () {
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
                   	  location.href = "/delivery/selectBookbagListById?id=${loginID }";
              	  }
                })
                $("#bookshelves").on("click", function () {
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
                $("#snBookshelves").on("click", function () {
                    location.href = "/bookshelves/selectBookshelvesListById";
                });
    			$("#snCalendar").on("click",function(){
    				location.href = "/bookcalendar/toCalendar";
    			})
                $("#snStatistics").on("click", function () {
                    location.href = "/bookstatistics/toStatistics";
                });
                $("#snBookmark").on("click", function () {
                    location.href = "/bookmark/selectBookmarkListById";
                });
                $("#snBooknote").on("click", function () {
                    location.href = "/booknote/selectPostListRev";
                });
                $("#toList").on("click", function(){
                	location.href = "/booknote/selectPostListRev";
                })
                $("#delPBtn").on("click", function(){
                	
            		if(confirm("포스트를 삭제하시겠습니까?")){
                    	let p_seq = $(this).closest(".contentsBody").find("#p_seq").val();
                		let p_writer_id = $(this).closest(".contentsBody").find("#p_seq").attr("p_writer_id");  
                		if('<%=(String) session.getAttribute("loginID")%>' == p_writer_id){
            				location.href = "/booknote/deletePostByPseq?p_seq="+p_seq;
            			}
            		}
                })
                $("#updPBtn").on("click", function(){
					alert("수정은 다음 기회에..^_ㅠ");
                })
                

                
                
                $(".insertPcContentBox").keyup(function () {
                    let content = $(this).html();

                    // 글자수 세기
                    if (content.length == 0 || content == '') {
                        $('.textCount').text('0자');
                    } else {
                        $('.textCount').text(content.length + '자');
                    }
					console.log(content.length)
                    // 글자수 제한
                    if (content.length > 200) {
                        // 200자 부터는 타이핑 되지 않도록
                        $(this).html($(this).html().substring(0, 200));
                        // 200자 넘으면 알림창 뜨도록
                        alert('댓글은 200자까지 입력 가능합니다.');
                    };
                });
                
//                 $(function(){
//                 	postCommentList();
//                 })
                


                    function setPostCommentAppend(res) {

                        for (let i = 0; i < res.length; i++) {
                            let pcContents = $("<div>").addClass("pcContents").attr("seq", res[i].pc_seq);

                            let pcWriterImg = $("<div>").addClass("pcWriterImg");
                            let img = $("<img>").attr("src", "/resources/profile/"+res[i].sysprofname);

                            pcWriterImg.append(img);
                            pcContents.append(pcWriterImg);


                            let pcContentsTxt = $("<div>").addClass("pcContentsTxt");
                            let pcContentsInfo = $("<div>").addClass("pcContentsInfo");

                            let pcWriter = $("<div>").addClass("pcWriter");
                            let icon1 = $("<span>").addClass("material-symbols-outlined size-20").html("cloud");
							let pcWriterNn = $("<span>").addClass("pcWriterNn").html(res[i].pc_writer_nn);
                            let icon2 = $("<span>").addClass("material-symbols-outlined size-20").html("cloud");

                            pcWriter.append(icon1).append(pcWriterNn).append(icon2);

                            let pcWriteDate = $("<div>").addClass("pcWriteDate").html("&nbsp&nbsp" + res[i].pc_write_date);

                            pcContentsInfo.append(pcWriter).append(pcWriteDate);

                            let pcContent = $("<div>").addClass("pcContent").html(res[i].pc_content);

                            
                            if ('<%=(String) session.getAttribute("loginID")%>' == res[i].pc_writer_id) {
                                let pcBtn = $("<div>").addClass("pcBtn");
//                                 let updatePcBtn = $("<button>").addClass("updCBtn").attr("type", "button").text("수정");
                                let deletePcBtn = $("<button>").addClass("delCBtn").attr("type", "button").text("삭제");

//                                 pcBtn.append(updatePcBtn).append(deletePcBtn);
                                pcBtn.append(deletePcBtn);
                                pcContentsInfo.append(pcBtn);
                            }
                            pcContentsTxt.append(pcContentsInfo);
                            pcContentsTxt.append(pcContent);
                            pcContents.append(pcContentsTxt);


                            $(".postComments").append(pcContents);  
                            console.log("aaaaaaaaaa");
                        }
                    }

                    function postCommentList(data) {
                        let p_seq = $("#p_seq").val();
                        let arrPC = document.querySelectorAll(".pcContents");
                        let lastPc_seq = $(arrPC[arrPC.length-1]).attr("seq");
      
						if(lastPc_seq == null){
							lastPc_seq = 0;
						}
                    	console.log(lastPc_seq);


                        $.getJSON("/booknote/selectPCListByPseq", { "p_seq": p_seq, "pc_seq": lastPc_seq})
                            .done(res => {
                                if (res != null) {
                                	$(".pcCount").html("");
                                	$(".pcCount").append(data);
                                    setPostCommentAppend(res);

                                }
                            })

                    }
                    function insertPostComment(){

                        let pc_content = $(".insertPcContentBox").html();
                        let p_seq = $("#p_seq").val();

                        $.ajax({
                            url: "/booknote/insertPostComment",
                            type: "post",
                            data: {
                                "pc_content": pc_content,
                                "p_seq": p_seq
                            }, success:function(data){
                                postCommentList(data);
                                $(".insertPcContentBox").html("");
                            }
                        })
                    }

                    $("#insertPcBtn").on("click", function () {
                    	insertPostComment();
                    });
                    
                    $(".insertPcContentBox").on("keydown", function(e){
						if(e.keyCode == 13 && e.shiftKey == false) {
							let pc_content = $(".insertPcContentBox").html();
							insertPostComment();
						}
                    });
                    
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
        				
//         						console.log()
//         						$(tmp).attr("like","true");
//         						$(tmp).attr("style", "color:blue;");
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

        						
//         							$(tmp).attr("like","false");
//         							$(tmp).attr("style", "color:grey;");
                                    location.reload();
        						
        					})
        				}
        			})
$(function(){
	$(document).on("click", ".delCBtn", function(){
		if(confirm("댓글을 삭제하시겠습니까?")){
		let pc_seq = $(this).closest(".pcContents").attr("seq");
		let p_seq = $("#p_seq").val();
		$.ajax({
			url: "/booknote/deletePostComment",
			type: "post",
			data: {
				"pc_seq": pc_seq,
				"p_seq": p_seq
			}
		}).done(function(data){
			location.reload();
		})
		}
	})
	})
	
	$("#postBook").on("click", function(){
		let b_isbn = $(this).attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
	})
	$(".bookTitle").on("click", function(){
		let b_isbn = $(this).attr("isbn");
		location.href = "/book/selectBookinfo?b_isbn="+b_isbn;
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