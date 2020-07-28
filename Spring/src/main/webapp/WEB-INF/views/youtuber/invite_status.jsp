<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String url = (String)session.getAttribute("url"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유튜버 초대 현황</title>
</head>
<body>

	<h3>초대 대기 목록</h3>
	<br>
	<c:forEach items="${postList}" varStatus="status">
		
        <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
        	<div class="job-listing-position custom-width w-50 mb-3 mb-sm-0">
                <a href="http://localhost:8080/myweb/enterprise/detail?id=${postList[status.index].id}">${postList[status.index].title}</a>
                <input type=button value="수락/거절하기" name=choiceInvite onclick="choiceInvite(${postList[status.index].id}, ${Invite[status.index].id});"/>
            </div>
        	<br>
        </div>
    </c:forEach>

	<!-- javascript -->
	<script language="javascript">
		function choiceInvite(id, inviteid){
			var path = "./choice/?id=" + id + "&inviteid=" + inviteid ;
			window.open(path, "choiceInvite", "width=400, height=300, left=100, top=50");
		}
	</script>

</body>
</html>


