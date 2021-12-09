<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="./base/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>해피홀팜</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--판매상품-->
	<link rel="stylesheet" href="../css/fonts/icomoon/style.css">	<!--판매상품-->
	<link rel="stylesheet" href="../css/style.css">
<!-- // 판매상품 -->
<!-- 인기있는농장-->
	<link rel="stylesheet" type="text/css" href="../css/main_styles.css">
<!-- // 인기있는농장-->	
	<link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
	<link href="../plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.carousel.css">
	<link rel="stylesheet" type="text/css" href="../plugins/OwlCarousel2-2.2.1/owl.theme.default.css">

	<!-- 메인페이지 지도 css -->
	<link rel="stylesheet" href="../css/map.css">
	<!-- 01 --><!-- 메인 페이지 상품 목록들 -->
	<link rel="stylesheet" href="./css/productmain.css">

	<!-- 지도 스크립트 -->
	<script type="text/javascript" src="../js/raphael_min.js"></script>
	<script type="text/javascript" src="../js/raphael_path_s.korea.js"></script>
	<script>
		var sca = '01';
	</script>

	<style>
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        #notline:hover{
        	text-decoration: none;
        }
    </style>
<script type="text/javascript">
// 날씨
$(document).ready(function(){
   
   $.ajax({
      url:"./weatherApi",
      type:"post",   
      dataType:"json",//xml 일때는 xml로 변경
      data:{
         "pageNo":1,
         //"wCodeNo":11B10101
      },
      success:function(data){      
         var arr =  data.response.body.items.item;
          var arr1 =  data.response.body.items.item.numEf;
          console.log(arr1);
          var chtml = "";
          
          for(var i in arr){
            chtml+="<tr>";
            if(arr[i].regId=='11B10101'){
               chtml+="<th>서울</th>";   
            }else if(arr[i].regId=='11B20201'){
               chtml+="<th>인천</th>";
            }else if(arr[i].regId=='11B10103'){
               chtml+="<th>경기</th>";
            }else if(arr[i].regId=='11D10302'){
               chtml+="<th>강원도</th>";
            }else if(arr[i].regId=='11C10303'){
               chtml+="<th>충북</th>";
            }else if(arr[i].regId=='11C20502'){
               chtml+="<th>충남</th>";
            }else if(arr[i].regId=='11C20401'){
               chtml+="<th>대전</th>";
            }else if(arr[i].regId=='11C20404'){
               chtml+="<th>세종</th>";
            }else if(arr[i].regId=='11F20501'){
               chtml+="<th>광주</th>";
            }else if(arr[i].regId=='11F10201'){
               chtml+="<th>전북</th>";
            }else if(arr[i].regId=='11F20404'){
               chtml+="<th>전남</th>";
            }else if(arr[i].regId=='11H10501'){
               chtml+="<th>경북</th>";
            }else if(arr[i].regId=='11H20701'){
               chtml+="<th>경남</th>";
            }else if(arr[i].regId=='11H10701'){
               chtml+="<th>대구</th>";
            }else if(arr[i].regId=='11H20201'){
               chtml+="<th>부산</th>";
            }else if(arr[i].regId=='11H20101'){
               chtml+="<th>울산</th>";
            }else if(arr[i].regId=='11G00201'){
               chtml+="<th>제주</th>";
            }
            
            chtml+="<th>"+arr[i].ta+"℃</th>";   // 예상기온
            
            if(arr[i].wf=='맑음'){
               chtml+="<th><img src='./images/sun.png'></th>";   // 하늘상태   
            }else if(arr[i].wf=='구름많음'){
               chtml+="<th><img src='./images/cloudmuch.png'></th>";
            }else if(arr[i].wf=='흐림'){
               chtml+="<th><img src='./images/cloud.png'></th>";
            }else if(arr[i].wf=='구름많고 가끔 비/눈'){
               chtml+="<th><img src='./images/sleet.png'></th>";
            }else if(arr[i].wf=='흐리고 가끔 비'){
               chtml+="<th><img src='./images/cloudrain.png'></th>";
            }else if(arr[i].wf=='구름많고 가끔 비'){
               chtml+="<th><img src='./images/cloudrain.png'></th>";
            }else if(arr[i].wf=='흐리고 한때 비/눈'){
               chtml+="<th><img src='./images/sleet.png'></th>";
            }
            chtml+="<th>"+arr[i].rnSt+"%</th>";   // 강수확률
            if(arr[i].numEf==0){
               chtml+="<th>오늘오후</th>";   // 시간               
            }else if(arr[i].numEf==1){
               chtml+="<th>내일오전</th>";
            }else if(arr[i].numEf==2){
               chtml+="<th>내일오후</th>";
            }else if(arr[i].numEf==3){
               chtml+="<th>모레오전</th>";
            }else if(arr[i].numEf==4){
               chtml+="<th>모레오후</th>";
            }
            chtml+="</tr>";
          }
          
          $("#apiList").append(chtml);
      },
      error:function(textStatus, errorThrown){
         alert("실패 : " + textStatus);
         alert(errorThrown);
      }         
   });   // ajax
});


</script>

</head>

    <script src="../js/header.js"></script>

<body>
	<div class="korea_weather">
		<h2>전국 날씨</h2>
		<table class="weather_board" width="250px">
			<colgroup>
				<col width="18%">
				<col width="19%">
				<col width="19%">
				<col width="19%">				
				<col width="25%">				
			</colgroup> 
			<tr>
				<td>지역</td>
				<td>기온</td>
				<td>날씨</td>
				<td>강수확률</td>
				<td>시간대</td>
			</tr>
			<tbody id="apiList">
			</tbody>
		</table>
	</div>
	<section style="width: 1200px; margin: 0 auto;">
		<div class="site-wrap">
			<!-- 메인 이미지 -->
			<div class="site-blocks-cover" style="background-image: url(../images/main01.jfif);" data-aos="fade">
			</div>
			
			<!-- 지도  -->
			<div class="mid_section">
				<div class="farm_list">
					<h2>[지역별 농장목록]</h2>
				</div>
				<div class="koreamap" style="width: 300px;height:400px;">
					<div id="canvas">
						<div id="south"></div>
						<div id="seoul">
							<h2><a href="../farm/farm_list?region=서울">서울특별시</a></h2>
						</div>
						<div id="gygg">
							<h2><a href="../farm/farm_list?region=경기">경기도</a></h2>
						</div>
						<div id="incheon">
							<h2><a href="../farm/farm_list?region=인천">인천광역시</a></h2>
						</div>
						<div id="gangwon">
							<h2><a href="../farm/farm_list?region=강원">강원도</a></h2>
						</div>
						<div id="chungbuk">
							<h2><a href="../farm/farm_list?region=충북">충청북도</a></h2>
						</div>
						<div id="chungnam">
							<h2><a href="../farm/farm_list?region=충남">충청남도</a></h2>
						</div>
						<div id="daejeon">
							<h2><a href="../farm/farm_list?region=대전">대전광역시</a></h2>
						</div>
						<div id="sejong">
							<h2><a href="../farm/farm_list?region=세종">세종특별자치시</a></h2>
						</div>
						<div id="gwangju">
							<h2><a href="../farm/farm_list?region=광주">광주광역시</a></h2>
						</div>
						<div id="jeonbuk">
							<h2><a href="../farm/farm_list?region=전북">전라북도</a></h2>
						</div>
						<div id="jeonnam">
							<h2><a href="../farm/farm_list?region=전남">전라남도</a></h2>
						</div>
						<div id="gyeongbuk">
							<h2><a href="../farm/farm_list?region=경북">경상북도</a></h2>
						</div>
						<div id="gyeongnam">
							<h2><a href="../farm/farm_list?region=경남">경상남도</a></h2>
						</div>
						<div id="daegu">
							<h2><a href="../farm/farm_list?region=대구">대구광역시</a></h2>
						</div>
						<div id="busan">
							<h2><a href="../farm/farm_list?region=부산">부산광역시</a></h2>
						</div>
						<div id="ulsan">
							<h2><a href="../farm/farm_list?region=울산">울산광역시</a></h2>
						</div>
						<div id="jeju">
							<h2><a href="../farm/farm_list?region=제주">제주특별자치도</a></h2>
						</div>
					</div>
				</div>
				<!-- 네비게이션 탭 -->
				<div class="mini_board">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#home">공지사항</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#menu1">정보게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#menu2">거래게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#menu3">자유게시판</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" data-toggle="tab" href="#menu4">유저게시판</a>
						</li>
					</ul>
					<!-- 탭 목록 -->
					<div class="tab-content">
						<!-- 공지사항 -->
						<div id="home" class="container tab-pane active"><br>
							<table style="width: 800px;">
								<colgroup>
									<col width="10%">
									<col width="55%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<tr class="trth">
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
								<tr class="trtd">
									<td>1</td>
									<td>제목들어갑니다</td>
									<td>글쓴이들어갑니다</td>
									<td>등록일들어갑니다</td>
									<td>조회수들어갑니다.</td>
								</tr>
							</table>
						</div>
						<!-- 정보게시판 -->
						<div id="menu1" class="container tab-pane fade"><br>
							<table style="width: 800px;">
								<colgroup>
									<col width="10%">
									<col width="55%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<tr class="trth">
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
								<tr class="trtd">
									<td>1</td>
									<td>제목들어갑니다</td>
									<td>글쓴이들어갑니다</td>
									<td>등록일들어갑니다</td>
									<td>조회수들어갑니다.</td>
								</tr>
							</table>
						</div>
						<!-- 거래게시판 -->
						<div id="menu2" class="container tab-pane fade"><br>
							<table style="width: 800px;">
								<colgroup>
									<col width="10%">
									<col width="55%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<tr class="trth">
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
								<tr class="trtd">
									<td>1</td>
									<td>제목들어갑니다</td>
									<td>글쓴이들어갑니다</td>
									<td>등록일들어갑니다</td>
									<td>조회수들어갑니다.</td>
								</tr>
							</table>
						</div>
						<!-- 자유게시판 -->
						<div id="menu3" class="container tab-pane fade"><br>
							<table style="width: 800px;">
								<colgroup>
									<col width="10%">
									<col width="55%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<tr class="trth">
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
								<tr class="trtd">
									<td>1</td>
									<td>제목들어갑니다</td>
									<td>글쓴이들어갑니다</td>
									<td>등록일들어갑니다</td>
									<td>조회수들어갑니다.</td>
								</tr>
							</table>
						</div>
						<!-- 유저게시판 -->
						<div id="menu4" class="container tab-pane fade"><br>
							<table style="width: 800px;">
								<colgroup>
									<col width="10%">
									<col width="55%">
									<col width="10%">
									<col width="15%">
									<col width="10%">
								</colgroup>
								<tr class="trth">
									<th>번호</th>
									<th>제목</th>
									<th>글쓴이</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
								<tr class="trtd">
									<td>1</td>
									<td>제목들어갑니다</td>
									<td>글쓴이들어갑니다</td>
									<td>등록일들어갑니다</td>
									<td>조회수들어갑니다.</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>		

		<!-- 판매 하는 상품 VIEW -->
		<div class="site-section block-3 site-blocks-2 bg-light">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-7 site-section-heading text-center pt-4">
						<h2>판매하는 상품</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="nonloop-block-3 owl-carousel">
							<c:forEach items="${plist}" var="pDto"><!-- 01 --><!-- 반복 시작 -->
								<!-- 첫번째 상품 사이즈 세로,가로 350px 이상으로 구하기-->
								<div class="item" id="">
									<div class="block-4 text-center" id="inneritem">
										<figure class="block-4-image">
											<img src="./upload/${pDto.p_pic}" alt="${pDto.p_pic}" class="img-fluid" id="img1">
										</figure>
										<div class="block-4-text p-4">
											<h3><a href="#">${pDto.p_name}</a></h3>
											<p class="mb-0">${pDto.p_info}</p>
											<p class="text-primary font-weight-bold"><fmt:formatNumber value="${pDto.p_price}" pattern="#,###"/> 원</p>
										</div>
									</div>
								</div>
							</c:forEach><!-- 반복 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 인기있는 농장 TOP 7 -->
		<div class="services">
			<div class="container">
				<div class="row">
					<div class="col text-center">
						<div class="section_title">
							<h1>인기있는 농장 TOP 7</h1>
							<!-- <span>Explore our services</span> -->
						</div>
					</div>
				</div>
			</div>

			<div class="h_slider_container services_slider_container">
				<div class="service_slider_outer">
					<!-- Services Slider -->
					<div class="owl-carousel owl-theme services_slider">

						<!-- 첫번째-->
						<c:forEach items="${map.fList}" var="fDto">
						<div class="owl-item services_item">
							<a href="farm/farm_view?fr_no=${fDto.fr_no}" id="notline">
								<div class="services_item_inner">
									<div class="service_item_content">
										<div class="service_item_title">
											<img src="../upload/${fDto.fr_thumb }">
										</div>
										<h2>${fDto.fr_name }</h2>
										<p>${fDto.fr_addr }</p>
									</div>
								</div>
							</a>
						</div>
						</c:forEach>
					</div>
					<div class="services_slider_nav services_slider_nav_left"><i
							class="fas fa-chevron-left trans_200"></i></div>
					<div class="services_slider_nav services_slider_nav_right"><i
							class="fas fa-chevron-right trans_200"></i></div>

				</div>
			</div>
		</div>

		</div>

		<script src="js/bootstrap.min.js"></script>
		<script src="js/owl.carousel.min.js"></script>
		<script src="js/aos.js"></script>
		<script src="js/main.js"></script>
		<script src="js/custom.js"></script>
		<script src="plugins/scrollmagic/ScrollMagic.min.js"></script>

	</section>

      <%@ include file="./base/footer.jsp" %> 
</body>

</html>