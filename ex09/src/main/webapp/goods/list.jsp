<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div>
	<h1>��ǰ���</h1>
	<div id="div_shop"></div>
</div>
<script id="temp_shop" type="x-handlebars-template">
	<table class="table table-borderd table-hover">
		<tr class="text-center">
			<td><input type="checkbox" id="all"></td>
			<td>���̵�</td><td colspan=2>��ǰ��</td><td>����</td><td>����</td>
		</tr>
		{{#each .}}
			<td class="text-center"><input type="checkbox" class="chk"></td>
			<td>{{gid}}</td>
			<td><img src={{image}} width="100"></td>
			<td>
				<div class="ellipsis">{{{title}}}</div>
				<div>{{regDate}}</div>
			</td>
			<td>{{price}}</td>
			<td><button class="btn btn-outline-danger delete" gid="{{gid}}">����</button></td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
getData();

//delete button
$("#div_shop").on("click",".delete",function(){
	const gid=$(this).attr("gid");
	if(confirm(gid + "����ǰ�� �����ϽǷ���?")){
		//�����ϱ�
		$.ajax({
			type:"post",
			url:"/goods/delete",
			data:{gid},
			success:function(data){
				if(data=="true"){
					alert("��������");
					getData();
				}else{
					alert("��������");
				}	
			}
		});
	}
});
function getData(){
	$.ajax({
		type:"get",
		url:"/goods/list.json",
		dataType:"json",
		success:function(data){
			const temp=Handlebars.compile($("#temp_shop").html());
			$("#div_shop").html(temp(data));
		}
	});
}
</script>