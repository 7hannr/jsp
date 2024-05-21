<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<div class="row my-5">
		<div class="col">
			<img src="${goods.image}" width="80%">
		
		</div>
		<div class="col">
			<h5>${goods.title}</h5>
			<hr>
			<div class="my-3">가격:<fmt:formatNumber value="${goods.price}" pattern="#,###원"/></div>
			<div class="my-3">브랜드:${goods.brand}</div>
			<div class="my-3">등록일:${goods.regDate}</div>
			<div class="my-3">배송정보:한진택배</div>
			<div class="my-3">카드할인:하나카드 무이자 최대3개월</div>
			<div class="my-3 text-center">
				<button class="px-3 btn btn-secondary">바로구매</button>
				<button class="px-3 btn btn-outline-danger" id="cart">장바구니</button>
			</div>
		</div>
	</div>
</div>
<script>
	const gid="${goods.gid}";
	$("#cart").on("click",function(){
		if(uid){
			//장바구니넣기
			$.ajax({
				type:"post",
				url:"/cart/insert",
				data:{uid,gid},
				success:function(data){
					if(data=="true"){
						alert("장바구니에 넣었습니다");
					}else{
						alert("장바구니에 이미 있는 상품입니다!")
					}
				}
			});
		}else{
			sessionStorage.setItem("target","/goods/read?gid=" + gid);
			location.href="/user/login";
		}
	});
</script>