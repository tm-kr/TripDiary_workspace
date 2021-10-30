<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/style.css" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d21da3744ebeea9a10c9a6f6aa2244c4"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [ {
		title : '카카오',
		latlng : new kakao.maps.LatLng(33.450705, 126.570677)
	}, {
		title : '생태연못',
		latlng : new kakao.maps.LatLng(33.450936, 126.569477)
	}, {
		title : '텃밭',
		latlng : new kakao.maps.LatLng(33.450879, 126.569940)
	}, {
		title : '근린공원',
		latlng : new kakao.maps.LatLng(33.451393, 126.570738)
	} ];

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
</script>
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="common/header.jsp" flush="false" />

	<div class="container">
		<h1>메인 페이지</h1>
	</div>

	<div id="map" style="width: 500px; height: 400px;"></div>

	<jsp:include page="common/sidebar.jsp" flush="false" />


</body>
</html>