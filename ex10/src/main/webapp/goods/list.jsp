<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <style>
    #div_shop img{
    	cursor:pointer;
    	border-radius:10px;
    }
   #size { 
      width:100px;
      float: right;
   }
   .page-link {
     color: #000; 
     background-color: #fff;
     border: 1px solid #fff;
     border-radius : 15%; 
   }
   
   .page-item.active .page-link {
    z-index: 1;
    color: #4A6BD6;
    font-weight:bold;
    background-color: #f1f1f1;
    border-color: #ccc;
    
   }
   
   .page-link:focus, .page-link:hover {
     color: #000;
     background-color: #fafafa; 
     border-color: #ccc;
   }
</style>
<div>
	<h1>��ǰ���</h1>
	<div class="row mb-2">
		<div class="col">
			<button class="btn btn-outline-danger" id="delete">���û���</button>
		</div>
		<div class="col">
			<form name="frm">
				<div class="input-group">
					<span id="total" class="me-2 mt-2"></span>
					<input class="form-control" placeholder="�˻���" name="word">
					<button class= "btn btn-outline-secondary">�˻�</button>
				</div>
			</form>
		</div>
	</div>
	<div id="div_shop"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_shop" type="x-handlebars-template">
	<table class="table table-borderd table-hover">
		<tr class="text-center">
			<td><input type="checkbox" id="all"></td>
			<td>���̵�</td><td colspan=2>��ǰ��</td><td>����</td><td>����</td>
		</tr>
		{{#each .}}
			<td class="text-center"><input type="checkbox" class="chk" gid="{{gid}}"></td>
			<td>{{gid}}</td>
			<td><img src={{image}} width="100" index="{{@index}}"></td>
			<td>
				<div class="ellipsis">{{{title}}}</div>
				<div>{{regDate}}</div>
			</td>
			<td>{{price}}</td>
			<td><button class="btn btn-outline-danger delete" gid="{{gid}}">����</button>
			<jsp:include page="modal_image.jsp"/>
			</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=5;
	let word="";
	//getData();
	getTotal();
	
	//�̹����� Ŭ��������
	$("#div_shop").on("click", "img", function(){
		const index=$(this).attr("index");
		$("#modal" + index).modal("show");
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		word=$(frm.word).val();
		//getData();
		page=1;
		getTotal();
	});
	
	//���û�����ư�� Ŭ���Ѱ��
	$("#delete").on("click", function(){
		const chk=$("#div_shop .chk:checked").length;
		if(chk==0) {
			alert("������ ��ǰ�� �����ϼ���!");
			return;
		}
		if(!confirm(chk + "�� ��ǰ�� �����ϽǷ���?")) return;
		//�����ϱ�
		let cnt=0;
		let success=0;
		$("#div_shop .chk:checked").each(function(){
			const gid=$(this).attr("gid");
			$.ajax({
				type:"post",
				url:"/goods/delete",
				data:{gid},
				success:function(data){
					cnt++;
					if(data=="true") success++;
					if(cnt==chk) {
						alert(success + "�� ��ǰ�� �����Ǿ����ϴ�.");
						//getData();
						getTotal();
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
	$("#div_shop").on("click", ".chk", function(){
		const all=$("#div_shop .chk").length;
		const chk=$("#div_shop .chk:checked").length;
		if(all==chk){
			$("#div_shop #all").prop("checked", true);
		}else{
			$("#div_shop #all").prop("checked", false);
		}
	});
	
	
	//������ư�� Ŭ���� ���
	$("#div_shop").on("click",".delete", function(){
		const gid=$(this).attr("gid");
		if(confirm(gid + "�� ��ǰ�� �����ϽǷ���?")){
			//�����ϱ�
			$.ajax({
				type:"post",
				url:"/goods/delete",
				data:{gid},
				success:function(data){
					if(data=="true"){
						alert("��������!");
						//getData();
						getTotal();
					}else{
						alert("��������!");
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
			data:{word, page, size},
			success:function(data){
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
			}
		});
	}
	
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/goods/total",
			data:{word},
			success:function(data){
				const total=parseInt(data);
				if(total==0) {
					alert("�˻��� ��ǰ�� �����ϴ�!");
					return;
				}
				const totalPage=Math.ceil(total/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				if(total > size){
					$("#pagination").show();
				}else{
					$("#pagination").hide();
				}
				$("#total").html("�˻���: " + total);
			}
		});
	}
$('#pagination').twbsPagination({
	totalPages:10, 
	visiblePages: 5, 
	startPage : 1,
	initiateStartPageClick: false, 
	first:'<i class="bi bi-arrow-left-circle-fill"></i>', 
	prev :'<i class="bi bi-arrow-left-circle"></i>',
	next :'<i class="bi bi-arrow-right-circle"></i>',
	last :'<i class="bi bi-arrow-right-circle-fill"></i>',
	onPageClick: function (event, clickPage) {
		 page=clickPage; 
		 getData();
	}
});

</script>