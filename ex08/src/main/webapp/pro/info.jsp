<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<ul class="nav nav-tabs my-5" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">������</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">�����л�</button>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
  	<h3 class="text-center">������</h3>
  	<div id="div_cou"></div>
  </div>
  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
  	<h3 class="text-center">�����л�</h3>
  	<div id="div_stu"></div>
  </div>
</div>
<script id="temp_cou" type="x-handlebars-template">
	<table class="table table-borderd table-hover">
		<tr class="text-center">
			<td>���¹�ȣ</td>
			<td>�����̸�</td>
			<td>���ǽð�</td>
			<td>���ǽ�</td>
			<td>��û�ο�</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{lcode}}</td>
			<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</td>
			<td>{{hours}}</td>
			<td>{{room}}</td>
			<td>{{persons}}��/{{capacity}}��</td>
		</tr>
		{{/each}}
	</table>
</script>
<script id="temp_stu" type="x-handlebars-template"> 
	<table class="table table-borderd table-hover text-center">
		<tr>
			<td>�л���ȣ</td>
			<td>�л��̸�</td>
			<td>�л��а�</td>
			<td>�л��г�</td>
			<td>�������</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{scode}}</td>
			<td><a href="/stu/read?scode={{scode}}">{{sname}}</td>
			<td>{{sdept}}</td>
			<td>{{year}}�г�</td>
			<td>{{birthday}}</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=100;
	let key="instructor";
	let word="${pro.pcode}";
	
	getCou();
	function getCou(){
		let key="instructor";
		$.ajax({
			type:"get",
			url:"/cou/list.json",
			data:{page,size,key,word},
			dataType:"json",
			success:function(data){
				console.log("������",data);	
				const temp=Handlebars.compile($("#temp_cou").html());
				$("#div_cou").html(temp(data));
			}
		});
	}
	getStu();
	function getStu(){
		let key="advisor";
		$.ajax({
			type:"get",
			url:"/stu/list.json",
			data:{page,size,key,word},
			dataType:"json",
			success:function(data){
				console.log("�����л�",data);	
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			}
		});
	}
</script>