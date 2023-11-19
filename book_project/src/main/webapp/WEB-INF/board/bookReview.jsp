<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<h3>책 리뷰</h3>

<table class="table" border="1" style="width:800px;">
	<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>내용</th>
			<th>조회수</th>
		</tr>
	<tbody>
		<c:forEach items="${bookReviewList }" var="vo">
				<tr>
					<td>${vo.boardNo }</td>
					<td><a href="GetBoard.do?bno${vo.boardNo }">${vo.boardTitle }</a>
					<td>${vo.userId }</td>
					<td><fmt:formatDate value="${vo.boardDate }"
							 pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
					<td>${vo.boardContent }</td>
					<td>${vo.boardCnt }</td>
				</tr>
		</c:forEach>
	</tbody>
	
</table>

<p>
	<a href="bookBoardForm.do">리뷰 등록</a>
</p>