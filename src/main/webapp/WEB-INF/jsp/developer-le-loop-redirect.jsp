<jsp:include page="include/headerScript.jsp"/>
<html lang="en" ng-app="loop">
<head>  
<title>LOOP | Developer View</title>

            <meta charset="utf-8">
            <link href="../img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
            <link href="../css/bootstrap3/dist/css/bootstrap.css" rel="stylesheet" media="screen" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="../css/bootstrapformhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
            <link href="../css/bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" />
            <link href="../fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="../css/datatables/css/dataTables.bootstrap.css" />
            <link href="../js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
            <link href="../js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />
            <link type="text/css" href="../css/css-include/style-footer-try.css" rel="stylesheet" />
            <link type="text/css" href="../css/inputfile/jquery.inputfile.css" rel="stylesheet" />
            <link rel="stylesheet" href="../js/bootstrapvalidator/dist/css/bootstrapValidator.css" />
            
</head>
<body> 
	<div class="wrapper" ng-app="loop">
    
    <form  method="post" ng-controller="LoginCtrl">
            <div class="modal fade" id="responsive_changePassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">Change Password</span>
                        </div>
                        <div class="modal-body">  
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1 ">
                                    <p class="alert alert-danger hide" id="error"><i class="icon-warning-sign"></i> Invalid password.</p>
                                    <p class="alert alert-success hide" id="success"><i class="icon-ok"></i> Successfully changed password.</p>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Old Password" ng-model="ConfirmPass"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="enterNewPassword" name="newPassword" placeholder="Enter New Password"  ng-model="newPass"/>
                                    </div>
                                    <div class="form-group last">
                                        <input type="password" class="form-control last" id="confirmNewPassword" name="confirmNewPassword" placeholder="Confirm New password" ng-model="newPass2"/>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3 ">
                                    <button type="button" class="btn btn-primary" id="changepassword" ng-click="ChangePass(ConfirmPass,newPass,newPass2)" data-dismiss="modal"><i class="icon-ok icon-large default"></i> Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <form id="emailForm">
            <div class="modal fade" id="responsive_changeEmail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">Change Email</span>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                 <p class="alert alert-danger hide" id="error1"><i class="icon-warning-sign"></i> Invalid password.</p>
                                    <p class="alert alert-success hide" id="success1"><i class="icon-ok"></i> Successfully changed password.</p>
                                <div class="form-group">
                                        <input type="password" class="form-control" id="emailPassword" name="emailPassword" placeholder="Enter Password" ng-model="ConfirmPass" required/>
                                    </div>
                                    <div class="form-group last">
                                        <input type="text" class="form-control last" id="enterNewEmail" name="enterNewEmail" placeholder="Enter New Email" ng-model="newEmail" required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary" id="changeEmail" ng-click="ChangeEmail(ConfirmPass,newEmail)" data-dismiss="modal"><i class="icon-ok icon-large default"></i> Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </form>

        <div id="header-wrap">
            <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="/loop-XYZ/store/admin-view">
                            <img src="../img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
                        </a>
                    </div>
                    
<div class="navbar-collapse collapse" ng-controller="LoginCtrl">
                                                <ul class="nav navbar-nav navbar-right"> 
                                                    <li class="dropdown">
                                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icomoon-user2"></i> Hello, {{username}} {{userId}}<b class="caret"></b></a>

                                                        <ul class="dropdown-menu">
                                                                <li role="presentation" class="dropdown-header">Options</li>
                                                                <li><a href="#responsive_changeEmail" data-toggle="modal">Change Email</a></li>
                                                                <li><a id="responsive_changePassword_btn" href="#responsive_changePassword" data-toggle="modal">Change Password</a></li>
                                                                <li class="divider"></li>
                                                                <li><a href="/loop-XYZ/store/home" ng-click="clearUser()"><i class="icon-off"></i> Logout</a></li>
                                                        </ul>
                                                     </li>
                                                </ul>
					</div>
                                    </div>
            </nav>
        </div>		

		<div class="clearfix"></div>

    	<ul id="main-demo" class="nav nav-tabs main-views tour-step tour-step-two">
			<li class="tour-step tour-step-one"><a class="active-tab"  href="/loop-XYZ/store/developer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
			<li class="active tour-step tour-step-two"><a class="active-tab"  href="/loop-XYZ/store/developer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
                 <!--       <li class="tour-step tour-step-three"><a href="/loop-XYZ/store/upload-dev"><i class="icon-upload-alt icon-large default"></i> Upload LO</a></li> -->
			<li class="tour-step tour-step-three"><a href="/loop-XYZ/store/uploadLE-dev"><i class="icon-upload-alt icon-large default"></i> Upload LE</a></li>
			<li class="tour-step tour-step-four"><a href="/loop-XYZ/store/advanced-search-dev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
		</ul>
		<div class="clearfix"></div>
  		<div id="content-wrap-dev">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">
						<div class="table-responsive">
                                                     <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                                    <div class="row">
                                                    <div class="col-sm-12">
                                                    <div class="pull-right">
                                                        <i class="icomoon-search pull-left searchbar-icon"></i>
                                                        <div class="dataTables_filter pull-right" id="DataTables_Table_0_filter">
                                                            <label>
                                                                <input type="text" aria-controls="DataTables_Table_0" data-ng-model="searchText" placeholder="Search" class="form-control input-sm" style="width: 162px;">
                                                            </label>
                                                        </div>
                                                    </div>
                                                        <div class="clearfix"></div>
                                                    </div></div>
                                                    <table class="datatable table table-hover" ng-controller="LEList">
						    <thead>
                                                        <tr>
                                                                <th class="color-code"></th>
                                                                <th>Name</th>
                                                                <th>Subject</th>
                                                                <!-- <th>Date Uploaded</th> -->
                                                                <th>Uploaded</th>
                                                                <th>Rating</th>
                                                                <th>Comments</th>
                                                                <th>Reviewer</th>
                                                        </tr>
							</thead>
					        <tbody ng-controller="LoginCtrl">
                                                    <tr ng-repeat="le in les | filter:searchText | filter: { uploadedBy: username }">
                                                        <td>
                                                            <img ng-if="le.rating==1" src="../img/icon-red.png" alt="For Review">
                                                            <img ng-if="le.rating==2" src="../img/icon-orange.png" alt="For Review">
                                                            <img ng-if="le.rating==3" src="../img/icon-yellow.png" alt="For Review">
                                                            <img ng-if="le.rating==4" src="../img/icon-yellowgreen.png" alt="For Review">
                                                            <img ng-if="le.rating==5" src="../img/icon-green.png" alt="For Review">

                                                        </td>
                                                        <td><a ng-click="GetLE(le)"><label ng-model="le.title">{{le.title}}</a></td>
                                                        <td><label ng-model="le.subject">{{le.subject}}</td>
                                                        <td><label ng-model="le.uploadDate">{{le.uploadDate | date:"medium"}}</td>
                                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label ng-model="le.rating">{{le.rating}}</td>
                                                        <td><label ng-model="le.comments">{{le.comments}}</td>
                                                        <td><label ng-model="le.rev">{{le.rev}}</td>
                                                    </tr>						
							</tbody>
						  </table>
						</div>
					</div>
				</div>
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div>
  		<div class="clearfix"></div>
        <div class="push"></div>
	</div>
                </div>
	<div class="footer">
		<footer id="footer-wrap-index">
			<div class="container">
	            <div class="copyright-here pull-left">
					Copyright &copy; LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    </div>
	    </footer>
        </div>
        
        <script src="../css/bootstrap3/assets/js/jquery.js"></script>
        <script src="../css/bootstrap3/dist/js/bootstrap.js"></script>
        <script src="../js/main.js"></script>
        <script src="../js/js-flat-ui/jquery-1.8.3.min.js"></script>
        <script src="../js/js-flat-ui/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="../js/js-flat-ui/jquery.ui.touch-punch.min.js"></script>
        <script src="../js/js-flat-ui/flatui-checkbox.js"></script>
        <script src="../js/js-flat-ui/flatui-radio.js"></script>
        <script src="../js/js-flat-ui/jquery.tagsinput.js"></script>
        <script src="../js/js-flat-ui/jquery.placeholder.js"></script>
        <script src="../js/js-flat-ui/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/c/video.js"></script>
        <script src="../js/backstretch-jquery/jquery.backstretch.min.js"></script>
        <script src="../js/datatables/jquery.dataTables.min.js"></script>
        <script src="../js/datatables/dataTables.bootstrap.js"></script>
        <script src="../css/bootstrap3/js/tooltip.js"></script>
        <script src="../css/bootstrap3/js/popover.js"></script>
        <script src="../js/angular/angular.js"></script>
        <script src="../js/angular/angular-sanitize.js"></script>
        <script src="../js/angular/ngStorage.js"></script>
        <script src="../js/loop.js" type="text/javascript"></script>
        <script src="../js/scripts/services/userService.js"></script>
        
        <script src="../js/scripts/services/storeService.js"></script>

        <script src="../js/scripts/controllers/userController.js"></script>
        <script src="../js/scripts/controllers/loController.js"></script>
        <script src="../js/scripts/controllers/leController.js"></script>
        <script src="../js/scripts/controllers/advancedSearchController.js"></script>

        <script src="../js/scripts/services/userService.js"></script>
        <script src="../js/scripts/services/loService.js"></script>
        <script src="../js/scripts/services/leService.js"></script>
        <script src="../js/scripts/services/utilService.js"></script>


        <script src="../js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
        <script src="../bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
        <script type="text/javascript" src="../js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
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
