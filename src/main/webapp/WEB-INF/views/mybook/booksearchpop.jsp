<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>BookSearchPop</title>
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

.header {
	display: flex;
	height: 150px;
	padding: 5px;
	margin: 5px;
}

.container {
	max-width: 700px;
	margin: auto;
}

button {
	cursor: pointer;
}
/* logo */
.logo {
	height: 100%;
	width: 35%;
	position: relative;
	text-align: center;
}

#logoImg {
	height: 100%;
	width: auto;
}

#logoImg:hover {
	cursor: pointer;
}

/* search */
.search {
	position: relative;
	height: 100%;
	width: 65%;
	display: flex;
	align-items: center;
}

.searchBox {
	position: absolute;
	left: 10px;
	bottom: 10px;
	overflow: hidden;
	height: 40px;
	width: 85%;
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

hr {
	margin-top: 10px;
	margin-bottom: 0px;
}
.empty{
	text-align: center;
	height: 400px;
	line-height: 400px;
}
table {
	width: 95%;
	border-collapse: collapse;
	margin: auto;
}

td {
	padding: 15px 15px 15px 15px;
	border-bottom: 1px solid rgb(216, 216, 216)
}

.bookCover {
	width: 80px;
}

.bookCover img {
	width: 80px;
	height: 120px;
		border-radius: 2%;
	
}

.bookInfo {
	padding-top: 13px;
	padding-bottom: 17px;
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

.bookPublisher {
	font-size: 13px;
}

.between {
	font-size: 13px;
}

.bookPublicationDate {
	font-size: 13px;
}

.select {
	width: 50px;
	height: 30px;
	font-size: 15px;
	color: rgb(47, 47, 47);
	background-color: #5397fc50;
	border: none;
	border-radius: 5px;
	box-shadow: 2px 2px 2px 2px #80808050;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="logo">
				<img src="/resources/bookdaylogos.png" id="logoImg">
			</div>
			<div class="search">
				<div class="searchBox">
					<input class="searchTxt" type="text" placeholder="검색어를 입력해 주세요"
						id="searchWord" name="searchWord" value="${searchWord }" maxlength="100">
					<button class="searchBtn" type="submit">
						<span class="material-symbols-outlined"> search </span>
					</button>
				</div>
			</div>
		</div>
		<hr class="footerHr">
		<div class="body">
			<table>
			<c:choose>
			<c:when test="${empty blist}">
			<div class="empty">검색 결과가 없습니다.</div>
			</c:when>
			<c:otherwise>

				<c:forEach var="book" items="${blist }">
					<tr>
						<td class="bookCover"><a href="#"><img
								src="${book.b_img_url}"></a></td>
						<td class="bookInfo"><span class="bookGenre">${book.b_genre}</span>
							<p>
								<span class="bookTitle"><a href="#">${book.b_title}</a></span>
							</p>
							<p>
								<span class="bookWriter">${book.b_writer}</span>
							</p> <span class="bookPublisher">${book.b_publisher}</span><span
							class="between">&nbsp|&nbsp</span><span
							class="bookPublicationDate">${book.b_publication_date}</span></td>
						<td>
							<button class="select" value="${book.b_isbn}">선택</button>
						</td>
					</tr>
				</c:forEach>
							</c:otherwise>
			</c:choose>
			</table>
		</div>
<!-- 		<div class="footer">paging</div> -->
<hr>
	</div>

	<script>
		$("#searchWord").on(
				"keydown",
				function(e) {
					if (e.keyCode == 13) {
						var searchWord = $("#searchWord").val();
						location.href = "/book/toBookSearchPop?searchWord="
								+ searchWord;
					}
				});
		$(".searchBtn").on("click", function() {
			var searchWord = $("#searchWord").val();
			location.href = "/book/toBookSearchPop?searchWord=" + searchWord;
		});
		$(document)
				.on(
						"click",
						".select",
						function() {
							var b_isbn = $(this).val();
							var b_genre = $(this).closest("tr").find(
									".bookGenre").html();
							var b_img_url = $(this).closest("tr").find("img")
									.attr("src");
							var b_title = $(this).closest("tr").find(
									".bookTitle").children("a").html();
							var b_writer = $(this).closest("tr").find(
									".bookWriter").html();
							var b_publisher = $(this).closest("tr").find(
									".bookPublisher").html();
							var b_publication_date = $(this).closest("tr")
									.find(".bookPublicationDate").html();

							console.log(b_isbn + b_genre + b_img_url + b_title
									+ b_writer + b_publisher
									+ b_publication_date);
							window.opener.initSearchBook(b_isbn, b_genre,
									b_img_url, b_title, b_writer, b_publisher,
									b_publication_date);
							window.self.close();
						});
	</script>
</body>

</html>