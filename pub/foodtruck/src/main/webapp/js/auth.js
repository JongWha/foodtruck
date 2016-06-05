/**
 * 
 */

var Auth = {};

Auth.join = function(){
	
	var userId = $("#inputUserName").val();
	var userPassword = $("#inputUserPassword").val();
	var obj = document.getElementsByName('member_status');
	var userStatus = '';
	
	for(i=0; i< obj.length; i++){
		if(obj[i].checked){
			userStatus = obj[i].value;
		}
	}
	
	var action ="/member?action=joinMember";
}

Auth.joinCheck = function(mode){
	
	var paramType;
	var param;
	
	//check id
	if(mode == 1){
		paramType = "Name";
		param =$("#inputUserName").val();
		
		if(param.length < 2){
			$("div.msgRow").text("ID more than 4 character.");
			$("button.btnJoin").prop("disabled",true);
			return false;
		}
	} else if(mode == 2){
		var password1 = $("#inputUserPasswordPre").val();
		var password2 = $("#inputUserPassword").val();
		
		if(password1.length < 4){
			$("div.msgRow").text("ID more than 4 character.");
			$("button.btnJoin").prop("disabled",true);
			return false;
		}
	}
	
}

Auth.login = function() {

	//check the input form
	
	
	var inputMemberId = $("#username").val();
	var inputMemberPassword = $("#userpassword").val();

	if(inputMemberId == null || inputMemberId == "") {
		alert('Something wrong Check the input.');
		return false;
	}

	if(inputMemberPassword == "") {
		 alert('Something wrong Check the input.');
		return false;
	}

	
	// 3. 서버로부터 받은 공개키로 이메일과 비밀번호 암호화
	var memberEmail = $("#username").val();
	var memberPassword = $("#userpassword").val();

	// 4. 암호화된 이메일과 비밀번호를 서버로 전송   
	var action = "/member?action=loginMember";
	var form_data = {
			inputMemberId : memberEmail,
			inputMemberPassword : memberPassword
	};

	$.ajax({
		type : "POST",
		url : action,
		data : form_data,
		dataType : "text",
		success: function(response) {
			if(response == "LoginOK") {
				location.href="main.jsp";
			}else if(response == "Please check the Id or Password"){
				alert("Please check the Id or Password");
			}
			else if(response == "No member Exist"){
				alert("No member exist. Please move to Join page");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});

	return false;
}

Auth.loginCheck = function() {

	var check = false;

	$.ajax({
		type : "POST",
		url : "/member?action=loginCheck",
		dataType : "text",
		async : false,
		success: function(response) {
			if(response == 1) {
				check = true;
			} else if(response == -1) {
				alert("로그인이 필요합니다.");
				check = false;
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});

	return check;
}

Auth.logout = function() {

	var action = "/member?action=logoutMember";

	$.ajax({
		type : "POST",
		url : action,
		dataType : "text",
		async: false,
		success: function(response) {
			if(response == "LogoutOK") {
				location.href="index.jsp";
			} else {
				alert("Something wrong");
			}
		}, error: function(xhr,status,error) {
			alert(error);
		}
	});
}
	
Auth.open = function() {
	$("#loginNav, #loginBackground").fadeIn(250);
	$("#loginTxt").text("cancel");
	$("#loginTxt").attr("onclick", "Auth.close()");
}

Auth.close = function() {
	$("#loginNav, #loginBackground").fadeOut(250);
	$("#loginTxt").text("login");
	$("#loginTxt").attr("onclick", "Auth.open()");
}