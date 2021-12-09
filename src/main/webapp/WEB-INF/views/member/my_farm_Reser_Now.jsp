<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/myPage.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/farmreser.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        .rnow{
            width: 1200px;
            margin: 0 auto;
        }
        td{
            border: 1px solid black;
        }
		.btn{
			cursor:auto;
		}
        .btn2{
            background-color: #666;
            width: 100%;
            height: 100%;
            cursor: pointer;
            border: none;
            margin-top:8px;
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
    
    <script type="text/javascript">
    $(function(){
    	var acc = $("#acc").val();
    	var accArr = acc.split(",");
        for(var i=0; i<accArr.length; i++){
        	$("#"+accArr[i]+"").attr('class','btn2');
        }
    });
    </script>
</head>
<body>
    <section class="rnow">
        <div class="wrapF_res">
            <h3>농장명</h3>
            <input type="hidden" value="${fDto.fr_no}" id="fr_no">
            <input type="hidden" value="${fDto.frs_account}" id="acc">
            <input type="hidden" value="${mDto.u_name}" id="u_name">
            <input type="hidden" value="${mDto.u_phone}" id="u_phone">
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
                <!-- A구역 -->
                <c:if test="${fDto.fr_block-20>=20 && fDto.fr_block-20>0}">
                <tr>
                	<th>A</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="A${status.current }" id="A${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-20<20 && fDto.fr_block-20>=0}">
				<tr>
					<th>A</th>
					<c:forEach begin="1" end="${fDto.fr_block-20}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="A${status.current }" id="A${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-20==0}">
				<tr>
					<th>A</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="A${status.current }" id="A${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- B구역 -->
				<c:if test="${fDto.fr_block-40>=20 && fDto.fr_block-40>0}">
				<tr>
                	<th>B</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="B${status.current }" id="B${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-40<20 && fDto.fr_block-40>0}">
				<tr>
                	<th>B</th>
					<c:forEach begin="1" end="${fDto.fr_block-40}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="B${status.current }" id="B${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-40==0}">
				<tr>
					<th>B</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="B${status.current }" id="B${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- C구역 -->
				<c:if test="${fDto.fr_block-60>=20 && fDto.fr_block-60>0}">
				<tr>
                	<th>C</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="C${status.current }" id="C${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-60<20 && fDto.fr_block-60>0}">
				<tr>
                	<th>C</th>
					<c:forEach begin="1" end="${fDto.fr_block-60}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="C${status.current }" id="C${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-60==0}">
				<tr>
					<th>C</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="C${status.current }" id="C${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>              
                <!-- D구역 -->
				<c:if test="${fDto.fr_block-80>=20 && fDto.fr_block-80>0}">
				<tr>
                	<th>D</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="D${status.current }" id="D${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-80<20 && fDto.fr_block-80>0}">
				<tr>
                	<th>D</th>
					<c:forEach begin="1" end="${fDto.fr_block-80}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="D${status.current }" id="D${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-80==0}">
				<tr>
					<th>D</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="D${status.current }" id="D${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- E구역 -->
				<c:if test="${fDto.fr_block-100>=20 && fDto.fr_block-100>0}">
				<tr>
                	<th>E</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="E${status.current }" id="E${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-100<20 && fDto.fr_block-100>0}">
				<tr>
                	<th>E</th>
					<c:forEach begin="1" end="${fDto.fr_block-100}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="E${status.current }" id="E${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<c:if test="${fDto.fr_block-100==0}">
				<tr>
					<th>E</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="E${status.current }" id="E${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
				<!-- F구역 -->
				<c:if test="${fDto.fr_block-120>=20 && fDto.fr_block-120>0}">
				<tr>
                	<th>F</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="F${status.current }" id="F${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-120<20 && fDto.fr_block-120>0}">
				<tr>
                	<th>F</th>
					<c:forEach begin="1" end="${fDto.fr_block-120}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="F${status.current }" id="F${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-120==0}">
				<tr>
					<th>F</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="F${status.current }" id="F${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- G구역 -->
				<c:if test="${fDto.fr_block-140>=20 && fDto.fr_block-140>0}">
				<tr>
                	<th>G</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="G${status.current }" id="G${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-140<20 && fDto.fr_block-140>0}">
				<tr>
                	<th>G</th>
					<c:forEach begin="1" end="${fDto.fr_block-140}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="G${status.current }" id="G${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-140==0}">
				<tr>
					<th>G</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="G${status.current }" id="G${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- H구역 -->
				<c:if test="${fDto.fr_block-160>=20 && fDto.fr_block-160>0}">
				<tr>
                	<th>H</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="H${status.current }" id="H${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-160<20 && fDto.fr_block-160>0}">
				<tr>
                	<th>H</th>
					<c:forEach begin="1" end="${fDto.fr_block-160}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="H${status.current }" id="H${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-160==0}">
				<tr>
					<th>H</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="H${status.current }" id="H${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- I구역 -->
				<c:if test="${fDto.fr_block-180>=20 && fDto.fr_block-180>0}">
				<tr>
                	<th>I</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="I${status.current }" id="I${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-180<20 && fDto.fr_block-180>0}">
				<tr>
                	<th>I</th>
					<c:forEach begin="1" end="${fDto.fr_block-180}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="I${status.current }" id="I${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-180==0}">
				<tr>
					<th>I</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="I${status.current }" id="I${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- J구역 -->
				<c:if test="${fDto.fr_block-200>=20 && fDto.fr_block-200>0}">
				<tr>
                	<th>J</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="J${status.current }" id="J${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-200<20 && fDto.fr_block-200>0}">
				<tr>
                	<th>J</th>
					<c:forEach begin="1" end="${fDto.fr_block-200}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="J${status.current }" id="J${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-200==0}">
				<tr>
					<th>J</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="J${status.current }" id="J${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- K구역 -->
				<c:if test="${fDto.fr_block-220>=20 && fDto.fr_block-220>0}">
				<tr>
                	<th>K</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="K${status.current }" id="K${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-220<20 && fDto.fr_block-220>0}">
				<tr>
                	<th>K</th>
					<c:forEach begin="1" end="${fDto.fr_block-220}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="K${status.current }" id="K${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-220==0}">
				<tr>
					<th>K</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="K${status.current }" id="K${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
                <!-- L구역 -->
				<c:if test="${fDto.fr_block-240>=20 && fDto.fr_block-240>0}">
				<tr>
                	<th>L</th>
                	<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="L${status.current }" id="L${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
				<c:if test="${fDto.fr_block-240<20 && fDto.fr_block-240>0}">
				<tr>
                	<th>L</th>
					<c:forEach begin="1" end="${fDto.fr_block-240}" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="L${status.current }" id="L${status.current }"></button></td>
                	</c:forEach>
                </tr>
                </c:if>
                <c:if test="${fDto.fr_block-240==0}">
				<tr>
					<th>L</th>
					<c:forEach begin="1" end="20" varStatus="status">
                	<td><button class="btn" type="button" name="frs_account" value="L${status.current }" id="L${status.current }"></button></td>
                	</c:forEach>
                </tr>
				</c:if>
            </table>
        </div>
        <div class="f_res_detail">
            <h3 class="detail-title">구좌 번호</h3>
            <!-- 테이블 클릭 시 구좌번호 넘어옴 -->
            <p class="detail-content" id="gujoanum"></p>

            <h3 class="detail-title">예약자</h3>
            <!-- 해당 구좌번호 예약 한 유저명 -->
            <p class="detail-content" id="name"></p>

            <h3 class="detail-title">예약자 연락처</h3>
            <!-- 해당 구좌번호 예약 한 유저의 연락처 -->
            <p class="detail-content" id="phone"></p>

            <h3 class="detail-title">사용시작일</h3>
            <!-- 해당 구좌번호 예약 한 유저의 희망작물 -->
            <p class="detail-content" id="startdate"></p>
        </div>
        <div class="all_reserv">
            <!-- span에 값 넣기 -->
            <h3>예약 완료된 총 구획 수 <span class="mainColor">${fDto.gujwa }</span>개</h3>
            <h3>총 결제 금액 <span class="mainColor"><fmt:formatNumber value="${fDto.totalPrice }" pattern="#,###"/></span>원</h3>
            <h3>농장 수익금 <span class="mainColor"><fmt:formatNumber value="${fDto.benefit }" pattern="#,###"/></span>원</h3>
        </div>
        <script type="text/javascript">
        $(function(){
	        $(".btn2").on("click",function(){
	            document.getElementById("gujoanum").innerText=this.value;
	            var frs_account=this.value;
	            var fr_no=$("#fr_no").val();
	            
	            $.ajax({
	            	url:"./detailReserView",
	            	type:"post",
	            	data:{
	            		"fr_no": "${fDto.fr_no}",
	            		"frs_account": frs_account
	            	},
	            	success:function(data){
	            		document.getElementById("name").innerText=(data.fDto.u_name);
	            		document.getElementById("phone").innerText=(data.fDto.u_phone);
	            		document.getElementById("startdate").innerText=(data.fDto.frs_startdate);
	            	},
	            	error:function(textStatus, errorThrown){
	            		alert("실패 : "+textStatus);
	            		alert(errorThrown);
	            	}
	            });
	        });
        });
    	</script>
    </section>
    <%@ include file="../base/footer.jsp" %>
</body>
</html>