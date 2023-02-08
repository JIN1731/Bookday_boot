<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>updatePost</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<style>
@font-face {
	font-family: '나눔스퀘어네오';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	box-sizing: border-box;
	font-family: '나눔스퀘어네오';
}

body {
	margin: 8px;
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
button:focus{ 	
    border: none;
    outline:none;
    }
/*     header */
.header {
	min-width: 978px;
	height: 150px;
	overflow: hidden;
	line-height: initial;
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

#nick {
	text-decoration: none;
}

#nick:hover {
	color: black;
	cursor: default;
}

/* headerHr */
#headerHr {
	display: block;
	height: 0px;
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
	display: flex;
	line-height: initial;
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
	width: 90%;
	overflow: hidden;
	min-width: 880.2px;
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
.contentsBody {
	width: 100%;
}

/* contentsBodyTitle */
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

/* ContentsBodyupdateBooknote */
.updateBooknote {
	width: 100%;
}

.updateBooknoteHeader {
	width: 100%;
}

.divider {
	border-top: 1px solid rgb(216, 216, 216);
	margin-top: 8px;
	margin-bottom: 15px;
}

/* ContentsBodyupdateBooknoteSearchBookInfo */
.updateBooknoteBookInfo {
	height: 50px;
	width: 100%;
	display: flex;
	align-items: center;
}

.booknoteBookSearchTitle {
	font-size: 15px;
	margin-right: 10px;
	padding-bottom: 10px;
}

.booknoteBookSearchBox {
	position: relative;
	bottom: 5px;
	overflow: hidden;
	height: 40px;
	width: 244.5px;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
}

.booknoteBookSearchTxt {
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

.booknoteBookSearchBtn {
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

/* ContentsBodyupdateBooknoteDate */
.updateBooknoteDate {
	height: 50px;
	width: 100%;
	display: flex;
	align-items: center;
}

.updateBooknoteDateTitle {
	font-size: 15px;
	margin-right: 10px;
	padding-bottom: 10px;
}

.updateBooknoteDateInput {
	position: relative;
	bottom: 5px;
	overflow: hidden;
	height: 40px;
	width: 260px;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
}

#demo {
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

.updateBooknoteDateBtn {
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

/* updateBooknoteTitle */
.updateBooknoteTitle {
	height: 50px;
	width: 100%;
	display: flex;
	align-items: center;
		margin-bottom: 8px;
	
}

.updateBooknoteTitleTitle {
	font-size: 15px;
	margin-right: 10px;
	padding-bottom: 10px;
}

.updateBooknoteTitleBox {
	position: relative;
	bottom: 5px;
	overflow: hidden;
	height: 40px;
	width: 837px;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
}

#updateBooknoteTitleTxt {
	float: left;
	padding: 0;
	background: none;
	border: none;
	outline: none;
	font-size: 15px;
	line-height: 40px;
	position: absolute;
	left: 10px;
	right:10px;
}

/* ContentsBodyupdateBooknoteBtn */
.updateBooknoteBtn {
	float: left;
	width: 100%;
	height: 50px;
	position: relative;
}

#updateBooknoteBtn {
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

/*footerHr*/
.footerHr{
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid rgb(216, 216, 216);
	margin-top: 50px;
	margin-bottom: 15px;
}

/* footer */
.footer {
    margin:5px;
}

.f_header{
    display: inline-flex;
    margin-top:10px;
}

.f_header>a>img{
    width:200px;
}

.sns_icon{
  position: relative;
  top:1px;
  left:595px;
}

.sns_icon>a>img{
	  height:20px;
}

.business_info{
    margin-top:30px;
}

#business_info_title{
    font-size: x-small;
    color: #808080d6;
}

.business_info>span{
    margin-top:5px;
}

.f_intro{
    margin-top:15px;
    margin-bottom:20px;
    font-size: small;
}

.f_intro>span{
   color:#4d4b4bc1;
}

.f_line{
    color: #808080d6;
}

.business_info{
    margin-top:20px;
}
#business_info_text{
    margin-top:10px;
    font-size: x-small;
    color: #808080d6;
}
.inline_info{
    display: inline-flex;
}

#arrow_down2,#arrow_up2{
    position: relative;
    bottom:6px;
    color: #808080d6;
}

#arrow_up2{
display:none;
}

.sns_icon>a>img{
    width:40px;
    height:40px;
}

.copyright{
    margin-top:5px;
    font-size: x-small;
}
</style>
<script>

                $(document)
                    .ready(
                        function () {
                            $('#summernote')
                                .summernote(
                                    {
                                        lang: 'ko-KR',
                                        height: 400,
                                        placeholder: "내용을 입력해주세요.",
                                        fontNames: ['나눔스퀘어네오'],
                                        // addDefaultFonts: false,
                                        fontNamesIgnoreCheck: ['나눔스퀘어네오'],
                                        callbacks: {
                                        	onImageUpload : function(files) {
                                                // 파일 업로드(다중업로드를 위해 반복문 사용)
                                                for (var i = files.length - 1; i >= 0; i--) {
                                                	// 이미지 아닌 것 막기
                                                	let ext = files[i].name.split(".").pop().toLowerCase();
                                                	let accept = ["png","jpg","jpeg","gif"];
                                                	let result = $.inArray(ext,accept);
                                                	if(result==-1){//배열이 아닐 때
                                            			alert("png,jpg,jpeg,gif 만 사용가능합니다.");
                                                		continue;
                                            		}
                                                uploadSummernoteImageFile(files[i],this);
                                                		}
                                                	}

                                        }
                                    });
                            function uploadSummernoteImageFile(file, el) {
                    			data = new FormData();
                    			data.append("file", file);
                    			console.log(file)
                    			$.ajax({
                    				data : data,
                    				type : "POST",
                    				url : "/booknote/uploadSummernoteImageFile",
                    				contentType : false,
                    				enctype : 'multipart/form-data',
                    				processData : false,
                    				success : function(data) {
                    					console.log(data.url)
                    					$(el).summernote('editor.insertImage', data.url);
                    				}
                    			});
                    		}
                            $('#updateBooknoteBtn').on('click', function () {
            					if($(".searchResultBookInfo").attr("isbn") == null){
            						alert("책을 검색해주세요.");
            						return false;
            					}
                                if ($("#updateBooknoteTitleTxt").val() == "") {
                                    alert('제목을 입력해주세요.');
                                    return false;
                                }
                                if ($('#summernote').summernote('isEmpty')) {
                                    alert("내용을 입력해주세요.");
                                    return false;
                                }
                                saveContent();
                            });
                            function saveContent() {

                                //값 가져오기
                                var summernoteContent = $('#summernote')
                                    .summernote('code'); //썸머노트(설명)
                                console.log("summernoteContent : "
                                    + summernoteContent);
                                var b_isbn = $(".searchResultBookInfo").attr("isbn");
                                var b_img_url = $("#b_img_url").attr("src");
                                var b_title = $(".bookTitle").html();
                                var b_writer = $(".bookWriter").html();
                                var b_genre = $(".bookGenre").html();
                                var b_publisher = $(".bookPublisher").html();
                                var b_publication_date = $(".bookPublicationDate").html();
                                var start = $("#demo").attr("start");
                                var finish = $("#demo").attr("finish");
								var dyst_read = $("#demo").val().substring(0,10);
								var dyfn_read = $("#demo").val().substring(13,23);
								var p_writer_nn = $("#contentsHeaderTxt").attr("p_writer_nn");
                                var p_title = $("#updateBooknoteTitleTxt").val();

                                $
                                    .ajax({
                                        url: "/booknote/updatePost",
                                        type: "post",
                                        data: {
                                            "b_isbn": b_isbn,
                                            "b_img_url": b_img_url,
                                            "b_title": b_title,
                                            "b_writer": b_writer,
                                            "b_genre": b_genre,
                                            "b_publisher": b_publisher,
                                            "b_publication_date": b_publication_date,
                                            "dyst_read": dyst_read,
                                            "dyfn_read": dyfn_read,
                                            "p_writer_nn": p_writer_nn,
                                            "p_title": p_title,
                                            "p_content": summernoteContent
                                        },		

                                        success: function (data) {
                                            var p_seq = data;
                                            console.log(p_seq)
                                            location.href = "/booknote/selectPostByPseq?p_seq="
                                                + p_seq;
                                                
                                        }
                                    });
                            }
                            ;
                        });
            </script>
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
						<img src="/resources/profile/${mdto.sysprofname }" width="100" height="100"
							id="profile">
					</div>
					<div id="contentsHeaderTxt" p_writer_nn="${mdto.nickname }">${mdto.nickname }님&nbsp책하루와&nbsp함께한&nbsp${mdto.signup_date
						} 하루</div>
				</div>
				<div class="contentsBody">
					<div class="title">
						<div class="titleTxt">POST</div>
						&nbsp <span class="material-symbols-outlined size-30">edit</span>
					</div>
					<div class="updateBooknote">
						<div class="bookInfo">
							<div class="updateBooknoteBookInfo">
								<div class="booknoteBookSearchTitle">책 검색</div>
								<div class="booknoteBookSearchBox">
									<input class="booknoteBookSearchTxt" type="text"
										placeholder="검색어를 입력해 주세요" id="booknoteBookSearchWord"
										name="booknoteBookSearchWord" maxlength="100">
									<button class="booknoteBookSearchBtn">
										<span class="material-symbols-outlined"> search </span>
									</button>
								</div>
							</div>
							<div class="searchResultBookInfo" isbn="${dto.b_isbn }"><table><tr><td class="bookCover"><img src="${dto.b_img_url }" id="b_img_url"></a></td><td class="bookInfo"><p><span class="bookGenre">${dto.b_genre }</span></p><p><span class="bookTitle">${dto.b_title }</span></p><p><span class="bookWriter">${dto.b_writer }</span></p><span class="bookPublisher">${dto.b_publisher }</span><span class="between">&nbsp;|&nbsp;</span><span class="bookPublicationDate">${dto.b_publication_date }</span></td></tr></table></div>
						</div>
					</div>
					<hr class="divider">
					<div class="updateBooknoteDate">
						<div class="updateBooknoteDateTitle">읽은 기간 선택</div>
						<div class="updateBooknoteDateInput">
							<input type="text" id="demo" name="demo" value="${dto.dyst_read } ~ ${dto.dyfn_read }">
							<button class="updateBooknoteDateBtn">
								<span class="material-symbols-outlined"> calendar_month </span>
							</button>
						</div>
					</div>
					<hr class="divider">
					<div class="updateBooknoteTitle">
						<div class="updateBooknoteTitleTitle">제목</div>
						<div class="updateBooknoteTitleBox">
							<input type="text" id="updateBooknoteTitleTxt"
								placeholder="제목을 입력해주세요." maxlength="101" value="${dto.p_title }">

						</div>
					</div>
					<div class="updateBooknoteContent">
						<div id="summernote" name="booknoteContent">${dto.p_content }</div>
					</div>
					<div class="updateBooknoteBtn">
						<button id="updateBooknoteBtn">수정</button>
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
					<a href="#"><img src="/resources/twitter_black.png" id="twitter"></a>
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
					<span>대표자 성태조 </span>
					<span> | </span>
					<span> 사업자 등록번호 01-20-22015</span>
					<p>주소 서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F</p>
					<span>대표전화 1544-9970 </span>
					<span> | </span>
					<span> 이메일 help@bookday.com</span>
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
                })

                $("#searchword").on("keydown", function (e) {
                    if (e.keyCode == 13) {
                        $("#search").submit();
                    }
                })
                $("#notifications").on("click", function () {
    				alert(new Date());
                })
                $("#bookbag").on("click", function() {
		    	  if(${loginID == null}) {
		              location.href = "/member/toLogin";
		    	  }else {
		         	  location.href = "/delivery/selectBookbagListById?id=${loginID }";
		    	  }
		        })
                $("#bookshelves").on("click", function () {
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
                $("#snBookshelves").on("click", function () {
                    location.href = "/bookshelves/selectBookshelvesListById";
                })
				$("#snCalendar").on("click",function(){
					location.href = "/bookcalendar/toCalendar";
				})                
				$("#snStatistics").on("click", function () {
                    location.href = "/bookstatistics/toStatistics";
                })
                $("#snBookmark").on("click", function () {
                    location.href = "/bookmark/selectBookmarkListById";
                })
                $("#snBooknote").on("click", function () {
                    location.href = "/booknote/selectPostListRev";
                })
                $("#booknoteBookSearchWord").on("keydown", function (e) {
                    if (e.keyCode == 13) {
                        var searchWord = $("#booknoteBookSearchWord").val();
                        $("#booknoteBookSearchWord").val("");
                        window.open("/book/toBookSearchPop?searchWord="
                            + searchWord, "", "width=600,height=600");
                    }
                });
                $(".booknoteBookSearchBtn").on(
                    "click",
                    function () {
                        var searchWord = $("#booknoteBookSearchWord").val();
                        window.open("/book/toBookSearchPop?searchWord="
                            + searchWord, "", "width=600,height=600");
                        $("#booknoteBookSearchWord").val("");

                    });

                $(function () {

                    $(".updateBooknoteDateBtn").on("click", function () {
                        $("#demo").click();
                    })

                    $("#demo").daterangepicker(
                        {
                            "locale": {
                                "format": "YYYY-MM-DD",
                                "separator": " ~ ",
                                "applyLabel": "확인",
                                "cancelLabel": "취소",
                                "fromLabel": "From",
                                "toLabel": "To",
                                "customRangeLabel": "Custom",
                                "weekLabel": "W",
                                "daysOfWeek": ["일", "월", "화", "수", "목", "금",
                                    "토"],
                                "monthNames": ["1월", "2월", "3월", "4월", "5월",
                                    "6월", "7월", "8월", "9월", "10월", "11월",
                                    "12월"],
                            },
                            "startDate": new Date(),
                            "endDate": new Date(),
                            "maxDate": new Date(),
                            "drops": "auto"
                        },

                        function (start, end, label) {
                            console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
                        });
                });

                function initSearchBook(b_isbn, b_genre, b_img_url, b_title,
                    b_writer, b_publisher, b_publication_date) {
                	
                	$(".searchResultBookInfo *").remove();

                    let tdBookCover = $("<td>").addClass("bookCover");
                    let tdBookCoverA = $("<a>").attr("href","#");
                    let tdBookCoverImg = $("<img>").attr("src", b_img_url).attr("id", "b_img_url");

                    tdBookCoverA.append(tdBookCoverImg);
                    tdBookCover.append(tdBookCoverA);


                    let p1 = $("<p>");
                    let spanBookGenre = $("<span>").addClass("bookGenre").html(b_genre);
                       
                    let p2 = $("<p>");
                    let spanBookTitle = $("<span>").addClass("bookTitle");
                    let aBookTitle = $("<a>").attr("href","#").attr("id", "b_title").html(b_title);
                    
                    let p3 = $("<p>");
                    let spanBookWriter = $("<span>").addClass("bookWriter").html(b_writer);

                    let spanBookPublisher = $("<span>").addClass("bookPublisher").html(b_publisher);
                    let spanBetween = $("<span>").addClass("between").html("&nbsp|&nbsp");
                    let spanBookPublicationDate = $("<span>").addClass("bookPublicationDate").html(b_publication_date);
                    
                    p1.append(spanBookGenre);
                    
                    spanBookTitle.append(aBookTitle);
                    p2.append(spanBookTitle);

                    p3.append(spanBookWriter);

                    let tdBookInfo = $("<td>").addClass("bookInfo");
                    tdBookInfo.append(p1);
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

                    $(".bookInfo").append(divSearchResultBookInfo);

                }
                $('#updateBooknoteTitleTxt').keyup(function () {
                    let title = $(this).val();

                    // 글자수 세기
                    if (title.length == 0 || title == '') {
                        $('.textCount').text('0자');
                    } else {
                        $('.textCount').text(title.length + '자');
                    }
					console.log(title.length)
                    // 글자수 제한
                    if (title.length > 100) {
                        // 100자 부터는 타이핑 되지 않도록
                        $(this).val($(this).val().substring(0, 100));
                        // 100자 넘으면 알림창 뜨도록
                        alert('제목은 100자까지 입력 가능합니다.');
                    };
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