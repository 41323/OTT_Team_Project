<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
#login_wrap{ width:504px; height:250px; border:1px solid white; position:absolute; left:50%; top:50%;
margin:-140px 0 0 -292px; padding:22px 40px 8px;}

 
table, tr, td {
    border:0px;
    border-collapse:collapse;
    
}
input {
   size: 200;
   box-sizeing: border-box;
}
</style>
<body  bgcolor="black">
         <div class="logo-wrap">
            <img src="images/logo.png">
         </div>

<div align="center" id="login_wrap">
   
<h1 style="color:#A9A9A9;" >로그인</h1>

<form action="getUser.do" method="post">
   <table border="1" >
   <tr>
      
      <td><input type="text" name="user_id" id="user_id" placeholder="아이디 입력" style="width:300px; height:30px;" required autofocus/></td>
   </tr>
   <tr>
      <td><input type="password" name="password" id="password"  placeholder="비밀번호 입력" style="width:300px; height:30px;" required/></td>
   </tr>
   <tr>
      <td colspan="2" align="center">
         <input type="submit" value="로그인" style="width:110px; height:30px; background-color: #FF8C00; "/>
      </td>
      <td>
      <a href="registerForm.jsp">join us</a>
      </td>

   </tr>
   </table>
</form>
</div>
</body>
</html>