<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<style>
#login_wrap {
	width: 504px;
	height: 400px;
	border: 1px solid white;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -140px 0 0 -292px;
	padding: 22px 40px 8px;
}

table, tr, td {
	border: 0px;
	border-collapse: collapse;
}

input {
	size: 200;
	box-sizeing: border-box;
}
</style>

<body bgcolor="black">
	<div class="logo-wrap">
		<img src="images/logo.png">
	</div>

	<div align="left" id="login_wrap">

		<h1 style="color: #A9A9A9;">회원가입</h1>

		<form action="insertUser.do" method="post" name="registerForm">
		<input type="hidden" name= "reid" id="reid">	
			<table border="1">
				<tr>

					<td style="color: white;">아이디 <br> <input type="text"
						name="user_id" id="user_id" placeholder="아이디 입력"
						style="width: 200px; height: 30px;" required autofocus/> <input
						type="button" value="아이디 중복확인"  onclick="idcheck()"/>
					</td>
				</tr>
				<tr>
					<td style="color: white;">비밀번호<br> <input type="password"
						name="password" id="password" 
						placeholder="비밀번호 입력" style="width: 200px; height: 30px;" required />
						</td>
				</tr>
				<tr>
					<td style="color: white;">비밀번호 확인<br> <input
						type="password" id="password2" name="password2"
						placeholder="비밀번호 확인"
						style="width: 200px; height: 30px;" required /></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><br> <br> <br> <br>
						<input type="submit" value="회원가입"
						style="width: 150px; height: 35px; background-color: #FF8C00;"
						id="submit" onclick="return check_pw();"/></td>
				</tr>
			</table>
		</form>
		<script type="text/javascript">
			function check_pw() {
				var p1 = document.getElementById('password').value;
				var p2 = document.getElementById('password2').value;
				var id = document.getElementById('user_id').value;
				var reid = document.getElementById('reid').value;
				if (p1 != p2) {
					alert("비밀번호가 일치 하지 않습니다.");
					
					return false;
				} else if(id == ""){
					alert("아이디 중복체크를 해야합니다.");		
					return false;
				} else if(id != reid){
					alert("아이디 중복체크를 해야합니다.");		
					return false;
				} else{
					return true;
				}
			}
			//id 중복체크
			
		function idcheck() {
			if (document.registerForm.user_id.value !== "") {
				var _width = '300';
			    var _height = '120';
			    var _left = Math.ceil(( window.screen.width - _width )/2);
			    var _top = Math.ceil(( window.screen.height - _height )/2); 
				var url = "id_check_form.do?user_id=" + document.registerForm.user_id.value;
				window.open(url, '_blank', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top);
		}
	}

			
		</script>
	</div>
</body>
</html>