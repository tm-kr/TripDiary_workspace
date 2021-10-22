<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp" flush="false" />

	<div class="container">
		<h2>글쓰기</h2>
		
		<form action="/write" method="get" enctype="multipart/form-data" class="mt-5 mb-5">
			<div class="writeForm mt-5">
			<div class="writeSelect">
				<h4>여행 날짜</h4>
				<c:set var="year" value="2021" />
				<select name="user_birth_year" class="form-select">
					<option selected disabled hidden>년</option>
					<c:forEach var="i" begin="0" end="70">
						<option value="<c:out value="${year-i}" />"><c:out
								value="${year-i}" />
						</option>
					</c:forEach>

				</select> <select name="user_birth_month" class="form-select">
					<option selected disabled hidden>월</option>
					<c:forEach var="i" begin="1" end="12">
						<option value="${i}">${i}</option>
					</c:forEach>

				</select> <select name="user_birth_day" class="form-select">
					<option selected disabled hidden>일</option>
					<c:forEach var="i" begin="1" end="31">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>

				<h4 class="mt-5">여행 지역</h4>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="place" value="abroad" onclick="disable_select()">
					<label class="form-check-label" >해외</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="place" value=""onclick="disable_select2()" checked>
					<label class="form-check-label" >국내</label>
				</div>
					
				 <select name="place" id="select_place" class="form-select">
					<option selected disabled hidden >지역선택</option>
					<option value="seoul">서울특별시</option>
					<option value="busan">부산광역시</option>
					<option value="daegu">대구광역시</option>
					<option value="incheon">인천광역시</option>
					<option value="gwangju">광주광역시</option>
					<option value="daejeon">대전광역시</option>
					<option value="ulsan">울산광역시</option>
					<option value="sejong">세종특별자치시</option>
					<option value="gyeonggi">경기도</option>
					<option value="gangwon">강원도</option>
					<option value="chungbuk">충청북도</option>
					<option value="chungnam">충청남도</option>
					<option value="jeonbuk">전라북도</option>
					<option value="jeonnam">전라남도</option>
					<option value="gyeongbuk">경상북도</option>
					<option value="gyeongnam">경상남도</option>
					<option value="jeju">제주도특별자치도</option>
				</select>
				</div>
				<div class="imgUpload mt-5">
						<label for="input-file" class="btn btn-outline-secondary imgBtn2">
							<span class="imgText">대표사진 등록하기</span>
						</label>
						<input type="file" id="input-file" style="display:none" name="file1" />
						
						<label for="input-file2" class="btn btn-outline-secondary imgBtn2">
							<span class="imgText">추가사진 등록하기</span>
						</label>
						<input type="file" id="input-file2" style="display:none" name="file2" />
				</div>
				<textarea class="form-control mt-5 " placeholder="내용을 입력해주세요.  (1000자 이내)" name="content" id="writeContent"></textarea>
				<textarea class="form-control mt-5 mb-5" placeholder="#태그를 입력해주세요.  (태그 형식으로 10자 이내)" name="tag" ></textarea>
				
				
				</div>
				
				<div class="writeButton">
					<button type="button" class="btn btn-outline-primary" onclick="history.go(-1)">돌아가기</button>
					<button type="submit" class="btn btn-primary">작성하기</button>
				</div>
			</form>
		</div>

	<script>
		function disable_select() {
			$("#select_place").attr("disabled", "disabled");
		}
		function disable_select2() {
			$("#select_place").removeAttr("disabled", "disabled");
		}
	</script>
</body>
</html>