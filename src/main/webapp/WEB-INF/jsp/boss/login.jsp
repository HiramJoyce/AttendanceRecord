<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Lowin</title>
	<link rel="stylesheet" href="${ctx}/resource/login/auth.css">
</head>

<body>
	<div class="lowin">
		<div class="lowin-brand">
			<img src="${ctx}/resource/login/kodinger.jpg" alt="logo">
		</div>
		<div class="lowin-wrapper">
			<div class="lowin-box lowin-login">
				<div class="lowin-box-inner">
					<form action="${ctx}/boss/login" method="post">
						<p>管理者登录</p>
						<div class="lowin-group">
							<label>管理者编号<a href="#" class="login-back-link">Sign in?</a></label>
							<input type="text" autocomplete="bossNum" name="bossNum" class="lowin-input">
						</div>
						<div class="lowin-group password-group">
							<label>登录密码</label>
                            <%--<a href="#" class="forgot-link">Forgot Password?</a>--%>
							<input type="password" name="password" autocomplete="current-password" class="lowin-input">
						</div>
						<button class="lowin-btn login-btn">
							登录
						</button>
					</form>
				</div>
			</div>
		</div>
    </div>

	<script src="${ctx}/resource/login/auth.js"></script>
	<script>
		Auth.init({
			login_url: '${ctx}/boss/login',
			forgot_url: '#forgot'
		});
	</script>
</body>
</html>