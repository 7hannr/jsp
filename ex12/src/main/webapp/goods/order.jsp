<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<style>
	span{
		width:100px;
	}
</style>
<div>
	<h1>�ֹ��ϱ�</h1>
	<div id="div_order"></div>
	<div id="div_order_total" class="alert alert-light text-end">�հ�:</div>
	<div class="row justify-content-center my-5">
		<div class="col-10 col-md-8">
			<div class="card">
				<div class="card-header text-center">
					<h3>���������</h3>
				</div>
					<div class="card-body">
						<form name="frm">
						<div class="input-group mb-2">
							<span class="input-group-text">�ֹ��ڸ�</span>
							<input name="rname" class="form-control" value="${user.uname}">
						</div>
						<div class="input-group mb-2">
							<span class="input-group-text">��ȭ��ȣ</span>
							<input name="rphone" class="form-control" value="${user.phone}">
						</div>
						<div class="input-group mb-2">
							<span class="input-group-text">�ּ�</span>
							<input name="raddress1" class="form-control" value="${user.address1}">
							<button class="btn btn-dark">�˻�</button>
						</div>
						<div>
							<input name="raddress2" class="form-control" placeholder="���ּ�" value="${user.address2}">
						</div>
						<input name="sum" type="hidden">
						<div class="text-center my-3">
							<button class="btn btn-dark px-3">�ֹ��ϱ�</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script id="temp_order" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td>��ǰ��ȣ</td>
			<td>��ǰ�̸�</td>
			<td>����</td>
			<td>����</td>
			<td>�ݾ�</td>
		</tr>
		{{#each .}}
		<tr class="text-center goods" gid="{{gid}}" price="{{price}}" qnt="{{qnt}}">
			<td>{{gid}}</td>
			<td class="text-start">
				<img src="{{image}}" width="50px">
				<a href="/goods/read?gid={{gid}}">{{{title}}}</a>
			</td>
			<td>{{sum price 1}}</td>
			<td>{{qnt}}��</td>
			<td>{{sum price qnt}}</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	//�ֹ��ϱ��ư�� Ŭ���Ѱ��
	$(frm).on("submit",function(e){
		e.preventDefault();
		const rname=$(frm.rname).val();
		const rphone=$(frm.rphone).val();
		const raddress1=$(frm.raddress1).val();
		const raddress2=$(frm.raddress2).val();
		const sum=$(frm.sum).val();
		console.log(uid,rname,rphone,raddress1,raddress2,sum)
		const cnt=$("#div_order .goods").length;
		if(!confirm(cnt + "�� ��ǰ���� �ֹ��ϽǷ���?")) return;
		$.ajax({
			type:"post",
			url:"/purchase/insert",
			data:{uid,rname,rphone,raddress1,raddress2,sum},
			success:function(pid){
				//�ֹ���ǰ���
				let order_cnt=0;
				$("#div_order .goods").each(function(){
					const gid=$(this).attr("gid");
					const price=$(this).attr("price");
					const qnt=$(this).attr("qnt");
					console.log(pid,gid,price,qnt);
					$.ajax({
						type:"post",
						url:"/orders/insert",
						data:{pid,gid,price,qnt},
						success:function(){		
							//��ٱ��ϻ���
							$.ajax({
								type:"post",
								url:"/cart/delete",
								data:{uid,gid},
								success:function(){
									order_cnt++;
									if(cnt==order_cnt){
										alert(order_cnt + "�ֹ���ǰ��ϿϷ�!");
										location.href="/";
									}
								}
							});
						}
					});
				});
			}
		});
	});
	
	function getOrder(data){
		const temp=Handlebars.compile($("#temp_order").html());
		$("#div_order").html(temp(data));
		let total=0;
		$(data).each(function(){
			const price=this.price;
			const qnt=this.qnt;
			const sum=price*qnt;
			total += sum;
		});
		$("#div_order_total").html("�հ�:" + total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		$(frm.sum).val(total);
	}
</script>