<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	td {
	text-align: center;
	}
	body {
	background-color: rgb(249,247,232);
	}
</style>
<title>관리자 페이지</title>
</head>
<body>
	<div align="center">

		<b>관리작업중.. </b><br> <a href="logout.do">관리자 로그아웃</a><br><br>
		<table>
			<tr>
				<th>작품 목록</th>
			</tr>
		</table>
		<table border="1" style="width: 90%">
			<tr>
				<th bgcolor="blublack" width="5%" >ID</th>
				<th bgcolor="blublack" width="20%">제목</th>
				<th bgcolor="blublack" width="7%">장르</th>
				<th bgcolor="blublack" width="10%">감독/작가</th>
				<th bgcolor="blublack" width="15%">배우</th>
				<th bgcolor="blublack" width="8%">OTT 서버</th>
				<th bgcolor="blublack" width="15%">포스터</th>
				<th bgcolor="blublack" width="15%">이미지</th>
				<th bgcolor="blublack" width="5%">조회수</th>
			</tr>
			<c:forEach items="${ottList}" var="ott">
				<tr>
					<td><a href="ad_getOtt.do?id=${ott.id}"><b>${ott.id}</b></a></td>
					<td align="center">${ott.title}</td>
					<td align="center">${ott.genre}</td>
					<td align="center">${ott.director}</td>
					<td align="center">${ott.actor}</td>
					<c:if test="${ott.server == 'NETFLIX'}">
						<td align="center">
							<b><span style="color: rgb(229,9,20)">${ott.server}</span></b>
						</td>
					</c:if>
					<c:if test="${ott.server == 'WAVVE'}">
						<td align="center">
							<b><span style="color: rgb(0,77,247)">${ott.server}</span></b>
						</td>
					</c:if>
					<c:if test="${ott.server == 'WATCHA'}">
						<td align="center">
							<b><span style="color: rgb(255,62,124)">${ott.server}</span></b>
						</td>
					</c:if>
					
					<td align="center">${ott.poster}</td>
					<td align="center">${ott.image}</td>
					<td align="center">${ott.cnt}</td>
					

				</tr>
			</c:forEach>
		</table>
		<br> <input type="button" value="작품 등록하기" onclick="location='ad_insert.jsp'">

	</div>
</body>
</html>
