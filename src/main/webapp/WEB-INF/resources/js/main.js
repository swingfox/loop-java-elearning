$(document).ready(function(){
        $("#btn-signup").click(function(){
         /*   var jsonData = 
                        JSON.stringify({
			email: $("#semail").val(),
                        username:$("#susername").val(),
			password: $("#spassword").val(),
                       // userType : $('#input[name:optionsRadios]:checked', '#defaultForm').val()
                        usertype :  $('input[name=optionsRadios]:checked','#defaultForm').val()
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
            });*/
        });
        
        $('#defaultForm').bootstrapValidator({
            message: 'This value is not valid',
            submitHandler: function (validator, form) {
                // validator is the BootstrapValidator instance
                // form is the jQuery object present the current form
                form.find('.alert').html('Thanks for signing up. Now you can sign in as ' + validator.getFieldElement('username').val()).show();
                if (isset($msg)) {
                    form.find('.alert').html('#loginvalidator').show();
                }
                form.submit();
            },
            fields: {
                username: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The username is required and can\'t be empty'
                        },
                        stringLength: {
                            min: 6,
                            max: 30,
                            message: 'The username must be more than 6 and less than 30 characters long'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: 'The username can only consist of alphabetical, number, dot and underscore'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'The email address is required and can\'t be empty'
                        },
                        emailAddress: {
                            message: 'The input is not a valid email address'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        },
                        identical: {
                            field: 'confirmPassword',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: 'The confirm password is required and can\'t be empty'
                        },
                        identical: {
                            field: 'password',
                            message: 'The password and its confirm are not the same'
                        }
                    }
                }
            }
        });
   
    $('#devUser').change();
    $("#btn-login").click(function(){
            console.log("CLICKED BUTTON LOG IN");
     /*       var jsonData = 
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
                   if(data.id === null){
                       //alert('User not found'); 
                       //$('div').removeClass("alert alert-danger"); 
                       //$('i').removeClass("icon-warning-sign"); 
                       //$('p').removeClass("label-alert");
                       //("<p class='alert alert-danger'><i class='icon-warning-sign'></i> Invalid account details. Check your information below.</p> </div>");
                      
                      $('#loginto').prepend("<p class='alert alert-danger'><i class='icon-warning-sign'>Invalid account details. Check your information below.</i></p>");
                     
                      
                    }
                   else if(data.id !== null){
                        //alert("YEEEYYYY!");
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
        }); */
    });
    $('.btn-profile-edit').click(function(e){
        var group = $('form.form-profile');
        $('input[type="text"], input[type="email"]', group).removeClass('hide');
        $('input[name="first_name"]', group).focus();
        $('span', group).addClass('hide');
        $(this).addClass('hide');
        $('button.btn-profile-edit-save').removeClass('hide');
        $('button.btn-profile-edit-cancel').removeClass('hide');
        e.preventDefault();
    });
    $('.btn-profile-edit-cancel').click(function(e){
        var group = $('form.form-profile');
        $('input', group).each(function(){
            var val = $(this).attr('data-name');
            
            $(this).val(val);
        });
        $('input[type="text"], input[type="email"]', group).addClass('hide');
        $('span', group).removeClass('hide');
        $(this).addClass('hide');
        $('button.btn-profile-edit').removeClass('hide');
        $('button.btn-profile-edit-save').addClass('hide');
        $(this).addClass('hide');
        e.preventDefault();
    });
    $('.btn-profile-edit-save').click(function(e){
        $('form.form-profile').submit();
        
        e.preventDefault();
    });
    $('#profile-picture').on({
        mouseenter: function(){
            $('button', this).show();
        },
        mouseleave: function(){
            $('button', this).hide();
        }
    });
    $('#profile-picture button').click(function(e){
        $('input[type="file"]').click();
        
        e.preventDefault();
    });
    $('input[type="file"]').change(function(){
        $(this).parent('form').submit();
    });
    $('.btn-delete-entry').click(function(){
        $('#responsive_confirmDelete #btn-delete-entry').attr('data-value',$(this).parent('li').attr('data-value'));
        $('#responsive_confirmDelete').modal({
            backdrop: 'static'
        });
        $('#responsive_confirmDelete').on('shown.bs.modal',function(){
            $('#responsive_confirmDelete #btn-delete-entry').focus();
        });
    });
    $('#responsive_confirmDelete #btn-delete-entry').click(function(){
        var value = $(this).attr('data-value');
        
        $('#responsive_confirmDelete').modal('hide');
        $('#responsive_confirmDelete').on('hidden.bs.modal', function(){
            $.post('http://localhost/jiary/index.php/journal/delete_entry', { entry_id: value }, function(data){
                if(data.status){
                    var value = data.status;
                    $('ul.jiary-list-view li[data-value="' + value + '"]').slideUp('fast',function(){
                        $(this).remove();
                        if(!$('ul.jiary-list-view').has('li').length){
                            $('ul.jiary-list-view').append('<li style="text-align: center; border: 1px solid black; padding: 10px 5px">\n\
                                    No Entries Created\n\
                                    </li>').hide().slideDown('fast');
                        }
                    });
                }
            }, 'json');
        });
    });
    /* create entry */
    $('#form-create-entry').submit(function(e){
        var form = $('#form-create-entry');
        var html = $('#summernote').code();
        
        $('textarea#summernote_container', form).val(html);
    });

    /* collapse entry */
    $('.btn-content-collapse').click(function(){
        var hint = $(this).attr('data-hint');
        var group = $(this).parent('li');

        if(hint == 0){
            $('p.list', group).stop(true,true).slideDown('fast');
            $('i',this).removeClass('icon-plus').addClass('icon-minus');
            $('span',this).html('Hide');
            $(this).attr('data-hint','1');
        }
        else{
            $('p.list', group).stop(true,true).slideUp('fast');
            $('i',this).removeClass('icon-minus').addClass('icon-plus');
            $('span',this).html('Show more');
            $(this).attr('data-hint','0');
        }
    });
});
