<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<link rel="stylesheet" href="<c:url value='/resources/css/post/post_list.css'/>">
</head>
<body>
	<div class="mylist">
		<h2 class="mypage">커뮤니티</h2>
		<div class="list">
			<a href="<c:url value='/post/list?board_id=1'/>"><h4 class="notice active">공지사항</h4></a>
			<a href="<c:url value='/post/list?board_id=2'/>"><h4 class="review">후기 게시판</h4></a>
			<a href="<c:url value='/post/list?board_id=3'/>"><h4 class="ad">홍보 게시판</h4></a>
			<a href="<c:url value='/post/list?board_id=4'/>"><h4 class="news">뉴스/칼럼</h4></a>
		</div>
	</div>
</body>
<script>
	let notice = document.querySelector(".notice");
	let review = document.querySelector(".review");
	let ad = document.querySelector(".ad");
	let news = document.querySelector(".news");
	
	let board_id = ${board_id}
	if(board_id == 1){
		notice.classList.add("active");
		review.classList.remove("active")
		ad.classList.remove("active")
		news.classList.remove("active")
	} else if(board_id == 2){
		notice.classList.remove("active");
		review.classList.add("active")
		ad.classList.remove("active")
		news.classList.remove("active")
	} else if(board_id == 3){
		notice.classList.remove("active");
		review.classList.remove("active")
		ad.classList.add("active")
		news.classList.remove("active")
	} else if(board_id == 4){
		notice.classList.remove("active");
		review.classList.remove("active")
		ad.classList.remove("active")
		news.classList.add("active")
	}
</script>
</html>