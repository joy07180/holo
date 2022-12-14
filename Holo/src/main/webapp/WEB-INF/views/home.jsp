<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="resources/myLib/board.css">
<script src="resources/myLib/jquery-3.2.1.min.js"></script>
<script src="resources/myLib/inCheck.js"></script>
<script src="resources/myLib/Test01.js"></script>
<script>
// =========================== 배너 슬라이드 자바스크립트 ============================================

/* ======================================================================================== */

   let iCheck=false;
   let pCheck=false;
   
   $(function(){
      $('#id').focus();
      // ** ID
      $('#id').keydown(function(e){
         if ( e.which==13 ) {
            e.preventDefault();
            // => form 에 submit 이 있는경우
            // => enter 누르면 자동 submit 발생되므로 이를 제거함
            $('#password').focus();
         }
      }).function() {
         iCheck=idCheck();
      }; //id
      
      // ** Password
      $('#password').keydown(function(e){
         if ( e.which==13 ) {
            e.preventDefault();
            $('#password2').focus();
         }
      }).function(){
         pCheck=   pwCheck();
      }; //password
   }); //ready
   
   
   $(function searchsearch() {
       $('#searchBtn2').click(function () {
           self.location = "searchsearch"
               + "${pageMaker.makeQuery(1)}"
               + "&keyword2="
               + $('#keyword2').val()
       }); //click
   }); //ready	
   

   
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
						placeholder="게시판 & 통합검색" type="text" name="keyword2" id="keyword2" /> 
					<input class="searchClick" id="searchBtn2" type="submit" value="검색" />
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

		<main>
			<div class="main">
				<div class="main_slide">
					<ul class="slide_list"></ul>
					<script>
					const imgArray = [
					    "resources/uploadImage/banner1.png",
					    "resources/uploadImage/banner2.png",
					    "resources/uploadImage/banner3.png",
					    "resources/uploadImage/banner4.jpg",
					    "resources/uploadImage/banner5.jpg"
					];

					const links = [
					    "https://1in.seoul.go.kr/front/board/boardContentsView.do?board_id=1&contents_id=42540f97571344a3b84ecb180eaa5241",
					    "https://www.gseek.kr/member/rl/courseInfo/onCourseCsInfo.do?menuId=&menuStep=&pMenuId=OTOP&courseSeq=3526&courseCsSeq=1&courseCateCode=D600&eduTypeCode=&stuSeq=",
					    "https://1in.seoul.go.kr/front/board/boardContentsView.do?board_id=1&contents_id=04bae8eea0d24bca9becd560f0ffa8e6",
					    "https://1in.seoul.go.kr/front/board/boardContentsView.do?board_id=1&contents_id=217822ddd64344258b9d282b50822bcb",
					    "https://mywellnessgood.com/?p=82/"
					];

					const slide_list = document.querySelector(".slide_list");
					
					for (let i = 0; i < imgArray.length; i++) {
					    slide_list.appendChild(document.createElement("li"))
					        .style.background = "url("+imgArray[i]+") center/100% 100%";
					};
					
					const li = slide_list.getElementsByTagName("li");
					const a = document.getElementsByTagName("a");

					for (let i = 0; i < links.length; i++) {
					    li[i].innerHTML = "<a class='link' href=" + links[i] + ">" + [i + 1] + '/5' + "</a>";
					};

					var i = 0;

					setInterval(() => {
					    li[i].style.display = 'none';
					    li[i].style.right = "-100%";
					    // li[i].style.opacity = 0;

					    i++;
					    i %= li.length;

					    li[i].style.display = 'block';
					    li[i].style.right = 0;
					    // li[i].style.opacity = 1;
					}, 4000);
					</script>
				</div>
				<div class="main_login">
					<c:if test="${not empty loginID}">
						<form action="logout" method="get" class="board_Logout">

							<h1>${loginName} 님 !!!</h1>
							<br>
							<div class="user_box2"> 
							 <input type="submit" id="axlogout" value="Logout" class="user">
							 <a href="userdetail" class="user3">MYPAGE</a>
							<c:if test="${loginID=='admin'}">
								<a href="user" class="user4">회원목록</a>
							</c:if>
							</div>
						</form>
					</c:if>


				<c:if test="${empty loginID}">
					<form action="login" method="post" class="board_Login">
						<table>
							<tr>
								<td class="user">I D</td>
								<td><input type="text" class="put" name="id" id="id"><br>
								</td>
							</tr>
							<tr>
								<td class="user">Password</td>
								<td><input type="password" class="put" name="password" id="password"><br>
								</td>
							</tr>
							<tr><td></td>
								<td class="user_box">
								<input type="submit" id="jslogin" value="Login" class="user1" >
								<a href="joinf" class="user2">회원가입</a>&nbsp;&nbsp;
							</tr>
						</table>
					</form>
				</c:if>
				</div>
			</div>
			<div class="boards">
				<section>
					<h4>
						최신 공지사항 <a href="noticelist">+</a>
					</h4>
					<hr>
					<table width=100%>
						<thead>
							<tr height="30">
								<th width="50%">제목</th>
								<th width="20%">글쓴이</th>
								<th width="30%">날짜</th>
							</tr>
						</thead>
						<c:if test="${not empty nlist}">
							<c:forEach var="board" items="${nlist}">
								<tr height="30">
									<td width="50%"><a href="noticedetail?seq=${board.seq}">${board.title}</a></td>
									<td class="ct" width="20%"><a href="userdetail?id=${board.id}">${board.id}</a></td>
									<td class="ct" width="30%">${board.regdate}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</section>
				<section>
					<h4>
						인기 자유글 <a href="f_bcrilist">+</a>
					</h4>
					<hr>
					<table width=100%>
						<thead>
							<tr height="30">
								<th width="50%">제목</th>
								<th width="30%">글쓴이</th>
								<th width="20%">조회수</th>
							</tr>
						</thead>
						<c:if test="${not empty fhotlist}">
							<c:forEach var="fboard" items="${fhotlist}">
								<tr height="30">

									<td width="40%"><a href="f_bdetail?seq=${fboard.seq}">${fboard.title}</a></td>
									<td class="ct" width="20%"><a href="userdetail?id=${fboard.id}">${fboard.id}</a></td>
									<td class="ct" width="10%">${fboard.cnt}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</section>
			</div>
			<div class="boards">
				<section>
					<h4>
						최신 팁/정보 <a href="tipblist">+</a>
					</h4>
					<hr>
					<table width=100%>
						<thead>
							<tr height="30">
								<th width="50%">제목</th>
								<th width="20%">글쓴이</th>
								<th width="30%">날짜</th>
							</tr>
						</thead>
						<c:if test="${not empty hlist}">
							<c:forEach var="hboard" items="${hlist}">
								<tr height="30">
									<td width="40%"><a href="tipbdetail?seq=${hboard.seq}">${hboard.title}</a></td>
									<td class="ct" width="20%"><a href="userdetail?id=${hboard.id}">${hboard.id}</a></td>
									<td class="ct" width="30%">${hboard.regdate}</td>

								</tr>
							</c:forEach>
						</c:if>
					</table>
				</section>
				<section>
					<h4>
						인기 팁/정보 <a href="tipblist">+</a>
					</h4>
					<hr>
					<table width=100%>
						<thead>
							<tr height="30">
								<th width="50%">제목</th>
								<th width="30%">글쓴이</th>
								<th width="20%">조회수</th>
							</tr>
						</thead>
						<c:if test="${not empty hhotlist}">
							<c:forEach var="hboard" items="${hhotlist}">
								<tr height="30">
									<td width="40%"><a href="tipbdetail?seq=${hboard.seq}">${hboard.title}</a></td>
									<td class="ct" width="20%"><a href="userdetail?id=${hboard.id}">${hboard.id}</a></td>
									<td class="ct" width="10%">${hboard.cnt}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</section>
			</div>
			<div class="boards">
				<section>
					<h4>
						최신 거래글 <a href="t_bcrilist">+</a>
					</h4>
					<hr>
					<table width=100%>
						<thead>
							<tr height="30">
								<th width="50%">제목</th>
								<th width="20%">글쓴이</th>
								<th width="30%">날짜</th>
							</tr>
						</thead>
						<c:if test="${not empty tlist}">
							<c:forEach var="tboard" items="${tlist}">
								<tr height="30">
									<td width="40%"><a href="t_bdetail?seq=${tboard.seq}">${tboard.title}</a></td>
									<td class="ct" width="20%"><a href="userdetail?id=${tboard.id}">${tboard.id}</a></td>
									<td class="ct" width="30%">${tboard.regdate}</td>

								</tr>
							</c:forEach>
						</c:if>
					</table>
				</section>
				<section>
					<h4>
						인기 동아리 <a href="cbcrilist">+</a>
					</h4>
					<hr>
					<table width=100%>
						<thead>
							<tr height="30">
								<th width="50%">제목</th>
								<th width="30%">글쓴이</th>
								<th width="20%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty chotlist}">
								<c:forEach var="cboard" items="${chotlist}">
									<tr height="30">
										<td width="40%"><a href="cbdetail?seq=${cboard.seq}">${cboard.title}</a></td>
										<td class="ct" width="20%"><a href="userdetail?id=${cboard.id}">${cboard.id}</a></td>
										<td class="ct" width="10%">${cboard.cnt}</td>
									</tr>
								</c:forEach>
							</c:if>
					</table>
				</section>
			</div>

		</main>
	</div>
	<footer>
		<div class="bottom">
			<ul class="btMenu">
				<li><a href="">공지사항</a></li>
				<li><a href="">팁/정보</a></li>
				<li><a href="">자유게시판</a></li>
				<li><a href="">거래/나눔</a></li>
				<li><a href="">동아리/모임</a></li>
			</ul>
			<span>
				<div>Copyright (c) Holo.net All rights reserved.</div>
				<div>Contact us, holo at gmail dot com</div>
				<div>
					<a href="">이용약관</a> | <a href="">개인정보취급방침</a>
				</div>
			</span>
		</div>
		<br>
	</footer>

</body>

</html>
