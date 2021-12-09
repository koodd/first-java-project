<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>농장목록</title>
    
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function filtersrc(){
            // 지역 선택 값 가져옴
            var re = $("input[name='region']:checked").val();
            // 서비스 선택 시 우선 배열에 담음
            var serviceArr = [];
            var service;
            $("input[name='category']:checked").each(function(i){
                serviceArr.push($(this).val());
            });
            service=serviceArr.join();
            // 서비스 미 선택 시 전체 검색
            if(serviceArr[0]==null){
                if(re == null){
                    re = "";
                }
            }else{
                if(re== null){
                    re = "";
                }
            }
            $("#filter_src").submit();
        }
        // 제공 서비스 전체 클릭 시 다른 항목 체크 해제
        function resetcheck(cc){
            if(cc.target.checked){
                document.querySelectorAll(".checkServices").forEach(function(v,i){
                    v.checked = false;
                });
            }
        }
		// 초기화 버튼
        function resetRegion(){
            $("input:radio[name='region']").each(function(){
                this.checked=false;
            })
            $("input[name='category']").each(function(){
                this.checked=false;
            })
            document.querySelectorAll(".checkServices").forEach(function(v,i){
                v.checked = false;
            });

        }
    </script>
    <script type="text/javascript">
    	$(function(){
    		var comma = $(".sale-price").val();
    		$(".sale-price").val(comma.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    		
    		if(${result==1}){
    			alert("농장을 이미 등록하셨습니다!");
    		}
    	});
    </script>
</head>

<body>
<%@ include file="../base/header.jsp" %>
    <div class="con-wrap con-subpage ">
        <form action="farm_list" id="filter_src" name="filter_src">
            <div class="detail-condition" id="searchfilter">
                <nav class="detail-condition-nav">
                    <p class="tit">검색 필터</p>
                    <ul class="detail-condition-list">
                        <li class="course">
                            <p class="tit">지역별</p>
                            <div class="area">
                                <ul class="course-list" >
                                    <!-- 지역별 검색 -->
                                    <!-- 해당 지역을 누르면 value값 얻을 수 있음-->
                                    <li><label class="box-radio-input"><input type="radio" name="region" value=""><span>전체</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="서울"><span>서울</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="경기"><span>경기</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="인천"><span>인천</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="충북"><span>충북</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="충남"><span>충남</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="강원"><span>강원</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="전북"><span>전북</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="전남"><span>전남</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="경북"><span>경북</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="경남"><span>경남</span></label></li>
                                    <li><label class="box-radio-input"><input type="radio" name="region" value="제주"><span>제주</span></label></li>
                                </ul>
                            </div>
                        </li>
                        <li class="service">
                            <p class="tit">제공 서비스</p>
                            <div class="area">
                                <ul class="check-list detail-event-list close">
                                    <li>
                                        <input type="checkbox" id="searchAll" name="category" onclick="resetcheck(event)" value="">
                                        <label for="searchAll">전체</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="waterSer" name="category" class="checkServices" value="수도">
                                        <label for="waterSer">수도</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="restSer" name="category" class="checkServices" value="휴식공간">
                                        <label for="restSer">휴식공간</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="toiletSer" name="category" class="checkServices" value="화장실">
                                        <label for="toiletSer">화장실</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="sapSer" name="category" class="checkServices" value="삽">
                                        <label for="sapSer">삽</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="threeforkSer" name="category" class="checkServices" value="삼지창">
                                        <label for="threeforkSer">삼지창</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="homiSer" name="category" class="checkServices" value="호미">
                                        <label for="homiSer">호미</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="hosSer" name="category" class="checkServices" value="호스">
                                        <label for="hosSer">호스</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" id="rootSer" name="category" class="checkServices" value="거름판매">
                                        <label for="rootSer">거름판매</label>
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                    <div class="detail-condition-btn fixed">
                        <button type="button" class="reset" onclick="resetRegion()">초기화</button>
                        <button type="button" class="apply" onclick="filtersrc()">적용하기</button>
                    </div>
                    <!-- 농장 등록하기! -->
                    <c:if test="${session_ucno==2 }">
	                    <div style="margin-top: 20px; height: 500px;">
	                        <a href="./farm_regi?u_no=${session_uno }"><img src="../images/add_Farm.png" alt="내 농장 등록하기" style="height: 100%; border:2px solid black;"></a>
	                    </div>
                    </c:if>
                </nav>
            </div>
        </form>
        <!-- 본문 -->
        <section class="sub-page">

            <h2 class="sub-page-tit">
                <span class="subject">농장 목록</span>
            </h2>

            <article class="shop-area anotherlist">
                <div class="shop-title ano_list_status">
                	<form action="farm_list" name="search" method="post" id="searchForm">
                    <input type="text" placeholder="찾으시는 농장명을 입력하세요" class="farmsearch" name="searchword" id="searchword">
                    <input type="submit" class="searchBtn" value="">
                    </form>
                </div>

                <ul class="shop-list half" id="anotherlist">
                    <!--  목록 -->
                    <c:forEach items="${map.list}" var="farmDto">
                    <li>
                        <div class="shop-list-box gold">
                            <a href="./farm_view?fr_no=${farmDto.fr_no}&page=${map.pDto.page}&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}">
                                <div class="shop-top type">
                                    <div class="shop-img-list slick-initialized slick-slider">
                                        <div aria-live="polite" class="slick-list draggable">
                                            <div class="slick-track" role="listbox" style="opacity: 1; width: 2250px;">
                                                <div class="shop-img slick-slide slick-current slick-active"
                                                    data-slick-index="0" aria-hidden="false" tabindex="-1" role="option"
                                                    aria-describedby="slick-slide200"
                                                    style="width: 375px; position: relative; left: 0px; top: 0px; z-index: 999; opacity: 1;">
                                                    <div class="shop-box">
                                                        <picture>
                                                            <!-- 농장 썸네일 사진 -->
                                                            <img class=" ls-is-cached lazyloaded" alt="농장1"
                                                                src="../upload/${farmDto.fr_thumb}">
                                                        </picture>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="shop-main-area">
                                <div class="shop-main">
                                    <div class="shop-main-top">
                                        <p class="tit">
                                            <a href="./farm_view?fr_no=${farmDto.fr_no}&page=${map.pDto.page}&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}">${farmDto.fr_name}</a>
                                        </p>
                                    </div>
                                    <div class="shop-main-address">
                                        <div class="address">
                                            <span>${farmDto.fr_addr}</span>
                                        </div>
                                    </div>
                                    <div class="shop-main-bottom">
                                        <div class="price">
                                            <div class="sale ">
                                                <p class="sale-price"><fmt:formatNumber value="${farmDto.fr_price}" pattern="#,###"/>원</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </article>
        </section>
        
        <ul class="page-num">
			<a href="farm_list?page=1&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}"><li class="first"></li></a>
			
			<c:if test="${map.pDto.page>1 }">
				<a href="farm_list?page=${map.pDto.page-1}&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}"><li class="prev"></li></a>
			</c:if>
			
			<c:forEach var="nowpage" begin="${map.pDto.startpage }" end="${map.pDto.endpage }">
				<li class="num">
					<c:if test="${map.pDto.page!=nowpage}">
					<a href="farm_list?page=${nowpage}&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}"><div>${nowpage}</div></a>
					</c:if>
					
					<c:if test="${map.pDto.page==nowpage}">
					<div>${nowpage }</div>
					</c:if>
				</li>
			</c:forEach>

			<c:if test="${map.pDto.page<map.pDto.maxpage }">
				<a href="farm_list?page=${map.pDto.page+1}&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}"><li class="next"></li></a>
			</c:if>
			
			<a href="farm_list?page=${map.pDto.maxpage}&searchword=${map.pDto.searchword}&category=${map.pDto.category}&region=${map.pDto.region}"><li class="last"></li></a>
		</ul>
    </div>
	
    <%@ include file="../base/footer.jsp" %>
    
</body>
<link rel="stylesheet" href="../css/farmList.css">
</html>