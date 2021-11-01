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

	<jsp:include page="common/header.jsp" flush="false" />

	<div class="container">
		<div class="diary-top row">
			<div class="diary_profile_img col-sm-4">
				<div style="width: 240px; height: 240px; margin: auto;">
					<a data-toggle="modal" href="#profileUpdateModal"> <img
						src="<spring:url value='/image/${profile.storeFileName }'/> "
						class="border border-secondary rounded-circle image-profile icon2"
						style="width: 100%;">
					</a>
				</div>
				<h2 class="mt-3">${profile.nickname }</h2>
				<h6 class="mb-5" style="width: 240px; margin: auto;">${profile.message }</h6>

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

	<div class="modal fade" id="boardModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">나만의 여행지도</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
						<div id="map" style="width: 100%; height: 600px; margin: auto;" ></div>
				</div>
				<div class="modal-footer">
					<div style="margin: auto;">
						<button type="button" class="btn btn-primary" onclick="relayout()">지도 재호출</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="common/sidebar.jsp" flush="false" />
	
	
	
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d21da3744ebeea9a10c9a6f6aa2244c4"></script>
	<script>
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(38.7083, 124.9358), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		};
		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [
			<c:forEach var="mapCmd" items="${mapCmd}" varStatus="loop">
				{
		  	      latlng : new kakao.maps.LatLng(${mapCmd.markerLat} , ${mapCmd.markerLng})
		  	    },
		  	</c:forEach>
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});
		}
	
	function openModal(){
		setTimeout(function (){
			map.relayout(); 
			}, 300);
	}
	function relayout() {    
	    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
	    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
	    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
		map.relayout(); 
	}

	</script>

</body>
</html>