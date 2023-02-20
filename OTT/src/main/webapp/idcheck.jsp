<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID check</title>

</head>
<body>
	<form method="post" class="form-signin" action="id_check_form.do"
		name="joinform">
		<div class="form-label-group">
			<input type="text" id="user_id" name="user_id" class="form-control"
				value="${user_id}" />
		</div>

		<div class="form-label-group">
			<input type="submit" value="중복확인">
		</div>

		<!-- 아이디가 존재할 때 -->
		<c:if test="${check == 1}">
			<script>
				opener.document.registerform.user_id.value = "";
			</script>
			${user_id}는 사용중인 아이디입니다.
		</c:if>

		<!-- 아이디가 존재하지 않을 때 -->
		<c:if test="${check == 0 }">
		${user_id}는 사용가능한 아이디입니다.
		<div class="form-label-group">
				<input type="button" value="사용하기" onclick="idok()">
			</div>
		</c:if>

	</form>

</body>

<script type="text/javascript">
		function idok() {
			opener.registerForm.reid.value = "${user_id}";
			opener.registerForm.user_id.value = "${user_id}";
			self.close();
		}
		
</script>
</html>