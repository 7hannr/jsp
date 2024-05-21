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
			<div class="my-3">����:<fmt:formatNumber value="${goods.price}" pattern="#,###��"/></div>
			<div class="my-3">�귣��:${goods.brand}</div>
			<div class="my-3">�����:${goods.regDate}</div>
			<div class="my-3">�������:�����ù�</div>
			<div class="my-3">ī������:�ϳ�ī�� ������ �ִ�3����</div>
			<div class="my-3 text-center">
				<button class="px-3 btn btn-secondary">�ٷα���</button>
				<button class="px-3 btn btn-outline-danger" id="cart">��ٱ���</button>
			</div>
		</div>
	</div>
</div>
<script>
	const gid="${goods.gid}";
	$("#cart").on("click",function(){
		if(uid){
			//��ٱ��ϳֱ�
			$.ajax({
				type:"post",
				url:"/cart/insert",
				data:{uid,gid},
				success:function(data){
					if(data=="true"){
						alert("��ٱ��Ͽ� �־����ϴ�");
					}else{
						alert("��ٱ��Ͽ� �̹� �ִ� ��ǰ�Դϴ�!")
					}
				}
			});
		}else{
			sessionStorage.setItem("target","/goods/read?gid=" + gid);
			location.href="/user/login";
		}
	});
</script>