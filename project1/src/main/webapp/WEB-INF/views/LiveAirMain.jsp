<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LiveAirMain</title>
 <style>
        body{
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }
        header{
            background-size: auto;
            background-image: url("에어컨.jpg");
            height: 1000px;
        }

        #logo img {
            width: 80px;  /* 로고 크기 조절 */
            height: auto;
            float: left;
        }
        /*일반 / 관리자 버튼*/
        #back button{
        font-size: 20px;
        font-weight: bold;
        padding: 10px 20px;
        color: rgb(0, 0, 0);
        border: none;
        border-radius: 10px;
        cursor: pointer;  /*--마우스 올렸을대 커서 바뀜*/
        font-family: 'pretendard', sans-serif;
        display: inline-block;
        margin: 0 auto; /* 가운데 정렬 */
        transition: background-color 0.3s ease;
        }
        #back :hover{
            text-decoration: underline;
        }
        #a{
            justify-content: space-between;
        }
        /* 화살표 공통 스타일 */
        #dlwjs, #ekdma {
            position: absolute;
            top: 32%;
            transform: translateY(-50%);
            width: 60px;
            height: 60px;
            background-size: cover;
            background-repeat: no-repeat;
            cursor: pointer;
        }

        /* 왼쪽 화살표 */
        #dlwjs {
            left: 20px;
            background-image: url("left.png");
            background-color: rgb(255, 238, 224);
            border-radius: 50%;
        }

        /* 오른쪽 화살표 */
        #ekdma {
            right: 20px;
            background-image: url("right.png");
            background-color: rgb(255, 238, 224);
            border-radius: 50%;
        }

        /*--로그인 div 전체*/
        section{
            height: 650px;
            margin: 0%;
        }
        .pad{
            padding-bottom: 70px;
        }

    /*--로그인 글자*/
    #fh {
    font-size: 45px;
    font-weight: bold;
    text-align: center;
    color: #333;
    margin-bottom: 20px;
    padding: 40px;
    font-family: 'Arial', sans-serif;
    }

    /*--버튼*/
    #qj {
    font-size: 27px;
    font-weight: bold;
    padding: 10px 20px;
    background-color: #000000; 
    color: white;
    border: none;
    border-radius: 20px;
    cursor: pointer;  /*--마우스 올렸을대 커서 바뀜*/
    font-family: 'Arial', sans-serif;
    display: block;
    margin: 0 auto; /* 가운데 정렬 */
    transition: background-color 0.3s ease;
    }

    /*출장 서비스/ 예약 조회 / 챗봇 공통 css*/
.e {
  width: 150px;
  height: 150px;
  border-radius: 50%;
  background-color: rgb(250, 250, 247);
  display: flex;
  justify-content: center;
  align-items: center;
}
.item {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0 15px; /* 아이템 간 간격 */
}
    /*이미지만*/
.e img {
  width: 70px;
  height: 70px;
  object-fit: contain;
}
    /*그것들을 정중안 배치하기*/
#ehd {
  display: flex;
  justify-content: center;
  gap: 30px;
  margin-top: 40px;
}

.item p {
  margin-top: 8px;
  font-size: 30px;
  color: #333;
  text-align: center;
  font-weight: bold;
  font-family: 'Arial', sans-serif;
}
        
/*footer영역*/
#c{
    padding: 3%;
    margin: 0%;
    background-color: #e4e4e4;
    font-size: 25px;
}
</style>
</head>
<body>
<!-- url 주소 일로 넣으면 됌 -->
    <form>
    <!--로고-->
    <!--사진 및 공지 넣을 공간-->
    <header>
        <div style="display: flex;" id="a">

        <div id="logo">
            <a href="http://127.0.0.1:5500/home.html">
            <img src="logo.png" > <!-- 로고 --></a>
        </div>

        <div id="back"><!--관리자 로그인 통합-->
            <button type="button"> 일반 </button><!-- 관리자 페이지로 연결-->
            <button type="button"> 관리자 </button><!-- 로그인 페이지로 연결 -->
        </div>
        </div>


        <div> <!-- 사진 배경 위에 이전과 다음 버튼 자리 -->
            <div id="dlwjs" style="width: 60px; height: 60px; background-image: url(left.png); background-size: cover;"></div>
            <div id="ekdma" style="width: 60px; height: 60px; background-image: url(right.png); background-size: cover;" ></div>
        </div>

    </header>



    <section> <!-- 로그인 전체 div -->
    <div>

        <div class="pad">
        <p id="fh">로그인하시고 바로 예약해보세요</p>
        <button type="button" id="qj">로그인</button>
        </div>


    <div id="ehd"><!-- 나중에 출장서비스 예약 페이지로 <a href="">-->
         <div class="item">
            <div class="e">
            <img src="출장서비스예약.png" alt="출장예약" />
        </div>
            <p>출장 서비스 예약</p>
        </div>
    <div class="item"><!-- 나중에 예약 조회 및 변경 예약 페이지로 <a href="">-->
        <div class="e">
            <img src="조회및변경.png" alt="예약조회" />
        </div>
            <p>예약 조회 및 변경</p>
    </div>
        <div class="item"><!-- 나중에 챗봇 페이지로 <a href="">-->
        <div class="e">
            <img src="챗봇.png" alt="챗봇연결" />
        </div>
    <p>챗봇 연결하기</p>
        </div>
      </div>
    </div>

    </section>

    <!-- footer 영역
    대표 번호 / 대표이메일 / 구매 서비스 분의 (전화번호) / 전화상담 시간 / 휴무 유무 안내 /
    이름 / 사업자 등록번호 / 통신판매업신고번호 / 주소 
  -->

    <footer id="c">
        <ul style="list-style: none;">
            <li>대표 번호 : 010-1111-1111&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;대표 이메일 : LiveAir@naver.com</li>
            <li>구매 문의 : 010-1111-1112&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;전화 상담 시간 : 9:00-6:00</li>
            <li>휴무 유무 안내 : 공휴일 9:00-12:00&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;주말 휴무 </li>
        </ul>
        <hr>
        <ul style="list-style: none;">
            <li> Live Air&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;사업자 등록번호 : 123-45-67891&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;주소 : 울산광역시 남구 삼산중로100번길 26 케이엠빌딩 </li>
        </ul>
    </footer>
  </form>
</body>
</html>