<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap css  -->
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css' rel="stylesheet">
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel="stylesheet">

<link href="${pageContext.request.contextPath }/resources/loginandjoin/loginandjoin.css" rel="stylesheet">


<!-- Bootstrap js -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js'></script>
<script src='${pageContext.request.contextPath }/resources/loginandjoin/loginandjoin.js'></script>

</head>
<body>
<%
System.out.println("여긴 jsp야");
%>
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">로그인</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="social"> <a class="circle github" href="#"> <i class="fa fa-github fa-fw"></i> </a> <a id="google_login" class="circle google" href="#"> <i class="fa fa-google-plus fa-fw"></i> </a> <a id="facebook_login" class="circle facebook" href="#"> <i class="fa fa-facebook fa-fw"></i> </a> </div>
                        <div class="division">
                            <div class="line l"></div> <span>다른 아이디가 있으시다면</span>
                            <div class="line r"></div>
                        </div>
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="" action="" accept-charset="UTF-8"> 
                            	<input id="id" class="form-control" type="text" placeholder="아이디" name="id"> 
                            	<input id="pw" class="form-control" type="password" placeholder="비밀번호" name="password"> 
                            	<input class="btn btn-default btn-login" type="button" value="Login" onclick="loginAjax()"> 
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="form">
                            <form method="" html="{:multipart=>true}" data-remote="true" action="" accept-charset="UTF-8"> 
                            	<input id="id" class="form-control" type="text" placeholder="아이디" name="id"> 
                            	<input id="username" class="form-control" type="password" placeholder="사용자" name="username"> 
                            	<input id="email" class="form-control" type="text" placeholder="이메일" name="email">
                            	<input id="pw" class="form-control" type="password" placeholder="비밀번호" name="password"> 
                            	<input id="pw_confirmation" class="form-control" type="password" placeholder="비밀번호 재확인" name="password_confirmation"> 
                            	<input id="phone" class="form-control" type="text" placeholder="전화번호" name="phone"> 
                            	<input id="addr" class="form-control" type="text" placeholder="주소" name="addr"> 
                            	
                            	
                            	
                            	<input class="btn btn-default btn-register" type="button" value="회원가입" name="commit"> 
                                
                            
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer"> <span><a href="javascript: showRegisterForm();">회원가입 하시겠습니까</a> ?</span> </div>
                <div class="forgot register-footer" style="display:none"> <span>이미 회원가입 하셨습니까?</span> <a href="javascript: showLoginForm();">로그인</a> </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>