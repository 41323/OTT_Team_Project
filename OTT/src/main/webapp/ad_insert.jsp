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
<title>등록하기</title>
</head>
<body>
	<div align="center">
		<h1>새 작품 등록</h1>
		
		<form action="insertOtt.do" method="post" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<th bgcolor="blublack" width="150">제목</th>
					<td align="left"><input type="text" name="title"></td>
				</tr>
				<tr>
					<th bgcolor="blublack">장르</th>
					<td align="left">
						<select name="genre">
							<option value="액션/스릴러" <c:if test="${ott.genre == '액션/스릴러'}">selected</c:if> >액션/스릴러</option>
							<option value="드라마" <c:if test="${ott.genre == '드라마'}">selected</c:if> >드라마</option>
							<option value="멜로/로맨스" <c:if test="${ott.genre == '멜로/로맨스'}">selected</c:if> >멜로/로맨스</option>
						</select>
					</td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">감독</th>
					<td align="left"><input type="text" name="director"></td>
				</tr>
					<tr>
					<th bgcolor="blublack" width="150">배우</th>
					<td align="left"><input type="text" name="actor"></td>
				<tr>
					<th bgcolor="blublack">내용</th>
					<td align="left"><textarea name="content" cols="40" rows="10"></textarea></td>
				</tr>
				<tr>
					<th id="im" bgcolor="blublack"><span style="font-size: 15px">-메인 포스터-<br>이미지 파일</span></th>
					<td align="left"><input type="file" name="pUploadFile"/></td>
				</tr>
				<tr>
					<th id="im" bgcolor="blublack"><span style="font-size: 15px">-상세조회 배경-<br>이미지 파일</span></th>
					<td align="left"><input type="file" name="iUploadFile"/></td>
				</tr>
				<tr>
					<th bgcolor="blublack" width="150">OTT서버</th>
					<td align="left"><input type="radio" name="server" value="NETFLIX"  
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
					<td colspan="2" align="center"><input type="submit"
						value="새 게시글 등록" /></td>
				</tr>
			</table>
		</form>
		<br>
		<a href="getOttList.do">메인화면으로</a>
	</div>
</body>
</html>