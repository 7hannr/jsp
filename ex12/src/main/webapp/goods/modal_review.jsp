<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- Modal -->
<div class="modal fade" id="modalReview" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">
					�����ۼ�
				</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input id="rid" type="hidden">
				<textarea id="content" rows="10" class="form-control" placeholder="������ �Է��ϼ���."></textarea>
			</div>
			<div class="text-center my-3">
				<button type="button" class="btn btn-outline-dark px-3 " id="btn-update">����</button>
				<button type="button" class="btn btn-outline-dark px-3 " id="btn-insert">���</button>
				<button type="button" class="btn btn-outline-danger px-3"
				data-bs-dismiss="modal">���</button>
			</div>
		</div>
	</div>
</div>
<script>
	$("#btn-insert").on("click",function(){
		const content=$("#content").val();
		if(content==""){
			alert("���䳻���� �ۼ��ϼ���!");
			$("#content").focus();
		}else{
			//alert(gid + "\n" + uid + "\n" + content);
			$.ajax({
				type:"post",
				url:"/review/insert",
				data:{uid,gid,content},
				success:function(){
					alert("��ϼ���!");
					$("#content").val("");
					$("#modalReview").modal("hide");
					getData();
					//getTotal();
				}
			});
		}
	});
</script>