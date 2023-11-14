<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dogether</title>
<%@ include file="/WEB-INF/views/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/post/post_detail.css'/>">
</head>
<body>
  <!-- Global Navigation Bar -->
 <jsp:include page="/WEB-INF/views/globalNavigationBar.jsp"></jsp:include>


  <h1>후기 게시판</h1>
  <hr>
  <h3>게시글 수정하기</h3>
  <br><br>

  <form name="post_update" method="post" action="<c:url value='/post/update'/>">
    <input type="hidden" name="post_id" value="${detail.post_id}" />
    <input type="hidden" name="user_nickname" value="${detail.user_nickname}" />
    <input type="text" name="post_title" size="40" value="${detail.post_title}" />
    <br><br>
    <textarea name="post_content" style="width: 80%; height: 200px;">${detail.post_content}</textarea>
    <br><br>
    <input type="text" size="40" value="사진 추가 (사진은 최대 20장까지 등록 가능합니다)" />
    <br><br>
    <input type="reset" value="작성취소" />
    <input type="submit" value="수정하기" />
  </form>
</body>
</html>