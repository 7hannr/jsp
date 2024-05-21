<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
	#login .title {
	width:100px;
	}
</style>
<div class="row justify-content-center my-5" id="login">
	<div class="col-8 col-md-6 col-lg-4">
		<div class="card">
			<div class="card-header">
				<h1>�α���</h1>
			</div>
			<div class="card-body">
				<form name="frm">
					<div class="input-group mb-2">
						<span class="input-group-text title justify-content-center">���̵�</span>
						<input name="uid" class="form-control">
					</div>
					<div class="input-group mb-3">
						<span class="input-group-text title justify-content-center">��й�ȣ</span>
						<input name="upass" class="form-control" type="password">
					</div>
					<div>
						<button class="btn btn-dark w-100">�α���</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		const uid=$(frm.uid).val();
		const upass=$(frm.upass).val();
		if(uid==""){
			alert("���̵� �Է��ϼ���!");
			return;
		}
		if(upass==""){
			alert("��й�ȣ�� �Է��ϼ���!");
			return;
		}
		//�α���üũ
		$.ajax({
				type:"post",
				url:"/user/login",
				data:{uid,upass},
				success:function(data){
					const result=parseInt(data);
					if(result==0){
						alert("���̵� ���������ʽ��ϴ�!");
					}else if(result==2){
						alert("��й�ȣ�� ��ġ�����ʽ��ϴ�!")
					}else if(result==1){
						sessionStorage.setItem("uid",uid);
						const target=sessionStorage.getItem("target");
						if(target){
							location.href=target;
						}else{
							location.href="/";
						}					
					}
				}
		});		
	});
</script>


















