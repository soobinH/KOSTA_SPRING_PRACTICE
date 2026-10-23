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
	width: 150px;
}

.td_right {
	background: skyblue;
	width: 300px;
}

#content {
	height: 200px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#heart").click(
				function() {
					$.ajax({
						url : "${contextPath}/article/heart",
						type : "post",
						dataType : "text",
						data : {
							num : "${article.num}"
						},
						success : function(result) {
							if (result == 'true') {
								$("#heart").attr('src',
										'${contextPath}/img/redheart.png')
							} else {
								$("#heart").attr('src',
										'${contextPath}/img/blackheart.png')
							}
						},
						error : function(err) {
							console.log(err)
						}
					})
				})
	})
</script>
</head>
<body>
	<h2>게시판 글 상세</h2>
	<table border="1">
		<tr>
			<td class="td_left"><label>글쓴이</label></td>
			<td class="td_right"><c:choose>
					<c:when test="${not empty article.profile}">
						<c:url var="profileImg" value="/image">
							<c:param name="filename" value="${article.profile}" />
						</c:url>
					</c:when>

					<c:otherwise>
						<c:set var="profileImg" value="${contextPath}/img/person.jpg" />
					</c:otherwise>
				</c:choose> <img src="${profileImg}" width="30px" height="30px"
				style="border-radius: 50%; object-fit: cover;" /> <span>${article.writerName}</span>

			</td>
		</tr>
		<tr>
			<td class="td_left"><label>제목</label></td>
			<td class="td_right"><span>${article.title }</span></td>
		</tr>
		<tr>
			<td class="td_left"><label>내용</label></td>
			<td class="td_right"><div id="content">${article.content }</div></td>
		</tr>
		<tr>
			<td class="td_left"><label>이미지</label></td>
			<td class="td_right"><c:if
					test="${article.imageFilename ne Empty and article.imageFilename ne ''}">
					<img src="${contextPath}/image?filename=${article.imageFilename}"
						width="100px" />
				</c:if></td>
		</tr>
		<tr>
			<td class="td_left"><label>파일다운로드</label></td>
			<td class="td_right"><a
				href="${contextPath}/fileDown?filename=${article.downloadFilename }">${article.downloadFilename }</a></td>
		</tr>
	</table>
	<br>
	<div id="commandCell">
		<c:if test="${sessionScope.user ne Empty}">
			<img
				src="${contextPath}/img/${heart eq true? 'redheart.png':'blackheart.png' }"
				width="25px" id="heart" />&nbsp;&nbsp;
	</c:if>
		<c:if test="${sessionScope.user.id eq article.writer }">
			<a href="${contextPath}/article/modify?num=${article.num}">수정</a>&nbsp;&nbsp;&nbsp;
	</c:if>
		<a href="${contextPath}/article/list">목록</a>&nbsp;&nbsp;&nbsp;

	</div>
</body>
</html>