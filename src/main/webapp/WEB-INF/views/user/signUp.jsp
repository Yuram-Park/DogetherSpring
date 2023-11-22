<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dogether</title>
<%@ include file="/WEB-INF/views/header.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/user/signUp.css'/>">

</head>
<body>
  <!-- Navigation Bar -->
  <nav class="navbar navbar-expand-lg bg-body-tertiary">
    <a class="navlogo" href="<c:url value='/'/>">Dogether</a>
  </nav>
  <div class="frontbar">
    <a href="<c:url value='/user/login'/>"><div class="loginbar">로그인 하기</div></a> <a href="signUp.jsp"><div class="signbar active">회원가입 하기</div></a> <a href=""><div class="findbar">ID/PW 찾기</div></a>
  </div>

  <div class="navout"></div>
  <br>
  <br>
  <div>
	
	<!-- 회원가입 양식 -->
    <div class="container_2">
      <h2 class="join">회원가입</h2>
      <br>
      <form method="post" action="<c:url value='/user/signUp'/>" name="userInfo" onsubmit="return checkValue()">
        <div class="input-group mb-3">
          <span class="input-group-text" id="basic-addon1">아이디</span>
          <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" id="userid" name="user_id">
        </div>
        <div class="error">
	        <div class="id-success hide">사용할 수 있는 아이디입니다</div>
	        <div class="id-fail hide">아이디는 4~12글자이어야 합니다</div>
	        <div class="id-fail2 hide">영어 또는 숫자만 가능합니다</div>
	        <div class="id-fail3 hide">중복된 아이디입니다</div>
        </div>
		<br>
		
        <div class="userCheck">
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">비밀번호</span>
            <input type="password" class="form-control" placeholder="Userpassword" aria-label="Username" aria-describedby="basic-addon1" id="userpw" name="user_pw">
          </div>
          <i class="fa-solid fa-eye"></i>
        </div>
        <div class="error">
        	<div class="pw-success hide">사용할 수 있는 비밀번호입니다</div>
        	<div class="pw-fail hide">8글자 이상, 영문, 숫자, 특수문자(@$!%*#?&)를 사용하세요</div>
        </div>

        <div class="userCheck">
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">비밀번호 확인</span>
            <input type="password" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" id="userpwCheck" name="user_pwcheck">
          </div>
          <i class="fa-solid fa-eye"></i>
        </div>
        <div class="error">
        	<div class="pw-mismatch hide">비밀번호가 일치하지 않습니다</div>
        </div>
        <br>

        <div class="icon_botton">
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">이메일 등록</span>
            <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" id="userEmail" name="user_email">
          </div>
          <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
          &nbsp;&nbsp;&nbsp;&nbsp; <label class="btn btn-primary" for="btn-check">인증 요청</label>
        </div>

        <div class="userCheck">
          <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">인증 코드</span>
            <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="emailCode">
          </div>
          <i class="fa-solid fa-circle-check" style="color: #20a117;"></i>&nbsp; <i class="fa-solid fa-circle-xmark" style="color: #fa0000;"></i>
        </div>
        <br>

        <div class="input-group mb-3">
          <span class="input-group-text" id="basic-addon1">이름</span>
          <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="user_name">
        </div>
        <div class="input-group mb-3">
          <span class="input-group-text" id="basic-addon1">닉네임</span>
          <input type="text" class="form-control" placeholder="##" aria-label="Username" aria-describedby="basic-addon1" name="user_nickname">
        </div>
        <br>

        <div class="input-group mb-3">
          <span class="input-group-text" id="basic-addon1">생년월일</span>
          <input type="date" class="form-control" id="start" value="2018-07-22" min="2018-01-01" max="2018-12-31" name="user_birthday">
        </div>
        <br>

        <div class="input-group mb-3">
          <span class="input-group-text Gender" id="basic-addon1">성별</span> &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="form-check form-check-inline">
            <!-- gender 테이블 컬럼의 크기 수정 필요. 전달하는 값이 큼 -->
            <input class="form-check-input" type="radio" id="inlineRadio1" value="M" name="user_gender" value="M" checked>
            <label class="form-check-label" for="inlineRadio1">남성</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="inlineRadio2" value="F" name="user_gender" value="F">
            <label class="form-check-label" for="inlineRadio2">여성</label>
          </div>
        </div>

        <div class="userCheck">
          <span class="input-group-text type" id="basic-addon1">회원 종류</span> &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="user_grade" id="inlineRadio1" value="1">
            <label class="form-check-label" for="inlineRadio1">판매자 회원</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="user_grade" id="inlineRadio2" value="2">
            <label class="form-check-label" for="inlineRadio2">일반 회원</label>
          </div>
        </div>

        <br> <br> <span class="sss">
          <h6>회원 약관 동의(필수)</h6> &nbsp;&nbsp;&nbsp;&nbsp; <label class="btn btn-outline-secondary" for="btn-check-2-outlined">보기</label><br> &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="agreement" value="option1">
            <label class="form-check-label" for="agreement">동의함</label>
          </div>
        </span> <br> <span class="userCheck">
          <h6>개인 정보 수집 및 이용 동의(필수)</h6> &nbsp;&nbsp;&nbsp;&nbsp; <label class="btn btn-outline-secondary" for="btn-check-2-outlined">보기</label><br> &nbsp;&nbsp;&nbsp;&nbsp;
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="privacy" value="option1">
            <label class="form-check-label" for="privacy">동의함</label>
          </div>
        </span> <br> <span class="icon-botton"> <input type="checkbox" class="btn-check" id="btn-check" autocomplete="off">
          <input type="submit" class="btn btn-primary" value="회원가입">
          <!--
          <label class="btn btn-primary" for="btn-check">회원가입</label>-->
        </span>
      </form>
    </div>
  </div>
</body>
<script>
    function checkValue() {
        if (!document.userInfo.user_id.value) {
            alert("아이디를 입력하세요.");
            return false;
        }
        if (!document.userInfo.user_pw.value) {
            alert("비밀번호를 입력하세요.");
            return false;
        }
        if (document.userInfo.user_pw.value != document.userInfo.user_pwcheck.value) {
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        if (!document.userInfo.user_email.value) {
            alert("이메일을 입력하세요.");
            return false;
        }
        // 이메일 인증 구현
        /*
        if (!document.userInfo.emailCode.value) {
            alert("이메일 인증 코드를 입력하세요.");
            return false;
        }*/
        if (!document.userInfo.user_name.value) {
            alert("이름을 입력하세요.");
            return false;
        }
        if (!document.userInfo.user_nickname.value) {
            alert("닉네임을 입력하세요.");
            return false;
        }
        /*
        if (!document.userInfo.birthyy.value) {
            alert("연도를 입력하세요.");
            return false;
        }
        if (!document.userInfo.birthdd.value) {
            alert("날짜를 입력하세요.");
            return false;
        }*/
        if (!document.getElementById('agreement').checked) {
            alert("회원 약관에 동의하세요.");
            return false;
        }
        if (!document.getElementById('privacy').checked) {
            alert("개인 정보 수집 및 이용에 동의하세요.");
            return false;
        }
        document.userInfo.submit();
    }
    
    // 아이디 유효성 검사
    let elId = document.querySelector("#userid");
    let elIdSuccess = document.querySelector(".id-success");
    let elIdFail1 = document.querySelector(".id-fail");
    let elIdFail2 = document.querySelector(".id-fail2");
    let elIdFail3 = document.querySelector(".id-fail3");

    function idLength(value){
    	return value.length >= 4 && value.length <= 12
    }
    
    function onlyNumAndEn(str){
    	return /^[A-Za-z0-9][A-Za-z0-9]*$/.test(str);
    }
    
    elId.onkeyup = function(){
    	if (elId.value.length !== 0) {
    		if (onlyNumAndEn(elId.value) === false) {
    			elIdSuccess.classList.add('hide');
    			elIdFail1.classList.add('hide');
    			elIdFail2.classList.remove('hide');
    			elIdFail3.classList.add('hide');
    		} else if (idLength(elId.value) === false) {
    			elIdSuccess.classList.add('hide');
    			elIdFail1.classList.remove('hide');
    			elIdFail2.classList.add('hide');
    			elIdFail3.classList.add('hide');
        	} else if (idLength(elId.value) && onlyNumAndEn(elId.value)){
        		elIdSuccess.classList.remove('hide');
    			elIdFail1.classList.add('hide');
    			elIdFail2.classList.add('hide');
    			elIdFail3.classList.add('hide');
        	}
    	} else {
    		elSuccess.classList.add('hide');
			elFail1.classList.add('hide');
			elFail2.classList.add('hide');
    	}
    }
    
    // 비밀번호 유효성 검사
    let elPw = document.querySelector("#userpw");
    let elPwSuccess = document.querySelector(".pw-success")
    let elPwFail = document.querySelector(".pw-fail")
    
    function pwConfirm(str){
    	return /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/.test(str);
    }
    
    elPw.onkeyup = function(){
    	if(elPw.value.length !== 0){
    		if(pwConfirm(elPw.value)){
    			elPwFail.classList.add('hide');
    		} else{
    			elPwFail.classList.remove('hide');
    		}
    	} else {
    		elPwSuccess.classList.add('hide');
    		elPwFail.classList.add('hide');
    	}
    }
    
    // 비밀번호 확인 일치여부
    let elPwCheck = document.querySelector("#userpwCheck");
    let elPwCheckFail = document.querySelector(".pw-mismatch");
    
    function pwMatch(pw1, pw2){
    	return pw1 === pw2;
    }
    
    elPwCheck.onkeyup = function(){
    	if(elPwCheck.value.length !== 0){
    		if(pwMatch(elPw.value, elPwCheck.value)){
    			elPwCheckFail.classList.add('hide');
    		} else{
    			elPwCheckFail.classList.remove('hide');
    		}
    	} else {
    		elPwCheckFail.classList.add('hide');
    	}
    }
    
    // 아이디 중복검사
    let httpRequest = null;
    
    elId.addEventListener('blur',function(){
    	let idValue = elId.value;
    	httpRequest = new XMLHttpRequest();
    	
    	httpRequest.open("GET", "<c:url value='/user/idCheck?user_id="+ idValue + "'/>", true);
    	httpRequest.onreadystatechange = function(){
    		if(httpRequest.readyState == 4 && httpRequest.status == 200){
    			const response = httpRequest.responseText;
    			if(response == 1){
    				elIdSuccess.classList.remove('hide');
        			elIdFail1.classList.add('hide');
        			elIdFail2.classList.add('hide');
        			elIdFail3.classList.add('hide');
    			} else if(response == 0){
    				elIdSuccess.classList.add('hide');
        			elIdFail1.classList.add('hide');
        			elIdFail2.classList.add('hide');
        			elIdFail3.classList.remove('hide');
    			}
    		} else {
    			console.log("bad request")
    		}
    	};
    	
    	httpRequest.send(null);
    	
    })
    
    // 이메일 인증
    let emailBtn = document.quarySelector()
    let elEmail = document.quarySelector("#userEmail");
    let emailVal = elEmail.value;
    
    console.log(emailVal);
    
    
</script>
</html>