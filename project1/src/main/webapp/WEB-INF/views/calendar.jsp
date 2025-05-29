<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>

    <style>
.calendar {
  width: 350px;
  border: 1px solid #ddd;
  font-family: 'Arial', sans-serif;
}

.calendar-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #3f51b5;
  color: white;
  padding: 10px 15px;
  font-weight: bold;
}

.calendar-header button {
  background: transparent;
  border: none;
  color: white;
  font-size: 18px;
  cursor: pointer;
  user-select: none;
}

.calendar-body {
  padding: 10px 15px;
}

.weekdays {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  text-align: center;
  font-weight: bold;
  color: #555;
  margin-bottom: 8px;
}

.days {
  display: grid;
  grid-template-columns: repeat(7, 1fr);
  gap: 5px;
}

.day, .empty {
  text-align: center;
  padding: 12px 0;
  border-radius: 4px;
  cursor: pointer;
  user-select: none;
}

.day:hover {
  background-color: #e0e0e0;
}

.empty {
  background: none;
  cursor: default;
}

    </style>

</head>
<body>
    <div class="calendar">
  <div class="calendar-header">
    <button class="prev">&lt;</button>
    <div class="month-year">2025년 6월</div>
    <button class="next">&gt;</button>
  </div>
  <div class="calendar-body">
    <div class="weekdays">
      <div>월</div><div>화</div><div>수</div><div>목</div><div>금</div><div>토</div><div>일</div>
    </div>
    <div class="days">
      <!-- 빈 칸 -->
      <div class="empty"></div> <!-- 1일이 일요일이면 월~토까지 빈칸을 넣어야 함 -->
      <!-- 날짜들 -->
      <div class="day">1</div>
      <div class="day">2</div>
      <div class="day">3</div>
      <div class="day">4</div>
      <div class="day">5</div>
      <div class="day">6</div>
      <div class="day">7</div>
      <div class="day">8</div>
      <div class="day">9</div>
      <div class="day">10</div>
      <div class="day">11</div>
      <div class="day">12</div>
      <div class="day">13</div>
      <div class="day">14</div>
      <div class="day">15</div>
      <div class="day">16</div>
      <div class="day">17</div>
      <div class="day">18</div>
      <div class="day">19</div>
      <div class="day">20</div>
      <div class="day">21</div>
      <div class="day">22</div>
      <div class="day">23</div>
      <div class="day">24</div>
      <div class="day">25</div>
      <div class="day">26</div>
      <div class="day">27</div>
      <div class="day">28</div>
      <div class="day">29</div>
      <div class="day">30</div>
    </div>
  </div>
</div>
</body>
</html>