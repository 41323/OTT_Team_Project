<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#im{
		text-align: center;
	}
	body {
		background-color: rgb(249,247,232);
	}
</style>
<title>상세 조회</title>
</head>
<body>
	<form action="updateOtt.do" method="post" enctype="multipart/form-data">
		<input name="id" type="hidden" value="${ott.id}"/>
		<input name="noposter" type="hidden" value="${ott.poster}"/>
		<input name="noimage" type="hidden" value="${ott.image}"/>
		<div align="center">
		<div style="display: inline-block;"align="center">
			<img src="poster/${ott.poster}" height="208px" width="146px">
			<br>
			<span style="font-size: 13px; color: grey">(메인 포스터) </span>
		</div>
		<div style="display: inline-block;" align="center">
			<img src="images/${ott.image}" height="208px" width="354px">
			<br>
			<span style="font-size: 13px; color: grey">(상세조회 배경)</span>
		</div>
		<br>
		</div>
		<div align="center">
			<table border="1" >
				<tr>
					<th id="im" bgcolor="blublack"><span style="font-size: 15px">-메인 포스터-<br>이미지 파일</span></th>
					<td align="left"><input type="file" name="pUploadFile"/></td>
				</tr>
				<tr>
					<th id="im" bgcolor="blublack"><span style="font-size: 15px">-상세조회 배경-<br>이미지 파일</span></th>
					<td align="left"><input type="file" name="iUploadFile"/></td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">제목</th>
					<td width="350"><input type="text" name="title" value="${ott.title}"/></td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">장르</th>
					<td>
						<select name="genre">
							<option value="액션/스릴러" <c:if test="${ott.genre == '액션/스릴러'}">selected</c:if> >액션/스릴러</option>
							<option value="드라마" <c:if test="${ott.genre == '드라마'}">selected</c:if> >드라마</option>
							<option value="멜로/로맨스" <c:if test="${ott.genre == '멜로/로맨스'}">selected</c:if> >멜로/로맨스</option>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">감독/작가</th>
					<td><input type="text" name="director" value="${ott.director}" /></td>
					
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">배우</th>
					<td><input type="text" name="actor" value="${ott.actor}" /></td>
					
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">OTT 서버</th>
					<td>
						<input type="radio" name="server" value="NETFLIX" 
						<c:if test="${ott.server == 'NETFLIX'}">checked</c:if> />
						<b><span style="color: rgb(229,9,20)">NETFLIX</span></b>
						
						<input type="radio" name="server" value="WAVVE" 
						<c:if test="${ott.server == 'WAVVE'}">checked</c:if>/>
						<b><span style="color: rgb(0,77,247)">WAVVE</span></b>
						
						<input type="radio" name="server" value="WATCHA" 
						<c:if test="${ott.server == 'WATCHA'}">checked</c:if>/>
						<b><span style="color: rgb(255,62,124)">WATCHA</span></b>
					</td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">줄거리</th>
					<td>
						<textarea name="content" cols="40" rows="10">${ott.content}</textarea>
					</td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">조회수</th>
					<td>${ott.cnt}</td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">ID</th>
					<td>${ott.id}</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="글 수정"/>
					</td>
				</tr>
			</table>
			<br>
			<a href="ad_insert.jsp">글 등록</a>&nbsp;&nbsp;
			<a href="deleteOtt.do?id=${ott.id}">글 삭제</a>&nbsp;&nbsp;
			<a href="getOttList.do">글 목록</a>&nbsp;&nbsp;
			<a href="logout.do">log-out</a>
		</div>
	</form>
</body>
</html>