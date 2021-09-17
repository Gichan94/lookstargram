<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>...</title>
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
<link rel="stylesheet" href="/resources/css/dmdmdm.css" />


<!-- 메세지 전송 아이콘(종이비행기) 때문에 필요 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
	
	// 가장 처음 메세지 리스트를 가져온다.
	const firstDMList = function(){
		$.ajax({
			url:"/dm/dmList_withAjax.do",
			method:"get",
			data:{
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					alert('room : '+ $(this).attr('room_no'));
					
					var room_no = $(this).attr('room_no');
					var your_nickname = $(this).attr('your_nickname');
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room_no).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+room_no).addClass('active_chat');
					
					var div = "";
					div += "<div class='type_msg'>";
					div += "	<div class='input_msg_write row'>";
					div += "		<div class='col-11'>";
					div += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...' />";
					div += "		</div>";
					div += "		<div class='col-1'>";
					div += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					div += "		</div>";
					div += "	</div>";
					div += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(div);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						// 메세지 전송 함수 호출
						insertDM(room_no, your_nickname);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					
					// 메세지 내용을 불러오는 함수 호출
					getContentList(room_no);
					
				});
				
			}
		})
	};
	
	// 메세지 리스트를 다시 가져온다.
	const dmList = function(){
		$.ajax({
			url:"/dm/dmList_withAjax.do",
			method:"get",
			data:{
			},
			success:function(data){
				console.log("메세지 리스트 리로드 성공");
				
				$('.inbox_chat').html(data);
				
				// 메세지 리스트중 하나를 클릭했을 때
				$('.chat_list').on('click', function(){
					alert('room_no : '+ $(this).attr('room_no'));
					
					var room_no = $(this).attr('room_no');
					var your_nickname = $(this).attr('your_nickname');
					
					// 선택한 메세지빼고 나머지는 active 효과 해제하기
					$('.chat_list_box').not('.chat_list_box.chat_list_box'+room_no).removeClass('active_chat');
					// 선택한 메세지만 active 효과 주기
					$('.chat_list_box'+room_no).addClass('active_chat');
					
					var div2 = "";
					div2 += "<div class='type_msg'>";
					div2 += "	<div class='input_msg_write row'>";
					div2 += "		<div class='col-11'>";
					div2 += "			<input type='text' class='write_msg form-control' placeholder='메세지를 입력...' />";
					div2 += "		</div>";
					div2 += "		<div class='col-1'>";
					div2 += "			<button class='msg_send_btn' type='button'><i class='fa fa-paper-plane-o' aria-hidden='true'></i></button>";
					div2 += "		</div>";
					div2 += "	</div>";
					div2 += "</div>";
			          
					// 메세지 입력, 전송 칸을 보인다.
					$('.send_message').html(div2);
					
					// 메세지 전송버튼을 눌렀을 때
					$('.msg_send_btn').on('click',function(){
						
						// 메세지 전송 함수 호출
						insertDM(room_no, your_nickname);
						
						// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
						// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
						//$('.chat_list_box:first').addClass('active_chat');
					});
					
					// 메세지 내용을 불러오는 함수 호출
					getContentList(room_no);
					
				});
				
				// 전송버튼을 누르면 메세지 리스트가 리로드 되면서 현재 열린 메세지의 선택됨 표시가 사라진다.
				// 이걸 해결하기 위해 메세지 전송버튼을 누르고 메세지 리스트가 리로드되면 메세지 리스트의 첫번째 메세지(현재 열린 메세지)가 선택됨 표시 되도록 한다.
				$('.chat_list_box:first').addClass('active_chat');
			}
		})
	};
    
	
	// 메세지 내용을 가져온다.
	// 읽지 않은 메세지들을 읽음으로 바꾼다.
	const getContentList = function(room_no) {
		
		$.ajax({
			url:"/dm/dmContentList.do",
			method:"GET",
			data:{
				room_no : room_no,
			},
			success:function(data){
				console.log("메세지 내용 가져오기 성공");
				
				// 메세지 내용을 html에 넣는다
				$('.msg_history').html(data);
				
				// 이 함수로 메세지 내용을 가져올때마다 스크롤를 맨아래로 가게 한다.
				$(".msg_history").scrollTop($(".msg_history")[0].scrollHeight);

			},
			error : function() {
				alert('서버 에러');
			}
		})
		
		$('.unread'+room_no).empty();
	
	};
	
	
	// 메세지를 전송하는 함수
	const insertDM = function(room_no, your_nickname){
		
		var dm_content = $('.write_msg').val();
		//alert("content: " + content);
		
		dm_content = dm_content.trim();
		
		if(dm_content == ""){
			alert("메세지를 입력하세요!");
		}else{
			$.ajax({
				url:"/dm/insertDM.do",
				method:"GET",
				data:{
					room_no : room_no,
					your_nickname: your_nickname,
					dm_content: dm_content
				},
				success:function(data){
					console.log("메세지 전송 성공");
					
					// 메세지 입력칸 비우기
					$('.write_msg').val("");
					
					// 메세지 내용  리로드
					getContentList(room_no);
					
					// 메세지 리스트 리로드
					dmList();
					
				},
				error : function() {
					alert('서버 에러');
				}
			});
		}
		
	};
	
	$(document).ready(function(){
		// 메세지 리스트 리로드
		firstDMList();
	});
</script>


</head>

<body>
<%@ include file="../inc/header.jsp" %>
<br><br><br><br><br><br>
	
	<div class="msg-container">
	
		<div class="messaging">
	      <div class="inbox_msg">
	      	<!-- 메세지 목록 영역 -->
	        <div class="inbox_people">
	          <div class="headind_srch">
	            <div class="recent_heading">
	              <h4>Recent</h4>
	            </div>
	            <!-- 메세지 검색 -->
	            <div class="srch_bar">
	              <div class="stylish-input-group">
	                <input type="text" class="search-bar"  placeholder="Search" >
	                <span class="input-group-addon">
	                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
	                </span> 
	              </div>
	            </div>
	          </div>
	          
	          <!-- 메세지 리스트 -->
	          <div class="inbox_chat">
		          
	          </div>
	        </div>
	        
	        <!-- 메세지 내용 영역 -->
	        <div class="mesgs">
	          <!-- 메세지 내용 목록 -->
	          <div class="msg_history" name="contentList">
	            <!-- 메세지 내용이 올 자리 -->
	          </div>
	          <div class="send_message">
	          </div>
	          <!-- 메세지 입력란이 올자리 -->
	        </div>
	      </div>
	      
	    </div>
	</div>

</body>
</html>