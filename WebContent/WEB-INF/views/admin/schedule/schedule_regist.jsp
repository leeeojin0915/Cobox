<%@page import="com.koreait.cobox.model.domain.Location"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%List<Location> locationList=(List)request.getAttribute("locationList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/main_navi.jsp" %>
<style>
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
/*시간  */
 /* .box{
	width:300px;
}  */
#addTime{
	width:200px;
	position:relative;
}
.removeTime{
	width:4%;
	position:absolute;
	left:200px;
	margin:10px;
}
</style>
<!-- 달력 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script type='text/javascript'src='/resources/admin/js/timepicki.js'></script>
<script>
var t=1;
$(function() {
	//달력생성
	$("#datepicker1").datepicker({
		dateFormat : 'yy-mm-dd'
	});
	//시간생성
	$("#timepicker").timepicki();
	
	//비동기로 극장가져오기
	$($("select")[0]).change(function(){
		gettheaterList(this);
	});
	//비동기로 상영관가져옥;
	$($("select")[1]).change(function(){
		getboxList(this);
	});
	//비동기로 영화목록가져옥;
	$($("select")[2]).change(function(){
		getMovieList(this);
	});
	
});
//비동기로 극장가져오기
function gettheaterList(obj) {
	//alert($(obj).val());
	$.ajax({
		url:"/admin/schedule/theaterlist",
		type:"get",
		data:{
			location_id:$(obj).val()
		},
		success:function(result){
			//alert("서버로부터 받은 결과는 "+result);
			
			$($("select")[1]).empty();
			$($("select")[1]).append("<option>극장선택</option>");
			
			for(var i=0;i<result.length;i++){
				var theater=result[i];
				$($("select")[1]).append("<option value=\""+theater.theater_id+"\">"+theater.theater_name+"</option>");
			}
		}
	});
}
//비동기로 상영관가져오기
function getboxList(obj) {
	//alert($(obj).val());
	$.ajax({
		url:"/admin/schedule/boxlist",
		type:"get",
		data:{
			theater_id:$(obj).val()
		},
		success:function(result){
			//alert("서버로부터 받은 결과는 "+result);
			
			$($("select")[2]).empty();
			$($("select")[2]).append("<option>상영관선택</option>");
			
			for(var i=0;i<result.length;i++){
				var box=result[i];
				$($("select")[2]).append("<option value=\""+box.box_id+"\">"+box.box_name+"</option>");
			}
		}
	});
}
//비동기로 영화목록가져오기
function getMovieList(obj) {
	//alert($(obj).val());
	$.ajax({
		url:"/admin/schedule/movielist",
		type:"get",
		data:{
			movie_id:$(obj).val()
		},
		success:function(result){
			//alert("서버로부터 받은 결과는 "+result);
			
			$($("select")[3]).empty();
			$($("select")[3]).append("<option>영화선택</option>");
			
			for(var i=0;i<result.length;i++){
				var movie=result[i];
				$($("select")[3]).append("<option value=\""+movie.movie_id+"\">"+movie.movie_name+"</option>");
			}
		}
	});
}
//시간추가
function addTimes(){
	//alert("눌러?",i);
	
	var time="<div id=\"addTime\">";
	time+="<div class=\"removeTime\" id=\"index\" onClick=\"removeTimes()\">X</div>";
	time+="<input id=\"timepicker\" type=\"text\" name=\"stime["+t+"].timepicker\" placeholder=\"시간선택\"/>";
	time+="</div>";
	$(".box").append(time);
	$("input[name='stime["+t+"].timepicker']").timepicki();
	
	t++;
}

//시간삭제
function removeTimes() {
	$("#index").parent().remove();
}
//스케줄 등록
function registSchedule() {
	/*
	var formData=new FormData($("form")[0]);
	

	/*
 	for(var a=0;a<stime.length;a++){
		formData.append("stime["+a+"].timepicker",stime[a]);
	} 
	$.ajax({
		url:"/admin/schedule/regist",
		data:formData,
		type:"post",
		success:function(responseData){
			alert(responseData);
			var json=JSON.parse(responseData);
			if(json.result==1){
				alert(json.msg);
				location.href="/admin/schedule/list"
			}else{
				alert(json.msg);
			}
		}
	});
	*/
	//동기방식 업로드
	$("form").attr({
		action:"/admin/schedule/regist",
		method:"post",
	});
	$("form").submit();
}
</script>
<body>
<h3>극장등록</h3>

<div class="container">
  <form>
    <select>
      <option>지역선택</option>
      <%for(int i=0;i<locationList.size();i++){ 
      		Location location=locationList.get(i);
      %>
      <option value="<%=location.getLocation_id()%>"><%=location.getLoc_name()%></option>
      <%} %>
    </select>
    
    <select>
      <option>극장선택</option>
    </select>
    
    <select name="box.box_id">
      <option>상영관선택</option>
    </select>
    
    <select name="movie.movie_id">
      <option>영화선택</option>
    </select>
    
    <input type="text" name="datepicker" placeholder="날짜선택" id="datepicker1">
    
    <input type="button" value="추가" onClick="addTimes()">
    
    <div class="box">
    	<div id="addTime">
		    <div class="removeTime" id="index" onClick="removeTimes()">X</div>
		    <input id="timepicker" type="text" name="stime[0].timepicker" placeholder="시간선택"/>
    	</div>
    </div> 
    
    <input type="button" value="등록" onClick="registSchedule()">
    <input type="button" value="취소">
  </form>
</div>
</body>
</html>