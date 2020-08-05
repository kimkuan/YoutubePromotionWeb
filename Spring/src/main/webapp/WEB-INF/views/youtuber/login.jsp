<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../navbar.jsp"%>

<script type="text/javascript">
	$(document).ready(function(){
		$("loginBtn").click(function(){
		var url = $("#url").val();"
		var passwd = $("#passwd").val();
		if(url==""){
			alert("아이디를 입력하세요.");
			$("#url").focus();
			return;
			}
		if(passwd==""){
			alter("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
			}
		document.form1.action="http://localhost:8080/myweb/member/login/"
		document.form1.submit();
		});
	});
</script>

<body>
    <%
       if(url==null){
    %>

	        <section>
            <h2 class="text-center">Login</h2>
            <form class="login-form" name=form1 action="http://localhost:8080/myweb/youtuber/login/" method="post">
              <div class="form-text">
                Youtube URL
              </div>
              <input class="form-input" type="text" name="url" placeholder="https://www.youtube.com/channel/...">
              <div class="form-text">
                Password
              </div>
              <input class="form-input" type="password" name="passwd" placeholder="Type your password">
              <a href="#"><button class="button" type="submit" name="button">LOGIN</button></a>
            </form>
        </section>
	

	<div id="dropDownSelect1"></div>
	 <c:if test="${msg=='failure'}"> 
      <div style="color:red">
              아이디 또는 비밀번호가 일치하지않습니다.
      </div>
    </c:if>
    <c:if test="${msg=='logout'}"> 
      <div style="color:red">
         로그아웃되었습니다.
      </div>
   </c:if>
   <%}else{ %>
      <section class="site-section">
      <div class="container">
      
      </div>
      </section>
    <% } %>
</body>
<%@ include file="../footer.jsp"%>
<!-- The core Firebase JS SDK is always required and must be listed first -->
<script src="https://www.gstatic.com/firebasejs/7.16.0/firebase-app.js"></script>

<!-- TODO: Add SDKs for Firebase products that you want to use
     https://firebase.google.com/docs/web/setup#available-libraries -->
</html>