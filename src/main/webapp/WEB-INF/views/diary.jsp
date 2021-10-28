<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/style.css" />
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="common/header.jsp" flush="false" />
	
	<div class="container">
		<div class="diary-top row">
			<div class="diary_profile_img col-sm-4">
				<div style="width:240px; height:240px; margin: auto;">
					<a data-toggle="modal" href="#profileUpdateModal">
						<img src="resources/img/sample.png" class="border border-secondary rounded-circle image-profile icon2" style="width: 100%;">
					</a>
				</div>
					<h2 class="mt-3">닉네임 </h2>
					<h6 class="mb-5">프로필 사진을 클릭하여 상태메세지를 입력하세요!</h6>
				
			</div>
				<div class="col-sm-4 mt-5 mb-5">
					<div class="row">
						<div class="col-4">
							<a data-toggle="modal" href="#emblemModal">
								<img class="icon" src="resources/img/emblem_cnt.png" style="width: 100%;">
							</a>
							<br><br>
							3
						</div>
						<div class="col-4">
							<a data-toggle="modal" href="#boardModal">
								<img class="icon" src="resources/img/board_cnt.png" style="width: 100%;">
							</a>
							<br><br>
							23
						</div>
						<div class="col-4">
							<a href="/pick">
								<img class="icon" src="resources/img/pick_cnt.png" style="width: 100%;"><br><br>
							</a>
							12
						</div>
					</div>
				</div>
			<div class="diary_calendar col-sm-4 mb-5">
				<div style="border: solid; height: 400px; width: 70%; height:300px; margin: auto;">
					<h3>달력</h3>
				</div>
			</div>
		</div>
	
		<!-- 전체 게시물 부분  -->
		<div class="diary-mid row mt-5 mb-5">
			<!-- 게시물 1개 부분 이 주석 밑부분 부터 반복문 실행-->
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="pick-img" style="width: 40px; height: 40px; object-fit: cover;">	
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3" src="resources/img/sample1.png" style="width: 100%;">
					</div>
					
					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>
							여행날짜 : 2021년 8월 4일
						</div>
						<div>
							좋아요 8개
						</div>
						<div>
							#첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작!	#첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="pick-img" style="width: 40px; height: 40px; object-fit: cover;">	
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3" src="resources/img/sample2.jpg" style="width: 100%;">
					</div>
					
					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>
							여행날짜 : 2021년 8월 4일
						</div>
						<div>
							좋아요 8개
						</div>
						<div>
							#첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="pick-img" style="width: 40px; height: 40px; object-fit: cover;">	
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3" src="resources/img/sample3.jpg" style="width: 100%;">
					</div>
					
					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>
							여행날짜 : 2021년 8월 4일
						</div>
						<div>
							좋아요 8개
						</div>
						<div>
							#첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="pick-img" style="width: 40px; height: 40px; object-fit: cover;">	
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3" src="resources/img/sample4.jpg" style="width: 100%;">
					</div>
					
					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>
							여행날짜 : 2021년 8월 4일
						</div>
						<div>
							좋아요 8개
						</div>
						<div>
							#첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="/resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="pick-img" style="width: 40px; height: 40px; object-fit: cover;">	
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3" src="resources/img/sample5.jpg" style="width: 100%;">
					</div>
					
					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>
							여행날짜 : 2021년 8월 4일
						</div>
						<div>
							좋아요 8개
						</div>
						<div>
							#첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="pick-img" style="width: 40px; height: 40px; object-fit: cover;">	
						</div>
					</div>
					<!-- 썸네일 이미지 -->
					<div class="board-mid">
						<img class="image-thumbnail border border-secondary mt-3" src="resources/img/sample6.jpg" style="width: 100%;">
					</div>
					
					<!-- 하단 정보부분 -->
					<div class="board-bottom mt-5 mb-3">
						<div>
							여행날짜 : 2021년 8월 4일
						</div>
						<div>
							좋아요 8개
						</div>
						<div>
							#첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
		</div>
	
	
	</div>
	
	
	
	<!-- 모달 jsp -->
	<div class="modal fade" id="profileUpdateModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">프로필 수정</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<form action ="./reportAction.jsp" method="post">
						<div style="text-align: center;">
							<img alt="" src="resources/img/sample.png" class="border border-secondary rounded-circle" style="width: 80%;">
						</div>
						<div class="form-group">
							<label>프로필 사진 수정</label>
							<input class="form-control" type="file" id="formFile" name="file">
						</div><br>
						<div class="form-group">
							<label>상태메세지 수정</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="30">
						</div><br>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 엠블럼 모달 -->
	<div class="modal fade" id="emblemModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">엠블럼</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				
				<div class="modal-body row" style="text-align: center">
					<c:forEach var="emblem" items="${emblem}" varStatus="loop">
						<div class="col-4">
							<a data-toggle="modal" href="#Emblem${emblem.emblemNum }">
								<img alt="" src="resources/img/none.png" style="width: 100%">
							</a>
							${emblem.emblemName }
						</div>
					</c:forEach>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: auto;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<c:if test="${sessionScope.memberNum eq memberNum }">
	<!-- 획득한 엠블럼 모달 -->
	<c:forEach var="emblem" items="${emblem}" varStatus="loop">
		<div class="modal fade" id="getEmblem${emblem.emblemNum }" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">이미 획득한 엠블럼</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						" ${emblem.emblemName } "<br>
						${emblem.emblemExplain }
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal" style="margin: auto;">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
		<c:forEach var="emblem" items="${emblem}" varStatus="loop">
		<div class="modal fade" id="Emblem${emblem.emblemNum }" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						" ${emblem.emblemName } "<br>
						${emblem.emblemExplain }<br>
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
					<div  style="margin: auto;">
					
				
						<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
						<c:choose>
							<c:when test="${emblem.emblemNum eq 1 }">
								<c:if test="${actCnt.tdLikePressCnt gt 0}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 2 }">
								<c:if test="${actCnt.tdLikePressCnt gt 9}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 3 }">
								<c:if test="${actCnt.tdLikePressCnt gt 99}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 4 }">
								<c:if test="${actCnt.pickPressCnt gt 0}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 5 }">
								<c:if test="${actCnt.pickPressCnt gt 9}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 6 }">
								<c:if test="${actCnt.pickPressCnt gt 99}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 7 }">
								<c:if test="${actCnt.boardWriteCnt gt 0}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 8 }">
								<c:if test="${actCnt.boardWriteCnt gt 9}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 9 }">
								<c:if test="${actCnt.boardWriteCnt gt 99}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 10 }">
								<c:if test="${actCnt.replyWriteCnt gt 0}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 11 }">
								<c:if test="${actCnt.replyWriteCnt gt 9}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 12 }">
								<c:if test="${actCnt.replyWriteCnt gt 99}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 13 }">
								<c:if test="${actCnt.tdLikeReceiveCnt gt 0}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 14 }">
								<c:if test="${actCnt.tdLikeReceiveCnt gt 9}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							<c:when test="${emblem.emblemNum eq 15 }">
								<c:if test="${actCnt.tdLikeReceiveCnt gt 99}">
									<button type="button" class="btn btn-warning" onclick="location.href='/getEmblem?emblemNum=${emblem.emblemNum}'" >획득하기</button>
								</c:if>
							</c:when>
							
						</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	</c:if>
	
	<!-- 획득하지 못한 엠블럼 -->
<!-- 	<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						" 좋아요 한 스푼 "<br>
						좋아요 1번 누르기
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="modal fade" id="Emblem2" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						취향 존중!<br>
						좋아요 10번 누르기
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem3" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						" 만인의 연인 "<br>
						좋아요 100번 누르기
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<div class="modal fade" id="Emblem1" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
			<div class="modal-dialog modal-sm mt-5">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="modal">엠블럼 획득 조건</h5>
						<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
					
					<div class="modal-body" style="text-align: center">
						
					</div>
					<div class="modal-footer">
						<div style="margin: auto;">
							<button type="button" class="btn btn-primary" data-dismiss="modal" >닫기</button>
							<button type="button" class="btn btn-warning" data-dismiss="modal" >획득하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	 -->	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<div class="modal fade" id="boardModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">나만의 여행지도</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<img alt="" src="resources/img/map_sample.png" style="width: 100%">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: auto;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="common/sidebar.jsp" flush="false" />
		
	
</body>
</html>