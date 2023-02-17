
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset="UTF-8">
<title>책하루 도서 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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

div {
	/* 	border: 1px solid black; */
	
}

.container {
	margin: auto;
	overflow: hidden;
	width: 978px;
}

hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid rgb(216, 216, 216);
	margin-top: 15px;
	margin-bottom: 15px;
}

/*     header */
.header {
	height: 150px;
	overflow: hidden;
}

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
	box-shadow: 3px 3px 3px 3px #80808050;
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

.icons {
	float: left;
	position: relative;
	width: 20%;
	height: 100%;
}

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

#login {
	width: 100px;
	text-align: right;
}

#nick {
	text-decoration: none;
	width: 100px;
}

#nick:hover {
	color: black;
	cursor: default;
}

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

/*     header */

/* navi */
.navi {
	width: 100%;
	height: 50px;
}

.body {
	overflow: hidden;
}

.box, .b_etc, .post-link, .link_btn, #b_genre {
	display: inline-flex;
}

.box {
	width: 978px;
	position: relative;
	overflow: hidden;
}

.b_img>img {
	width: 250px;
	height: 375px;
	background: linear-gradient(to right, rgba(0, 0, 0, .3) 3px,
		rgba(255, 255, 255, 0.5) 5px, rgba(255, 255, 255, 0.25) 7px,
		rgba(255, 255, 255, 0.25) 10px, transparent 12px, transparent 16px,
		rgba(255, 255, 255, 0.25) 20px, transparent 22px);
	box-shadow: 0 0 5px -1px rgba(0, 0, 0, 1), inset -1px 1px 2px
		rgba(255, 255, 255, 0.5);
	border-radius: 5px;
	/* margin-left: 38px; */
}

#label {
	position: relative;
	top: 5px;
}

.b_title {
	margin-left: 20px;
	margin-top: 5px;
}

#b_title {
	font-size: 30px;
}

.box>div>p, .box>div>div>p {
	margin: 20px;
	margin-top: 5px;
}
#b_genre, #b_writer, #b_publisher{
	cursor: pointer;
}
.b_etc {
	margin-bottom: 25px;
	width: fit-content;
}

/* 기본정보 구분선 */
.line {
	margin: 0px;
	padding: 0px;
}

.b_genre {
	margin: 20px;
	margin-bottom: 0px;
}

#b_genre {
	margin: 0px;
}

.link_btn {
	margin-left: 20px;
	top: 85%;
	position: absolute;
	justify-content: space-evenly;
}

.link_btn>input {
	width: 330px;
	height: 50px;
	border: 1px solid #5397fc;
	background-color: white;
	color: #5397fc;
	border-radius: 5px;
}

.link_btn>span {
	color: #5397fc;
}

.link_btn>input {
	cursor: pointer;
}

#to_bag {
	margin-left: 26px;
}

#heart {
	position: relative;
	right: 660px;
	top: 13px;
	font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 48
}

#bookbag2 {
	position: relative;
	right: 335px;
	top: 8px;
	font-size: 35px;
	font-variation-settings: 'FILL' 0, 'wght' 200, 'GRAD' 0, 'opsz' 20
}

#to_write {
	font-variation-settings: 'FILL' 0, 'wght' 300, 'GRAD' 0, 'opsz' 48
}

.detail {
	width: 100%;
	margin-top: 25px;
	line-height: 30px;
	overflow: hidden;
}

#arrow_down, #arrow_up {
	position: relative;
	bottom: 35px;
	left: 95%;
	color: white;
}

#arrow_up {
	display: none;
}

.intro {
	height: fit-content;
	margin-right: 3px;
}

#intro_title {
	/* border: 1px solid  #5397fc; */
	color: #808080;
	background-color: #5397fc50;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
	height: 50px;
	line-height: 50px;
	padding-left: 10px;
	margin: 0px;
}

#intro_text {
	border: 1px solid #d5d5d5;
	word-break: normal;
	margin: 0px;
	padding: 10px;
}

.review {
	position: relative;
	bottom: 70%;
}

.input-box{
	display: flex;
	justify-content: space-between;
}

#input {
	width: 90%;
	height: 50px;
	border-radius: 5px;
	outline: none;
	border: 1px solid #80808050;
}

#input_btn {
	cursor: pointer;
	width: 9%;
	height: 50px;
	outline: none;
	color: #5397fc;
	border-radius: 5px;
	background-color: white;
	border: 1px solid #5397fc;
}

.r_content_box {
	margin: 20px;
	margin-top: 0px;
}

.r_box {
	border-bottom: 1px solid #80808050;
	display: flex;
	flex-direction: column;
}

.r_writer_info>p{
	margin: 10px;
	font-size: small;
}

.r_writer_info {
	display: flex;
}

.r_contents {
	display: flex;
	justify-content: space-evenly;
	margin-bottom: 10px;
}

.r_like {
	display: flex;
	align-self: center;
	color: #808080;
}

.r_like_icon {
	line-height: inherit;
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48
}

.r_content_blank {
	margin-top: 30px;
	text-align: center;
}

.user_btn {
	margin-left: auto;
	align-self: center;
}


.user_btn>button, .fin_btn, .cancel_btn {
	cursor: pointer;
	outline: none;
	color: #5397fc;
	border-radius: 5px;
	background-color: white;
	border: 1px solid #5397fc;
}
.cancel_btn{
	margin-left: 4px;
}
.content {
	border: none;
	resize: none;
	width: 880px;
	height: fit-content;
	overflow: hidden;
	word-break: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.content:focus {
	outline: none;
}

.paging {
	text-align: center;
}

/* .post {  */
/*  	position: relative;  */
/*  	top: 55%;  */
/*  }  */

/* .post>p { */
/* 	margin: 20px; */
/* } */

/*  .flex-box>p, */
/*         .flex-box, */
/*         .flex-postBox>p, */
/*         .post_list, */
/*         .with-books>p { */
/*             margin: 20px;  */
/* }  */

/* .flex-postBox {  */
/*  	display: flex;  */
/*  	justify-content: space-between;  */
/*  }   */

.swiper-slide{
	margin-right: 0px !important;
}

.post {
	padding-top: 40px;
	overflow: hidden;
}

.post-main {
	cursor: pointer;
	overflow: hidden;
	width: 250px;
	height: 300px;
	margin-left: 55px;
	margin-bottom: 20px;
	margin-top: 25px;
	border: 1px solid #5397fc40;
	border-radius: 15px;
	box-shadow: 3px 3px #80808050;
}

.p_line {
	border-top: 1px;
}
.post-main-top {
	padding-top: 15px;
	display: flex;
	line-height: 10px;
}

.writer{
	display: flex;
	flex-direction: column;
}
.pb_img_url{
	width: 34px;
	height: 51px;
	box-shadow: 2px 2px 2px 2px #80808050;

}
.profile-img-div {
	float: left;
	padding-right: 10px;
	padding-left: 10px;
}

.profile_img {
	width: 55px;
	height: auto;
	border-radius: 50%;
	box-shadow: 2px 2px 2px 2px #80808050;

}

.p-writer {
	padding-top: 4px;
	/*  	overflow: hidden;  */
	width: 120px;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	word-wrap: break-word;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 32px;
	line-height: 32px;
}

.like-icon {
	float: left;
	position: relative;
	bottom: 1px;
	font-size: 18px;
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 48;
}

.like-text {
	float: left;
	position: relative;
	height: 20px;
	line-height: 17px;
	padding-left: 3px;
	font-size: 13px;
}
.postHr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 1px solid #5397fc50;
}
.p-title {
	overflow: hidden;
	width: 100%;
	height: 30px;
	line-height: 17px;
	font-size: 15px;
	font-weight: bold;
	padding-left: 10px;
	padding-right: 10px;
	word-wrap: break-word;
	text-overflow: ellipsis;
	white-space: nowrap;
	font-weight: bold;
}

.p-content {
	word-wrap: break-word;
	overflow: hidden;
	font-size: 15px;
	padding-left: 10px;
	padding-right: 10px;
	display: -webkit-box;
	line-height: 17px;
	-webkit-line-clamp: 8;
	-webkit-box-orient: vertical;
	text-overflow: ellipsis;
}
.with-books {
	overflow: hidden;
}

.with-books>p {
	margin-left: 0px;
}

.book {
	margin-left: 20px;
}

.w_img_url {
	width: 150px;
	height: 233px;
	background: linear-gradient(to right, rgba(0, 0, 0, .3) 3px,
		rgba(255, 255, 255, 0.5) 5px, rgba(255, 255, 255, 0.25) 7px,
		rgba(255, 255, 255, 0.25) 10px, transparent 12px, transparent 16px,
		rgba(255, 255, 255, 0.25) 20px, transparent 22px);
	box-shadow: 0 0 5px -1px rgba(0, 0, 0, 1), inset -1px 1px 2px
		rgba(255, 255, 255, 0.5);
	border-radius: 5px;
	/* margin-left: 38px; */
}



.book_box>a {
	text-decoration: none;
	color: black;
}

/* footer */
.footer {
	margin: 5px;
	positon: relative;
	top: 30%;
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
.title {
	/* border-bottom:1px solid #d4dde5; */
	
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
	/*  text-align: center; */
}
</style>

</head>

<body>
	<div class="container">
		<div class="header">
			<div class="logo">
				<a href="/"><img src="/resources/bookday_logotitle.png"
					id="logoImg"></a>
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
			<div class="icons">
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

			<div class="book_basic_info">
				<form id="sendBookData">
					<div class="box">
						<div class="b_img">
							<img src="${dto.b_img_url}" id="b_img" name="b_img_url">
						</div>
						<div class="b_title">
							<p id="b_title" name="b_title">${dto.b_title}</p>
							<div class="b_etc">
								<p id="b_writer" name="b_writer">${dto.b_writer}</p>
								<p class="line">|</p>
								<p id="b_publisher" name="b_publisher">${dto.b_publisher}</p>
								<p class="line">|</p>
								<p id="b_publication_date">${dto.b_publication_date}</p>
							</div>
							<div class="b_genre">
								<span class="material-symbols-outlined" id="label">label</span>
								<p id="b_genre" name="b_genre">${dto.b_genre}</p>
							</div>
							<div class="link_btn">
								<%--                         <a href="/book/selectForWishlist?b_isbn=${dto.b_isbn}" --%>
								<!--                                 class="a_move"></a> -->
								<input type="button" value="위시리스트에 담기" id="to_wish">
								<%--                                 <a href="/book/selectForBookbag?b_isbn=${dto.b_isbn}" --%>
								<!--                                 class="a_move"></a> -->
								<input class="a_move" type="button" value="책가방에 담기" id="to_bag">
								<%--  <a href="/book/selectForWishlist?b_isbn=${dto.b_isbn}"
                                class="a_move"> --%>
								<span class="material-symbols-outlined" id="heart">favorite</span>

								<!--                                 </a> -->
								<%--                                 <a href="/book/selectForWishlist?b_isbn=${dto.b_isbn}" --%>
								<!--                                 class="a_move"> -->
								<span class="material-symbols-outlined size-40" id="bookbag2">shopping_bag</span>
								<!--                                 </a> -->
							</div>
						</div>
					</div>
					<!--box -->
				</form>
			</div>
			<!--book_basic_info-->

			<div class="detail">

				<div class="book_detail_info">
					<div class="flex-box">
						<div class="intro">
							<p id="intro_title">책 소개</p>
							<span class="arrow_icon material-symbols-outlined"
								id="arrow_down">keyboard_arrow_down</span> <span
								class="arrow_icon material-symbols-outlined" id="arrow_up">keyboard_arrow_up</span>

							<div id="intro_text">${dto.b_description}</div>
						</div>
					</div>
				</div>

				<div class="review">
					<div class="flex-box">

						<div class="review_box">
							<p class="title">짧은 리뷰</p>
							<form action="/book/insertReview">
								<div class="input-box">
									<input type="hidden" value="${dto.b_isbn}" name="b_isbn"
										id="b_isbn"> <input type="text"
										placeholder="내용을 입력해주세요." id="input" name="rv_content"
										maxlength="200">
									<button
										<c:if test="${loginID == null}"> type="button" onclick="alert_open();"</c:if>
										id="input_btn">작성</button>
								</div>
							</form>
							<c:choose>
								<c:when test="${not empty rlist}">
									<c:forEach items="${rlist}" var="r">
										<div class="r_box">
											<div class="r_writer_info">
												<input type="hidden" value="${r.rv_seq}" class="rv_seq">
												<p class="nick">${r.rv_writer_nn}</p>
												<p class="r_line">|</p>
												<p class="review_date">
													<fmt:formatDate pattern="yyyy-MM-dd"
														value="${r.rv_write_date}" />
												</p>

												<c:if test="${loginID == r.rv_writer_id}">
													<div class="user_btn">
														<button type="button" class="r_update"
															data-seq="${r.rv_seq}" data-content="${r.rv_content}"
															data-isbn="${r.b_isbn}">수정</button>
														<button type="button" class="r_delete"
															data-seq="${r.rv_seq}">삭제</button>
													</div>
												</c:if>
											</div>
											<div class="r_contents">
												<div class="r_content">
													<div class="content" contenteditable="false">${r.rv_content}</div>
												</div>


												<div class="r_like">

													<c:set var="doneLoop" value="false" />
													<c:set var="existFlag" value="false" />

													<c:forEach items="${rl_list}" var="rl">
														<c:if test="${rl.rv_seq == r.rv_seq}">
															<c:set var="existFlag" value="true" />
														</c:if>
													</c:forEach>

													<c:choose>
														<c:when test="${existFlag}">
															<c:forEach items="${rl_list}" var="rl">
																<c:if test="${not doneLoop}">
																	<c:choose>
																		<c:when test="${rl.rv_seq == r.rv_seq}">
																			<c:choose>
																				<c:when test="${rl.id == loginID}">
																					<span class="r_like_icon material-symbols-outlined"
																						data-count="1" style="color: #5397fc;">thumb_up</span>
																					<c:set var="doneLoop" value="true" />
																				</c:when>
																				<c:otherwise>
																					<span class="r_like_icon material-symbols-outlined"
																						data-count="0">thumb_up</span>
																					<c:set var="doneLoop" value="true" />
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>
																</c:if>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<span class="r_like_icon material-symbols-outlined"
																data-count="0">thumb_up</span>
														</c:otherwise>
													</c:choose>
													<span class="r_like_count">${r.r_count_like}</span>
												</div>

											</div>
										</div>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<div class="r_content_blank">작성된 리뷰가 없습니다.</div>

								</c:otherwise>
							</c:choose>
						</div>
						<!--  review_box -->
						<!--  <div class="paging">1 2 3 4 5</div> -->

					</div>
					<!-- flex-box -->
				</div>
				<!-- review -->

				<div class="post">

					<div class="post_list">

						<p class="title">포스트</p>
					</div>

					<div class="swiper-container">
						<div class="swiper-wrapper">
							<c:choose>
								<c:when test="${not empty plist}">
									<c:forEach items="${plist}" var="p">
										<div class="swiper-slide">
											<div class="post-main" seq="${p.p_seq}">
												<!-- 									<br> -->
												<div class="post-main-top">
													<div class="profile-img-div">
														<img src="/resources/profile/${p.sysprofname}"
															 class="profile_img">
													</div>
													<div class="writer">
														<div class="p-writer">${p.p_writer_nn }</div>
														<div class="p-like">
															<div class="like-icon material-symbols-outlined"
																 data-count="0">thumb_up</div>
															<div class="like-text">${p.p_like_count }</div>
														</div>
													</div>
													<div class="bookinfo">
														<div class="pb-img">
															<a href="/book/selectBookinfo?b_isbn=${p.b_isbn}"><img
																	src="${p.b_img_url}" class="pb_img_url"></a>													</div>
															<%--													<div class="pb-title">--%>
															<%--														${p.b_title}--%>
															<%--													</div>--%>
													</div>
												</div>
												<hr class="postHr">
												<div class="p-title" title="${p.p_title }">${p.p_title }</div>
												<div class="p-content">
														${p.p_content }
												</div>
											</div>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<p class="post_title">작성된 포스트가 없습니다.</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div class="with-books">
					<p class="title">함께 담은 책</p>

					<div class="flex-box">

						<div class="swiper-with">
							<div class="swiper-wrapper">

								<c:choose>
									<c:when test="${not empty wlist}">
										<c:forEach items="${wlist}" var="w">
											<div class="book_box swiper-slide">

												<a href="/book/selectBookinfo?b_isbn=${w.b_isbn}">
													<script>
														console.log("${w.b_img_url}");
													</script>
													<div class="book">
														<img src="${w.b_img_url}" title="${w.b_title}"
															class="w_img_url">
													</div>
												</a>
											</div>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p class="w_title_blank">함께 담은 책이 없습니다.</p>
									</c:otherwise>
								</c:choose>

								<!-- foreach 문 -->
							</div>
						</div>
					</div>
					<!-- flex-box  -->
				</div>
				<!-- with-books -->

			</div>
			<!--detail-->
		</div>
		<!--body-->

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
	$("#post-link").on("click", function() {
	  	  if(${loginID == null}) {
	  		 alert("로그인 후 이동할 수 있습니다.");
	  		 return false;
	  	  }
	  })
$("#logo_img").on("click", function() {
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
    if(${loginID == null}) {
         location.href = "/member/toLogin";
    }else {
         location.href = "/delivery/selectBookbagListById?id=${loginID }";
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
    location.href = "/member/toMypage?";
    }
 });

var swiper = new Swiper(".swiper-container", {
slidesPerView:3,
spaceBetween:30
});

var swiper = new Swiper(".swiper-with", {
	slidesPerView:6,
	spaceBetween:30
	});
	
//프로필 사진 없을 때
/* $( document ).ready( function() {
    
  	if(${p.sysprofname != null}){
  		
		$(".profile_img").attr("src","/resources/basic.png");
						return;
					}
   }); */
	$(document).on("click", ".post-main", function (){
		let seq = $(this).attr("seq");

		if(${loginID == null}) {
			location.href = "/member/toLogin";
		}else {
			location.href="/booknote/selectPostByPseq?p_seq="+seq;
		}
	})

$(document).ready(function(){
	
	
	   //사업자 정보 토글 기능
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


                 //책소개 화살표 버튼 누르면 내용 보이기 / 숨기기(토글 사용)
                 //책 내용 기본으로 숨기기
                 $("#intro_text").hide();
                 $("#arrow_down").click(function() {

                     $("#intro_text").toggle("down");

                     $("#arrow_up").css("display", "block");
                     $("#arrow_down").css("display", "none");
                 });

                 $("#arrow_up").click(function() {
                     $("#intro_text").toggle("down");

                     $("#arrow_down").css("display", "block");
                     $("#arrow_up").css("display", "none");
                 });

	
    //로그인 상태가 아닐 때
     if(${loginID==null}){
    	 
    //엔터키로 값이 넘어가는 이벤트 막기(input창만 막기-검색창은 x)
	 $(document).keypress(function(e) { 

	      	if (e.keyCode == 13 && $("#input").val() != "") {
	      		e.preventDefault(); 
	      		alert("로그인 후 이용해주세요.");
	      		$("#input").val("");
	      	}
			
	      	
	      });
        
                //링크 삭제
                $(".a_move").removeAttr("href");
             
                       //위시리스트/책가방/포스트 작성 회원만 이동 기능
                    $("#to_wish,#to_bag,#to_write").on("click",function(){
                        alert("로그인 후 사용할 수 있습니다.");
                    
                        });
                       
                       
                    $(document).on("click",".r_like_icon",function(){
                    	alert("로그인 후 사용할 수 있습니다.");
                    });
                       
                       
                       
     }else{
    	 
    	 // 위시리스트에 담기 기능
    	 $(function () {
	            $("#to_wish").on("click", function () {
	                $.ajax({
	                    url: "/book/selectWishlistByIdBisbn",
	                    data: {
	                        "id": "${loginID }",
	                        "b_isbn": "${dto.b_isbn}"
	                    }, success: function (result) {
	                        if (result == "false") {
	                            alert("이미 위시리스트에 있는 책입니다.");
	                        } else {
	                            $.ajax({
	                                url: "/book/insertWishlist",
	                                data: {
	                                    "id": "${loginID }",
	                                    "b_isbn": "${dto.b_isbn}",
	                                    "b_img_url": "${dto.b_img_url }",
	                                    "b_title": "${dto.b_title }",
	                                    "b_writer": "${dto.b_writer }",
	                                    "b_genre": "${dto.b_genre }"
	                                }, success: function (resp) {
	                                    alert("위시리스트에 담았습니다.");
	                                }
	                            });
	                        }
	                    }
	                });
	           	});
     		});
    	 
    	 // 책가방에 담기 기능
    	 $(function () {
	            $("#to_bag").on("click", function () {
	                $.ajax({
	                    url: "/book/selectBookbagByIdBisbn",
	                    data: {
	                        "id": "${loginID }",
	                        "b_isbn": "${dto.b_isbn}"
	                    }, success: function (result) {
	                        if (result == "false") {
	                            alert("이미 책가방에 있는 책입니다.");
	                        } else {
	                            $.ajax({
	                                url: "/book/insertBookbag",
	                                data: {
	                                    "id": "${loginID }",
	                                    "b_isbn": "${dto.b_isbn}",
	                                    "b_img_url": "${dto.b_img_url }",
	                                    "b_title": "${dto.b_title }",
	                                    "b_writer": "${dto.b_writer }",
	                                    "b_genre": "${dto.b_genre }"
	                                }, success: function (resp) {
	                                    alert("책가방에 담았습니다.");
	                                }
	                            });
	                        }
	                    }
	                });
	           	});
  			});
                       
                     //댓글 작성 시
				$("#input_btn").on("click",function(){
					let input=$("#input").val();
					if(input == ""){
						alert("리뷰를 입력해주세요.");
					}
					
				});
                     
                         
                    //리뷰 삭제
                    $(document).on("click",".r_delete",function() {

                          let rv_seq = $(this).attr("data-seq");
                          let b_isbn = $("#b_isbn").val();

                            if (confirm("리뷰를 삭제하시겠습니까?")) {
                                  console.log(rv_seq);
                                  location.href = "/book/deleteReview?rv_seq="
                                                    + rv_seq
                                                    + "&b_isbn="
                                                    + b_isbn;
                                  } else {

                                     location.reload();
                                        }
                           });
                    
                    //리뷰 수정
                    $(document).on("click",".r_update",function() {

                         let rv_seq = $(this).attr("data-seq");
                         let b_isbn = $("#b_isbn").val();
							let con = $(this).closest(".r_box").find(".content").html();
                                console.log(con);

                            $(this).closest(".r_box").find(".content").attr("contenteditable", true);

							$(this).closest(".r_box").find(".r_update,.r_delete").css("display", "none");

                                let input = $("<input>");
                                input.attr("type", "button");
                                input.attr("data-seq", rv_seq);
                                input.attr("data-isbn", b_isbn);
                                input.val("완료");
                                input.addClass("fin_btn");



                                let input2 = $("<input>");
                                input2.attr("type", "button");
                                input2.val("취소");
                                input2.addClass("cancel_btn");

                                $(this).closest(".r_box").find(
                                        ".user_btn").append(input).append(input2);


                            });

                    $(document).on("click",".fin_btn",function() {
                                
                                let rv_seq = $(this).closest(
                                        ".r_box").find(".rv_seq")
                                        .val();
                                let rv_content = $(this).closest(
                                        ".r_box")
                                        .find(".content").html();
                                let b_isbn = $(this).attr("data-isbn");

                                $.ajax({
                                    url : "/book/updateReview",
                                    type : "post",
                                    data : {
                                        "rv_seq" : rv_seq,
                                        "rv_content" : rv_content,
                                        "b_isbn" : b_isbn
                                    }
                                }).done(function(resp) {
                                    if (resp == 1) {
                                        location.reload();
                                    }
                                })

                            });

                    //수정 취소 버튼 눌렀을 때
                    $(document).on("click", ".cancel_btn", function() {
                        location.reload();
                    });
                    
                    
                    //댓글 좋아요 기능    
       
                           //유저가 좋아요 0번 눌렀을 때 실행
                          $(document).on("click",".r_like_icon",function(){
                              
                              let b_isbn = $("#b_isbn").val();
                              
                              let rv_seq = $(this).closest(
                              ".r_box").find(".rv_seq").val();
                              
                              let r_like_icon =$(this).attr("data-count");
                          
                              console.log(r_like_icon);
                              console.log(b_isbn);
                              console.log(rv_seq);
                                    
                            if(r_like_icon == '0' ){
                                  
                              $.ajax({
                                  type:"post",
                                  url: "/book/insertReviewLike",
                                  data: {"rv_seq" : rv_seq,
                                          "b_isbn":b_isbn
                                          }
                              }).done(function(resp){
                                 console.log("좋아요 성공");
                                  location.reload();

                              });
                              
                                    }else if(r_like_icon == 1){
                                        
                                        let b_isbn = $("#b_isbn").val();
                                     
                                     let rv_seq = $(this).closest(
                                     ".r_box").find(".rv_seq").val();
                                    

                                        
                                    console.log("여기까지 오는지 확인");
                                        
                                    //취소 기능
                                        
                                     $.ajax({
                                      type:"post",
                                      url:"/book/deleteReviewLike",
                                      data: {"rv_seq" : rv_seq}
                                  }).done(function(resp){
                                      console.log("취소 성공");
                                      location.reload();
                                  });
                                  
                                    }
                                        
                                    });
                    
                        
     			}



		}); 

//리뷰 비회원 대비) 비로그인 상태에서 리뷰 달려고 하면 로그인 페이지로 이동
function alert_open() {
    alert("로그인 후 이용해주세요.");
    $("#input").val("");
}
	$("#b_genre").on("click", function (){
		let bookGenre = $(this).html();
		location.href = "/search/toSearch?searchWord="+bookGenre;
	});

	$("#b_writer").on("click", function (){
		let bookWriter = $(this).html();
		location.href = "/search/toSearch?searchWord="+bookWriter;
	});
	$("#b_publisher").on("click", function (){
		let bookPublisher = $(this).html();
		location.href = "/search/toSearch?searchWord="+bookPublisher;
	});
</script>
</body>
</html>