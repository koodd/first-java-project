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
    <title>체험 프로그램 상세보기</title>

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/exp_reg.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="../css/datepicker.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <script src="../js/datepicker.js"></script>
    <script src="../js/datepicker.ko.js"></script>
    
    <script type="text/javascript">
    	function expRegiDeleteBtn(e_no){
    		if(confirm("해당 체험 프로그램을 반려 하시겠습니까?")){
    			location.href="./expRegiDelete?e_no="+e_no;
    			alert("반려 되었습니다.");
    		}else{
    			return false;
    			alert("반려에 실패하셨습니다.");
    		}
    	}
    	function expRegiApprBtn(e_no){
    		if(confirm("해당 체험 프로그램을 승인 하시겠습니까?")){
    			location.href="./expRegiApprUpdate?e_no="+e_no;
    			alert("승인 되었습니다.");
    		}else{
    			return false;
    			alert("승인에 실패하셨습니다.");
    		}   		
    	}
    </script>
</head>
<body style="margin: 0 auto; width: 1200px;">
    <script src="../js/header.js"></script>
    <h2>체험프로그램 상세보기</h2>
    <hr>
     <form action="./man_exp_modify" name="man_exp_modify" id="man_exp_modify" method="post" enctype="multipart/form-data">
        <input type="hidden" name="e_no" value="${map.eDto.e_no}">
        <input type="hidden" name="e_thumb" value="${map.eDto.e_thumb}">
        <table class="expreg_table">
            <colgroup>
                <col width="30%">
                <col width="70%">
            </colgroup>
            <tr>
                <th class="expreg_th">체험명</th>
                <td>
                    <input type="text" name="e_name" id="e_name" placeholder="흥미를 이끌만 한 체험명을 입력해주세요!" readonly="readonly" value="${map.eDto.e_name}">
                </td>
            </tr>
            
            <tr>
                <th class="expreg_th">세부사항</th>
                <td>
                    <textarea name="e_details" id="e_details" cols="50" rows="10" placeholder="체험에 대해 상세하게 설명해주세요!" readonly="readonly">${map.eDto.e_details}</textarea>
                </td>
            </tr>
            <tr>
                <th class="expreg_th">체험 시작일 - 체험 종료일</th>
                <td>
                    <input type="text" name="e_startdate" id="e_startdate" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly="readonly" value="${map.eDto.e_startdate}"> - <input type="text" name="e_enddate" id="e_enddate" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly="readonly" value="${map.eDto.e_enddate}">
                </td>
            </tr>
 
            <tr>
                <th class="expreg_th">체험 제공 시간</th>
                <td>
                    <input type="text" name="e_term" id="e_term" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly="readonly" value="${map.eDto.e_term}">
                    <select name="term" id="term" disabled="disabled">
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
                    <input type="text" name="e_price" id="e_price" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" readonly="readonly" value="${map.eDto.e_price}">원
                </td>
            </tr>
            <tr>
                <th class="expreg_th">체험관련키워드</th>
                <td>
                    <input type="text" name="e_keyword" id="e_keyword" placeholder="*어린이,고구마,농기구 와 같은 형태로 최대 5개까지 입력해주세요!" readonly="readonly" value="${map.eDto.e_keyword}">
                </td>
            </tr>
            <tr>
                <th class="expreg_th">체험 메인 사진 명</th>
                <td>${map.eDto.e_thumb}</td>
            </tr>
        </table>
        <br>
        <div class="btn_wrapper">
            <button type="button" onclick="expRegiDeleteBtn(${map.eDto.e_no})">반려</button>
            <button type="button" onclick="expRegiApprBtn(${map.eDto.e_no})" class="exp_RegWrite">승인</button>
        </div>
    </form>


</body>
</html>