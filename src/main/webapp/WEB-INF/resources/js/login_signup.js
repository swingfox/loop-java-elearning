/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
        $("#username, #password").val("");
        console.log("LOG IN");
        //$('#slider_now').nivoSlider();
        
         $('a[href*=#header-wrap], a[href*=#before-content], a[href*=#before-features], a[href*=#before-team]').click(function () {
            if (location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '')
                    || location.hostname === this.hostname) {

                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
    });    
        
        $('#btn-signup:submit').click(function(e) {
            if(!isValidUsername( $("#susername").val() ) ) { 
                $('.error_message_1').text("Invalid username");
                $('#susername').addClass('addborder');
                    e.preventDefault();
            }
            if(!isValidEmailAddress( $("#semail").val() ) ) { 
                $('.error_message_1').text("Invalid email");
                $('#semail').addClass('addborder');
                    e.preventDefault();
            }
            if($('#spassword').val() !== $('#sconfirmPassword').val()) {
                $('.error_message').text("Confirmation password does not match password");
                $('#spassword, #sconfirmPassword').addClass('addborder');
                e.preventDefault();
            }
        });
        $('#semail, #spassword, #sconfirmPassword').on('keydown', function() {
            if($(this).hasClass('addborder')) {
                $(this).removeClass('addborder');
                $(this).val('');
                $('.error_message').text('');
                $('.error_message_1').text('');
            }
        });
        
        $("#btn-signup").click(function(){
            var jsonData = 
                        JSON.stringify({
			email: $("#semail").val(),
                        username:$("#susername").val(),
			password: $("#spassword").val(),
                       // userType : $('#input[name:optionsRadios]:checked', '#defaultForm').val()
                        userType :  $('input[name=optionsRadios]:checked','#defaultForm').val()
                        });
                        console.log(jsonData);
            $.ajax({
                url: "/loop-XYZ/loop/user/signup",
                contentType:'application/json',
                data: jsonData,
                dataType: 'json',
                type: "POST",
                success: function(data, status, jqXHR){
                   // if(data.errorList.length>0){
                   if(data === null)
                        alert("Registration unSuccessful!");
                   else if(data.id !== null){
                        alert("Registration Successful!");
                        $.switchPage("login");
                    }
                  //  }
                },
		error: function(jqXHR, status, error) {
                    alert("status:" + status + " error:" + error);
		}
            });
        });
       $("#btn-login").click(function(){
            console.log("CLICKED BUTTON LOG IN");
            var jsonData = 
                        JSON.stringify({
                            username:$("#username").val(),
                            password: $("#password").val(),
                            usertype :  $('input[name=optionsRadios]:checked','#login_form').val()
                        });
            console.log(jsonData);
            $.ajax({
                url: "/loop-XYZ/loop/user/login",
                contentType:'application/json',
                data: jsonData,
                dataType: 'json',
                type: "POST",
                success: function(data, status, jqXHR){
                   // if(data.errorList.length>0){
                   $('#userId').val(data.id).change();
                   $('#userName').val(data.username).change();
                   $('#userType').val(data.usertype).change();
                   if(data === null){
                       alert('User not found');
                       $('#loginto').prepend("<p class='alert alert-danger'><i class='icon-warning-sign'></i> Invalid account details. Check your information below.</p> </div>");
                   }
                   else if(data.id !== null){
                       
                        if(data.usertype === "developer")
                        window.location = "/loop-XYZ/store/developer-update";
                        else if(data.usertype === "reviewer")
                        window.location = "/loop-XYZ/store/reviewer-update";
                        else 
                        window.location = "/loop-XYZ/store/admin-view";
                     //alert("Login Successful!");
                   }
               //     }
                },
		error: function(jqXHR, status, error) {
                        alert(":( status:" + status + "error:" + error);
		}
        }); 
    });
});
    function get(name){
        if(name===(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
           return decodeURIComponent(name[1]);
    };
    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    };
    function isValidUsername(username) {
        var pattern = new RegExp(/^[a-zA-Z0-9_\.]+$/);
        return pattern.test(username);
    };
    
    
    
