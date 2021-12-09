<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농장 상세보기</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <link rel="stylesheet" href="../css/farmView.css">
    <script type="text/javascript">
    function modalNow(){
    	if(${session_id==null}){
    		alert("로그인을 하셔야 농장 예약이 가능합니다");
    	}else{
    		location.href="./farm_reser?fr_no=${param.fr_no }&u_no=${session_uno}"; 
    	}
    }
    </script>
</head>
<body>
<%@ include file="../base/header.jsp" %>
    <main class="sub shop-detail">
        <div class="con-wrap con-subpage">
            <!-- 본문 -->
            <section class="sub-page">

                <div class="shop-detail-area" id="shopdetail">
                    <div class="left shop-detail-img">
                        <div class="shop-detail-img-top">
                            <div class="shop-detail-img-main slick-initialized slick-slider">
                                <div id="demo" class="carousel slide" data-ride="carousel">
	<input type="hidden" value="${session_id }" id="sesid">
	<input type="hidden" value="${session_nickname }" id="sesnick">
	<input type="hidden" value="${session_ucno }" id="ucno">
	<input type="hidden" value="${param.fr_no }" id="fr_no">
                                    <!-- Indicators -->
                                    <ul class="carousel-indicators">
                                      <li data-target="#demo" data-slide-to="0" class="active"></li>
                                      <li data-target="#demo" data-slide-to="1"></li>
                                      <li data-target="#demo" data-slide-to="2"></li>
                                      <li data-target="#demo" data-slide-to="2"></li>
                                    </ul>
                                    
                                    <!-- 이미지 넣기 -->
                                    <div class="carousel-inner">
                                      <div class="carousel-item active">
                                        <img src="../upload/${map.fDto.fr_view}" alt="농장 추가사진 1" width="640" height="426px">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="../upload/${map.fDto.fr_view2}" alt="농장 추가사진 2" width="640" height="426px">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="../upload/${map.fDto.fr_view3}" alt="농장 추가사진 3" width="640" height="426px">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="../upload/${map.fDto.fr_view4}" alt="농장 추가사진 4" width="640" height="426px">
                                      </div>
                                    </div>
                                    
                                    <!-- Left and right controls -->
                                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                      <span class="carousel-control-prev-icon"></span>
                                    </a>
                                    <a class="carousel-control-next" href="#demo" data-slide="next">
                                      <span class="carousel-control-next-icon"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 우측 간단한 정보 표기 -->
                    <div class="right shop-detail-info">
                        <!-- 농장명 -->
                        <h2 class="tit">${map.fDto.fr_name}<span style="float: right;"><img src="../images/star.png" width="30px">${map.fDto.f_grade}</span></h2>
                        <ul class="shop-detail-location">
                            <li>
                                <p class="tit">주소</p>
                                <!-- 농장주소 -->
                                <p class="area">${map.fDto.fr_addr}</p>
                            </li>
                            <li>
                                <p class="tit">구좌수</p>
                                <!-- 구좌수 -->
                                <p class="area">${map.fDto.fr_block}개</p>
                            </li>
                            <li>
                                <p class="tit">운영일</p>
                                <!-- 운영일 -->
                                <p class="area">${map.fDto.fr_startdate} ~ ${map.fDto.fr_enddate}</p>
                            </li>
                            <li>
                                <p class="tit">전화번호</p>
                                <!-- 농장주 전화번호 -->
                                <p class="area">${map.fDto.u_phone}</p>
                            </li>
                            <li>
                                <p class="tit">가격</p>
                                <!-- 가격 -->
                                <p class="area" style="font-size: 25px; font-weight: bold; color: #66BB6A;"><fmt:formatNumber value="${map.fDto.fr_price}" pattern="#,###"/>원</p>
                            </li>
                        </ul>
                        <c:if test="${session_ucno!=3 }">
                        <div class="shop-detail-btn">
                            <button class="" onclick="modalNow()">예약하기</button>
                        </div>
                        </c:if>
                        <c:if test="${session_ucno==3 }">
                        <div class="shop-detail-btn">
                            <button class="" onclick="farmDelete()">농장 삭제하기</button>
                        </div>
                        </c:if>
                    </div>
                </div>

                <!-- 상세 디테일 탭 -->
                <div class="shop-detail-tab-area" style="margin-bottom: 50px;">
                    <ul class="tab-list shop-detail-tab">
                        <li class="active"><a href="javascript:;">농장 정보</a></li>
                    </ul>
                    <div id="content-left">
                        <h2 class="detail-title">전체면적</h2>
                        <!-- 전체면적 -->
                        <p class="detail-content">${map.fDto.fr_area}㎡</p>
                        <h2 class="detail-title">구좌당 면적</h2>
                        <!-- 구좌당 면적 -->
                        <p class="detail-content">${map.fDto.fr_land}㎡</p>
                        <h2 class="detail-title">특이사항</h2>
                        <!-- 특이사항 -->
                        <p class="detail-content">${map.fDto.fr_unique}</p>
                        <h2 class="detail-title">재배 불가능한 농작물</h2>
                        <!-- 재배 불가능 식물 -->
                        <p class="detail-content">${map.fDto.fr_noplant}</p>
                        <h2 class="detail-title">제공서비스</h2>
                        <!-- 제공 서비스 -->
                        <!-- ** 포함하는 지 체크! ** -->
                        <c:set var="testStr" value="${map.fDto.fr_service}"></c:set>
		                <c:if test="${fn:contains(testStr,'Baby')}">
		                	<p>수도</p>
		                </c:if>
                        <p class="detail-content">${map.fDto.fr_service}</p>
                    </div>
                    
                    <!-- 지도 넣기 -->
                    <div id="content-right">
	                    <div id="map" style="width:700px;height:500px; margin-top:131px;">
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
				                geocoder.addressSearch('${map.fDto.fr_addr}', function(result, status) {
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
				                            content: '<div style="width:150px;text-align:center;padding:6px 0;">${map.fDto.fr_name}</div>'
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

                <div class="shop-detail-tab-area" style="margin-bottom: 50px;">
                    <ul class="tab-list shop-detail-tab">
                        <li class="active"><a href="javascript:;">리뷰</a></li>
                    </ul>
                </div>
            </section>
            <script type="text/javascript">
	            var userId = "${session_id}";
	            var userNick = "${session_nickname}";
	            var userUcno = "${session_ucno}";
	            var fr_no = "${param.fr_no}";
            	//리뷰 작성
            	function writeReview(){
            		if(userId==""){
            			alert("리뷰를 달기 위해선 로그인을 해야 합니다!");
            		}else if(userUcno==3){
            			alert("관리자는 농장에 리뷰를 달 수 없습니다!");
            		}else{
	            		$.ajax({
	            			url:"./writeReview",
	            			type:"post",
	            			data:{
	            				"u_id":userId,
	            				"fr_no":fr_no,
	            				"frv_nickname":userNick,
	            				"frv_grade":$("#frv_grade").val(),
	            				"frv_content":$("#frv_content").val()
	            			},
	            			success:function(data){
	            				alert("리뷰가 등록되었습니다.");
	            				window.location.reload();
	            			},
	            			error:function(textStatus, errorThrown){
	            				alert("실패 : "+textStatus);
	            				alert(errorThrown);
	            			}
	            		});	// ajax
            		} //else
            	}
            </script>
            <!-- 리뷰 -->
                <div class="shop-detail-tab-content small" style="width: 1200px;">
                    <div class="review-area" style="width: 100%;">
                        <div class="review-top">
                            <div class="review-score">
                                <p class="score-now"><img src="../images/star.png"><span class="detail-content">${map.fDto.f_grade}</span><span>/ 5.0</span></p>
                                <span id="rCount">(${rCount}개)</span>
                            </div>
                            <button class="review-write" onclick="writeReview()">리뷰작성</button>
                        </div>
                        <select name="frv_grade" id="frv_grade">
                            <option value="5">★★★★★</option>
                            <option value="4">★★★★☆</option>
                            <option value="3">★★★☆☆</option>
                            <option value="2">★★☆☆☆</option>
                            <option value="1">★☆☆☆☆</option>
                        </select>
                        <div>
                            <textarea name="frv_content" id="frv_content" cols="30" rows="10"></textarea>
                        </div>
                        <div class="review-detail">

                            <div class="review-detail-list-area">
                                <ul class="review-detail-list">
                                <c:forEach items="${rlist}" var="rList">
                                    <li>
                                        <div class="review-d">
                                            <div class="review-d-name">
                                            <c:if test="${rList.uc_no == 1 }">
                                            <p class="name">[유저]${rList.frv_nickname}</p>
                                            </c:if>
                                            <c:if test="${rList.uc_no == 2 }">
                                            <p class="name">[농장주]${rList.frv_nickname}</p>
                                            </c:if>
                                                <span class="time">${rList.frv_date}</span>
                                            </div>
                                            <!-- 점수에 따라 별 개수 -->
                                            <c:if test="${rList.frv_grade==5}">★★★★★</c:if>
                                            <c:if test="${rList.frv_grade==4}">★★★★</c:if>
                                            <c:if test="${rList.frv_grade==3}">★★★</c:if>
                                            <c:if test="${rList.frv_grade==2}">★★</c:if>
                                            <c:if test="${rList.frv_grade==1}">★</c:if>
                                            <div class="review-d-bottom">
                                                <p class="review-d-text">${rList.frv_content}</p>
                                            </div>
                                        </div>
                                    </li>
								</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
        
    </main>
    <%@ include file="../base/footer.jsp" %>
    
</body>
</html>