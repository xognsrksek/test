$(document).ready(function(){
openLoginModal();
});


function showRegisterForm(){
	$('.loginBox').fadeOut('fast',function(){
		$('.registerBox').fadeIn('fast');
		$('.login-footer').fadeOut('fast',function(){
			$('.register-footer').fadeIn('fast');
		});
		$('.modal-title').html('회원가입');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

function showLoginForm(){
	$('#loginModal .registerBox').fadeOut('fast',function(){
		$('.loginBox').fadeIn('fast');
		$('.register-footer').fadeOut('fast',function(){
			$('.login-footer').fadeIn('fast');
		});
		$('.modal-title').html('로그인');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

function openLoginModal(){
	showLoginForm();
	setTimeout(function(){
		$('#loginModal').modal('show');
	}, 230);
}

function openRegisterModal(){
	showRegisterForm();
	setTimeout(function(){
		$('#loginModal').modal('show');
	}, 230);
}

function loginAjax(){
	/* Remove this comments when moving to server
		$.post( "/login", function( data ) {
		if(data == 1){
			window.location.replace("/main");
		} else {
			shakeModal();
	}
});
*/

/* Simulate error message from the server */
shakeModal();
}

function shakeModal(){
	$('#loginModal .modal-dialog').addClass('shake');
	$('.error').addClass('alert alert-danger').html("잘못된 아이디/비밀번호입니다.");
	/*$('input[type="password"]').val('');*/
	setTimeout( function(){
		$('#loginModal .modal-dialog').removeClass('shake');
	}, 1000 );
}