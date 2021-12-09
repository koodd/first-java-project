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
	    $(function(){
		    var addr=$("#addr").val();
		    var addrArr = addr.split(",");
		    $("#farmAddr").val(addrArr[0]);
		    $("#farmdetailAddr").val(addrArr[1]);
	    });
    </script>
</head>

<body>
    <section class="f_regi">
        <h2>농장 수정</h2>
        <div class="wrapF_regi">
            <form action="farm_do_updet" method="post" enctype="multipart/form-data">
            <input type="hidden" value="${fDto.fr_no}" name="fr_no">
            <input type="hidden" value="${fDto.fr_noplant }" id="noplant">
            <input type="hidden" value="${fDto.fr_service }" id="service">
            <input type="hidden" value="${fDto.fr_addr }" id="addr">
                <table class="regiTable">
                    <tr>
                        <td>농장명</td>
                        <td><input type="text" class="regitextbox" value="${fDto.fr_name}" name="fr_name"></td>
                    </tr>
                    <tr>
                        <td>농장 주소</td>
                        <td><input type="text" id="farmJibun" placeholder="우편번호" readonly><button type="button" onclick="findAddr()">주소찾기</button></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" id="farmAddr" placeholder="주소" readonly name="fr_addr"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="text" id="farmdetailAddr" placeholder="상세주소" name="fr_addr"></td>
                    </tr>
                    <tr>
                        <td>면적</td>
                        <td><input type="text" name="fr_area" placeholder="면적을 숫자로만 입력해주세요" value="${fDto.fr_area}"> ㎡</td>
                    </tr>
                    <tr>
                        <td>구획수</td>
                        <td><input type="text" name="fr_block" placeholder="구획수를 숫자로만 입력해주세요" value="${fDto.fr_block }"> 개</td>
                    </tr>
                    <tr>
                        <td>구획당 면적</td>
                        <td><input type="text" name="fr_land" placeholder="숫자로만 입력해주세요" value="${fDto.fr_land }"> ㎡</td>
                    </tr>
                    <tr>
                        <td>운영시작일</td>
                        <td><input type="date" name="fr_startdate" id="f_start" value="${fDto.fr_startdate }"></td>
                    </tr>
                    <tr>
                        <td>밭갈이 예정일</td>
                        <td><input type="date" name="fr_enddate" value="${fDto.fr_enddate }"></td>
                    </tr>
                    <tr>
                        <td>희망 분양가</td>
                        <td><input type="text" name="fr_price" placeholder="숫자로만 입력해주세요" value="${fDto.fr_price }"> 원</td>
                    </tr>
                </table>
                
                <p>재배 불가능 식물</p>
                <div class="farmdont">
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="옥수수" id="옥수수"><label for="옥수수">옥수수</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="들깨(깻잎)" id="들깨(깻잎)"><label for="들깨(깻잎)">들깨(깻잎)</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="콩류" id="콩류"><label for="콩류">콩류</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="배추" id="배추"><label for="배추">배추</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="땅콩" id="땅콩"><label for="땅콩">땅콩</label><br />
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="오이" id="오이"><label for="오이">오이</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="가지" id="가지"><label for="가지">가지</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="여주" id="여주"><label for="여주">여주</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="돼지감자" id="돼지감자"><label for="돼지감자">돼지감자</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="보리" id="보리"><label for="보리">보리</label><br />
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="밀" id="밀"><label for="밀">밀</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="무" id="무"><label for="무">무</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="토란" id="토란"><label for="토란">토란</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="생강" id="생강"><label for="생강">생강</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="대파" id="대파"><label for="대파">대파</label>
                    <input type="checkbox" name="fr_noplant" class="dontlist" value="호박" id="호박"><label for="호박">호박</label>
                </div>
                
                <p>제공 가능한 서비스</p>
                <div class="farmdont">
                    <input type="checkbox" name="fr_service" class="canService" value="수도" id="수도"><label for="수도">수도</label>
                    <input type="checkbox" name="fr_service" class="canService" value="휴식공간" id="휴식공간"><label for="휴식공간">휴식공간</label>
                    <input type="checkbox" name="fr_service" class="canService" value="화장실" id="화장실"><label for="화장실">화장실</label>
                    <input type="checkbox" name="fr_service" class="canService" value="삽" id="삽"><label for="삽">삽</label>
                    <input type="checkbox" name="fr_service" class="canService" value="삼지창" id="삼지창"><label for="삼지창">삼지창</label><br />
                    <input type="checkbox" name="fr_service" class="canService" value="호미" id="호미"><label for="호미">호미</label>
                    <input type="checkbox" name="fr_service" class="canService" value="호스" id="호스"><label for="호스">호스</label>
                    <input type="checkbox" name="fr_service" class="canService" value="거름판매" id="거름판매"><label for="거름판매">거름판매</label>
                </div>
                
                <p>특이사항</p>
                <textarea name="fr_unique" id="farmSpe" cols="30" rows="10" placeholder="농장의 특이사항 및 주의할 점을 적어주세요">${fDto.fr_unique }</textarea><br />
                
                <span style="color:red;">*농장 정보 수정시 아래 이미지 업로드는 재업로드 해야 합니다.</span>
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
                </div>
                <div class="regibtn">
                	<input type="button" value="취소" id="farmRegiBtn" onclick="javascript:history.back();">
                    <input type="submit" value="수정" id="farmRegiBtn">
                </div>
                
            </form>
        </div>
    </section>
    <%@ include file="../base/footer.jsp" %>
<style>
	.regiTable input[type=text], .regiTable input[type=date]{
	height :40px;
	margin-left : 0;
	border:1px solid black;
	}
	#farmSpe{
	border: 1px solid black;}
</style>
</body>

</html>