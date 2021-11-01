<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 풀캘린더 오픈소스 -->
<link href='/resources/fullcalendar/main.min.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.min.js'></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<!-- 상단바 -->
	<jsp:include page="common/header.jsp" flush="false" />

	<div class="container">
		<div class="diary-top row">
			<div class="diary_profile_img col-sm-4">
				<div style="width: 240px; height: 240px; margin: auto;">
					<a data-toggle="modal" href="#profileUpdateModal"> <img
						src="<spring:url value='/profile/${profile.storeFileName}'/>"
						class="border border-secondary rounded-circle image-profile icon2"
						style="width: 100%;">
					</a>
				</div>
				<h2 class="mt-3"><c:out value="${profile.nickname}" /></h2>
				<h6 class="mb-5" style="width: 240px; margin: auto;"><c:out value="${profile.message}" /></h6>

			</div>
			<div class="col-sm-3 mt-5 mb-5">
				<div class="row">
					<div class="col-4">
						<a data-toggle="modal" href="#emblemModal"> <img class="icon"
							src="resources/img/icon/emblem_cnt.png" style="width: 100%;">
						</a> <br>
						<br>
						<b>${fn:length(haveEmblem) }</b>
					</div>
					<div class="col-4">
						<a data-toggle="modal" href="#boardModal" onclick="openModal();"> <img class="icon"
							src="resources/img/icon/board_cnt.png" style="width: 100%;">
						</a> <br>
						<br>
						<b>${actCnt.boardWriteCnt }</b>
					</div>
					<div class="col-4">
						<a data-toggle="modal" href="#pickModal"> <img class="icon"
							src="resources/img/icon/pick_cnt.png" style="width: 100%;">
						</a> <br>
						<br>
						<b>${actCnt.pickPressCnt }</b>
					</div>
				</div>
			</div>
			<div class="diary_calendar col-sm-5 mb-5">
				<div id='calendar' class="diaryCalendar"></div>
			</div>
		</div>

		<!-- 전체 게시물 부분  -->
		<div class="diary-mid row mt-5 mb-5">
			<!-- 게시물 1개 부분 이 주석 밑부분 부터 반복문 실행-->
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float: left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png"
								class="border rounded-circle"
								style="width: 50px; height: 50px; object-fit: cover;"> 닉네임2
						</div>
						<!-- pick 이미지 -->
						<div style="float: right; display: inline-block;" class="">
							<img alt="" src="resources/img/icon/pick_cnt.png"
								class="pick-img"
								style="width: 40px; height: 40px; object-fit: cover;">
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3"
							src="resources/img/sample1.png" style="width: 100%;">
					</div>

					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>여행날짜 : 2021년 8월 4일</div>
						<div>좋아요 8개</div>
						<div>#첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날
							#시작! #첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 모달 jsp -->
	<jsp:include page="common/modal.jsp" flush="false" />
	
	<!-- 사이드 바 -->
	<jsp:include page="common/sidebar.jsp" flush="false" />

</body>
</html>