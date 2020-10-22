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
<link href="${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.css" rel="stylesheet">

<!-- Bootstrap js -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.js'></script>

</head>
<body>
<%
System.out.println("여긴 jsp야");
%>
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Login with</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="social"> <a class="circle github" href="#"> <i class="fa fa-github fa-fw"></i> </a> <a id="google_login" class="circle google" href="#"> <i class="fa fa-google-plus fa-fw"></i> </a> <a id="facebook_login" class="circle facebook" href="#"> <i class="fa fa-facebook fa-fw"></i> </a> </div>
                        <div class="division">
                            <div class="line l"></div> <span>or</span>
                            <div class="line r"></div>
                        </div>
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="" action="" accept-charset="UTF-8"> <input id="email" class="form-control" type="text" placeholder="Email" name="email"> <input id="password" class="form-control" type="password" placeholder="Password" name="password"> <input class="btn btn-default btn-login" type="button" value="Login" onclick="loginAjax()"> </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="form">
                            <form method="" html="{:multipart=>true}" data-remote="true" action="" accept-charset="UTF-8"> <input id="email" class="form-control" type="text" placeholder="Email" name="email"> <input id="password" class="form-control" type="password" placeholder="Password" name="password"> <input id="password_confirmation" class="form-control" type="password" placeholder="Repeat Password" name="password_confirmation"> <input class="btn btn-default btn-register" type="button" value="Create account" name="commit"> </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer"> <span>Looking to <a href="javascript: showRegisterForm();">create an account</a> ?</span> </div>
                <div class="forgot register-footer" style="display:none"> <span>Already have an account?</span> <a href="javascript: showLoginForm();">Login</a> </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>