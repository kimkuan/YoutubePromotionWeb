<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<% int ID = (Integer)session.getAttribute("ID"); %> 

<script>
function showButton(ID, postid){
	if(ID == postid){
		document.getElementById("button_group").style.display="block";
		document.getElementById("invite").style.display="block";
	}
	else{
		document.getElementById("button_group").style.display="none";
		document.getElementById("invite").style.display="none";
	}
}
</script>



<%@ include file="../navbar.jsp"%>
      <section>
	      <input type="hidden" id="ID" value=<%= ID %> >
          <span class="title">${EnterprisePost.title}</span><span class="enterprise">${name}</span>
          <hr class="#FF97B6">
          <table class="detail_table">
            <tr>
              <td>
                <div class="td-title">
                	 모집기간
                </div>
              </td>
              <td>
               <div class="td-content">
			${EnterprisePost.date}               
			</div>
              <td>
                <div class="td-title">
         	         모집인원
                </div>
              </td>
              <td>
              <div class="td-content">
			${EnterprisePost.recuitCnt}              
			</div>
              </td>
            </tr>
            <tr>
              <td>
              <div class="td-title">
               	 카테고리
              </div>
              </td>
              <td>
              <div class="td-content">
                ${EnterprisePost.category}
                </div>
              </td>
              <td>
                <div class="td-title">
               	 조회수
                </div>
              </td>
              <td>
                <div class="td-content">
                ${EnterprisePost.viewCnt}
                </div>
              </td>
            </tr>
          </table>

          <div class="detail">
            <img class="detail_img" src="getImage?name=${EnterprisePost.image}" />
              <div class="detail_desc">
          		<c:forEach items="${detail}" var="detail">
                <p><c:out value="${detail}"/></p>
              	</c:forEach>
            </div>
          </div>
          <div class="button_group" id="button_group" style="margin: 0;">          
            <sec:authorize access="hasRole('ROLE_ENTERPRISE')">
		        <a href="/myweb/enterprise/update?id=${EnterprisePost.id}"><button class="button" type="button" name="button" >수정하기</button></a>
		        <a href="/myweb/enterprise/delete?id=${EnterprisePost.id}"><button class="button" type="button" name="button" >삭제하기</button></a>
          	</sec:authorize>
          </div>
          
          		<!-- Modal -->
          		<sec:authorize access="hasRole('ROLE_ENTERPRISE')">
				<div id="invite" style="display: none;">
   					<button type="button" id="modal_open_btn" onclick="modal1_open()">초대하기</button>
				</div>
				<script>
			      var ID = document.getElementById("ID").value;
		          showButton(ID, ${EnterprisePost.enterID});
	        	</script>
	        
				<div id="modal">
                <div class="modal_layer">
                <div class="middle_modal_content">
                  <div class="modal_title">
                   	유튜버 리스트
                  </div>
                 <form method="post" action="<c:url value="/invite/"/>">
					<c:forEach items="${Youtuber}" var="YoutuberVO">
					<div>
						<label><input type="checkbox" name="youtuberID" value=${YoutuberVO.id}>${YoutuberVO.name}</label>
					</div>
					</c:forEach>
						<input name="enterID" type="hidden" class="form-control" value=${EnterprisePost.enterID}>
						<input name="postID" type="hidden" class="form-control" value=${EnterprisePost.id}>
	                  <div class="modal_button" style="width:300px;">
	                    <button type="button" id="modal_close_btn" onclick="modal1_close()">취소</button>
	                    <button type="submit" id="submit">초대하기</button>
	                  </div>
				</form>

                </div>
              </div><!--modal layer-->
              </div> <!--modal-->
              </sec:authorize>
             
			  <!-- Modal -->
			  <sec:authorize access="hasRole('ROLE_YOUTUBER')">	
				<div id="root">
   					<button type="button" id="open_btn" onclick="modal2_open();">신청하기</button>
				</div>

				<div id="modal2">
                <div class="modal_layer">
                <div class="middle_modal_content">
                  <div class="modal_title">
                   	신청하기
                  </div>
                 	<form class="login-form" method="post" action="<c:url value="/apply/" />">
						<div style="margin-bottom:10px;">
							<span class="form-text">카테고리</span>
		                  	<select name="category" style="margin-left:10px;">
		                  		<option value="네일">네일</option>
		                  		<option value="헤어">헤어</option>
		                  		<option value="바디">바디</option>
		                  		<option value="헬스">헬스</option>
								<option value="뷰티">뷰티</option>
		                  		<option value="메이크업">메이크업</option>                  		
		                  	</select>						
		                  </div>
						<div>
							<span class="form-text">날짜</span>
							<input class="form-input" type="text" name="date" placeholder="2020-09-01">
						</div>
						<div>
							<span class="form-text">지역</span>
							<input class="form-input" type="text" name="location" placeholder="위치">
						</div>
						<div>
							<span class="form-text">신청글</span>
							<input class="form-input" type="text" name="comment" placeholder="안녕하세요">
						</div>
						<div>
						<input name="youtuberID" type="hidden" class="form-control" value=<%=ID%>>
						<input name="postID" type="hidden" class="form-control" value=${EnterprisePost.id}>
					  `<div class="modal_button" style="width:300px;">
	                    <button type="button" id="close_btn" onclick="modal2_close()">취소</button>
	                    <button type="submit" id="submit">초대하기</button>
	                  </div>
	                  </div>
				</form>
                 
                </div>
              </div><!--modal layer-->
              </div><!--modal-->
              </sec:authorize>
             
				
        </section>
		<script language="javascript">
		// Modal 
		function modal1_open(){
			document.getElementById("modal").style.display="block";
		}
		function modal1_close(){
			document.getElementById("modal").style.display="none";
		}
		function modal2_open(){
			document.getElementById("modal2").style.display="block";
		}
		function modal2_close(){
			document.getElementById("modal2").style.display="none";
		}

</script>
	

</body>
</html>