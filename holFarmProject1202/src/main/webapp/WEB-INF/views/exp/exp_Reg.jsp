<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/header.jsp" %>
<!DOCTYPE html>

<head>  
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>체험 프로그램 등록</title>
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/header.css">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
        <link rel="stylesheet" href="../css/exp_reg.css">
        <link rel="stylesheet" href="../css/footer.css">
        <link rel="stylesheet" href="../css/datepicker.min.css">
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <!-- 달력 불러오는 js파일 -->
        <script src="../js/datepicker.js"></script>
        <script src="../js/datepicker.ko.js"></script>
<script>
    function expRegBtn(){
        alert(
            "체험명 : "+$("#e_name").val()+"\n"+
            "세부사항 : "+$("#e_details").val()+"\n"+
            "체험 시작일 ~ 체험 종료일 : "+$("#e_startdate").val()+"~"+$("#e_enddate").val()+"\n"+
            "체험 이용 시간 : "+$("#e_term").val()+$("#term").val()+"\n"+
            "체험 이용 요금 : "+$("#e_price").val()+"\n"+
            "체험 관련 키워드 : "+$("#e_keyword").val()+"\n"+
            "체험 메인 사진 : "+$("#file").val()
            );
        if(confirm("체험 프로그램을 신청하시겠습니까?")){
        	$("#exp_RegWrite").submit();
        }else{
        	return false;
        }
    }
</script>

</head>

<body style="margin:0 auto; width: 1200px;">

    <script src="../js/header.js"></script>
    <h2>체험 프로그램 등록</h2><hr>

    <form action="./exp_RegWrite" name="exp_RegWrite" id="exp_RegWrite" method="post" enctype="multipart/form-data">
<%--     	<input type="hidden" id="u_no" name="u_no" value="${session_uno}">
    	<input type="hidden" id="f_no" name="f_no" value="${session_fno}"> --%>
    	<%-- <input type="hidden" id="e_no" name="e_no" value="${session_eno}"> 이거 들어가면 체험 등록이 안됨--%>
        <table class="expreg_table">
            <colgroup>
                <col width="30%">
                <col width="70%">
            </colgroup>
            <tr>
                <th class="expreg_th">체험명</th>
                <td>
                    <input type="text" name="e_name" id="e_name" placeholder="흥미를 이끌만 한 체험명을 입력해주세요! ">
                </td>
            </tr>
            
            <tr>
                <th class="expreg_th">세부사항</th>
                <td>
                    <textarea name="e_details" id="e_details" cols="50" rows="10" placeholder="체험에 대해 상세하게 설명해주세요!"></textarea>
                </td>
            </tr>
            <tr>
                <th class="expreg_th">체험 시작일 - 체험 종료일</th>
                <td>
                    <input type="text" name="e_startdate" id="e_startdate" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> - <input type="text" name="e_enddate" id="e_enddate" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                </td>
            </tr>
            <script>
               datePickerSet($("#e_startdate"), $("#e_enddate"), true); //다중은 시작하는 달력 먼저, 끝달력 2번째

/*
    * 달력 생성기
    * @param sDate 파라미터만 넣으면 1개짜리 달력 생성
    * @example   datePickerSet($("#datepicker"));
    * 
    * 
    * @param sDate, 
    * @param eDate 2개 넣으면 연결달력 생성되어 서로의 날짜를 넘어가지 않음
    * @example   datePickerSet($("#datepicker1"), $("#datepicker2"));
    */
function datePickerSet(sDate, eDate, flag) {

    //시작 ~ 종료 2개 짜리 달력 datepicker	
    if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
        var sDay = sDate.val();
        var eDay = eDate.val();

        if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
            var sdp = sDate.datepicker().data("datepicker");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요

            var edp = eDate.datepicker().data("datepicker");
            edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
        }

        //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(eDay)) {
            sDate.datepicker({
                maxDate: new Date(eDay.replace(/-/g, "/"))
            });
        }
        sDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
            }
        });

        //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
        if (!isValidStr(sDay)) {
            eDate.datepicker({
                minDate: new Date(sDay.replace(/-/g, "/"))
            });
        }
        eDate.datepicker({
            language: 'ko',
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
            }
        });

        //한개짜리 달력 datepicker
    } else if (!isValidStr(sDate)) {
        var sDay = sDate.val();
        if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
            var sdp = sDate.datepicker().data("datepicker");
            sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
        }

        sDate.datepicker({
            language: 'ko',
            autoClose: true
        });
    }


    function isValidStr(str) {
        if (str == null || str == undefined || str == "")
            return true;
        else
            return false;
    }
}
            </script>
            <tr>
                <th class="expreg_th">체험 제공 시간</th>
                <td>
                    <input type="text" name="e_term" id="e_term" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <select name="term" id="term">
                        <option value="hour">시간</option>
                        <option value="day">일</option>
                        <option value="week">주</option>
                        <option value="month">월</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="expreg_th txt">체험 이용 요금</th>
                <td>
                    <input type="text" name="e_price" id="e_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">원
                </td>
            </tr>
            <tr>
                <th class="expreg_th">체험관련키워드</th>
                <td>
                    <input type="text" name="e_keyword" id="e_keyword" placeholder="*어린이,고구마,농기구 와 같은 형태로 최대 5개까지 입력해주세요!">
                </td>
            </tr>
            <tr>
                <th class="expreg_th">체험 메인 사진</th>
                <td>
                    <input type="file" name="file" id="file">
                </td>
            </tr>
        </table>
        <br>
        <div class="btn_wrapper">
            <button type="button" onclick="location.href='./exp_List'">취소</button>
            <button type="button" onclick="expRegBtn()" class="exp_RegWrite">체험 프로그램 신청</button>
        </div>
    </form>


<%@ include file="../base/footer.jsp" %> 
</body>
</html>