<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h2, #commandCell {
	text-align: center;
}

table {
	margin: auto;
	width: 450px;
}

.td_left {
	background: orange;
}

.td_right {
	background: skyblue;
}
</style>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById("preview").src = e.target.result;
			}

			reader.readAsDataURL(input.files[0])
		}
	}
</script>
</head>
<body>
	<h2>게시판 글 등록</h2>
	<form action="${contextPath}/article/write" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="writer" id="writer" name="writer"
			value="${sessionScope.user.id }">
		<table>
			<tr>
				<td class="td_left"><label for="writerName">글쓴이</label></td>
				<td class="td_right">
				<input type="hidden" name="writer" value="${sessionScope.user.id}"> 
				<input type="text" value="${sessionScope.user.name}" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="td_left"><label for="subject">제목</label></td>
				<td class="td_right"><input type="text" name="title" id="title"
					required="required"></td>
			</tr>
			<tr>
				<td class="td_left"><label for="content">내용</label></td>
				<td class="td_right"><textarea id="content" name="content"
						cols="40" rows="15"></textarea></td>
			</tr>
			<tr>
				<td class="td_left"><label for="ifile">이미지 파일 첨부</label></td>
				<td class="td_right"><img
					src="${contextPath}/resources/img/plus.png" alt="이미지선택"
					id="preview" width="100px"
					onclick="document.getElementById('ifile').click();"> <input
					type="file" id="ifile" name="ifile" accept="image/*"
					style="display: none" onchange="readURL(this);" /></td>
			</tr>
			<tr>
				<td class="td_left"><label for="dfile">파일 첨부</label></td>
				<td class="td_right"><input type="file" name="dfile" id="dfile">
				</td>
			</tr>
		</table>
		<div id="commandCell">
			<input type="submit" value="등록">&nbsp;&nbsp; <input
				type="reset" value="다시쓰기">&nbsp;&nbsp; <a
				href="${contextPath}/article/list">목록</a>
		</div>
	</form>
</body>
</html>