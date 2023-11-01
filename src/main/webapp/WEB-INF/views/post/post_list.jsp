<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/resources/css/post_list.css'/>">
</head>
<body>
  <!-- Global Navigation Bar -->
 <jsp:include page="/WEB-INF/views/globalNavigationBar.jsp"></jsp:include>


  <!-- Side Bar -->
  <div class="mylist">
    <h2 class="mypage">커뮤니티</h2>
    <div class="list">
      <h4>공지사항</h4>
      <h4 class="active">후기 게시판</h4>
      <h4>홍보 게시판</h4>
      <h4>뉴스/칼럼</h4>
    </div>
  </div>
  <br>

  <!-- Post List -->
  <div class="container_4">
    <div class="child_1">
      <h1>후기 게시판</h1>

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
        <div class="col">
          <div class="card">
            <a href="post_detail.jsp?board_id=&post_id="><img src="image/img1.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">글제목</h5>
                <p class="card-text">
                  닉네임<br>
                  작성일 | 조회수 <br>
                  글내용<br>
                </p>
              </div> </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- 게시글 작성하기 버튼 -->
  <input type="button" value="게시글 작성하기" onClick="location='<c:url value='/board/write'/>'" />
  <br>
	
</body>
</html>