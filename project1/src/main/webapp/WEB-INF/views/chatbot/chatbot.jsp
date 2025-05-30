<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>chatbot 문의</title>
<style type="text/css">
	* { text-align: center; margin-bottom: 1%}
	div { border-radius: 20px; width: 40%; margin-left: auto; margin-right: auto;}
	.choice { border-color: #53a3d9; border-style: solid; border-width: 1px; margin-left: 0; height: 50%; width: 50%; padding: 3%; }
	.client { border: 1px solid black; margin-left: 0; height: 50%; width: 60%; padding: 3%;}
	.user { background-color: #53a3d9; margin-right: 0; height: 50%; width: 50%; padding: 3%;}
</style>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
	$("document").ready(function() {
		var chat = $("#chat");
		let str = "";
		$("#question1").on("click", function() {
			str = "<div class='user'>A/S 가격을 예상하고 싶어</div>";
			str += "<div class='client'>test</div>";
			chat.append(str);			
		})
		$("#question2").on("click", function() {
			str = "<div class='user'>예약하고 싶어</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		$("#question3").on("click", function() {
			str = "<div class='user'>예약을 조회하고 싶어</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		$("#question4").on("click", function() {
			str = "<div class='user'>상담사 연결해줘</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		$("#question5").on("click", function() {
			str = "<div class='user'>상담을 종료할래</div>";
			str += "<div class='client'>temp</div>";
			chat.append(str);		
		})
		
	})
	
</script>
</head>
<body>
<div id="chat">
	<div class="client">어떤 도움이 필요하신가요?</div>
	<div class="choice" id="question1">A/S 가격을 예상하고 싶어</div>
	<div class="choice" id="question2">예약하고 싶어</div>
	<div class="choice" id="question3">예약을 조회하고 싶어</div>
	<div class="choice" id="question4">상담사 연결해줘</div>
	<div class="choice" id="question5">상담을 종료할래</div>
</div>
</body>
</html>