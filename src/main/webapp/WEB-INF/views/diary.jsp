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
						<a data-toggle="modal" href="#boardModal"> <img class="icon"
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
				<div id='calendar' style="width: 72%; margin: auto;"></div>
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
								style="width: 50px; height: 50px; object-fit: cover;"> 닉네임
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
	<!-- 엠블럼 모달 -->
	<div class="modal fade" id="emblemModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">엠블럼</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>

				<div class="modal-body row" style="text-align: center">
					<c:forEach var="emblem" items="${emblem}" varStatus="loop">
						<div class="col-4 p-3">
							<c:forEach var="haveEmblem" items="${haveEmblem}"
								varStatus="loop">
								<c:if test="${emblem.emblemNum eq haveEmblem.emblemNum }">
									<c:set var="get" value="${haveEmblem.emblemNum}"></c:set>
								</c:if>
							</c:forEach>

							<c:if test="${empty get}">
								<a data-toggle="modal" href="#Emblem${emblem.emblemNum }"> <img
									alt="" src="resources/img/emblem/none.png" class="icon2"
									style="width: 100%">
								</a>
							</c:if>
							<c:if test="${not empty get}">
								<a data-toggle="modal" href="#getEmblem${emblem.emblemNum }">
									<img alt=""
									src="resources/img/emblem/emblem${emblem.emblemNum}.png"
									class="icon2" style="width: 100%">
								</a>
							</c:if>${emblem.emblemName }
							<c:remove var="get" />
						</div>
					</c:forEach>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="margin: auto;">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${sessionScope.memberNum eq profile.memberNum }">
		<!-- 프로필 수정 모달 -->
		<div class="modal fade" id="profileUpdateModal" tabindex="-1"
			role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">프로필 수정</h5>
						<button type="button" class="btn-close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					<div class="modal-body">
						<form action="/profileUpdate" method="post" enctype="multipart/form-data">
							<div class="form-group" style="text-align: center;">
								<label for="thumbnail" class="btn btn-outline-secondary mt-3"
									id="image_container"> <span class="imgText">프로필
										사진 수정</span>
								</label> <input name="profile_img" type="file" id="thumbnail"
									accept="image/*" onchange="setThumbnail(event);"
									style="display: none" />
								<div class="mt-3" id="image_container"></div>
							</div>
							<br>
							<div class="form-group">
								<label>상태메세지 수정</label> <input type="text" name="message" value="${profile.message}"
									class="form-control" maxlength="30">
								<input type="hidden" name="memberNum" value="${sessionScope.memberNum }"/>
							</div>
							<br>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
								<button type="submit" class="btn btn-primary">수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

		<!-- 획득한 엠블럼 모달 -->
		<c:forEach var="emblem" items="${emblem}" varStatus="loop">
			<div class="modal fade" id="getEmblem${emblem.emblemNum }"
				tabindex="-1" role="dialog" aria-labelledby="modal"
				aria-hidden="true">
				<div class="modal-dialog modal-sm mt-5">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modal">이미 획득한 엠블럼</h5>
							<button type="button" class="btn-close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true"></span>
							</button>
						</div>

						<div class="modal-body" style="text-align: center">
							" ${emblem.emblemName } "<br> ${emblem.emblemExplain }
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal" style="margin: auto;">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

		<c:forEach var="emblem" items="${emblem}" varStatus="loop">
			<div class="modal fade" id="Emblem${emblem.emblemNum }" tabindex="-1"
				role="dialog" aria-labelledby="modal" aria-hidden="true">
				<div class="modal-dialog modal-sm mt-5">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
							<button type="button" class="btn-close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true"></span>
							</button>
						</div>

						<div class="modal-body" style="text-align: center">
							" ${emblem.emblemName } "<br> ${emblem.emblemExplain }<br>
							<c:choose>
								<c:when test="${emblem.emblemNum eq 1 }">
								( ${actCnt.tdLikePressCnt } / 1 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 2 }">
								( ${actCnt.tdLikePressCnt } / 10 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 3 }">
								( ${actCnt.tdLikePressCnt } / 100 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 4 }">
								( ${actCnt.pickPressCnt } / 1 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 5 }">
								( ${actCnt.pickPressCnt } / 10 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 6 }">
								( ${actCnt.pickPressCnt } / 100 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 7 }">
								( ${actCnt.boardWriteCnt } / 1 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 8 }">
								( ${actCnt.boardWriteCnt } / 10 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 9 }">
								( ${actCnt.boardWriteCnt } / 100 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 10 }">
								( ${actCnt.replyWriteCnt } / 1 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 11 }">
								( ${actCnt.replyWriteCnt } / 10 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 12 }">
								( ${actCnt.replyWriteCnt } / 100 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 13 }">
								( ${actCnt.tdLikeReceiveCnt } / 1 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 14 }">
								( ${actCnt.tdLikeReceiveCnt } / 10 )
							</c:when>
								<c:when test="${emblem.emblemNum eq 15 }">
								( ${actCnt.tdLikeReceiveCnt } / 100 )
							</c:when>

							</c:choose>
						</div>
						<div class="modal-footer">
							<div style="margin: auto;">

								<form action="/getEmblem" method="POST">
									<input type="hidden" name="memberNum"
										value="${sessionScope.memberNum }">
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">닫기</button>



									<c:choose>
										<c:when test="${emblem.emblemNum eq 1 }">
											<c:if test="${actCnt.tdLikePressCnt gt 0}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 2 }">
											<c:if test="${actCnt.tdLikePressCnt gt 9}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 3 }">
											<c:if test="${actCnt.tdLikePressCnt gt 99}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 4 }">
											<c:if test="${actCnt.pickPressCnt gt 0}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 5 }">
											<c:if test="${actCnt.pickPressCnt gt 9}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 6 }">
											<c:if test="${actCnt.pickPressCnt gt 99}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 7 }">
											<c:if test="${actCnt.boardWriteCnt gt 0}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 8 }">
											<c:if test="${actCnt.boardWriteCnt gt 9}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 9 }">
											<c:if test="${actCnt.boardWriteCnt gt 99}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 10 }">
											<c:if test="${actCnt.replyWriteCnt gt 0}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 11 }">
											<c:if test="${actCnt.replyWriteCnt gt 9}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 12 }">
											<c:if test="${actCnt.replyWriteCnt gt 99}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 13 }">
											<c:if test="${actCnt.tdLikeReceiveCnt gt 0}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 14 }">
											<c:if test="${actCnt.tdLikeReceiveCnt gt 9}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>
										<c:when test="${emblem.emblemNum eq 15 }">
											<c:if test="${actCnt.tdLikeReceiveCnt gt 99}">
												<input type="hidden" name="emblemNum"
													value="${emblem.emblemNum }">
												<button type="submit" class="btn btn-warning">획득하기</button>
											</c:if>
										</c:when>

									</c:choose>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>






	<div class="modal fade" id="pickModal" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">PICK!</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body" style="text-align: center;">
					여행가고 싶은곳을 "PICK" 해보세요!<br>
					그리고 자신이 여행간 일을 공유해주세요.<br>
					여행일기를 작성하면 달력에 여행 날짜가 표시됩니다.
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-dismiss="modal" style="margin: auto;">닫기</button>
				</div>
			</div>
		</div>
	</div>



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
					<div class="form-group">
						<img alt="" src="resources/img/map_sample.png" style="width: 100%">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="margin: auto;">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="common/sidebar.jsp" flush="false" />

	<script type="text/javascript">
		// 풀캘린더 스크립트 부분
		var all_events = null;
		<c:if test="${not empty calendar}">
		all_events = [
			<c:forEach var="calendarList" items="${calendar}" varStatus="loop">
				{
		  	      title  : '여행일',
		  	      start  : '${calendarList }'
		  	    },
		  	</c:forEach>
	  	  ]
		</c:if>
		$(document).ready(function() {
		    var calendarEl = document.getElementById('calendar');
		    var calendar = new FullCalendar.Calendar(calendarEl, {
		      initialView: 'dayGridMonth',
		      locales: 'ko',
		      events: all_events
	    });
	    calendar.render();
	  });    
		
		// 대표사진 미리보기
		function setThumbnail(event) {
			for (var image of event.target.files) {
				var reader = new FileReader(); 
				reader.onload = function(event) {
					var img = document.createElement("img"); 
					img.setAttribute("src", event.target.result);
					img.setAttribute("class", "board-thumbnail border border-secondary"); 
					document.querySelector("div#image_container").appendChild(img); 
				}; 
			console.log(image); reader.readAsDataURL(image); 
			} 
		}
		</script>
</body>
</html>