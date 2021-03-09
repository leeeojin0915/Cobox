<%@page import="com.koreait.cobox.model.domain.Stime"%>
<%@page import="com.koreait.cobox.model.domain.Schedule"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%List<Schedule> scheduleList=(List)request.getAttribute("scheduleList");
	// Schedule scheduleTime=(Schedule)request.getAttribute("schedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/main_navi.jsp" %>
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/resources/admin/images/searchicon.png');
  background-position: 10px 8px;
  background-repeat: no-repeat;
  background-size:25px;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
<body>
<h2>영화 스케줄</h2>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.." title="Type in a name">

<table id="myTable">
  <tr class="header">
    <th style="width:10%;">영화관</th>
    <th style="width:10%;">상영관</th>
    <th style="width:10%;">영화제목</th>
    <th style="width:10%;">상영날짜</th>
    <th style="width:60%;">상영시간</th>
  </tr>
  <%for(int i=0;i<scheduleList.size();i++){ 
  		Schedule schedule=scheduleList.get(i);%>
  <tr>
    <td><%=schedule.getBox().getTheater().getTheater_name()%></td>
    <td><%=schedule.getBox().getBox_name() %></td>
    <td><a href="/admin/schedule/detail?schedule_id=<%=schedule.getSchedule_id()%>"><%=schedule.getMovie().getMovie_name()%></td>
    <td><%=schedule.getSdate().getDatepicker()%></td>
   	<td>
   		<%for(int a=0;a<schedule.getStimeList().size();a++){ %>
		<%Stime stime=schedule.getStimeList().get(a); %>
   		<span>|<%=stime.getTimepicker()%></span>
		<%} %>
	</td>
  	<%} %>
  </tr>

</table>
</body>
</html>