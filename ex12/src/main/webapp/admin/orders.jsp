<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div>
	<h1>�ֹ�����</h1>
	<div id="div_purchase"></div>
	<jsp:include page="/user/modal_orders.jsp"/>
</div>
<script id="temp_purchase" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td>�ֹ���ȣ</td>
			<td>�ֹ���</td>
			<td>��ȭ</td>
			<td>�ֹ���</td>
			<td>�ݾ�</td>
			<td>����</td>
			<td>�ֹ���ǰ</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{pid}}</td>
			<td>{{uname}}({{uid}})</td>
			<td>{{phone}}</td>
			<td>{{pdate}}</td>
			<td>{{sum sum 1}}��</td>
			<td>
				<div class="input-group">
				<select class="form-select status">
					<option value="0"{{selected status 0}}>�������</option>
					<option value="1"{{selected status 1}}>����Ȯ��</option>
					<option value="2"{{selected status 2}}>����غ�</option>
					<option value="3"{{selected status 3}}>��ۿϷ�</option>
					<option value="4"{{selected status 4}}>�ֹ��Ϸ�</option>
				</select>
					<button class="btn btn-outline-dark update" pid="{{pid}}">����</button>
				</div>
			</td>
			<td><button class="btn btn-dark btn-sm orders" 
					pid="{{pid}}" address1="{{address1}}" address2="{{address2}}">�ֹ���ǰ</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	Handlebars.registerHelper("sum",function(price,qnt){
		const sum = price * qnt;
		return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");  
	});
	Handlebars.registerHelper("selected",function(status,value){
		if(status == value) return "selected"
	});
</script>
<script>
	let key="uid";
	let word="";
	let page=1;
	let size=5;
	
	//���º��� ��ư�� Ŭ���� ���
	$("#div_purchase").on("click", ".update", function(){
		const pid=$(this).attr("pid");
		const status=$(this).parent().find(".status").val();
		//alert(pid + "............." + status);
		if(!confirm("�ֹ����¸� �����ϽǷ���?")) return;
		$.ajax({
			type:"post",
			url:"/admin/order/update",
			data:{pid, status},
			success:function(){
				alert("����Ϸ�!");
				getData();
			}
		});
	});
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/admin/order/list.json",
			data:{key, word, page, size},
			dataType:"json",
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_purchase").html());
				$("#div_purchase").html(temp(data));
			}
		});	
	}
</script>