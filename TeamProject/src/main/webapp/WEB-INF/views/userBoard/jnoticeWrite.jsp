<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="UTF-8">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/jnoticeWrite.css">
    <title>JollyStore</title>
</head>
<jsp:include page="/WEB-INF/views/include/header_.jsp" />
<body>
    <div id="main">
        <div id="content">
            <div class="page_aticle aticle_type2">
                <jsp:include page="/WEB-INF/views/include/left_.jsp" />
                <div class="page_section section_qna">
                    <div class="head_aticle">
                        <h2 class="tit">공지 작성</h2>
                    </div>

                    <div class="xans-board-write">
                        <form name="frm" id="fm" method="post" action="/userBoard/jnoticeWrite"
                            enctype="multipart/form-data" onsubmit="return chkForm(this)" style="height: 100%;">
                  <input type="hidden" name="pageNum" value="${ pageNum }">                        
                            <table id="jnotice" class="boardWrite2" width="100%">
                                <colgroup>
                                    <col width="14%" align="right">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th class="input_txt">제목</th>
                                        <td>
                                            
                                            <input type="text" name="title" style="width:100%" label="제목" value="" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="input_txt">작성자</th>
                                        <td>
                                           <input type="text" name="id" value="${id}" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; outline:none;" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="input_txt">내용</th>
                                        <td class="edit_area" style="position: relative;">
                                            <textarea name="content" style="width:100%;height:474px;"
                                                class="editing_area" required label="내용"></textarea>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table width="100%">
                                <tbody>
                                    <tr>
                                        <td align="right" style="padding-top:5px; border:none;" id="avoidDbl">
                                            <input type="submit" class="bhs_button yb" value="저장" style="float:none;">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </form>
                    </div>

                </div>
            </div>

        </div>
    </div>
   <jsp:include page="/WEB-INF/views/include/footer_.jsp" />
</body>
</html>