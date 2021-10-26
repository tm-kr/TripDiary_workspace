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
	href="/resources/css/style.css" />
	<link rel="stylesheet"
	href="/resources/css/writeStyle.css" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="common/header.jsp" flush="false" />

	<div class="container">
		<h2>글쓰기</h2>
		
		<form action="/write" method="POST" enctype="multipart/form-data" class="mt-5 mb-5">
			<div class="writeForm mt-5">
			<div class="writeSelect">
				<h4>여행 날짜</h4>
				<c:set var="year" value="2021" />
				<select name="year" class="form-select">
					<option selected disabled hidden>년</option>
					<c:forEach var="i" begin="0" end="70">
						<option value="<c:out value="${year-i}" />"><c:out
								value="${year-i}" />
						</option>
					</c:forEach>

				</select> <select name="month" class="form-select">
					<option selected disabled hidden>월</option>
					<c:forEach var="i" begin="1" end="12">
						<option value="${i}">${i}</option>
					</c:forEach>

				</select> <select name="day" class="form-select">
					<option selected disabled hidden>일</option>
					<c:forEach var="i" begin="1" end="31">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>

				<h4 class="mt-5">여행 지역</h4>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="placeCheck" value="abroad" onclick="disable_select()">
					<label class="form-check-label" >해외</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="placeCheck" onclick="disable_select2()" checked>
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
<!-- 				<div class="imgUpload mt-5">
						<label for="input-file" class="btn btn-outline-secondary imgBtn2" id="image_container">
							<span class="imgText">대표사진 등록하기</span>
						</label>
						<input type="file" id="input-file" style="display:none" name="file1" accept="image/*" onchange="setThumbnail(event);" />
						
						<label for="input-file2" class="btn btn-outline-secondary imgBtn2">
							<span class="imgText">추가사진 등록하기</span>
						</label>
						<input type="file" id="input-file2" style="display:none" name="file2" multiple />
				</div> -->
				
				<label for="input-file" class="btn btn-outline-secondary mt-5" id="image_container">
							<span class="imgText">사진 업로드하기</span>
				</label>
				<input name="file" type="file" id="input-file" accept="image/*" onchange="setThumbnail(event);" style="display:none" multiple/>
				<h6 class="mt-3" style="color: red;"> * 사진을 한번에 업로드 하여 주십시오.<br>* 버튼을 재클릭시 이전에 업로드 내용은 사라집니다.<br>* 맨 처음 사진이 썸네일로 들어갑니다!</h6>
				 <div class="mt-5" id="image_container"></div>
				 
				<!-- 수정사항 업로드시 이미지 관련해서 좀 더 편하게 할 수 있도록 하자! -->





				<!-- 내용 입력란 -->
				<textarea class="form-control mt-5 " placeholder="내용을 입력해주세요.  (1000자 이내)" name="content" id="writeContent"></textarea>
				<!-- 태그 리스트 나오는 곳 -->
				<ul id="tag-list" class='ulWrite'>
        		</ul>
        		<!-- 태그 입력란 -->
        		<textarea id="tag" class="form-control mb-5" placeholder="#태그를 입력해주세요. (태그 형식으로 10자 이내, 최대 5개)"></textarea>
			</div>
				
			<div class="writeButton">
				<button type="button" class="btn btn-outline-primary" onclick="history.go(-1)">돌아가기</button>
				<button type="submit" class="btn btn-primary">작성하기</button>
			</div>
			<input type="hidden" name="member_num" value="${member_num}">
		</form>
	</div>

	<script>
		// 국내 선택시 지역선택 설정 가능
		function disable_select() {
			$("#select_place").attr("disabled", "disabled");
		}
		function disable_select2() {
			$("#select_place").removeAttr("disabled", "disabled");
		}
		
		// 이미지 미리보기
		function setThumbnail(event) {
			for (var image of event.target.files) {
				var reader = new FileReader(); 
				reader.onload = function(event) {
					var img = document.createElement("img"); 
					img.setAttribute("src", event.target.result);
					img.setAttribute("class", "image-thumbnail2 border border-secondary"); 
					document.querySelector("div#image_container").appendChild(img); 
				}; 
			console.log(image); reader.readAsDataURL(image); 
			} 
		}
		
		// 태그 입력받기
	    $(document).ready(function () {

	        var tag = {};
	        var counter = 0;

	        // 태그를 추가한다.
	        function addTag (value) {
	            tag[counter] = value; // 태그를 Object 안에 추가
	            counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
	        }

	        // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
	        function marginTag () {
	            return Object.values(tag).filter(function (word) {
	                return word !== "";
	            });
	        }
	    
	        // 서버에 넘기기
	        $("#tag-form").on("submit", function (e) {
	            var value = marginTag(); // return array
	            $("#rdTag").val(value); 

	            $(this).submit();
	        });

	        $("#tag").on("keypress", function (e) {
	            var self = $(this);

	            // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
	            if (e.key === "Enter" || e.keyCode == 32) {

	                var tagValue = self.val(); // 값 가져오기

	                // 값이 없으면 동작 ㄴㄴ
	                if (tagValue !== "") {

	                    // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
	                    var result = Object.values(tag).filter(function (word) {
	                        return word === tagValue;
	                    })
	                
	                    // 태그 중복 검사
	                    if (result.length == 0) { 
	                        $("#tag-list").append("<li class='tag-item' name='tag'><input name='tag' type='hidden' value='"+tagValue+"'/>    #"+tagValue+"<span class='del-btn' idx='"+counter+"'>x</span></li>");
	                        addTag(tagValue);
	                        self.val("");
	                    } else {
	                        alert("태그값이 중복됩니다.");
	                    }
	                }
	                e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
	            }
	        });

	        // 삭제 버튼 
	        // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
	        $(document).on("click", ".del-btn", function (e) {
	            var index = $(this).attr("idx");
	            tag[index] = "";
	            $(this).parent().remove();
	        });
	})
	</script>
	
</body>
</html>