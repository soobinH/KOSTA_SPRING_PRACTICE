<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h2,#commandCell { text-align: center; }
	table { margin: auto; width:450px; }
	.td_left { background: orange; }
	.td_right { background: skyblue; }
</style>
<script>
function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("preview").src = e.target.result;
		}
		
		reader.readAsDataURL(input.files[0])
	}	
}

function changeFile(input) {
	if(input.files && input.files[0]) {
		document.getElementById("selectFile").text = input.files[0].name;
	}
}
</script>
</head>
<body>
	<h2>게시판 글 수정</h2>
	<form action="${contextPath}/article/modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="num" value="${article.num }" >
		<table>
			<tr>
				<td class="td_left"><label for="writer">글쓴이</label></td>
				<td class="td_right">
					<input type="text" name="writer" id="writer" value="${article.writer }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td class="td_left"><label for="title">제목</label></td>
				<td class="td_right">
					<input type="text" name="title" id="title" required="required" value="${article.title }">
				</td>
			</tr>
			<tr>
				<td class="td_left"><label for="content">내용</label></td>
				<td class="td_right">
					<textarea name="content" cols="40" rows="15" id="content" required="required">${article.content }</textarea>
				</td>
			</tr>
			<tr>
				<td class="td_left"><label>이미지</label></td>
				<td class="td_right">
					<img src='<c:choose>
								<c:when test="${article.imageFilename eq Empty or article.imageFilename eq ''}">
									${contextPath}/resources/img/plus.png
								</c:when>
								<c:otherwise>
									${contextPath}/image?filename=${article.imageFilename}
								</c:otherwise>
							 </c:choose>'
					width="100px" id="preview" onclick="document.getElementById('ifile').click()"/>
					<input type="file" name="ifile" id="ifile" accept="image/*" onchange="readURL(this);"
						style="display:none">
				</td>
			</tr>
			<tr>
				<td class="td_left"><label for="dfile">파일 첨부</label></td>
				<td class="td_right">
					<a href="#" id="selectFile" onclick="document.getElementById('dfile').click();return false;">
						<c:choose>
							<c:when test="${article.downloadFilename eq Empty or article.downloadFilename eq ''}">
								파일없음
							</c:when>
							<c:otherwise>
								${article.downloadFilename }
							</c:otherwise>
						</c:choose>
					</a>
					<input type="file" name="dfile" id="dfile" style="display:none" onchange="changeFile(this)">
				</td>
			</tr>			
		</table>
		
		<div id="commandCell">
			<input type="submit" value="수정">&nbsp;&nbsp;
			<input type="reset" value="다시쓰기">
		</div>
	</form>
</body>
</html>