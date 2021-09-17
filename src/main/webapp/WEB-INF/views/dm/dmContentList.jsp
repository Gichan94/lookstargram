<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon(인터넷창 아이콘) -->
<link rel="icon" type="image/x-icon"
	href="/resources/assets/favicon.ico" />
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<!-- 버튼 부트스트랩 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- CSS File -->
<link rel="stylesheet" href="../resources/css/dmdmdm.css" />


<c:forEach var="dm" items="${list }">
	
	<c:choose>
		<c:when test="${sessionScope.nick ne dm.from_nickname }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
				<a href="../mypage/mypage.do?your_nickname=${dm.from_nickname }">
							<img src="/resources/profile/${dm.your_profile}" alt="보낸사람 프로필">
				</a>
			</div>
			<div class="received_msg">
				<div class="received_withd_msg">
					<p>${dm.dm_content }</p>
					<span class="time_date"> ${dm.send_time }</span>
				</div>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메세지 -->
		<div class="outgoing_msg">
			<div class="sent_msg">
				<p>${dm.dm_content }</p>
				<span class="time_date"> ${dm.send_time }</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>


</c:forEach>