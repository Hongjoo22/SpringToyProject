<%@page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!-- <h1>
	THIS IS boardlist
</h1> -->
<div class="container" >
<div id="_showtable"></div>
</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	 $.ajax({
		url: "${root}/board/showboardlist",
		type: "GET",
		success: function(result){
			boardlist(result);
		}
	}); 

});

function boardlist(result){
	$("#_showtable").empty();
	var str="<table id='_table' class='table table-hover'>";
	str += "<col width='10%'>";
	str += "<col width='40%'>";
	str += "<col width='20%'>";
	str += "<col width='30%'>";
	str += "<thead> <tr>";
	str += "<th>번호</th>";
	str += "<th>제목</th>";
	str += "<th>작성자</th>";
	str += "<th>작성일</th>";
	str += "</tr> </thead>";
	str += "<tbody>";
	$(result).each(function(index,item){
		str += "<tr>";
		str += "<td>";
		str += (index+1);
		str += "</td>";
		str += "<td>";
		str += "<a href='boarddetail?articleno="+item.articleno+"' >"+item.title+"</a>";
		str += "</td>";
		str += "<td>";
		str += item.userid;
		str += "</td>";
		str += "<td>";
		str += item.regtime;
		str += "</td>";
		str += "</tbody> </tr>";
	});
	str+="</table>";
	$("#_showtable").html(str);
}
</script>
</html>