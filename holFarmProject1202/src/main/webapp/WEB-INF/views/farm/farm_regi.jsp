<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <script>
        // 주소api
        function findAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                var addr = '';

                if(data.userSelectedType === 'R'){
                    addr = data.roadAddress;
                }else{
                    addr = data.jibunAddress;
                }

                document.getElementById('farmJibun').value = data.zonecode;
                document.getElementById('farmAddr').value = addr;

                document.getElementById("farmdetailAddr").focus();
                }
            }).open();
        }

    </script>
</head>

<body>
<%@ include file="../base/header.jsp" %>
    <section class="f_regi">
        <h2>농장 등록</h2>
        <div class="wrapF_regi">
            <form action="farm_do_regi" method="post" enctype="multipart/form-data">
                <table class="regiTable">
                    <tr>
                        <td>농장명</td>
                        <td><input type="text" name="fr_name" placeholder="기억에 남을 농장명을 지어주세요"></td>
                    </tr>
                    <tr>
                        <td>농장 주소</td>
                        <td><input type="text" name="farmJibun" id="farmJibun" placeholder="우편번호" readonly><button type="button" onclick="findAddr()">주소찾기</button></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="fr_addr" id="farmAddr" placeholder="주소" readonly></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" name="fr_addr" id="farmdetailAddr" placeholder="상세주소"></td>
                    </tr>
                    <tr>
                        <td>면적</td>
                        <td><input type="text" name="fr_area" placeholder="면적을 숫자로만 입력해주세요"> ㎡</td>
                    </tr>
                    <tr>
                        <td>구획수</td>
                        <td><input type="text" name="fr_block" placeholder="구획수를 숫자로만 입력해주세요"> 개</td>
                    </tr>
                    <tr>
                        <td>구획당 면적</td>
                        <td><input type="text" name="fr_land" placeholder="숫자로만 입력해주세요"> ㎡</td>
                    </tr>
                    <tr>
                        <td>운영시작일</td>
                        <td><input type="date" name="fr_startdate" id="f_start"></td>
                    </tr>
                    <tr>
                        <td>밭갈이 예정일</td>
                        <td><input type="date" name="fr_enddate"></td>
                    </tr>
                    <tr>
                        <td>희망 분양가</td>
                        <td><input type="text" name="fr_price" placeholder="숫자로만 입력해주세요"> 원</td>
                    </tr>
                    <tr>
                        <td colspan="2"><small style="font-size: 14px; color: tomato;">현재 등록된 농장의 평균 희망가는 1평당 <00000>원 입니다.</small></td>
                    </tr>
                </table>
                
                <p>재배 불가능 식물</p>
                <div class="farmdont">
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="옥수수" id="r_corn"><label for="r_corn">옥수수</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="들깨(깻잎)" id="r_kkae"><label for="r_kkae">들깨(깻잎)</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="콩류" id="r_bean"><label for="r_bean">콩류</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="배추" id="r_baechu"><label for="r_baechu">배추</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="땅콩" id="r_grant"><label for="r_grant">땅콩</label><br />
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="오이" id="r_cucum"><label for="r_cucum">오이</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="가지" id="r_gaji"><label for="r_gaji">가지</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="여주" id="r_yeoju"><label for="r_yeoju">여주</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="돼지감자" id="r_pigpota"><label for="r_pigpota">돼지감자</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="보리" id="r_bori"><label for="r_bori">보리</label><br />
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="밀" id="r_mil"><label for="r_mil">밀</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="무" id="r_mu"><label for="r_mu">무</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="토란" id="r_toran"><label for="r_toran">토란</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="생강" id="r_river"><label for="r_river">생강</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="대파" id="r_bigpa"><label for="r_bigpa">대파</label>
                    <input type="checkbox" class="dontlist" name="fr_noplant" value="호박" id="r_halow"><label for="r_halow">호박</label>
                </div>
                
                <p>제공 가능한 서비스</p>
                <div class="farmdont">
                    <input type="checkbox" class="canService" name="fr_service" value="수도" id="rs_water"><label for="rs_water">수도</label>
                    <input type="checkbox" class="canService" name="fr_service" value="휴식공간" id="rs_rest"><label for="rs_rest">휴식공간</label>
                    <input type="checkbox" class="canService" name="fr_service" value="화장실" id="rs_toilet"><label for="rs_toilet">화장실</label>
                    <input type="checkbox" class="canService" name="fr_service" value="삽" id="rs_sap"><label for="rs_sap">삽</label>
                    <input type="checkbox" class="canService" name="fr_service" value="삼지창" id="rs_threefork"><label for="rs_threefork">삼지창</label><br />
                    <input type="checkbox" class="canService" name="fr_service" value="호미" id="rs_homi"><label for="rs_homi">호미</label>
                    <input type="checkbox" class="canService" name="fr_service" value="호스" id="rs_hos"><label for="rs_hos">호스</label>
                    <input type="checkbox" class="canService" name="fr_service" value="거름판매" id="rs_root"><label for="rs_root">거름판매</label>
                </div>
                
                <p>특이사항</p>
                <textarea id="farmSpe" cols="30" rows="10" name="fr_unique" placeholder="농장의 특이사항 및 주의할 점을 적어주세요"></textarea><br />
                
                <p>농장 증서 이미지</p>
                <input type="file" class="f_regi_file_certi"  name="certi_file" id="certi_file">
                
                <p>농장 메인 이미지</p>
                <input type="file" class="f_regi_file_main" name="thumb_file" id="thumb_file">
                
                <p>농장 추가 이미지</p>
                <div class="addImgWrap">
	                <input type="file" id="subfile" name="subfile">
	                <input type="file" id="subfile2" name="subfile2">
	                <input type="file" id="subfile3" name="subfile3">
	                <input type="file" id="subfile4" name="subfile4">
	                <input type="hidden" name="u_no" value="${session_uno}">
                </div>
                <div class="regibtn">
                    <input type="submit" value="농장 등록" id="farmRegiBtn">
                </div>
                
            </form>
        </div>
    </section>
   <%@ include file="../base/footer.jsp" %>
</body>

</html>