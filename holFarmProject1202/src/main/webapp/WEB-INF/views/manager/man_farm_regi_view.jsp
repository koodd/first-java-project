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
    <link rel="stylesheet" href="../css/farmregi.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        $(function(){
        	var noplant = $("#noplant").val();
        	var noplantArr = noplant.split(",");
            for(var i=0; i<noplantArr.length; i++){
            	$("#"+noplantArr[i]+"").prop('checked',true);
            }
        });
        </script>
    <script type="text/javascript">
        $(function(){
            var service = $("#service").val();
            var serArr = service.split(",");
            for(var i=0; i<serArr.length; i++){
            	$("#"+serArr[i]+"").prop('checked',true);
            }
        });
    </script>
    <script type="text/javascript">
        function deleteFegi(frno){
        	if(confirm("해당 농장 등록(수정) 신청을 반려하시겠습니까?")){
        		alert("반려되었습니다.");
        		location.href="./regi_delete?fr_no="+frno;
        	}else{
        		return false;
        	}
        }
    </script>
</head>

<body>
    <section class="f_regi" style="margin-top:30px">
        <h2>농장 등록&수정 신청서</h2>
        <div class="wrapF_regi">
            <form action="./success_farm_regi">
            <input type="hidden" value="${fDto.fr_no}" name="fr_no">
            <input type="hidden" value="${fDto.fr_noplant }" id="noplant">
            <input type="hidden" value="${fDto.fr_service }" id="service">
                <table class="regiTable">
                    <tr>
                        <td>농장명</td>
                        <td><input type="text" placeholder="기억에 남을 농장명을 지어주세요" readonly value="${fDto.fr_name }"></td>
                    </tr>
                    <tr>
                        <td>농장 주소</td>
                        <td><input type="text" id="farmJibun" placeholder="우편번호" readonly value="${fDto.fr_addr }"></td>
                    </tr>
                    <tr>
                        <td>면적</td>
                        <td><input type="text" placeholder="면적을 숫자로만 입력해주세요" readonly value="${fDto.fr_area }"> ㎡</td>
                    </tr>
                    <tr>
                        <td>구획수</td>
                        <td><input type="text" placeholder="구획수를 숫자로만 입력해주세요" readonly value="${fDto.fr_block }"> 개</td>
                    </tr>
                    <tr>
                        <td>구획당 면적</td>
                        <td><input type="text" placeholder="숫자로만 입력해주세요" readonly value="${fDto.fr_land }"> ㎡</td>
                    </tr>
                    <tr>
                        <td>운영시작일</td>
                        <td><input type="text" id="f_start" readonly value="${fDto.fr_startdate }"></td>
                    </tr>
                    <tr>
                        <td>밭갈이 예정일</td>
                        <td><input type="text" readonly value="${fDto.fr_enddate }"></td>
                    </tr>
                    <tr>
                        <td>희망 분양가</td>
                        <td><input type="text" placeholder="숫자로만 입력해주세요" readonly value="${fDto.fr_price }"> 원</td>
                    </tr>
                </table>
                
                <p>재배 불가능 식물</p>
                <div class="farmdont">
                    <input type="checkbox" class="dontlist" value="옥수수" id="옥수수" disabled><label for="r_corn">옥수수</label>
                    <input type="checkbox" class="dontlist" value="들깨(깻잎)" id="들깨(깻잎)" disabled><label for="r_kkae">들깨(깻잎)</label>
                    <input type="checkbox" class="dontlist" value="콩류" id="콩류" disabled><label for="r_bean">콩류</label>
                    <input type="checkbox" class="dontlist" value="배추" id="배추" disabled><label for="r_baechu">배추</label>
                    <input type="checkbox" class="dontlist" value="땅콩" id="땅콩" disabled><label for="r_grant">땅콩</label><br />
                    <input type="checkbox" class="dontlist" value="오이" id="오이" disabled><label for="r_cucum">오이</label>
                    <input type="checkbox" class="dontlist" value="가지" id="가지" disabled><label for="r_gaji">가지</label>
                    <input type="checkbox" class="dontlist" value="여주" id="여주" disabled><label for="r_yeoju">여주</label>
                    <input type="checkbox" class="dontlist" value="돼지감자" id="돼지감자" disabled><label for="r_pigpota">돼지감자</label>
                    <input type="checkbox" class="dontlist" value="보리" id="보리" disabled><label for="r_bori">보리</label><br />
                    <input type="checkbox" class="dontlist" value="밀" id="밀" disabled><label for="r_mil">밀</label>
                    <input type="checkbox" class="dontlist" value="무" id="무" disabled><label for="r_mu">무</label>
                    <input type="checkbox" class="dontlist" value="토란" id="토란" disabled><label for="r_toran">토란</label>
                    <input type="checkbox" class="dontlist" value="생강" id="생강" disabled><label for="r_river">생강</label>
                    <input type="checkbox" class="dontlist" value="대파" id="대파" disabled><label for="r_bigpa">대파</label>
                    <input type="checkbox" class="dontlist" value="호박" id="호박" disabled><label for="r_halow">호박</label>
                </div>
                
                <p>제공 가능한 서비스</p>
                <div class="farmdont">
                    <input type="checkbox" class="canService" vaule="수도" id="수도" disabled><label for="rs_water">수도</label>
                    <input type="checkbox" class="canService" vaule="휴식공간" id="휴식공간" disabled><label for="rs_rest">휴식공간</label>
                    <input type="checkbox" class="canService" vaule="화장실" id="화장실" disabled><label for="rs_toilet">화장실</label>
                    <input type="checkbox" class="canService" vaule="삽" id="삽" disabled><label for="rs_sap">삽</label>
                    <input type="checkbox" class="canService" vaule="삼지창" id="삼지창" disabled><label for="rs_threefork">삼지창</label><br />
                    <input type="checkbox" class="canService" vaule="호미" id="호미" disabled><label for="rs_homi">호미</label>
                    <input type="checkbox" class="canService" vaule="호스" id="호스" disabled><label for="rs_hos">호스</label>
                    <input type="checkbox" class="canService" vaule="거름판매" id="거름판매" disabled><label for="rs_root">거름판매</label>
                </div>
                
                <p>특이사항</p>
                <textarea id="farmSpe" cols="30" rows="10" readonly>${fDto.fr_unique }</textarea><br/>
                
                <p>농장 증서 이미지</p>
                <!-- 농장 증서 이미지 파일명 value -->
                <a href="#" download><img src="../upload/${fDto.fr_certi }" alt="농장 증서사진"></a>
                <p>농장 메인 이미지</p>
                <!-- 농장 메인 이미지 파일명 value -->
                <a href="#" download><img src="../upload/${fDto.fr_thumb }" alt="농장 메인사진"></a>
                
                <p>농장 추가 이미지</p>
                <div class="addImgWrap">
                    <ul>
                        <li class="addImg">
                            <div class="addImgsub1">
                                <img src="../upload/${fDto.fr_view }" alt="농장 추가사진 1">
                            </div>
                        </li>
                        <li class="addImg">
                            <div class="addImgsub2">
                                <img src="../upload/${fDto.fr_view2 }" alt="농장 추가사진 2">
                            </div>
                        </li>
                        <li class="addImg">
                            <div class="addImgsub3">
                                <img src="../upload/${fDto.fr_view3 }" alt="농장 추가사진 3">
                            </div>
                        </li>
                        <li class="addImg">
                            <div class="addImgsub4">
                                <img src="../upload/${fDto.fr_view4 }" alt="농장 추가사진 4">
                            </div>
                        </li class="addImg">
                    </ul>
                </div>
                <div class="regibtn">
                	<button type="button" id="farmCancBtn" onclick="deleteFegi(${fDto.fr_no})">반려</button>
                    <input type="submit" value="승인" id="farmRegiBtn">
                </div>
                
            </form>
        </div>
    </section>
    <script>
        $('#subImg2').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                 window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#subImg2').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('.addImgsub2 img').attr('src', blobURL);
                $('.addImgsub2').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
            }
        });

        $('#subImg3').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                 window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#subImg3').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('.addImgsub3 img').attr('src', blobURL);
                $('.addImgsub3').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
            }
        });

        $('#subImg4').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                 window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#subImg4').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('.addImgsub4 img').attr('src', blobURL);
                $('.addImgsub4').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
            }
        });

        $('#subImg1').on('change', function() {
            ext = $(this).val().split('.').pop().toLowerCase(); //확장자
            //배열에 추출한 확장자가 존재하는지 체크
            if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
                resetFormElement($(this)); //폼 초기화
                 window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
            } else {
                file = $('#subImg1').prop("files")[0];
                blobURL = window.URL.createObjectURL(file);
                $('.addImgsub1 img').attr('src', blobURL);
                $('.addImgsub1').slideDown(); //업로드한 이미지 미리보기 
                $(this).slideUp(); //파일 양식 감춤
            }
        });
    </script>
</body>

</html>