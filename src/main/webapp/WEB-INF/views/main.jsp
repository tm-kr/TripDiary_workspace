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

<title>Insert title here</title>

</head>
<body>
	<jsp:include page="common/header.jsp" flush="false" />
	<jsp:include page="common/sidebar.jsp" flush="false" />
	
	<div class="container">
		<h1>메인 페이지</h1>
	</div>

	<div id="map" style="width: 450px; height: 600px; margin: auto;" ></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d21da3744ebeea9a10c9a6f6aa2244c4"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	mapOption = {
		center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
		level : 13
	// 지도의 확대 레벨
	};
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [ {
		content : '<div style="padding:3px;text-align:center;width:100px">카카오</div>', 
		latlng : new kakao.maps.LatLng(33.450705, 126.570677)
	}, {
		content : '<div style="padding:3px;text-align:center;width:100px">카카오</div>', 
		latlng : new kakao.maps.LatLng(33.450936, 126.569477)
	}, {
		content : '<div style="padding:3px;text-align:center;width:100px">카카오</div>', 
		latlng : new kakao.maps.LatLng(33.450879, 126.569940)
	}, {
		content : '<div style="padding:3px;text-align:center;width:200px">카카오</div>', 
		latlng : new kakao.maps.LatLng(33.451393, 126.570738)
	}, {
		content :'<div style="padding:3px;text-align:center;width:200px">카카오</div>', 
		latlng : new kakao.maps.LatLng(36.751393, 127.770738)
	}, {
		content : '<div style="padding:3px;width:150px;text-align:center; margin:auto;">TripDiary</div>', 
		latlng : new kakao.maps.LatLng(35.951393, 128.870738)
	}, {
		content : '<div style="padding:3px;width:150px;text-align:center; margin:auto;">TripDiary</div>', 
		latlng : new kakao.maps.LatLng(37.151393, 128.970738)
	}, ];


	
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
		
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });

	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}

	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
	
	
	
	
	
	
	

   

	</script>


</body>
</html>