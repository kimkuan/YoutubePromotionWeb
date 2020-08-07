<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원 등록</title>

<!-- password 암호화  -->
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
<script    src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
<script type="text/javascript">
	function encrypt(){ 
		   console.log("암호화 패스워드 : ");
	       var passphrase="123456";
	       var password = document.getElementById("password");
	       console.log("패스워드 : " + password.value);
	       var encrypt = CryptoJS.AES.encrypt(password.value, passphrase).toString();

	       console.log("암호화 패스워드2 : " + encrypt);
    	   password.value = encyrpt; // 암호화 한 값으로 등록
    	   
           document.loginForm.submit();
	}
</script>
</head>

<body>
	<form class="login100-form validate-form"  name="loginForm" method="post" action="<c:url value="/register/enterprise" />"  >
		<sec:csrfInput/>
		<span class="login100-form-title p-b-49">
			<h2>Register</h2>
		</span>
		<div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
			<span class="label-input100">ID</span>
			<input class="input100" type="text" name="username" placeholder="000-00-00000">
			<span class="focus-input100" data-symbol="&#xf206;"></span>
		</div>

		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">Password</span>
			<input class="input100" type="password" name="password" placeholder="Type your password">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<input class="input100" type="hidden" name="authorities" value="ROLE_ENTERPRISE">
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">name</span>
			<input class="input100" type="text" name="name" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">category</span>
			<input class="input100" type="text" name="category" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">email</span>
			<input class="input100" type="text" name="email" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">address</span>
			<input class="input100" type="text" name="address" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		
		<div class="wrap-input100 validate-input" data-validate="Password is required">
			<span class="label-input100">manager</span>
			<input class="input100" type="text" name="manager" placeholder="">
			<span class="focus-input100" data-symbol="&#xf190;"></span>
		</div>
		<div class="text-right p-t-8 p-b-31">
			<div class="container-login100-form-btn">
				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn"></div>
						<button class="login100-form-btn" onclick="encrypt();">
							Sign
						</button>
					</div>
				</div>
			</div>
		</form>
</body>
</html>