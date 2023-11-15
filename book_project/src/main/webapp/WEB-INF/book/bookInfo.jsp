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
				<div class="small mb-1">${bno.bookNo }</div>
				<h1 class="display-5 fw-bolder">${bno.bookTitle }</h1>
				<div class="fs-5 mb-5">
					<span class="text-decoration-line-through">${bno.bookPrice }</span>
				</div>
				<p class="lead">${bno.bookContent }</p>
				<div class="d-flex">
					<input class="form-control text-center me-3" id="inputQuantity"
						type="text" style="max-width: 3rem" />
					<button class="btn btn-outline-dark flex-shrink-0" type="button">
						<i class="bi-cart-fill me-1"></i><a href="orderListInfo.do">
							구매하기</a>
					</button>
					<button class="btn btn-outline-dark flex-shrink-0" type="submit">
						<i class="bi-cart-fill me-1"></i><a id="addCart" onclick="addCart()"> 장바구니 담기</a>
					</button>
				</div>
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
						<!-- Product image-->
						<img class="card-img-top" src="resources/image/${vo.bookImage }"
							alt="..." />
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${vo.bookTitle }</h5>
								<!-- Product reviews-->
								<!-- Product price-->
								<span class="">${vo.bookPrice }</span>
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<script>
let bno = "${bno.bookNo}";
let uid = "uid";
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
			result.vo;
			alert('장바구니 담기 성공');
		} else{
			alert('장바구니 담기 실패')
		}
		
	})
	});
}

</script>
