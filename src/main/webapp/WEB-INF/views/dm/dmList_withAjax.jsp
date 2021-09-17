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
</head>
<body>
<%@ include file="../inc/header.jsp" %>
<br><br><br><br><br><br>

	<c:forEach var="dm" items="${list }">
		<div class="chat_list_box${dm.room_no } chat_list_box">
			<div type="button" class="chat_list" room_no="${dm.room_no }" your_nickname="${dm.your_nickname }">
				<!-- active-chat -->
				<div class="chat_people">
					<div class="chat_img" >				
						<a href="../mypage/mypage.do?users_nickname=${dm.your_nickname }">
							<img src="/resources/profile/${dm.your_profile}" alt="sunil">
						</a>
					</div>
					<div class="chat_ib">
						<h5>${dm.your_nickname }<span class="chat_date">${dm.send_time }</span>
						</h5>
						<div class="row">
							<div class="col-10">
								<p>${dm.dm_content }</p>
							</div>
							<%-- 만약 현재사용자가 안읽은 메세지 갯수가 0보다 클때만 badge를 표시한다. --%>
							<c:if test="${dm.unread > 0 }">
								<div class="col-2 unread${dm.room_no }">
									<span class="badge bg-danger">${dm.unread }</span>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<%@ include file="../inc/footer.jsp" %>
</body>
</html>	