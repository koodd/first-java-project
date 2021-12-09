<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../base/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>체험 프로그램 상세보기</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_View.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="../js/datepicker.js"></script>
    <script src="../js/datepicker.ko.js"></script>
    
    <style type="text/css">
        .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    </style>
    
    <script type="text/javascript">
    	$(function(){
    		$("#kakaoPayBtn").click(function(){
    			
    			var totalPrice = ${map.eDto.e_price}*$("#er_people").val();
    			$("#py_price").val(totalPrice);
    			var expPay_code = "${map.eDto.fr_name}"+$("#uno").val();
    			
    			 IMP.init('imp30403635');	 
    			      // IMP.request_pay(param, callback) 결제창 호출
    			      IMP.request_pay({ // param
    			          pg: "kakaopay",
    			          pay_method: "card",
    			          merchant_uid: expPay_code,
    			          name: "${map.eDto.fr_name}",
    			          amount: $("#py_price").val(),
    			          buyer_email: "chlrjsgh555@naver.com",
    			          buyer_name: "${map.eDto.u_name}",
    			          buyer_tel: "010-8121-3567",
    			          buyer_addr: "${map.eDto.u_addr}",
    			          buyer_postcode: "01181"
    			      }, function (rsp) { // callback
    			          if (rsp.success) {
    			        	  $("#exp_do_reser").submit();
    			          } else {
    			        	  var msg = '결제에 실패하였습니다.';
    			        	  msg += '에러내용 : ' + rsp.error_msg;
    			        	  alert(msg);
    			          }
    			      }); 
    		});//kakaoPayBtn 
    	});
    </script>
    
    
</head>
<body style="margin: 0 auto; width: 1200px;">
    <script src="../js/header.js"></script>
    <h2>체험프로그램 상세보기</h2>
    <hr>
    <!-- 탑 박스 -->
    <form action="./exp_do_reser" id="exp_do_reser">	    
	    <div class="exp_viwe_topbox">
	        <h3><span>${map.eDto.fr_name}</span></h3><br>
	        <div class="exp_view_leftbox">
	            <div class="img_box">
	                <img src="../upload/${map.eDto.e_thumb}">
	            </div>
	        </div>
	        <div class="exp_view_rightbox">
	        <!-- 체험 정보 부분 -->
	        
	            <table class="right_box_info" style="width: 100%;">
	                <colgroup>
	                    <col width="25%">
	                    <col width="75%">
	                </colgroup>
	                <tr class="bordertop">
	                    <th>체험명 : </th>
	                    <th>${map.eDto.e_name}</th>
	                </tr>
	                <tr>
	                    <th>농장명 : </th>
	                    <th>${map.eDto.fr_name}</th>
	                </tr>
	                <tr>
	                    <th>주소 : </th>
	                    <th>${map.eDto.fr_addr}</th>
	                </tr>
	                <tr>
	                    <th>이용기간 : </th>
	                    <th>${map.eDto.e_startdate} ~ ${map.eDto.e_enddate}</th>
	                </tr>
	                <tr>
	                    <th>전화번호 : </th>
	                    <th>${map.eDto.u_phone}</th>
	                </tr>
	                <tr>
	                    <th>체험이용시간 : </th>
	                    <th>${map.eDto.e_term} 시간</th>
	                </tr>
	                <tr>
	                    <th>이용요금 : </th>
	                    <th><fmt:formatNumber value="${map.eDto.e_price}" pattern="#,###" /> 원 </th>
	                </tr>
	            </table>
	            <span>&nbsp;* 1인당 이용요금입니다.</span>
	<!-- 관리자 한테는 체험 예약하는 부분이 안보임 -->
	     <c:if test="${session_ucno!=3}">        
	            <!-- 체험 예약하는 부분 -->
	            <div class="exp_view_rightbox_bottom">
	                <div class="button_box">
	                    <table>
	                        <tr class="sdate">
	                            <td>체험시작일 : </td>
	                            <td><input type="text" id="er_visitdate" name="er_visitdate" size="10"></td>
	                        </tr>
	<!-- 달력-->
	<script>
	    $("#er_visitdate").datepicker({
	        language: 'ko'
	    });
	</script>
	                        <tr>
	                            <td>인원수 : </td>
	                            <td><input type="text" id="er_people" name="er_people" size="5"> 명</td>
	                        </tr>
	                        <div class="reg_btn_wrap">
	                        	<input type="hidden" name="e_no" value="${param.e_no}" id="eno">
	                        	<input type="hidden" name="u_no" value="${session_uno}" id="uno">
	                        	<input type="hidden" name="py_price" id="py_price">	                        		                        	
	                            <button type="button" class="reg_btn" id="kakaoPayBtn">체험 예약하기</button>     
	                        </div>
	                    </table>
	                </div>
	            </div>
	         </c:if> <!-- // 관리자 한테는 체험 예약하는 부분이 안보임  -->  
	            
	        </div>
	    </div>
    </form>
    <hr>
    <!-- 바텀 박스 -->
    <div class="exp_view_bottombox">
        <h4>이용안내</h4><hr>
        <div class="exp_view_bottombox_info">
            <div class="sub_each">
                <h4 class="sub_tit1">필수 준수사항</h4>
                <p class="sub_txt1">
                    모든 서비스의 이용은 담당 기관의 규정에 따릅니다. 각 시설의 규정 및 허가조건을 반드시 준수하여야 합니다.
                    각 관리기관의 시설물과 부대시설을 이용함에 있어 담당자들과 협의 후 사용합니다.
                    각 관리기관의 사고 발생시 해피홀팜에서는 어떠한 책임도 지지않습니다.
                    시설이용료 납부는 각 관리기관에서 규정에 준합니다.
                    본 사이트와 각 관리기관의 규정을 위반할 시에는 시설이용 취소 및 시설이용 불허의 조치를 취할 수 있습니다.
                </p>
            </div>
            <div class="sub_each">
                <h4 class="sub_tit1">상세 사항</h4>
                <p class="sub_txt1">  
                    -체험명 : ${map.eDto.e_name}
                </p>
                <p class="sub_txt1">
                    -농장명 : ${map.eDto.fr_name}
                </p>
                <p class="sub_txt1">
                    -위치 : ${map.eDto.fr_addr}
                </p>
                <p class="sub_txt1">
                    -농장주 : ${map.eDto.u_name}
                </p>
                <p class="sub_txt1">
                    -전화번호 : ${map.eDto.u_phone}
                </p>
                <p class="sub_txt1">
                    -체험이용시간 : ${map.eDto.e_term} 시간
                </p>
                <p class="sub_txt1">
                    -이용 요금 : <fmt:formatNumber value="${map.eDto.e_price}" pattern="#,###"/> 원
                </p>
            </div>
            <div class="sub_each">
                <h4 class="sub_tit1">주의 사항</h4>
                <p class="sub_txt1">
                    1. 농장을 오염시키는 행위를 삼가하여 주시기 바랍니다.
                </p>
                <p class="sub_txt1">
                    2. 농장에서는 식품조리를 하실 수 없습니다.
                </p>
                <p class="sub_txt1">
                    3. 외부의 쓰레기는 반입하지 마시고, 귀가시 쓰레기는 꼭 되가져 가시기 바랍니다.(특히,텃밭내 쓰레기 투기는 삼가하여 주시기 바랍니다)
                </p>
                <p class="sub_txt1">
                    4. 공동으로 사용하는 농기구는 사용 후 제자리에 가져다 놓읍시다
                </p>
                <p class="sub_txt1">
                    5. 반려동물 동반시에는 목줄을 착용해주시고 다른 참여자와 텃밭에 피해가 되지 않도록 하여 주십시오.
                </p>
            </div>
            <div class="sub_each">
                <h4 class="sub_tit1">농장 위치</h4>
                <div id="map" style="width:700px;height:500px;">
                    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5ee0485b8fd43c2a10e8821f6c5d3ada&libraries=services"></script>
                    <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                        level: 3 // 지도의 확대 레벨
                    };  

                // 지도를 생성합니다    
                var map = new kakao.maps.Map(mapContainer, mapOption); 

                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();

                // 주소로 좌표를 검색합니다
                geocoder.addressSearch('${map.eDto.fr_addr}', function(result, status) {

                    // 정상적으로 검색이 완료됐으면 
                     if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="width:150px;text-align:center;padding:6px 0;">${map.eDto.fr_name}</div>'
                        });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                    } 
                });    
                        </script>
                </div>
            </div>
        </div>
    </div>

<%@ include file="../base/footer.jsp" %> 
</body>
</html>