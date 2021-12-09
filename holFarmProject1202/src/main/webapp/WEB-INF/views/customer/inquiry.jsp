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
    <link rel="stylesheet" href="../css/inquiry.css">
</head>

<body>
<%@ include file="../base/header.jsp" %>
    <!-- contents -->
        <div id="customer">
            <h2><strong id="inquriyTitle">1:1문의</strong><span id="inquriymTitle">해피홀팜에 문의 사항을 남겨주시면 답변해드립니다.</span></h2>

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
                                <input type="text" class="wlong" />
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>상세 내용</span></th>
                            <td>
                                <textarea class="tta"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Btn Area -->
            <div class="btnArea">
                <div class="bCenter">
                    <ul>
                        <li><a href="#" class="nbtnbig">취소</a></li>
                        <li><a href="#" class="sbtnMini">확인</a></li>
                    </ul>
                </div>
            </div>
            <!-- //Btn Area -->

        </div>
<%@ include file="../base/footer.jsp" %>
</body>

</html>