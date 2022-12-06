<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    // 엔터 입력시 줄바꿈
    pageContext.setAttribute("replaceChar","\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
<title></title>
</head>
<body>
	<div class="contents">
		<header>
			<div class="header">
				<div>
					<a href="home" class="logo">logo</a>
				</div>
				<div class="search">
					<form action="searchsearch">
						<input class="searchBox" type="text" size="40"
							placeholder="게시판 & 통합검색" type="text" name="keyword2"
							id="keyword2" /> <input class="searchClick" id="searchBtn2"
							type="submit" value="검색" />
					</form>
				</div>

			</div>

			<nav class="headerM">
				<div>
					<ul class="category">
						<li><a href="noticelist" class="liText">공지사항 </a></li>
						<li><a href="tipblist" class="liText">팁/정보 </a></li>
						<li><a href="f_bcrilist" class="liText">자유게시판 </a></li>
						<li><a href="t_bcrilist" class="liText">거래/나눔 </a></li>
						<li><a href="cbcrilist" class="liText">동아리/모임 </a></li>
					</ul>
				</div>
			</nav>

		</header>
		<hr>
		<table class="board_dTop">
	        <tr class="board_dTitle"><td>${apple.title}</td></tr>
	        <tr class="board_dList">
	        	<td>글번호 : ${apple.seq}&nbsp;&nbsp;</td>
	            <td>| 작성자 : ${apple.id}&nbsp;&nbsp;</td>
	            <td>| 조회수 : ${apple.cnt}&nbsp;&nbsp;</td>
	            <td>| ${apple.regdate}</td>
	        </tr>
        <tr class="board_dBottom">
            <c:if test="${empty apple.uploadfile}">
            	<td>${apple.content}</td>
            </c:if>
            <c:if test="${not empty apple.uploadfile}">
            	<td><img height="300" width="300" src="${apple.uploadfile}"><br>${apple.content}</td>
            </c:if>
	    </tr>
	</table>
	</div>
	<!-- footer -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>