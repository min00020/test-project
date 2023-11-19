<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<section class="py-5">
	<div class="container px-4 px-lg-5 my-5">
		<div class="row gx-4 gx-lg-5 align-items-center">
			<div class="col-md-6">
				<img class="card-img-top mb-5 mb-md-0"
					src="resources/image/${bno.bookImage }" alt="..." />

			
			</div>
			<div class="col-md-6">
				<h1 class="display-5 fw-bolder">${bno.bookTitle }</h1>
				<div class="fs-5 mb-5">
					<span>가격: ${bno.bookPrice }원</span>
					<p></p>
					<a style="font-size: 15px;">지은이: ${bno.bookWriter }</a><br>
					<a style="font-size: 15px;">출판사: ${bno.bookPublisher }</a><br>
					<a style="font-size: 15px;">분야: ${bno.bookSort }</a>
				</div>
				<h3>책소개</h3>
				<p class="lead">${bno.bookContent }</p>

				<div class="d-flex">
					<input class="form-control text-center me-3" id="inputQuantity"
						type="text" style="max-width: 3rem" />
					<button class="btn btn-outline-dark flex-shrink-0" type="button">

						<i class="bi-cart-fill me-1"></i> cart

						<i class="bi-cart-fill me-1"></i><a href="orderListInfo.do">
							구매하기</a>
					</button>
					<button class="btn btn-outline-dark flex-shrink-0" type="submit">
						<i class="bi-cart-fill me-1"></i><a id="addCart" onclick="addCart()"> 장바구니 담기</a>

					</button>
				</div>
			</div>
		</div>
	


</section>
<!-- Related items section-->
<section class="py-5 bg-light">
	<div class="container px-4 px-lg-5 mt-5">
		<h2 class="fw-bolder mb-4">Another book</h2>
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			

			<c:forEach items="${list }" var="vo" end="3">

				<!-- 상품목록 -->
				<div class="col mb-5">
					<div class="card h-100">

						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem"></div>

						<!-- Product image-->
						<img class="card-img-top" src="resources/image/${vo.bookImage }"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->

								<!-- Product reviews-->

								<!-- Product price-->
								<span class="">${vo.bookPrice }원</span>

								
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="bookInfo.do?bno=${vo.bookNo }">Cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
 	<div class="container px-4 px-lg-5 mt-5">
		<div class="wrap_review">
			<h2>리뷰 작성</h2>
			<form name="reviewform" class="reviewform">
				<label>작성자 <input name="userId" value="${userId }" readonly></label>
				<div class="review">
					<label>서비스
						<select name="starservice" id="starservice">
							<option value="5">5</option>
							<option value="4">4</option>
							<option value="3">3</option>
							<option value="2">2</option>
							<option value="1">1</option>
						</select>
					</label>
				</div>
				<div class="review_contents">
					<textarea rows="10" name="writecontent" class="review_textarea"></textarea>
				</div>
				<div class="cmd">
					<input type="button" id="addreview" onclick="addReview()" value="리뷰작성">
				</div>
			</form>
		</div>
	</div>

	<div class="container px-4 px-lg-5 mt-5">
		<h2>리뷰 목록</h2>
		<table>
			<thead>
				<tr class="table_head">
					<td>작성자</td>
					<td>리뷰 내용</td>
					<td>작성일자</td>
					<td></td>
					<td></td>
				</tr>
			</thead>
			<tbody id="reviewList">
				<tr id="template" style="display: none;">
					<td>작성자</td>
					<td class="review_content">리뷰 내용</td>
					<td>작성일자</td>
					<td class="like">좋아요수</td>
					<td><input type="button" id="likereview" value="좋아요"></td>
					<td><button id="delreview">삭제</button></td>
				</tr>
			</tbody>
		</table>
	</div>
	
</section>
<script>
let bno = "${bno.bookNo}";
let uid = "${id}";
let amount = document.querySelector('#inputQuantity').value;

// 장바구니 담기
function addCart() {

	amount = document.querySelector('#inputQuantity').value;
	
	document.querySelector('#addCart').addEventListener('click', function(e){
	fetch('addCart.do', {
		method: 'post',
		headers: {'Content-type': 'application/x-www-form-urlencoded'},
		body: 'bno=' + bno + '&uid=' + uid + '&amount=' + amount
	})
	.then(resolve => resolve.json())
	.then(result =>{
		if(result.retCode == 'OK'){
			alert('장바구니 담기 성공');
			result.vo;
		} else{
			
		}
		
	})
	});
}
function addReview(){
	
	
}



</script>