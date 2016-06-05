<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Welcome to FoodChaser</title>

 <jsp:include page="commonHeader.jsp" flush="false"/>

 <script>
  function formCheck(){
	  var id = document.forms[0].username.value;
	  var password = document.forms[0].userpassword.value;
	  
	  if (id == null || id == ""){
		  alert('please insert ');
		  document.forms[0].id.focus();
		  return false;
	  }
	  if(password == null || password == ""){
		  
		  alert('Something wrong Check the input.');
		  document.forms[0].password.focus();
		  return false;
	  }
  }
 </script>
</head>

<body style="height: 900px !important;">
	<jsp:include page="/commonNav.jsp" flush="false"/>

	<div class="container" id="join">
		<div class="container">
		<div class="space"></div>
		<div class="space"></div>
			<div class="col-md-2"></div>
			<div class="col-md-8">

				<form action="JoinServlet" method="post">
						<div class="col-md-3">
							<span style="color: #fff; text-align: left;">ID :</span>
						</div>
						<div class="col-md-8 msgRow">
							<input type="text" id="inputUserName" size="24">
						</div>
					<div class="space"></div>
					
						<div class="col-md-3">
							<span style="color: #fff; text-align: left;">PassWord :</span>
						</div>
						<div class="col-md-8 msgRow">
							<input type="password" id="inputUserPasswordpre" size="24">
						</div>
						
						<div class="space"></div>
						
						<div class="col-md-3">
							<span style="color: #fff; text-align: left;">Check PassWord :</span>
						</div>
						<div class="col-md-8 msgRow">
							<input type="password" id="inputUserPassword" size="24">
						</div>

					<div class="space"></div>
					<div class="w100p">
						<label class=""><input type="radio" name="member_status" value="1">Guest</label>
						<label><input type="radio" name="member_status" value="2">Owner</label>
					</div>
					<div class="space"></div>
					<div class="col-md-12">
						<button class = "btnJoin" type="submit" value="memberJoin" onclick="Auth.join();"><span style="color:#fff">Join</span></button>
					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<jsp:include page="/commonfooter.jsp" flush="false"/>

	
</body>
</html>