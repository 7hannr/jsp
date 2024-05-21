<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div>
	<h1>��ǰ�˻�</h1>
	<div class="row mb-2">
		<div class="col">
			<button class="btn btn-outline-secondary" id="insert">��������</button>
		</div>
		<form name="frm" class="col-8 col-md-5">
			<div class="input-group">
				<input name="query" class="form-control" value="��">
				<button class="btn btn-outline-secondary">�˻�</button>
			</div>
		</form>
	</div>
	<div id="div_shop"></div>
	<div class="text-center">
		<button id="prev" class="btn btn-secondary">����</button>
		<span id="page" class="mx-3">1</span>
		<button id="next" class="btn btn-secondary">����</button>
	</div>
</div>

<script id="temp_shop" type="x-handlebars-template">
	<table class="table table-bordered table-hover">
		<tr class="text-center">
			<td><input type="checkbox" id="all"></td>
			<td>���̵�</td><td colspan=2>��ǰ��</td><td>��ǰ����</td><td>����</td>
		</tr>
		{{#each items}}
		<tr gid="{{productId}}" img="{{image}}" title="{{title}}" brand="{{brand}}" price="{{lprice}}">
			<td class="text-center"><input type="checkbox" class="chk"></td>
			<td>{{productId}}</td>
			<td><img src={{image}} width="50"></td>
			<td><div class="ellipsis">{{{title}}}</div></td>
			<td>{{lprice}}</td>
			<td><button class="btn btn-secondary insert">����</button></td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let query=$(frm.query).val();
	let page=1;
	let size=5;
	
	
	//�������� ��ư�� Ŭ���� ���
	$("#insert").on("click", function(){
		let chk=$("#div_shop .chk:checked").length;
		if(chk==0){
			alert("������ ��ǰ���� �����ϼ���!");
			return;
		}
		if(!confirm(chk + "�� ��ǰ�� ����ϽǷ���?")) return;
		//��ǰ���
		let cnt=0;
		let success=0;
		$("#div_shop .chk:checked").each(function(){
			let tr=$(this).parent().parent();
			let gid=tr.attr("gid");
			let title=tr.attr("title");
			let image=tr.attr("img");
			let price=tr.attr("price");
			let brand=tr.attr("brand");
			console.log(gid, title, image, price, brand);
			$.ajax({
				type:"post",
				url:"/goods/insert",
				data:{gid, title, image, price, brand},
				success:function(data){
					cnt++;
					if(data=="true") success++;
					if(chk==cnt){
						alert(success + "�� ��ǰ ��ϼ���!");
						getData();
					}
				}
			});
		});
	});
	
	//��ü���� üũ�ڽ��� Ŭ���� ���
	$("#div_shop").on("click", "#all", function(){
		if($(this).is(":checked")){
			$("#div_shop .chk").each(function(){
				$(this).prop("checked", true);
			});
		}else{
			$("#div_shop .chk").each(function(){
				$(this).prop("checked", false);
			});
		}
	});
	
	//������ üũ�ڽ��� Ŭ���� ���
	$("#div_shop").on("click", ".chk", function() {
		let all=$("#div_shop .chk").length;
		let chk=$("#div_shop .chk:checked").length;
		if(chk==all) {
			$("#div_shop #all").prop("checked", true);
		}else{
			$("#div_shop #all").prop("checked", false);
		}
	});
	
	//�����ư�� Ŭ���� ���
	$("#div_shop").on("click", ".insert", function(){
		let tr=$(this).parent().parent();
		let gid=tr.attr("gid");
		let title=tr.attr("title");
		let image=tr.attr("img");
		let price=tr.attr("price");
		let brand=tr.attr("brand");
		console.log(gid, title, image, price, brand);
		//��ǰ���
		$.ajax({
			type:"post",
			url:"/goods/insert",
			data:{gid, title, image, price, brand},
			success:function(data){
				if(data=="true"){
					alert("�Է¼���!")
				}else{
					alert("�̵̹���� ��ǰ�Դϴ�!");
				}
			}
		});
	});
	
	$("#next").on("click", function(){
		page++;
		getData();
	});
	
	$("#prev").on("click", function(){
		page--;
		getData();
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		page=1;
		query=$(frm.query).val();
		getData();
	});
	
	getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/goods/search.json",
			dataType:"json",
			data: {query, page, size},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
				
				$("#page").html(page);
				if(page==1) $("#prev").attr("disabled", true);
				else $("#prev").attr("disabled", false);
				if(page==10) $("#next").attr("disabled", true);
				else $("#next").attr("disabled", false);
			}
		});
	}
</script>