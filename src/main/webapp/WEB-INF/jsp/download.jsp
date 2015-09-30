<%--NOTE:
<!--Functions in php that have not been transfered/revised here:-->
    <!--?php $this->layout->modal_footer() ?>-->
    <!--?php echo date("Y"); ?-->
    under <div class="page-header download">
    under <div class="form-actions advanced-search">
    <?php echo $le->getName(); ?>
    <?php echo $le->getSubject(); ?>
    <?php echo $le->getDateUploaded(); ?>
    <?php echo $le->getDescription(); ?>
--%>

<!--?php
	session_start();//to use session variables
	require './application/controllers/LOController.php';
	$los = unserialize($_SESSION['los']);
	$index = $counter;
	$lo = $los[$index];
	$filepath = $lo->getFilepath();
?-->
<!DOCTYPE html>
<html ng-app="loop">
<head>
<title>LOOP | Download</title>

<!--?php $this->layout->header() ?-->
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
	
	<!-- <div id="wrapper"> -->
	<div class="wrapper">
    	<!--?php $this->layout->modal_footer() ?-->
		
		<div id="header-wrap">
			<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
				<!-- <div class="container"> -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
	                    
	                    <a class="navbar-brand" href="index.php">
							<img src="img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
						</a>
	                </div>
					
					<div class="navbar-collapse collapse">

						<!--?php $this->layout->user_menu() ?-->
                                                <ul class="nav navbar-nav navbar-right"> 
                                                    <li class="dropdown">
                                                        <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-user"></i> Hello, '. $this->CI->session->userdata('username') .' <b class="caret"></b></a>-->

                                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icomoon-user2"></i> Hello, '. $this->CI->session->userdata('username') .' <b class="caret"></b></a>
                                                        <ul class="dropdown-menu">

                                                                <li role="presentation" class="dropdown-header">Options</li>

                                                                <li><a href="#responsive_changeEmail" data-toggle="modal">Change Email</a></li>
                                                                <li><a id="responsive_changePassword_btn" href="#responsive_changePassword" data-toggle="modal">Change Password</a></li>

                                                                <li class="divider"></li>

                                                                <li><a href="index.php/account/logout"><i class="icon-off"></i> Logout</a></li>
                                                        </ul>
                                                     </li>
                                                </ul>
					
					</div>
				<!-- </div> -->
			</nav>
		</div>

		<div class="clearfix"></div>

		<div id="breadcrumb-wrap">
			<!-- <div class="container"> -->
				<ol class="breadcrumb">
					<li><a class="breadcrumb-link" href="/loop-XYZ/store/reviewer-update">Back to Learning Object List</a></li>
					<li class="active">Download</li>
				</ol>
			<!-- </div> -->
		</div> 

		<div class="clearfix"></div>


		<!-- Gi sugdan -->

		<!-- <div id="content-wrap"> -->
		<div id="content-download">
			<div class="container">
				<!-- <div class="col-md-8 col-md-push-2"> -->
				<div class="col-md-6 col-md-push-3">
                    <div class="page-header download">
                        <!--?php 
                    	if($lo->getStatus() == 0)
                        	echo '<h2 class="download">Download</h2>';
                        else
                        	echo '<h2 class="download">Review</h2>';
                        ?-->
                    </div>

                    <!-- <legend class="col-md-12 col-md-push-3">Download</legend> -->

                    <form ng-controller="DisplayLOCtrl" class="form-horizontal bootstrap-validator-form" method="post" id="defaultForm" novalidate="novalidate">
                        <div class="well">	
	                        <div class="form-group">
                                    <label class="col-md-3 control-label download" ng-model="filename">Filename : {{filename}}</label>
	                            <div class="col-md-8">
                                        <!--<input type="text" name="username" class="form-control" value="{{filename}}" ng-model="filename">  -->
	                                <!-- <p class="download-details"><//?php echo $lo->getName(); ?></p> -->
	                                <p class="download-details"><!--?php echo $lo->getName(); ?--></p>
	                            </div>
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>

	                        <div class="form-group">
	                            <label class="col-md-3 control-label download">Subject :</label>
	                            <div class="col-md-8">
	                                <!-- <input type="text" name="email" class="form-control"> -->
	                                <p class="download-details"><!--?php echo $lo->getSubject(); ?--></p>
	                            </div>
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>

	                        <div class="form-group">
	                            <label class="col-md-3 control-label download">Date Uploaded :</label>
	                            <div class="col-md-8">
	                                <!-- <input type="password" name="password" class="form-control"> -->
	                                <p class="download-details"><!--?php echo $lo->getDateUploaded(); ?--></p>
	                            </div>
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>

	                        <div class="form-group">
	                            <label class="col-md-3 control-label download">Description :</label>
	                            <div class="col-md-8">
	                                <!-- <input type="password" name="confirmPassword" class="form-control"> -->
	                                <p class="download-details"><!--?php echo $lo->getDescription(); ?--></p>
	                            </div>
	                        <small class="help-block col-md-push-3 col-md-9" style="display: none;"></small></div>
	                    </div>	

                            <div class="form-actions advanced-search">                                    
                                <!---?php
                                echo '<input type="hidden" value="'.$lo->getID().'" id="id" name="id">';
                                if($lo->getStatus() == 0)
                                 echo '<a href="'.base_url().'redirect/downloadNow/'.$counter.'/'.$filepath.'" class="btn btn-primary"><i class="icon-download-alt icon-large"></i> Download</a>';
                                if($lo->getStatus() == 2 && $lo->getRev() == $username)
                                echo '<a href="'.base_url().'redirect/review_rev/'.$counter.'/'.$filepath.'" class="btn btn-primary"><i class="icon-edit icon-large"></i> Review</a>';
                                ?-->
                                <a class="btn btn-default" href="index.php">Back</a>
                            </div>
									
                    </form>
                </div>
				<div class="clearfix"></div>				
			</div>
		</div> 

  		<div class="clearfix"></div>

  		<!-- This is the original footer with id=wrapper -->
		<!-- <footer id="footer-wrap-index"> -->
			<!-- <div class="container">
		    	<div class="copyright-here pull-left">
					Copyright &copy; <?php //echo date("Y"); ?> LOOP | Learning Object Organizer Plus. All rights reserved.<button id="aime" class="btn btn-default">Test</button>
		    	</div>
	  		</div>
    	</footer> -->
		
		<!-- Take this out if you want the original footer back -->
        <div class="push"></div>
	</div>

	<div class="footer">
		<footer id="footer-wrap-index">
			<!-- <div class="container"> -->
	            <div class="copyright-here pull-left download">
					Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    <!-- </div> -->
	    </footer>
    </div>

	<!-- Load JS here for greater good =============================-->

	<!--?php $this->layout->footer() ?-->
        <script src="css/bootstrap3/assets/js/jquery.js"></script>
        <script src="css/bootstrap3/dist/js/bootstrap.js"></script>



        <script src="js/main.js"></script>


        <script src="js/js-flat-ui/jquery-1.8.3.min.js"></script>
        <script src="js/js-flat-ui/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/js-flat-ui/jquery.ui.touch-punch.min.js"></script>
        <script src="js/js-flat-ui/flatui-checkbox.js"></script>
        <script src="js/js-flat-ui/flatui-radio.js"></script>
        <script src="js/js-flat-ui/jquery.tagsinput.js"></script>
        <script src="js/js-flat-ui/jquery.placeholder.js"></script>
        <script src="js/js-flat-ui/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/c/video.js"></script>

        <script src="js/backstretch-jquery/jquery.backstretch.min.js"></script>

        <script src="js/datatables/jquery.dataTables.min.js"></script>

        <script src="js/datatables/dataTables.bootstrap.js"></script>


        <script src="css/bootstrap3/js/tooltip.js"></script>
        <script src="css/bootstrap3/js/popover.js"></script>

        <!-- Bootstrap tour =================================================-->
        <script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
        <script src="bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
        <!--script src="'.$this->base_url.'js/reviewer-tour-script.js"></script-->

        <!-- Form Validator =================================================-->
        <script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>        
        <script src="js/angular/angular.js"></script>
        <script src="js/loop.js"></script>
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
</html>