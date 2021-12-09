<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/myPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/farmreser.css">
    <style>
        .rnow{
            width: 1200px;
            margin: 0 auto;
        }
        td{
            border: 1px solid black;
        }

        td .btn{
            background-color: #666;
            width: 100%;
            height: 100%;
            cursor: pointer;
            border: none;
        }
        .f_res_detail{
            border-bottom: 2px solid black;
        }
        .all_reserv{
            width:900px;
            margin: 0 auto;
        }
        .mainColor{
            color: #538F6A;
        }
        .detail-content{
        	margin-bottom:20px;
        }
    </style>
    <script>
        function clickBtn(bb){
            document.getElementById("gujoanum").innerText=bb.value;
        }
    </script>
</head>
<body>
    <section class="rnow">
        <div class="wrapF_res">
            <h3>농장명</h3>
            <table>
                <tr>
                    <th></th>
                    <th>1</th>
                    <th>2</th>
                    <th>3</th>
                    <th>4</th>
                    <th>5</th>
                    <th>6</th>
                    <th>7</th>
                    <th>8</th>
                    <th>9</th>
                    <th>10</th>
                    <th>11</th>
                    <th>12</th>
                    <th>13</th>
                    <th>14</th>
                    <th>15</th>
                    <th>16</th>
                    <th>17</th>
                    <th>18</th>
                    <th>19</th>
                    <th>20</th>
                </tr>
                <tr>
                <!-- A구역 -->
                    <th>A</th>
                    <td><button type="button" class="btn" value="A1" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A2" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A3" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A4" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A5" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A6" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A7" onclick="clickBtn(this)"></button></td>
                    <td></td>
                    <td><button type="button" class="btn" value="A9" onclick="clickBtn(this)"></button></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><button type="button" class="btn" value="A19" onclick="clickBtn(this)"></button></td>
                    <td><button type="button" class="btn" value="A20" onclick="clickBtn(this)"></button></td>
                </tr>
            </table>
        </div>
        <div class="f_res_detail">
            <h3 class="detail-title">구좌 번호</h3>
            <!-- 테이블 클릭 시 구좌번호 넘어옴 -->
            <p class="detail-content" id="gujoanum"></p>

            <h3 class="detail-title">예약자</h3>
            <!-- 해당 구좌번호 예약 한 유저명 -->
            <p class="detail-content">최건호</p>

            <h3 class="detail-title">예약자 연락처</h3>
            <!-- 해당 구좌번호 예약 한 유저의 연락처 -->
            <p class="detail-content">010-1234-5678</p>

            <h3 class="detail-title">예약자 희망작물</h3>
            <!-- 해당 구좌번호 예약 한 유저의 희망작물 -->
            <p class="detail-content">준현씨</p>

            <h3>예약자 특이사항</h3>
            <!-- 예약자가 작성한 특이사항 -->
            <textarea readonly></textarea>
        </div>
        <div class="all_reserv">
            <!-- span에 값 넣기 -->
            <h3>예약 완료된 총 구획 수 <span class="mainColor">3</span>개</h3>
            <h3>총 결제 금액 <span class="mainColor">500,000</span>원</h3>
            <h3>농장 수익금 <span class="mainColor">400,000</span>원</h3>
        </div>
    </section>
    <%@ include file="../base/footer.jsp" %>
</body>
</html>