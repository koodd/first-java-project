<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/managerbase.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
        .page-num {
    
    text-align: center;
    margin:0 auto;
    margin-top: 50px;
  }
  
  .page-num li {
    width: 36px;
    height: 35px;
    padding: 0;
  	display: inline-block;
    padding-right: 5px;
  }
  
  .first {
    background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/paging_first.png) no-repeat;
  }
  
  .prev {
    background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/paging_prev.png) no-repeat;
  }
  
  .num {
    position: relative;
    top: -16px;
    height: 33px !important;
    border: 1px #989898 solid;
  }
  
  .num > div {
    position: relative;
    top: 2px;
  }
  
  .next {
    background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/paging_next.png) no-repeat;
  }
  
  .last {
    background: url(https://www.midashotel.co.kr/Midas_common/images/homepage/board/paging_last.png) no-repeat;
  }
  #searchBtn{
  	font-size: 18px;
    border:1px solid black;
    background-color:#d6d6d6;
    padding : 1px 30px;
  }
    </style>
</head>
<body>
    <section class="mlist_body">
        <h2>농장 등록 내역</h2>
        <table>
            <colgroup>
                <col width="10%"/>
                <col width="25%"/>
                <col width="40%"/>
                <col width="10%"/>
                <col width="15%"/>
            </colgroup>
            <tr>
                <th>번호</th>
                <th>농장명</th>
                <th>농장주소</th>
                <th>가격</th>
                <th>등록일</th>
            </tr>
            <c:forEach items="${map.list}" var="farmDto">
            <tr>
                <td>${farmDto.fr_no }</td>
                <td><a class="farmname" href="./man_farm_regi_view?fr_no=${farmDto.fr_no }">${farmDto.fr_name}</a></td>
                <td>${farmDto.fr_addr}</td>
                <td><fmt:formatNumber value="${farmDto.fr_price}" pattern="#,###"/></td>
                <td>${farmDto.fr_startdate}</td>
            </tr>
            </c:forEach>
        </table>
        <!-- 페이징 -->
		<ul class="page-num">
			<a href="man_farm_regi_list?page=1&searchword=${map.pDto.searchword}"><li class="first"></li></a>
			
			<c:if test="${map.pDto.page>1 }">
				<a href="man_farm_regi_list?page=${map.pDto.page-1}&searchword=${map.pDto.searchword}"><li class="prev"></li></a>
			</c:if>
			
			<c:forEach var="nowpage" begin="${map.pDto.startpage }" end="${map.pDto.endpage }">
				<li class="num">
					<c:if test="${map.pDto.page!=nowpage}">
					<a href="man_farm_regi_list?page=${nowpage}&searchword=${map.pDto.searchword}"><div>${nowpage}</div></a>
					</c:if>
					
					<c:if test="${map.pDto.page==nowpage}">
					<div>${nowpage }</div>
					</c:if>
				</li>
			</c:forEach>

			<c:if test="${map.pDto.page<map.pDto.maxpage }">
				<a href="man_farm_regi_list?page=${map.pDto.page+1}&searchword=${map.pDto.searchword}"><li class="next"></li></a>
			</c:if>
			
			<a href="man_farm_regi_list?page=${map.pDto.maxpage}&searchword=${map.pDto.searchword}"><li class="last"></li></a>
		</ul>
        <div class="mfsearchbox">
            <form action="man_farm_regi_list">
            <input type="text" id="mflistSearch" name="searchword" placeholder="농장명 입력">
            <input type="submit" value="검색" id="searchBtn"/>
        </form>
        </div>
        </section>
</body>
</html>