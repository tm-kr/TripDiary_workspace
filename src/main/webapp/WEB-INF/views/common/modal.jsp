<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<c:forEach var="haveEmblem" items="${haveEmblem}" varStatus="loop">
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal"
					style="margin: auto;">닫기</button>
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
					<form action="/profileUpdate" method="post"
						enctype="multipart/form-data">
						<div class="form-group" style="text-align: center;">
							<label for="thumbnail" class="btn btn-outline-secondary mt-3"
								id="image_container"> <span class="imgText">프로필
									사진 수정</span>
							</label> <input name="profile_img" type="file" id="thumbnail"
								accept="image/*" onchange="thumbnailHide(); setThumbnail(event);"
								style="display: none" />
							<div class="mt-3" id="image_container"></div>
						</div>
						<br>
						<div class="form-group">
							<label>상태메세지 수정</label> <input type="text" name="message"
								value="${profile.message}" class="form-control" maxlength="30">
							<input type="hidden" name="memberNum"
								value="${sessionScope.memberNum }" />
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
						<button type="button" class="btn btn-primary" data-dismiss="modal"
							style="margin: auto;">닫기</button>
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
				여행가고 싶은곳을 "PICK" 해보세요!<br> 그리고 자신이 여행간 일을 공유해주세요.<br>
				여행일기를 작성하면 달력에 여행 날짜가 표시됩니다.
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					style="margin: auto;">닫기</button>
			</div>
		</div>
	</div>
</div>
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
		
		// 프로필 사진 클릭시 이전 이미지 hide
	    function thumbnailHide() {
	        $(".board-thumbnail").hide();
	    }
		
		// 프로필 사진 미리보기
		function setThumbnail(event) {
			for (var image of event.target.files) {
				var reader = new FileReader(); 
				reader.onload = function(event) {
					var img = document.createElement("img"); 
					img.setAttribute("src", event.target.result);
					img.setAttribute("class", "board-thumbnail border border-secondary rounded-circle"); 
					document.querySelector("div#image_container").appendChild(img); 
				}; 
			console.log(image); reader.readAsDataURL(image); 
			} 
		}
	</script>
