<%@page import="com.koreait.cobox.model.domain.Stime"%>
<%@page import="com.koreait.cobox.model.domain.Schedule"%>
<%@page import="com.koreait.cobox.model.domain.Theater"%>
<%@page import="com.koreait.cobox.model.domain.Location"%>
<%@page import="com.koreait.cobox.model.domain.Movie"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
List<Movie> movieList = (List) request.getAttribute("movieList");
List<Location> locationList = (List) request.getAttribute("locationList");
List<Theater> theaterList=(List)request.getAttribute("theaterList");
List<Schedule> scheduleList=(List)request.getAttribute("scheduleList");
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/header.jsp"%>
<%@include file="../inc/script.jsp"%>
</head>
<style>
* {
  box-sizing: border-box;
}

/* Create four equal columns that floats next to each other */
.column {
  float: left;
  width: 25%;
  padding: 10px;
  height: 400px; /* Should be removed. Only for demonstration */
  overflow:scroll;
  text-align: center;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
img{
   padding: 14px;
   width:100%;
   height:200px;
}

/* Style the tab */
.tab {
  float: left;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
  width: 20%;
  height: 400px;
}

/* Style the buttons inside the tab */
.tab input[type=button] {
  display: block;
  background-color: inherit;
  color: black;
  padding: 22px 16px;
  width: 100%;
  border: none;
  outline: none;
  text-align: left;
  cursor: pointer;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab input[type=button]:hover {
  background-color: #ddd;
}

/* Create an active/current "tab button" class */
.tab input[type=button].active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  float: left;
  padding: 0px 12px;
  border: 1px solid #ccc;
  width: 100%;
  border-left: none;
  height: 100px;
  overflow:scroll;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function () {
	$(".movie_poster").click(function () {
		getTheaterList(this);
	});
		
});
//비동기 극장가져오기
/* function getTheaterList(obj) {
   alert("dd",$(obj).val());
   $.ajax({
      url:"/client/movie/theater",
      type:"get",
      data:{
    	  movie_id:$(obj).val()
      },  
      success:function(result){
         //alert("서버로 부터 받은 결과는 "+result);
         $(".tabcontent").empty();
            
         for(var i=0;i<result.length;i++){
            var schedule=result[i];
            $(".tabcontent").append("<input type=\"button\" value="+schedule.box.theater.theater_name+">");
         } 
      } 
   });
} */

function next(){
   if (confirm("좌석선택 단계로 넘어가시겠습니까??")) {
      var form = document.querySelector("form");
      form.action="/client/movie/reserRegist";
      form.method="post";
   }
   form.submit();
}

function myFunction(imgs) {
  var expandImg = document.getElementById("expandedImg");
  var imgText = document.getElementById("imgtext");
  expandImg.src = imgs.src;
  imgText.innerHTML = imgs.alt;
  expandImg.parentElement.style.display = "block";
}


$(function() {
   var selectLocation = document.getElementById("selectLocation");
   for (var i = 0; i < 8; i++) {
      $("#location_id"+i).click(function(obj) {
         //alert($(this).text());
         selectLocation.innerHTML =$(this).text();
      });
   }
});


function date_click(){
	var d=document.getElementById("sdate").value;
	document.getElementById("selectdate").innerHTML=d;
}
function time_click(){
	var t=document.getElementById("stime").value;
	document.getElementById("selecttime").innerHTML=t;
}
</script>
<%@include file="../inc/top.jsp"%>
<body>
   <section class="container">
   <form id="movie_form">
      <h2 class="page-heading">Reservation</h2>
      <div class="order-step-area">
         <div class="order-step first--step">1.영화/상영관/날짜</div>
         <div class="order-step second--step order-step--disable">2.좌석선택</div>
           <div class="order-step third--step order-step--disable">3.결제하기</div>
      </div>
      
		<div class="row">
		  <div class="column" style="background-color:#aaa;">
      	<%for(int i=0;i<scheduleList.size();i++){ %>
      	<%Schedule schedule=scheduleList.get(i); %>
		    <img onclick="myFunction(this)" name="movie_id" id="<%=schedule.getMovie().getMovie_id()%>" src="/resources/data/movie/<%=schedule.getMovie().getMovie_id()%>.<%=schedule.getMovie().getPoster() %>" alt="<%=schedule.getMovie().getMovie_name() %>" class="movie_poster">
             <a href="/client/movie/detail?movie_id=<%=schedule.getMovie().getMovie_id()%>" style="font-size:25px;margin-top:10px"><%=schedule.getMovie().getMovie_name() %></a>
		<%} %>
		  </div>
		  
			<div class="tab">
			<%for(int i=0;i<scheduleList.size();i++){ %>
			<%Schedule schedule=scheduleList.get(i); %>
			<%if(i==0){%>
			  <input type="button" class="tablinks" onclick="openCity(event, '<%=schedule.getBox().getTheater().getLocation().getLoc_name()%>')" id="defaultOpen" value="<%=schedule.getBox().getTheater().getLocation().getLoc_name()%>"/>
		  	<%} else{%>
		  	  <input type="button" class="tablinks" onclick="openCity(event, '<%=schedule.getBox().getTheater().getLocation().getLoc_name()%>')" value="<%=schedule.getBox().getTheater().getLocation().getLoc_name()%>"/>
		  	<%} %>
			<div id="<%=schedule.getBox().getTheater().getLocation().getLoc_name()%>" class="tabcontent">
			<input type="button" value="<%=schedule.getBox().getTheater().getTheater_name()%>">
			</div>
			  <%} %>
			</div>
			
		  <div class="column" style="background-color:#ccc;">
		    <select>
			<%for(int i=0;i<scheduleList.size();i++){ %>
			<%Schedule schedule=scheduleList.get(i); %>
		    	<option value="<%=schedule.getSdate().getSdate_id()%>"><%=schedule.getSdate().getDatepicker() %></option>
		    <%} %>
		    </select>
		  </div>
		  
		  <div class="column" style="background-color:#ddd;">
 		    <img id="expandedImg">
		    <span id="imgtext"></span>
		    <p>Some text..</p>
		  </div>
		</div>
      </form>
   </section>
   <%@include file="../inc/footer.jsp"%>
	<script>
	function openCity(evt, cityName) {
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
	
	// Get the element with id="defaultOpen" and click on it
	document.getElementById("defaultOpen").click();
	</script>
</body>
</html>