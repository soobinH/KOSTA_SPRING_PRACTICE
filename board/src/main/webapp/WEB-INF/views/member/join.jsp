<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.header { text-align:center; }
	.wrap {
		margin : 0 auto;
		border : 1px solid;
		width : 260px;
		padding: 10px;
	}
	.row { height : 30px; }
	.title {
		float:left;
		width:70px;
		text-align:center;
		font-weight:bold;
	}
	.input {float:left;}
	input[type='submit'] {
		font-weight:bold;
		width:120px;
		background-color:lightgray;
		display: block;
		margin : 0 auto;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#searchAddress').click(function(e) {
			e.preventDefault();
			searchAddress();
		})
		
		$("#doubleId").click(function(e) {
			e.preventDefault();
			if($("#id").val().length==0) {
				alert('아이디를 입력하세요.')
				return;
			}
			
			$.ajax({
				url:'${contextPath}/member/doubleId',
				type:'post',
				dataType:'text',
				data:{id:$('#id').val()},
				success:function(result) {
					if(result=='true') {
						alert('사용중인 아이디 입니다.')
					} else if(result=='false') {
						alert('사용 가능한 아이디 입니다.')
					} else {
						alert(result);
					}
				},
				error:function(err) {
					console.log(err)
				}
			})
		})
	})
</script>

<script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("preview").src = e.target.result;
		}
		
		reader.readAsDataURL(input.files[0])
	}	
}


</script>
<script>
    function searchAddress() {
        new kakao.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>
	<form action="${contextPath}/member/join" method="post"
		enctype="multipart/form-data">
		<div>
			<h3 class="header">회원가입</h3>
		</div>
		<div class="wrap">
			<div class="row">
				<div class="input">
					<img src='${contextPath}/resources/img/person.jpg'
						onclick="document.querySelector('#profile').click();" id="preview"
						width="260px" /> <input type="file" name="profileFile" id="profile"
						style="display: none" onchange="readURL(this);" />
				</div>
			</div>
			<div class="row">
				<div class="title">아이디</div>
				<div class="input">
					<input type="text" name="id" id="id" style="width: 117px" />
				</div>
				<div class="input">
					&nbsp;
					<button id="doubleId">중복</button>
				</div>
			</div>
			<div class="row">
				<div class="title">이름</div>
				<div class="input">
					<input type="text" name="name" />
				</div>
			</div>
			<div class="row">
				<div class="title">비밀번호</div>
				<div class="input">
					<input type="text" name="password" />
				</div>
			</div>
			<div class="row">
				<div class="title">이메일</div>
				<div class="input">
					<input type="text" name="email" />
				</div>
			</div>
			<div class="row">
				<div class="title">우편번호</div>
				<div class="input">
					<input type="text" name="postcode" id="postcode"
						style="width: 93px" readonly="readonly" />
				</div>
				<div class="input">
					&nbsp;
					<button id="searchAddress">주소찾기</button>
				</div>
			</div>
			<div class="row">
				<div class="title">주소</div>
				<div class="input">
					<input type="text" name="address" id="address" readonly="readonly" />
				</div>
			</div>
			<div class="row">
				<div class="title">상세주소</div>
				<div class="input">
					<input type="text" name="detailAddress" id="detailAddress" />
				</div>
			</div>
			<div>
				<input type="submit" value="회원가입" />
			</div>
		</div>
	</form>
</body>
</html>