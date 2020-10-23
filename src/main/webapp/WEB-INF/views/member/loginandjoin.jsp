<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | 회원가입</title>
<!-- bootstrap css  -->
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css' rel="stylesheet">
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.css" rel="stylesheet">

<!-- Bootstrap js -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/loginandjoin/loginandjoin.js'></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header"> <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">로그인</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="social"> 
                         <a class="circle github" href="#"> <i class="fa fa-github fa-fw"></i> </a> 
                         	<a id="google_login" class="circle google" href="#"> <i class="fa fa-google-plus fa-fw"></i> </a> 
                        		<a id="facebook_login" class="circle facebook" href="#"> <i class="fa fa-facebook fa-fw"></i> </a> 
                        </div>
                        <div class="division">
                            <div class="line l"></div> <span>다른 아이디가 있다면</span>
                            <div class="line r"></div>
                        </div>
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form action="/member/login" method="post" accept-charset="UTF-8"> 
                            	<input id="id" class="form-control" type="text" placeholder="아이디" name="id"> 
                            	<input id="pw" class="form-control" type="password" placeholder="비밀번호" name="pw"> 
                            	<!-- <input class="btn btn-default btn-login" type="submit" value="로그인" onclick="loginAjax()">  -->
                            	<input class="btn btn-default btn-login" type="submit" value="로그인"> 
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="form">
                            <form action="/member/join" method="post" html="{:multipart=>true}" data-remote="true" accept-charset="UTF-8"> 
                            	<input id="id" class="form-control" type="text" placeholder="아이디" name="id" required> 
                            	<input id="username" class="form-control" type="text" placeholder="이름" name="username" required> 
                            	<input id="pw" class="form-control" type="password" placeholder="비밀번호(영문숫자특수문자혼합 8자리이상)" name="pw"> 
                            	<input id="pw_confirmation" class="form-control" type="password" placeholder="비밀번호 재확인" name="password_confirmation"> 
                            	<input id="email" class="form-control" type="text" placeholder="이메일" name="email" required>
                            	<input id="phone" class="form-control" type="text" placeholder="전화번호 예시)01012345678" name="phone" required>                      
								<input type="text" id="sample4_postcode" class="form-control" placeholder="우편번호" style="width:144px;margin:0 0 5px 0;padding:12 0;display:inline;" readonly>
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-default btn-register" style="width:170px;height:50px;margin:0;padding:0;display:inline;"><br>
								<input type="text" id="sample4_roadAddress" class="form-control" placeholder="도로명주소" name="addr1" readonly>
								<input type="hidden" id="sample4_jibunAddress" class="form-control" placeholder="지번주소">
								<input type="text" id="sample4_detailAddress" class="form-control" placeholder="상세주소" name="addr2">
								<input type="hidden" id="sample4_extraAddress" class="form-control" placeholder="참고항목">
								<span id="guide" style="color:#999;display:none;visibility:hidden;"></span>
                            	<input class="btn btn-default btn-register" type="submit" value="회원가입" name="commit"> 
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

<!-- 주소API  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
</script>
</body>
</html>