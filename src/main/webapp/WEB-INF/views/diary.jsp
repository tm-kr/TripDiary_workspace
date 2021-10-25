<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
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
							<img class="icon" src="resources/img/pick_cnt.png" style="width: 100%;"><br><br>
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
			<div class="col-sm-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="" style="width: 40px; height: 40px; object-fit: cover;">	
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
							#첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작! #첫게시물 #여행가기좋은날 #시작!
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="" style="width: 40px; height: 40px; object-fit: cover;">	
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
			
			<div class="col-sm-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="" style="width: 40px; height: 40px; object-fit: cover;">	
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
			
			<div class="col-sm-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="" style="width: 40px; height: 40px; object-fit: cover;">	
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
			
			<div class="col-sm-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="" style="width: 40px; height: 40px; object-fit: cover;">	
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
			
			<div class="col-sm-4 diary-board-container">
				<div class="border border-secondary p-3 icon2">
					<div class="board-top">
						<div style="float:left;">
							<!-- 프로필 이미지와 닉네임 -->
							<img alt="" src="resources/img/sample.png" class="border rounded-circle" style="width: 50px; height: 50px; object-fit: cover;">
							닉네임
						</div>
							<!-- pick 이미지 -->
						<div style="float:right; display:inline-block;" class="">
							<img alt="" src="resources/img/pick_cnt.png" class="" style="width: 40px; height: 40px; object-fit: cover;">	
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
	
	<div class="modal fade" id="emblemModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">엠블럼</h5>
					<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<div >
						<img alt="" src="resources/img/emblem_sample.png" style="width: 100%">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin: auto;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	
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