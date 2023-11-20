<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>QnA 게시판</h3>

<table class="table" border="1">
	<thead>
		<tr>
			<th>글번호</th> <!-- boardNo -->
			<th>제목</th>  <!-- boardTitle -->  
			<th>작성자</th>  <!-- userId -->
			<th>등록일</th> <!-- boardDate -->
			<th>내용</th>  <!-- boardContent -->
			<th>조회수</th> <!-- boardCnt -->		
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${qnaList }" var="vo">
			<tr>
				<td>${vo.boardNo }</td>
				<td><a href="bookGetBoard.do?bno=${vo.boardNo }">${vo.boardTitle }</a></td>
				<td>${vo.userId }</td>
				<td><fmt:formatDate value="${vo.boardDate }"
						pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>></td>
				<td>${vo.boardContent }</td>
				<td>${vo.boardCnt }</td>		
			</tr>
		</c:forEach>
	
	</tbody>

</table>

<p>
	<a href="bookBoardForm.do">QnA 등록</a>
</p>