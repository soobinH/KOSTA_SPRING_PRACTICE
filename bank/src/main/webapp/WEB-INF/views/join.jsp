<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/common.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<script type="text/javascript">
	window.onload = function() {
		let doubleId =  document.getElementById("doubldId");
		doubleId.onclick = function(e) {
			e.preventDefault();
			checkDoubleId();
		}
		
		function checkDoubleId() {
			let id = document.getElementById("id").value;
			if(!id){
				alert("아이디를 입력하세요");
				return;
			}
			const param =new URLSearchParams({id:id});
			
			fetch("doubleId", {
				method: "POST",
				body: param 
			})
			.then(response => response.text())
			.then(data => {
				console.log(data)
				if(data == true){
					alert("사용 중인아이디입니다.")
				} else {
					alert("사용 가능한아이디입니다.")
				}
			})
			.catch(error=>console.log(err))
		}
	}
</script>

</head>
<body>
	<jsp:include page="header.jsp"/>
	<form action="join" method="post">
		<div><h3 class="header">회원가입</h3></div>
		<div class="wrap">
			<div class="row">  
				<div class="title">아이디</div>
				<div class="input"><input type="text" name="id" id="id" style="width:120px"/></div>
				<div class="input">&nbsp;<button id="doubldId">중복</button></div>
			</div>
			<div class="row">  
				<div class="title">이름</div>
				<div class="input"><input type="text" name="name"/></div>
			</div>
			<div class="row">  
				<div class="title">비밀번호</div>
				<div class="input"><input type="text" name="password"/></div>
			</div>
			<div class="row">  
				<div class="title">이메일</div>
				<div class="input"><input type="text" name="email"/></div>
			</div>
			<div class="row">  
				<div class="title">주소</div>
				<div class="input"><input type="text" name="address"/></div>
			</div>
			<div>
				<input type="submit" value="회원가입"/>
			</div>
		</div>
	</form>
</body>
</html>