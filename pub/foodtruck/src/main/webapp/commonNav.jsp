<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     
       
       <%	// 한글 캐릭터셋 변환
	request.setCharacterEncoding("UTF-8");%>
	

 <jsp:include page="commonHeader.jsp" flush="false"/>


<nav class="navbar navbar-default navbar-fixed-top">

	<!-- Brand and toggle get grouped for better mobile display -->

	<!-- Collect the nav links, forms, and other content for toggling -->

	<div class="navbar-tttop">


		<div class="col-md-12" id="bs-example-navbar-collapse-1">
			<div class="col-md-6">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="<%=request.getContextPath()%>/index.jsp">Food Chaser </a></li>
				</ul>
			</div>
			<div class="col-md-6">
				<c:if test="${empty sessionScope.memberId}">
					<ul class="nav navbar-nav navbar-right">

						<li class="hidden"><a href="#page-top"></a></li>
						<li class="page-scroll"><a href="#about">About</a></li>
						<li class="page-scroll"><a id="loginTxt" href="#"
							onclick="Auth.open()">Login</a></li>
						<li class="page-scroll"><a
							href="<%=request.getContextPath()%>/join.jsp">Join</a></li>
					</ul>
				</c:if>

				<c:if test="${not empty sessionScope.memberId}">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="main.jsp">Map</a></li>
						<li><a><span>'${sessionScope.memberId}' </span><span>님
									환영합니다.</span></a></li>
						<li><a href="#" onclick="Auth.logout();">LogOut</a></li>
					</ul>
				</c:if>
			</div>
		</div>




	</div>

	<!-- /.container-fluid -->
</nav>

<c:if test="${empty sessionScope.memberId}">

		<div id="loginNav">
			<div class="top">
				<div class="left">
					<span class="loginNav-title">FoodChaser Login</span>
				</div>
				<div class="right">
					<img class="exitBtn" src="/src/main/webapp/img/close.png" onclick="Auth.close()" />
				</div>
			</div>

			<div class="middle">
				<div class="form-group">
					<input type="email" class="form-control" id="username"
						required />
				</div>

				<div class="form-group">
					<input type="password" class="form-control"
						id="userpassword" required />
				</div>

				<div class="form-group">
					<button type="button" class="btn btn-block"
						onclick="Auth.login()">LogIn</button>
				</div>
				
			</div>
		</div>


		<div id="loginBackground" class="background-fixed"
				style="background: rgba(0, 0, 0, 0.6); z-index: 9999; display: none;"></div>
	</c:if>