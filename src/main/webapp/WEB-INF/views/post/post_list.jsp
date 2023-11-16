<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/post/post_list.css'/>">
</head>
<body>
  <!-- Global Navigation Bar -->
 <jsp:include page="/WEB-INF/views/globalNavigationBar.jsp"></jsp:include>


  <!-- Side Bar -->
  <jsp:include page="/WEB-INF/views/post/postSideBar.jsp?board_id=${board_id}"/>
  <br>

  <!-- Post List -->
  <div class="container_4">
    <div class="child_1">
      <h1><span id="board-name">후기 게시판</span></h1>

      <!-- 검색창 -->
      <form method="post" name="search" action="post_list.jsp" id="search">
        <div class="child_2">
          <select name="option" class="form-select" aria-label="Default select example">
            <option value="title" selected>제목</option>
            <option value="content">내용</option>
            <option value="title+content">제목+내용</option>
            <option value="nickname">닉네임</option>
          </select>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <input name="searchWord" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
          <button type="submit" form="search" class="btn btn-outline-dark">
            <i class="fa-solid fa-magnifying-glass"></i>
          </button>
        </div>
      </form>
      <br> <br> <br>

      <!-- 게시판 글 리스트 -->
      <div class="row row-cols1 row-cols-md-3 g-4">
      <c:forEach var="post" items="${list}">
        <div class="col">
          <div class="card">
            <a href="<c:url value='/post/detail?board_id=${post.board_id}&post_id=${post.post_id}'/>"><img src="<c:url value='/image/img1.jpg'/>" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">${post.post_title}</h5>
                <p class="card-text">
                  ${post.user_nickname}<br>
                  ${post.post_create_date} | ${post.post_views} <br>
                  ${post.post_content}<br>
                </p>
              </div> </a>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>
  
  <!-- 게시글 작성하기 버튼 -->
  <input type="button" value="게시글 작성하기" onClick="location='<c:url value='/post/post?board_id=${board_id}'/>'" />
  <br>
	
</body>
<script>
	let listTitle = document.getElementById("board-name");
	let board_id1 = ${board_id}
	
	if(board_id1 == 1){
		listTitle.innerText = "공지사항";
	} else if(board_id1 == 2){
		listTitle.innerText = "후기 게시판";
	} else if(board_id1 == 3){
		listTitle.innerText = "홍보 게시판";
	} else if(board_id1 == 4){
		listTitle.innerText = "뉴스/칼럼";
	}
</script>
</html>