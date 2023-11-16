<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/WEB-INF/views/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/post/post_list.css'/>">
</head>
<body>
  <!-- Global Navigation Bar -->
 <jsp:include page="/WEB-INF/views/globalNavigationBar.jsp"></jsp:include>

  <!-- Side Bar -->
  <jsp:include page="/WEB-INF/views/post/postSideBar.jsp?board_id=${board_id}"/>
  <br>
  
 
  <h1>후기 게시판</h1>
  <form method="post" action="<c:url value='/post/post'/>">
  	<input type="hidden" name="board_id" value="${board_id}"/>
    <input type="text" name="post_title" size="40" placeholder="제목을 입력해주세요" />
    <br> <br>
    <textarea placeholder="내용을 입력해주세요" name="post_content" style="width: 80%; height: 200px;"></textarea>
    <br> <br>
    <input type="text" size="40" placeholder="사진 추가 (사진은 최대 20장까지 등록 가능합니다)" />
    <input type="file" name="post_fileName">
    <br> <br>
    <input type="reset" value="작성취소" />
    <input type="submit" value="등록하기" />
  </form>
</body>
</html>