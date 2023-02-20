<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
</head>

<style>
table{
border-collapse:collapse;
}
h2{
	color: white;
}
a{
text-decoration:none;
color: white;
	}	
a:visited { color: white; }
a:hover { color: #FF8C00; }

li{
color: #FFFFFF;
}
img{
	display:bolck;
	float: left;
}
#menu1 {
	width:1250px; height:10px;
	margin: 15px 200px;
	padding: 4px;
	}
#menu ul{
	width:500px;
	margin:0 auto;
	overflow: hidden;
	}	
li{
	list-style:none;
}
#menu1 ul li a{
	display:block;
	}
#menu1 ul li a: hover {
	color:#FF8C00
	}	
#menu1 ul li {
float: left;
width:13%;
height: 150%;
line-height:10px;
text-align:center;
}

.search {
float:right;
}
.logout{
	display: inline-block;
	align: "center";	
}
ul :last-child li {
  height:"44px"; 
  width:"200px";
}
#logout { 
		display: inline-block;
        width: 700px;
}
</style>
<body bgcolor="black">

<a href="main.do?user_id=${user_id}"><img src="images/logo.png" height="44px" width="200px" style="padding: 0 30px"></a>
<div id="menu1">
	<ul>
		<li><a href="">TV 프로그램</a></li>
		<li><a href="">영화</a></li>
		<li><a href="">최신 콘텐츠</a></li>
		<li><a href="">즐겨찾기</a></li>
		<li ><a id="logout" href="logout.do" style="color: red">로그아웃</a></li>
	</ul>
</div>


<div class="search" align="right" style="margin: -25px auto; padding: 4px;">
<!-- 검색 파트 -->
	<form action="search.do?user_id=${user_id}" method="post">
	<table border="1" style="width:700;">
		<tr>
			<td align="right">
				<select name="searchCondition">
					<c:forEach items="${conditionMap}" var="option">
						<option value="${option.value}">${option.key}
					</c:forEach>
				</select>
				<input type="text" name="searchKeyword"/>
				<input type="submit" value="검색"/>
			</td>
		</tr>
	</table>
	</form>
	<!-- 검색 파트 종료 -->
	
</div>


<br><br><br>
<h2 style="padding:0 40px">즐겨찾기</h2>
<div>
	<ul>
		<c:forEach items="${ottFavoriteList }" var="ott">
			<li ><a href="getOtt.do?ott_id=${ott.id}&user_id=${user_id}"><img src="poster/${ott.poster}" width="170px" height="244px" style="inline-block ">
			</a></li>
		</c:forEach>		
	</ul>	
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>


<h2 style="padding:0 40px">드라마</h2>
<div>
	<ul>
		<c:forEach items="${ottDramaList }" var="ott">
			<li ><a href="getOtt.do?ott_id=${ott.id}&user_id=${user_id}"><img src="poster/${ott.poster}" width="170px" height="244px" style="inline-block ">
			</a></li>
		</c:forEach>		
	</ul>	
</div>


<br><br><br><br><br><br><br><br><br><br><br><br>



<h2 style="padding:0 40px">액션/스릴러</h2>
<div>
	<ul>
		<c:forEach items="${ottActionList }" var="ott">
			<li ><a href="getOtt.do?ott_id=${ott.id}&user_id=${user_id}"><img src="poster/${ott.poster}" width="170px" height="244px" style="inline-block ">
			</a></li>
		</c:forEach>
	</ul>	
</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
	<h2 style="padding:0 40px">멜로/로멘스</h2>
<div>
	<ul>
		<c:forEach items="${ottRomanceList }" var="ott">
			<li ><a href="getOtt.do?ott_id=${ott.id}&user_id=${user_id}"><img src="poster/${ott.poster}" width="170px" height="244px" style="inline-block ">
			</a></li>
		</c:forEach>
		
	</ul>	
</div>
<br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br><br>
		
</body>
</html>