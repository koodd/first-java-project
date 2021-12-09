<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../member/myPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험 예약현황</title>

    <!-- fullcalendar -->
    <link rel="stylesheet" href="../calendar/css/main.css">
    <script src="../calendar/js/main.js"></script>
    <script src="../calendar/js/locales-all.min.js"></script>


    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_Book.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- fullcalendar -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  var initialLocaleCode = 'ko';
  var localeSelectorEl = document.getElementById('locale-selector');
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },
    locale: initialLocaleCode,
    buttonIcons: false, // show the prev/next text
    weekNumbers: true,
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events
  });

  calendar.render();

  // build the locale selector's options
  calendar.getAvailableLocaleCodes().forEach(function(localeCode) {
    var optionEl = document.createElement('option');
    optionEl.value = localeCode;
    optionEl.selected = localeCode == initialLocaleCode;
    optionEl.innerText = localeCode;
    localeSelectorEl.appendChild(optionEl);
  });

  // when the selected option changes, dynamically change the calendar option
  localeSelectorEl.addEventListener('change', function() {
    if (this.value) {
      calendar.setOption('locale', this.value);
    }
  });

});
    
 
  </script>

</head>
<body style="margin: 0 auto; width: 1200px;">
   <script src="./js/header.js"></script>
    <h2>체험예약 현황</h2>
    <hr>
    <h3 class="h3">딸기 체험</h3>
    <table class="exp_BookList_table">
        <colgroup>
            <col width="15%">
            <col width="15%">
            <col width="20%">
            <col width="10%">
            <col width="20%">
            <col width="20%">
        </colgroup>
        <thead class="exp_Bookthead">
            <tr>
                <td>체험 예약 번호</td>
                <td>예약자</td>
                <td>예약자 연락처</td>
                <td>예약 인원</td>
                <td>방문 날짜</td>
                <td>신청 예약 날짜</td>
            </tr>
        </thead>
        <tbody class="exp_Booktbody">
            <tr>
                <th>111</th>
                <th><a href="#">최건호</a></th>
                <th>01081213567</th>
                <th>4</th>
                <th>2021-11-20</th>
                <th>2021-11-17</th>
            </tr>
            <tr>
                <th>111</th>
                <th><a href="#">최건호</a></th>
                <th>01081213567</th>
                <th>4</th>
                <th>2021-11-20</th>
                <th>2021-11-17</th>
            </tr>
        </tbody>
    </table>

    <hr>
    <table class="exp_Book_table">
        <tr>
            <th class="exp_Book_td">
                예약자 :
            </th>
            <td>
                예약자 이름
            </td>
        </tr>
        <tr>
            <th class="exp_Book_td">
                예약인원 :
            </th>
            <td>
                예약 인원 수 (명)
            </td>
        </tr>
        <tr>
            <th class="exp_Book_td">
                예약자 연락처 :
            </th>
            <td>
                010-8111-4114
            </td>
        </tr>
        
        <tr>
            <th class="exp_Book_td">
                이번달 체험 예약건수는 :
            </th>
            <td>
                10 (건) 입니다.
            </td>
        </tr>
        <tr>
            <th class="exp_Book_td">
               총 결제금액 :
            </th>
            <td>
               10,000 (원)
            </td>
        </tr>
        <!-- 총결제금액의 80% -->
        <tr>
            <th class="exp_Book_td">
                체험 프로그램 수익금 :
            </th>
            <td>
               8,000 (원)
            </td>
        </tr>
    </table>

<%@ include file="../footer.jsp" %> 
</body>
</html>