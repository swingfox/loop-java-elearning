<jsp:include page="include/headerScript.jsp"/>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Download</title>
    <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />

    <!-- Bootstrap 3 -->
    <link href="css/bootstrap3/dist/css/bootstrap.css" rel="stylesheet" media="screen" />

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Date Picker -->
    <link href="css/bootstrapformhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />

    <!-- Modal -->
    <link href="css/bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" />

    <!-- Icons -->
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/datatables/css/dataTables.bootstrap.css" />

    <!-- 1170 grid -->
    <link type="text/css" href="css/css-include/1170grid.css" rel="stylesheet" />           

    <!-- Bootstrap Tour -->
    <link href="js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
    <link href="js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />

    <link type="text/css" href="css/css-include/style-footer-try.css" rel="stylesheet" />

    <!-- Input File -->
    <link type="text/css" href="css/inputfile/jquery.inputfile.css" rel="stylesheet" />

    <!-- Form Validator -->
    <link rel="stylesheet" href="js/bootstrapvalidator/dist/css/bootstrapValidator.css" />

</head>
<body>	
	<jsp:include page="include/CurrentUser.jsp"/>
		<div class="clearfix"></div>

		<div id="breadcrumb-wrap">
				<ol class="breadcrumb">
					<li><a class="breadcrumb-link" href="/loop-XYZ/store/admin-view5">Back to Learning Object List</a></li>
					<li class="active">
                    </li>
				</ol>
		</div> 

		<div class="clearfix"></div>
		<div id="content-download">
			<div class="container">
				<div class="col-md-6 col-md-push-3">
                    <div class="page-header download">
                    	<!--?php 
                    	if($lo->getStatus() == 0)
                        	echo '<h2 class="download">Download</h2>';
                        else
                        	echo '<h2 class="download">Review</h2>';
                        ?-->
                    </div>

                   <form ng-controller="LOList" class="form-horizontal bootstrap-validator-form" id="defaultForm" novalidate="novalidate">
                        <div class="well">		
	                        <div class="form-group">
                                    <label class="col-md-3 control-label download">Filename :</label>
	                                <p class="download-details">{{lo.name}}</p>
	                           
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>

	                        <div class="form-group">
	                            <label class="col-md-3 control-label download">Subject :</label>
	                                <p class="download-details">{{lo.subject}}</p>
	                            
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>

	                        <div class="form-group">
	                            <label class="col-md-3 control-label download">Date Uploaded :</label>
	                                <p class="download-details">{{lo.dateUploaded}}</p>       
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>

	                        <div class="form-group">
	                            <label class="col-md-3 control-label download">Description :</label>
	                                <p class="download-details">{{lo.description}}</p>
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>
	                    </div>	

	                        <div class="form-actions advanced-search">
                                    <a class="btn btn-primary"><i class="icon-download-alt icon-large"></i> Download</a>
                                    <a class="btn btn-default" href="/loop-XYZ/store/admin-view5">Back</a>
                                </div>
									
                    </form>
                </div>
				<div class="clearfix"></div>				
			</div>
		</div> 

  		<div class="clearfix"></div>

        <div class="push"></div>

	<div class="footer">
		<footer id="footer-wrap-index">
	            <div class="copyright-here pull-left download">
					Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
	    </footer>
    </div>

	<!-- Load JS here for greater good =============================-->
	<jsp:include page="include/mainScripts.jsp"/>
        <script>



             <!-- Change Password Script =================================================-->
                $(document).ready(function(){
                    $("#changepassword").click(function(e){
                        var form = $(this).parents("form");
                        var data = form.serialize();
                        change_password(data);
                        e.preventDefault();
                    });

                    var change_password = function(data){
                        $.ajax({
                            url: "index.php/account/check_password",
                            dataType: "json",
                            type: "POST",
                            data: data,
                            success: function(result){
                                if(result.status){
                                    $("#success").removeClass("hide");
                                    $("#error").addClass("hide");
                                    
                                    setTimeout(function(){
                                        location.reload();
                                    },1000);
                                }
                                else{
                                    $("#error").removeClass("hide");
                                    setTimeout(function(){
                                        $("#error").addClass("hide");
                                    },1500);
                                }
                                $("#changepassword").modal("show");
                            },
                            error: function(xhr){
                                alert(xhr.responseText);
                            }
                        });
                    }
                });
            </script>


  <!-- Change Email Script =================================================-->
   <script>
                $(document).ready(function(){
                    $("#changeEmail").click(function(e){
                        var form = $(this).parents("form");
                        var data = form.serialize();
                        change_email(data);
                        e.preventDefault();
                    });

                    var change_email = function(data){
                        $.ajax({
                            url: "index.php/account/check_password_email",
                            dataType: "json",
                            type: "POST",
                            data: data,
                            success: function(result){
                                if(result.status){
                                    $("#success1").removeClass("hide");
                                    $("#error1").addClass("hide");
                                    
                                    setTimeout(function(){
                                        location.reload();
                                    },1000);
                                }
                                else{
                                    $("#error1").removeClass("hide");
                                    setTimeout(function(){
                                        $("#error1").addClass("hide");
                                    },1500);
                                }
                                $("#changeEmail").modal("show");
                            },
                            error: function(xhr){
                                alert(xhr.responseText);
                            }
                        });
                    }
                });

            
 </script>
	

	<script> 
		$(document).ready(function(){
			var length_sel;

            $('.datatable').dataTable({ 
                "sPaginationType": "bs_normal"
            });

            $('.datatable').each(function(){
                $(this).show();
                datatable_configuration_for_bootstrap_three($(this));
            });

            // datatable configuration for bootstrap 3
            function datatable_configuration_for_bootstrap_three(datatable){
            	datatable.addClass('col-md-12');
                var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
                search_input.attr('placeholder', 'Search');
                search_input.addClass('form-control input-sm');
                search_input.width('140px'); //used to be 150
                length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
                length_sel.addClass('form-control input-sm').css({ padding: '5px 10px 5px 5px', cursor: 'pointer' });
                $('option', length_sel).css({ padding: '5px 8px' });
                var pagination = datatable.closest('.dataTables_wrapper').find('ul.pagination');
                pagination.addClass('pagination-sm');
            }
		});
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
		    $('#defaultForm').bootstrapValidator({
		        message: 'This value is not valid',
		        submitHandler: function(validator, form) {
	                // validator is the BootstrapValidator instance
	                // form is the jQuery object present the current form
	                // form.find('.alert').html('Thanks for signing up. Now you can sign in as ' + validator.getFieldElement('username').val()).show();
	                form.find('.alert').html('Password Changed.').show();
	                //form.submit();
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
		            // password: {
		            //     validators: {
		            //         notEmpty: {
		            //             message: 'The password is required and can\'t be empty'
		            //         },
		            //         identical: {
		            //             field: 'password',
		            //             message: 'The password and its confirm are not the same'
		            //         }
		            //     }
		            // },

		            newPassword: {
		                validators: {
		                    notEmpty: {
		                        message: 'The password is required and can\'t be empty'
		                    },
		                    identical: {
		                        field: 'confirmNewPassword',
		                        message: 'The password and its confirm are not the same'
		                    }
		                }
		            },

		            confirmNewPassword: {
		                validators: {
		                    notEmpty: {
		                        message: 'The confirm password is required and can\'t be empty'
		                    },
		                    identical: {
		                        field: 'newPassword',
		                        message: 'The password and its confirm are not the same'
		                    }
		                }
		            }
		        }
		    });
		});
	</script>

</body>
</html>
