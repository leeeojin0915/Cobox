<%@page import="com.koreait.cobox.model.domain.Stime"%>
<%@page import="com.koreait.cobox.model.domain.Schedule"%>
<%@page import="com.koreait.cobox.model.domain.Location"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%Schedule schedule=(Schedule)request.getAttribute("schedule"); %>
<%List<Location> locationList=(List)request.getAttribute("locationList"); %>
<%-- <%out.print("요청객체에 담겨진 schedule_id"+schedule.getSchedule_id()); %> --%>
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
	$(".timepicker").timepicki();

});
//시간추가
function addTimes(){
	//alert("눌러?",i);
	
	var time="<div id=\"addTime\">";
	time+="<div class=\"removeTime\" id=\"index\" onClick=\"removeTimes()\">X</div>";
	time+="<input id=\"timepicker\" type=\"text\" name=\"stime["+t+"].timepicker\" placeholder=\"시간선택\" class=\"timepicker\"/>";
	time+="</div>";
	$(".box").append(time);
	$("input[name='stime["+t+"].timepicker']").timepicki();
	
	t++;
}

//시간삭제
function removeTimes() {
	$("#index").parent().remove();
}
//스케줄 수정
function edit() {
	//동기방식 업로드
	if(confirm("스케줄수정할까요?")){
		$("form").attr({
			action:"/admin/schedule/edit",
			method:"post",
		});
		$("form").submit();
	}
}
//스케줄삭제
function del() {
	//동기방식 업로드
	if(confirm("스케줄삭제할까요?")){
		$("form").attr({
			action:"/admin/schedule/delete",
			method:"get",
		});
		$("form").submit();
	}
}
</script>
<body>
<h3><%=schedule.getMovie().getMovie_name() %></h3>

<div class="container">
  <form>
  	<input type="hidden" name="schedule_id" value="<%=schedule.getSchedule_id()%>"/>
    <select>
      <option value="<%=schedule.getBox().getTheater().getTheater_id()%>"><%=schedule.getBox().getTheater().getTheater_name()%></option>
    </select>
    
    <select name="box.box_id">
      <option value="<%=schedule.getBox().getBox_id()%>"><%=schedule.getBox().getBox_name() %></option>
    </select>
    
    <select name="movie.movie_id">
      <option value="<%=schedule.getMovie().getMovie_id()%>"><%=schedule.getMovie().getMovie_name() %></option>
    </select>
    
    <input type="text" name="datepicker" placeholder="날짜선택" id="datepicker1" value="<%=schedule.getSdate().getDatepicker()%>">
    
    <input type="button" value="추가" onClick="addTimes()">
    
    <div class="box">
    	<%for(int i=0;i<schedule.getStimeList().size();i++){ %>
    	<%Stime stime=schedule.getStimeList().get(i); %>
    	<div id="addTime">
		    <div class="removeTime" id="index" onClick="removeTimes()">X</div>
		    <input id="timepicker" type="text" name="stime[<%=i %>].timepicker" placeholder="시간선택" value="<%=stime.getTimepicker()%>" class="timepicker"/>
    	</div>
    	<%} %>
    </div> 
    <input type="button" value="수정" onClick="edit()">
    <input type="button" value="삭제" onClick="del()">
    <input type="button" value="취소">
  </form>
</div>
</body>
</html>