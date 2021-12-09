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
    <link rel="stylesheet" href="../css/inquiry.css">
</head>

<body>
    <!-- contents -->
        <div id="customer">
        	<form action="./replyInquiry">
	            <div class="checkMt">
	                <table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1"
	                    cellspacing="0">
	                    <colgroup>
	                        <col width="19%" class="tw30" />
	                        <col width="*" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row"><span>분류</span></th>
	                            <td>
	                                <select>
	                                    <option value="">선택해주세요.</option>
	                                    <option value="">상품관련 문의</option>
	                                    <option value="">농장관련 문의</option>
	                                    <option value="">체험관련 문의</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><span>제목</span></th>
	                            <td>
	                                <input type="text" class="wlong" readonly value="${mDto.ci_title }" name="ci_title"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><span>상세 내용</span></th>
	                            <td>
	                                <textarea class="tta" readonly name="ci_content">${mDto.ci_content }</textarea>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>

	            <div class="checkMt">
		            <input type="hidden" value="${mDto.u_email }" name="u_email">
		            <input type="hidden" value="${mDto.u_name }" name="u_name">
		            <input type="hidden" value="${mDto.ci_no }" name="ci_no">
	                <table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1"
	                    cellspacing="0">
	                    <colgroup>
	                        <col width="19%" class="tw30" />
	                        <col width="*" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row"><span>답변 내용</span></th>
	                            <td>
	                                <textarea class="tta" name="ir_content">안녕하세요 ${mDto.u_name }님, 문의 주셔서 감사합니다.</textarea>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	            <!-- Btn Area -->
	            <div class="btnArea">
	                <div class="bCenter">
	                    <ul>
	                        <li><input type="submit" class="sbtnMini" value="답장하기" style="cursor: pointer; border:none;"></li>
	                    </ul>
	                </div>
	            </div>
	            <!-- //Btn Area -->
			</form>
        </div>
</body>

</html>