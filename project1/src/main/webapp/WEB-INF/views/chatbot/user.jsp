<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
 <style>
    body{
        margin: 0%;
        padding: 0%;
        width: 100%;
    }

    /*박스 사이즈 조절*/
    #main{
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f5f5f5;
      background-color: antiquewhite;
    }

    /*박스 안에 div들 조절*/
    #log {
      background-color: rgb(255, 254, 252);
      padding: 30px;
      width: 700px;
      height: 1000px;
      border-radius: 30px;
      box-shadow: 0 0 10px 2px rgba(0, 0, 0, 0.1); 
    }

    #p{
    font-size: 35px;
    font-family: 'Noto Sans', sans-serif;
    font-weight: bold;
    text-align: left;
    margin-bottom: 50px;
    }

    #lo{
        padding-bottom: 40px;
    }

input {
  width: 300px;
  height: 40px;
  font-size: 16px;
  border-radius: 10px;
  border: none;
  margin: 20px 0;
  padding: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  background-color: rgb(253, 242, 228);
}

/* 눈 아이콘이 들어가는 비밀번호 input */
.input-container {
  position: relative;
  width: 330px;
  margin: 20px auto;
}

.input-container input {
  padding-right: 10px; /* 오른쪽 눈 아이콘 공간 확보 */
}

.toggle-eye {
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  cursor: pointer;
  font-size: 18px;
  color: #555;
}

    label{
        font-size: 21px;
        font-family: 'Noto Sans' sans-serif;
        font-weight: bold;
        color: rgb(105, 104, 104);
    }
    #btn{
    background-color: rgb(253, 242, 228);
    color: rgb(0, 0, 0);
    border: none;
    padding: 12px 24px;
    margin: 18px;
    border-radius: 8px;
    font-size: 20px;
    font-weight: bold;
    font-family: 'Noto Sans' sans-serif;
    cursor: pointer;
    box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.15);
    transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .log-content {
    text-align: center;
    padding: 50px;
    }
    
    
    </style>
    <script>
    function togglePassword() {
    const input = document.getElementById("passwordInput");
    const icon = document.querySelector(".toggle-eye");
    if (input.type === "password") {
      input.type = "text";
      icon.textContent = "🔒"; // 눈 감은 상태
    } else {
      input.type = "password";
      icon.textContent = "👁️"; // 눈 뜬 상태
    }
  }
</script>
</head>
<body>
<div id="main"> 
    <div id="log"><!--로그인 전체 박스 div-->
        <p id="p">◀ 로그인</p>

        <div class="log-content"><!--로그인 빼고 중앙 정렬과 조정 하는 div-->
        <img src="lg.png" style="width: 150px;" id="lo"><br>

        <label>이메일 또는 아이디를 입력해주세요</label><br>
        <input type="text" placeholder="이메일 또는 아이디 입력"><br>

        <label>비밀번호</label><br>
        <div class="input-container">
        <input type="password" id="passwordInput" placeholder="비밀번호 입력">
        <span class="toggle-eye" onclick="togglePassword()">👁️</span>
        </div>

        <button type="button" id="btn">로그인</button>
        <p style="font-size: 20px;">아이디찾기 &nbsp;&nbsp;|&nbsp;&nbsp;비밀번호 재설정&nbsp;&nbsp;|&nbsp;&nbsp;회원가입</p>


        <hr style="color: black;">
        <button type="button" id="btn"> 간편 로그인 하기 </button><br>
        <a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Fcs.kakao.com%2Fhelps%3Fcategory%3D25#login"><img src="카카오톡.png"style="width: 50px;" alt="이미지설명"></a>
        <a href="https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/"><img src="네이버.png"style="width: 55px;" alt="이미지설명"></a>
        </div>
    </div>
</div>
</body>
</html>