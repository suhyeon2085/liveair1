<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar</title>

 <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Arial', sans-serif;
      background: #f0f0f0;
      padding: 30px;
    }

    .calendar {
      max-width: 1000px;
      margin: 0 auto;
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .calendar-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background: #3f51b5;
      color: white;
      padding: 20px 30px;
      font-size: 24px;
      font-weight: bold;
    }

    .calendar-header button {
      background: transparent;
      border: none;
      color: white;
      font-size: 24px;
      cursor: pointer;
    }

    .calendar-body {
      padding: 20px 30px;
    }

    .weekdays {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      text-align: center;
      font-weight: bold;
      color: #555;
      font-size: 18px;
      margin-bottom: 10px;
    }

    .days {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 10px;
    }

    .day, .empty {
      text-align: center;
      padding: 25px 0;
      border-radius: 6px;
      font-size: 18px;
      background: #f9f9f9;
      cursor: pointer;
      transition: background 0.2s;
    }

    .day:hover {
      background-color: #e0e0e0;
    }

    .empty {
      background: none;
      cursor: default;
    }

    @media (max-width: 768px) {
      .calendar {
        max-width: 100%;
        padding: 10px;
      }

      .calendar-header {
        font-size: 20px;
        padding: 15px 20px;
      }

      .calendar-body {
        padding: 15px 20px;
      }

      .day, .empty {
        padding: 15px 0;
        font-size: 16px;
      }

      .weekdays {
        font-size: 16px;
      }
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
      <div class="empty"></div>
      <!-- 날짜 -->
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