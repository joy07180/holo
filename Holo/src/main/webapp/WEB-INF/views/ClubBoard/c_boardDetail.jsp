<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    // 엔터 입력시 줄바꿈
    pageContext.setAttribute("replaceChar","\n");
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>** 동아리/모임게시판 디테일 **</title>
	<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
<<<<<<< HEAD
=======
	<title>** 동아리 게시판 **</title>
>>>>>>> branch 'master' of https://github.com/joy07180/holo.git
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	$(document).on("click", "#Comment_regist", function() {
		
		const com_bno = ${apple.seq};
		console.log(com_bno);
		const com_writer = $('#com_writer').val();
		const com_content = $('#com_content').val();
		
		console.log(com_writer);
		console.log(com_content);
	
		/* if(com_writer == ''){
			alert('로그인 후 이용해주세요');
			return;
		}else if(com_content == '') {
			alert('내용을 입력하세요');
		} */
		
		$.ajax({
			type:'post',
			url:'<c:url value="/Comment/InsertComment"/>',
			data: JSON.stringify(
				{
					"com_bno":com_bno,
					"com_writer":com_writer,
					"com_content":com_content
				}		
			),
			contentType: 'application/json',
			success:function(data){
				console.log('통신성공' + data);
				if(data === 'InsertSuccess') {
					alert('댓글 등록이 완료되었습니다.');
					console.log('댓글 등록 완료');
					$('#com_writer').val(com_writer);
   					$('#com_content').val('');
   					getList();
				} else {
					alert('로그인 이후 이용해주시기 바랍니다.');
					console.log('댓글 등록 실패');
				}
			},
			error:function(){
				alert('통신실패');
			}
		});// 댓글 비동기 끝
		
});// 댓글등록 이벤트 끝

getList();

function getList() {
	
	const com_bno = ${apple.seq};
	console.log(${apple.seq});
	const com_writer = $('#com_writer').val();
		const com_content = $('#com_content').val();
		/* const com_no = ${com}; */
	$.getJSON(
		"<c:url value='/Comment/CommentList/'/>"+com_bno,
		function(data) {
			if(data.total > 0){
				var list = data.list;
				
				var comment_html = "<div>";
				
				$('#count').html(data.total);
				for(i = 0;i < list.length;i++){
					var content = list[i].com_content;
					var writer = list[i].com_writer;
					comment_html += "<div><span id='com_writer'><strong>" + writer + "</strong></span><br/>";
					comment_html += "<span id='com-content'>" + content + "</span><br>";
					if(writer === $("#com_writer").val()){
						 comment_html += "<span id='delete' style='cursor:pointer;' data-id ="+content+">[삭제]</span><br></div><hr>";
						 
					}
					else{
						comment_html += "</div><hr>";
					}
				}
				
				$(".comment_Box").html(comment_html);
				
				
			}
			else{
				var comment_html = "<div>등록된 댓글이 없습니다.</div>";
				$(".comment_Box").html(comment_html);
			}
	
		
		}
		);//getJson
}
	</script>
	
	
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
<<<<<<< HEAD
        <br>
        <div class="Header_box">
        <h2>▶ 동아리/모임 게시판 ◀</h2>
        <p class="Header_text1">&nbsp;이곳은 동아리/모임 게시판 입니다. 동아리, 모임 글을  작성해주세요.</p>
        <p class="Header_text2">&nbsp;팁 관련 주제는 <a href="tipblist">팁/정보</a>게시판, 자유주제는 <a href="f_bcrilist">자유</a>게시판,  물건 판매 및 거래는 <a href="t_bcrilist">거래/나눔</a>게시판에 남겨주세요.</p>
        <br>
        </div>
        <br>
        
        
	<table class="board_dTop">
		<tr class="board_dTitle"><td><br>${apple.title}</td></tr>
		<tr class="board_dList">
        	<td>글번호 : ${apple.seq}&nbsp;&nbsp;</td>
 	        <td>| 작성자 : <img height="15" width="15" src="${apple.image}">${apple.id}&nbsp;&nbsp;</td>
            <td>| 조회수 : ${apple.cnt}&nbsp;&nbsp;</td>
            <td>| ${apple.regdate}</td>
	    </tr>
		<tr class="board_dBottom">
            <c:if test="${empty apple.uploadfile}">
            	<td>${fn:replace(apple.content, replaceChar, "<br/>")}</td>
            </c:if>
            <c:if test="${not empty apple.uploadfile}">
            	<td><img width="100%" src="${apple.uploadfile}"><br><br>${fn:replace(apple.content, replaceChar, "<br/>")}<br><br></td>
            </c:if>
        </tr>
=======
<h2>동아리/모임</h2>
<hr>
	<table>
		<tr height="40"><td bgcolor="Khaki">Seq</td><td>${apple.seq}</td></tr>
		<tr height="40"><td bgcolor="Khaki">I D</td><td>${apple.id}</td></tr>
		<tr height="40"><td bgcolor="Khaki">Title</td><td>${apple.title}</td></tr>
		<tr height="40"><td bgcolor="Khaki">Content</td>
						<td>
						<c:if test="${!empty apple.uploadfile}">
						<img height="300" width="300" src="${apple.uploadfile}">
						<br>
						</c:if>
						${apple.content}</td>
		</tr>
		<tr height="40"><td bgcolor="Khaki">RegDate</td><td>${apple.regdate}</td></tr>
		<tr height="40"><td bgcolor="Khaki">조회수</td><td>${apple.cnt}</td></tr>
>>>>>>> branch 'master' of https://github.com/joy07180/holo.git
	</table>

    <div class="comment-box">
                    
        <div class="comment-count">댓글 <span id="count">0</span></div>

         	   <!-- <span class="c-icon"><i class="fa-solid fa-user"></i>  -->
       	<div class="comment-name">
            <span class="anonym">작성자 : 
        	    <input type="text" class="form-control" id="com_writer" placeholder="이름" name ="com_writer" value='${login.userId}' readonly  style="width: 100px; border:none;">
            </span>
        </div>   
            	
            <!-- </span> -->
        <!--<img src="/익명.jpg" width ="50px" alt="My Image"><!-->
        <div class="comment-sbox">
            <textarea class="comment-input" id="com_content" cols="80" rows="2" name="com_content" ></textarea>
            <!-- <span class="com-function-btn" type="hidden">
               
               <a href="#"><i class="fa-solid fa-pen-to-square"></i></a>
               <a href="#"><i class="fa-solid fa-trash-can"></i></a>
            </span> -->
        </div>
        <div class="regBtn">
       		<button id="Comment_regist"> 댓글등록</button>
        </div>
   
   		<div class="comment_Box" style="border:1px solid gray;"> <!-- 댓글이 들어갈 박스 --></div>
  		<div align="center">
            <!-- First, Prev -->
            <c:choose>
                <c:when test="${pageMaker.prev && pageMaker.spageNo>1}">
                    <!-- New_ver01_Cri : pageMaker.makeQuery(1) -->
                    <!-- New_ver02_SearchCri : pageMaker.searchQuery(1) -->
                    <a href="CommentList/${apple.seq}${pageMaker.searchQuery(pageMaker.spageNo-1)}">&lt;</a>&nbsp;&nbsp;

                    <!-- OLD_version 
    	            => EL 은 주석내에 있어도 JSP가 처리하여 변수명등에 오류있으면 500 발생할 수 있음.  
				    <a href="bcrilist?currPage=1&rowsPerPage=5">FP</a>&nbsp;   
				    <a href="bcrilist?currPage=${pageMaker.spageNo-1}&rowsPerPage=5">&lt;</a>&nbsp;&nbsp;  
				    -->
                </c:when>
            </c:choose>
            <!-- Displag PageNo -->
            <c:forEach var="i" begin="${pageMaker.spageNo}" end="${pageMaker.epageNo}">
                <c:if test="${i==pageMaker.cri.currPage}">
                    <font size="5" color="Orange">${i}</font>&nbsp;
                </c:if>
                <c:if test="${i!=pageMaker.cri.currPage}">

                    <a href="CommentList/${apple.seq}${pageMaker.searchQuery(i)}">${i}</a>&nbsp;

                </c:if>
            </c:forEach>

            <c:choose>
                <c:when test="${pageMaker.next && pageMaker.epageNo>0}">
                    <a href="CommentList/${apple.seq}${pageMaker.searchQuery(pageMaker.epageNo+1)}">&nbsp;&gt;</a>

                </c:when>
            </c:choose>

      </div>
</div> <!-- comment-box /div -->

		<div>
			<!-- 아이디 로그인이랑 다를때 메뉴 -->
	        <c:if test="${loginID!=apple.id || loginID!='admin'}">
			<a href="cbinsertf">새글등록</a>
	        &nbsp;&nbsp;<a href="crinsertf?root=${apple.root}&step=${apple.step}&indent=${apple.indent}">답글등록</a>
			&nbsp;&nbsp;<a href="cbcrilist">목록으로</a>       
	        </c:if>
	        <!-- 아이디 로그인이랑 같을때 추가 메뉴 -->
	        <c:if test="${loginID==apple.id || loginID=='admin' }">
	        &nbsp;&nbsp;<a href="cbdetail?jCode=U&seq=${apple.seq}">글수정</a>
	        &nbsp;&nbsp;<a href="cbdelete?seq=${apple.seq}&root=${apple.root}">글삭제</a>
	        </c:if>
	        <br>
	        
	        <br>
	        <c:if test="${Prev!='T'}">
	        <a href="cbdetail?jCode=P&seq=${apple.seq}">이전글</a>
	        </c:if>
	        <c:if test="${Prev=='T'}">
	        이전글
	        </c:if>
	        
	        &nbsp;&nbsp;<a href="cbdetail?jCode=N&seq=${apple.seq}">다음글</a>
        </div>
</div> <!-- contents /div -->

<footer>
        <div class="bottom">
            <ul class="btMenu">
                <li><a href="">A</a></li>
                <li><a href="">B</a></li>
                <li><a href="">C</a></li>
                <li><a href="">D</a></li>
                <li><a href="">E</a></li>
                <li><a href="">F</a></li>
            </ul>
            <span>
                <div>Copyright (c) Holo.net All rights reserved.</div>
                <div>Contact us, holo at gmail dot com</div>
                <div><a href="">이용약관</a> | <a href="">개인정보취급방침</a></div>
            </span>
        </div>
        <br>
    </footer>

</body>
</html>