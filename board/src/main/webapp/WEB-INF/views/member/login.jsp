<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
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

</head>
<body>
	<form action="login" method="post">
		<div><h3 class="header">로그인</h3></div>
		<div class="wrap">
			<div class="row">  
				<div class="title">아이디</div>
				<div class="input"><input type="text" name="id" value="${id }"/></div>
			</div>
			<div class="row">  
				<div class="title">비밀번호</div>
				<div class="input"><input type="text" name="password" value="${password }"/></div>
			</div>
			<div class="row">
				<input type="checkbox" name="autoLogin" value="autoLogin" ${autoLogin!=null && autoLogin!='' ? checked : "" }/><b>자동로그인</b>
				
			</div>
			<div>
				<input type="submit" value="로그인"/><br>
			</div>
		</div>
	</form>
</body>
</html>