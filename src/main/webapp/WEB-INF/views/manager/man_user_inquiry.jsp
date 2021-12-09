<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/managerbase.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .mlist_body{
            width: 1200px;
            margin: 0 auto;
            margin-top : 50px;
        }
        .mlist_body h2{
            font-size: 30px;
            margin-bottom:50px;
        }
        .mlist_body table{
            width: 1000px;
            margin: 0 auto;
            text-align: center;
        }
        .mlist_body table th, .mlist_body table td, .mlist_body table{
            /* border: 1px solid black; */
            border-collapse: collapse;
        }
        .mlist_body table th{
            border-top: 3px solid #666;
            border-bottom: 3px solid #666;
        }
        .mfsearchbox{
            width: 900px;
            margin: 0 auto;
            text-align: center;
            margin-top: 40px;
        }
        #mflistSearch{
            font-size: 20px;
            border:1px solid black;
        }
        .mfsearchbox button{
            font-size: 18px;
            border:1px solid black;
            background-color:#d6d6d6;
            padding : 1px 30px;
        }

        .farmname:hover{
        	font-weight: 900;
        }
    </style>

</head>
<body>
    <section class="mlist_body">
        <h2>1:1 문의 내역</h2>
        <table>
            <colgroup>
                <col width="10%"/>
                <col width="60%"/>
                <col width="15%"/>
                <col width="15%"/>
            </colgroup>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>유저명</th>
                <th>접수일</th>
            </tr>
            <c:forEach items="${list }" var="list">
            <tr>
                <td>${list.ci_no }</td>
                <td><a href="./man_inquiry_view?ci_no=${list.ci_no }">${list.ci_title }</a></td>
                <td>${list.u_name }</td>
                <td>${list.ci_date }</td>
            </tr>
            </c:forEach>
        </table>
        <!-- 페이징 -->


        </section>
        <script type="text/javascript">
			if(${result==1}){alert("답장 전송 완료");}
		</script>
</body>
</html>