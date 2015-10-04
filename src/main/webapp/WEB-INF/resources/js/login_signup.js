/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function() {
        $("#username, #password").val("");
        console.log("LOG IN");
        //$('#slider_now').nivoSlider();
        
        $('#btn-signup:submit').click(function(e) {
            if(!isValidEmailAddress( $("#email").val() ) ) { 
                $('.error_message_1').text("Invalid email");
                $('#email').addClass('addborder');
                    e.preventDefault();
            }
            if($('#password').val() != $('#confirmPassword').val()) {
                $('.error_message').text("Confirmation password does not match password");
                $('#password, #confirmPassword').addClass('addborder');
                e.preventDefault();
            }
        });
        $('#email, #password, #confirmPassword').on('keydown', function() {
            if($(this).hasClass('addborder')) {
                $(this).removeClass('addborder');
                $(this).val('');
                $('.error_message').text('');
                $('.error_message_1').text('');
            }
        });
        
        /*
        var switchit = "";
        <%   
            if(session.getAttribute("action") == "signup") {
        %>
        switchit = "signup";
        <% 
            }else {
        %>
        switchit = $.getURLParameter('action');
        <% } %>
            */
        // Edited     
        var switchit = get("action");
        if(switchit == 'signup') 
		$.switchPage(switchit);
	else if(switchit == 'login') 
		$.switchPage(switchit);
        // ADDED 
        $("#btn-signup").click(function(){
            var jsonData = 
                        JSON.stringify({
			email: $("#email",'#defaultForm').val(),
                        username:$("#username",'#defaultForm').val(),
			password: $("#password",'#defaultForm').val(),
                       // userType : $('#input[name:optionsRadios]:checked', '#defaultForm').val()
                        userType :  $('input[name=optionsRadios]:checked','#defaultForm').val()
                        });
            $.ajax({
                url: "/loop-XYZ/loop/user/signup",
                contentType:'application/json',
                data: jsonData,
                dataType: 'json',
                type: "POST",
                success: function(data, status, jqXHR){
                   // if(data.errorList.length>0){
                   if(data == null)
                        alert("Registration unSuccessful!");
                   else if(data.id != null){
                        alert("Registration Successful!");
                //        $.switchPage("login");
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
                            userType :  $('input[name=optionsRadios]:checked','#login_form').val()
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
                   if(data == null)
                       alert('User not found');
                   else if(data.id != null){
                        alert("Login Successful!");
                        if(data.usertype == "developer")
                        window.location = "/loop-XYZ/store/developer-update";
                        else if(data.usertype == "reviewer")
                        window.location = "/loop-XYZ/store/reviewer-update";
                        else 
                        window.location = "/loop-XYZ/store/admin-view";
                    
                      
                   }
               //     }
                },
		error: function(jqXHR, status, error) {
                        alert("status:" + status + "error:" + error);
		}
            });
        });
    });
    function get(name){
        if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
           return decodeURIComponent(name[1]);
    }
    function isValidEmailAddress(emailAddress) {
        var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
        return pattern.test(emailAddress);
    };
    function isValidUsername(username) {
        var pattern = new RegExp(/^[a-zA-Z0-9_\.]+$/);
        return pattern.test(username);
    };
    
    
    
