<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%//@ include file="/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/post/post_detail.css'/>">
</head>
<body>
  <!-- Global Navigation Bar -->
 <jsp:include page="/WEB-INF/views/globalNavigationBar.jsp"></jsp:include>

  <!-- Side Bar -->
  <div class="mylist" name="">
    <h2 class="mypage">커뮤니티</h2>
    <div class="list">
      <h4>공지사항</h4>
      <h4 class="active">후기 게시판</h4>
      <h4>홍보 게시판</h4>
      <h4>뉴스/칼럼</h4>
    </div>
  </div>
  <br>

  <!-- Post Detail -->
  <form></form>
  <div class="container_5">
    <div class="child_1">
      <h1>후기 게시판</h1>
      
      <!-- 글 내용 보여주기 -->
      <div class="child_3">
        <h4 id="Announcement">${detail.post_title}</h4>
        <div class="child_4">
          <div class="hits">
            ${detail.post_views}
		  </div>
          <i class="fa-solid fa-circle-user fa-3x fa-review"></i>
          <div class="right_content">
            ${detail.user_nickname} | ${detail.post_create_date}
          </div>
        </div>
        <hr>
        <div class="content_1">
          ${detail.post_content}<br> <br> <br> <br>
        </div>
        <img src="image/Dog1.jpg" alt=""> <img src="image/Dog2.jpg" alt=""> <img src="image/Dog3.jpg" alt="">
      </div>
      <br> <br>

      <!-- 수정/삭제 버튼 -->

      <div class="btn_top">
        <div class="btn_cen">
          <button type="submit" class="btn btn-primary" for="btn-check" onclick="location='<c:url value='/post/update?board_id=${detail.board_id}&post_id=${detail.post_id}'/>'">수정하기</button>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <button type="submit" class="btn btn-danger" onclick="location='<c:url value='/post/delete?board_id=${detail.board_id}&post_id=${detail.post_id}'/>'">삭제하기</button>
          &nbsp;&nbsp;&nbsp;

          <form method="post" action="../favoritePost/favorite_post_proc.jsp">
            <input type="hidden" value="" name="post_id" />
            <input type="hidden" value="" name="board_id" />
            <input type="hidden" value="" name="user_id" />
            <button type="submit" class="btn btn-secondary">
              게시글 좋아요 <i class="fa-solid fa-heart" style="color: #ff000d;"></i>
            </button>
          </form>

          <button type="submit" class="btn btn-secondary" onclick="location='post_list.jsp?board_id='">목록</button>
        </div>
      </div>

      <!-- 댓글 등록하기 -->


      <span class="Comments_section"> <span class="Comments_count">
          <div class="comment_1">
            <h4> 댓글 개 </h4>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <button type="submit" class="btn btn-secondary">댓글 달기</button>
            <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
          </div>
      </span>
      </span> <br> <br> <br>
      <form method="post" action="../comment/comment.jsp">
        <input type="hidden" value="" name="post_id" />
        <input type="hidden" value="" name="board_id" />
        <input type="text" value="" name="user_nickname" readonly />
        <br> <br>
        <textarea rows="3" style="width: 50%;" name="comment_content" placeholder="댓글을 입력하세요."></textarea>
        <br> <br>
        <input type="submit" value="댓글 달기" />
      </form>
      <br>

      <!-- Comment List -->

      <h3>닉네임</h3> 
      작성날짜 <br>
      <div class="setting">
        <a class="dropdown-toggle" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical fa-2xl" style="color: #050b15;"></i></a>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="../comment/comment_update.jsp?board_id=&comment_id=">수정</a></li>
          <li><a class="dropdown-item" href="../comment/comment_delete.jsp?board_id=&comment_id=">삭제</a></li>
        </ul>
      </div>
      댓글내용
      <hr>
    </div>
  </div>

</body>
</html>