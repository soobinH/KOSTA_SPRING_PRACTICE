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
	h2, form, #paging, #tr_top { text-align: center; }
	table, #member, #paging { margin: auto; width:800px; }
	td, th { border: solid lightgray 1px; }
	td a { text-decoration: none; }
	#member { text-align: right; }
	#tr_top { background: orange }
	#paging a {
		display: inline-block;
		width:20px; height:20px; border:solid gray 1px;
		text-decoration: none;
	}
	#paging .select { background: lightblue; }
	#paging .btn { background: lightgray; }
	
.delBtn {
  display: inline-block;
  padding: 5px;
  background-color: #007bff; /* 버튼 색상 */
  color: #fff;              /* 글자 색상 */
  text-decoration: none;    /* 밑줄 제거 */
  border-radius: 5px;       /* 둥근 모서리 */
  font-weight: bold;
}	

.delBtn[disabled] {
  background-color: #ccc;
  color: #666;
  pointer-events: none; /* 클릭 방지 */
  cursor: not-allowed;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function submit(page) {
		$("#page").val(page);
		$("#search").submit();
	}
</script>
</head>
<body>
<h2>글 목록&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${sessionScope.user ne Empty}">
		<a href="${contextPath}/article/write">글쓰기</a>
	</c:if>
	
</h2>
<div id="member">
    <c:choose>
        <c:when test="${not empty sessionScope.user}">

            <c:choose>
                <c:when test="${empty sessionScope.user.profile}">
                    <c:set var="profileImg"
                           value="${contextPath}/img/person.jpg"/>
                </c:when>
                <c:otherwise>
                    <c:url var="profileImg" value="/image">
                        <c:param name="filename"
                                 value="${sessionScope.user.profile}"/>
                    </c:url>
                </c:otherwise>
            </c:choose>

            <img src="${profileImg}"
                 width="35px" height="35px"
                 style="border-radius:50%; object-fit:cover;"/>&nbsp;

            <span>${sessionScope.user.name}</span>&nbsp;&nbsp;
            <a href="${contextPath}/member/findPassword">비밀번호찾기</a>&nbsp;&nbsp;
            <a href="${contextPath}/member/logout">로그아웃</a>&nbsp;&nbsp;

        </c:when>
        <c:otherwise>
            <a href="${contextPath}/member/login">로그인</a>&nbsp;&nbsp;
        </c:otherwise>
    </c:choose>

    <a href="${contextPath}/member/join">회원가입</a>
</div><br>

<form action="${contextPath}/article/list" method="get" id="search">
	<input type="hidden" name="page" value="1" id="page"/>
	<select name="type" id="type">
		<option value="all">전체</option>
		<option value="title"  ${type eq 'title'? 'selected':''}>제목</option>
		<option value="writer" ${type eq 'name'? 'selected':''}>작성자</option>
		<option value="content" ${type eq 'content'? 'selected':''}>내용</option>
	</select>
	<input type="text" name="keyword" value="${keyword}">
	<input type="submit" value="검색"/>	
</form>
<br>
<table>
	<tr id="tr_top">
		<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>삭제</th>
	</tr>
	<c:forEach items="${articleList }" var="article">
		<tr>
			<td>${article.num }</td>
			<td><a href="${contextPath}/article/detail?num=${article.num}">${article.title }</a></td>
			
			<td>
			    <c:choose>
			        <c:when test="${not empty article.profile}">
			            <c:url var="writerProfileImg" value="/image">
			                <c:param name="filename"
			                         value="${article.profile}"/>
			            </c:url>
			        </c:when>
			        <c:otherwise>
			            <c:set var="writerProfileImg"
			                   value="${contextPath}/img/person.jpg"/>
			        </c:otherwise>
			    </c:choose>
			
			    <img src="${writerProfileImg}"
			         width="30px" height="30px"
			         style="border-radius:50%; object-fit:cover;"/>
			
			    ${article.writerName}
			</td>

			<td>${article.viewcnt }</td>
			<td><a href="${contextPath}/article/delete/${article.num}/${pageInfo.curPage}" class="delBtn" ${sessionScope.user.id eq article.writer? '':'disabled'} >삭제</a></td>
		</tr>
	</c:forEach>
</table>
<br>
<div id="paging">
	<c:choose>
		<c:when test="${pageInfo.curPage>1}">
			<button onclick="submit(${pageInfo.curPage-1})">&lt;</button>
		</c:when>
		<c:otherwise>
			<a>&lt;</a>
		</c:otherwise>
	</c:choose>
	
	<c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }" step="1" var="page">
		<button class="${pageInfo.curPage eq page? 'select':'btn' }"
			onclick="submit(${page})">${page}</button>
	</c:forEach>

	<c:choose>
		<c:when test="${pageInfo.curPage<pageInfo.allPage}">
			<button onclick="submit(${pageInfo.curPage+1})">&gt;</button>
		</c:when>
		<c:otherwise>
			<a>&gt;</a>
		</c:otherwise>
	</c:choose>	
</div>
</body>
</html>