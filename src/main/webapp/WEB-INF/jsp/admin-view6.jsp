<!DOCTYPE html>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Admin - Learning Objects</title>
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
    <link href="css/bootstrap3/dist/css/bootstrap.css" rel="stylesheet" media="screen" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrapformhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
    <link href="css/bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" />
    <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/datatables/css/dataTables.bootstrap.css" />
    <link href="js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
    <link href="js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />
    <link type="text/css" href="css/css-include/style-footer-try.css" rel="stylesheet" />
    <link type="text/css" href="css/inputfile/jquery.inputfile.css" rel="stylesheet" />
    <script type="text/javascript">
        function select(i)
        {
                document.getElementById("counters").value = i;
                document.getElementById("ctr").value = i;
        }
    </script>

</head>
<body>	

	<div class="wrapper">
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
							<img src="img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
						</a>
	                </div>
					
				<div class="navbar-collapse collapse" ng-controller="LoginCtrl">
                                                <ul class="nav navbar-nav navbar-right"> 
                                                    <li class="dropdown">
                                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icomoon-user2"></i> Hello, {{username}} <b class="caret"></b></a>
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

    <jsp:include page="include/CurrentUser.jsp"/>
		<div class="clearfix"></div>

    	<ul class="nav nav-tabs main-views">
    		<li><a href="/loop-XYZ/store/admin-view"><i class="icon-plus-sign-alt icon-large default"></i> New Account Requests</a></li>
		<li><a href="/loop-XYZ/store/admin-view1"><i class="icon-folder-open icon-large default"></i> Developers</a></li>
		<li><a href="/loop-XYZ/store/admin-view2"><i class="icon-edit icon-large default"></i> Reviewers</a></li>
		<li><a href="/loop-XYZ/store/admin-view3"><i class="icon-time icon-large default"></i> Inactive Accounts</a></li>
		<li><a href="/loop-XYZ/store/admin-view4"><i class="icon-ban-circle icon-large default"></i> Blocked Accounts</a></li>
		<li><a href="/loop-XYZ/store/admin-view5"><i class="icomoon-list"></i> Learning Objects</a></li>
		<li class="active"><a class="active-tab" href="/loop-XYZ/store/admin-view6"><i class="icomoon-list"></i> Learning Elements</a></li>
		</ul>

		<div class="clearfix"></div>

  		<div id="content-wrap-rev">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">
						
						<div class="table-responsive" ng-controller="LEList">
							<!-- <table class="datatable table table-bordered"> -->
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
                                                                </div>
                                                            </div>
							<table class="datatable table table-hover">
							    <thead>
									<tr>
										<th class="color-code"></th>
										<th>Name</th>
										<th>Subject</th>
										<th>Uploaded</th>
										<th>Rating</th>
										<th>Comments</th>
										<th>Status</th>
										<th>Reviewer</th>
										<th>Author</th>
									</tr>
								</thead>
						        <tbody>
                                                            
                                                            <tr ng-repeat="le in les | filter:searchText">
                                                                <td>
                                                                    <img ng-if="le.rating==1" src="img/icon-red.png" alt="For Review">
                                                                    <img ng-if="le.rating==2" src="img/icon-orange.png" alt="For Review">
                                                                    <img ng-if="le.rating==3" src="img/icon-yellow.png" alt="For Review">
                                                                    <img ng-if="le.rating==4" src="img/icon-yellowgreen.png" alt="For Review">
                                                                    <img ng-if="le.rating==5" src="img/icon-green.png" alt="For Review">
                                                                    
                                                                </td>
                                                                <td><a ng-click="GetLEDetails_admin(le)"><label ng-model="name">{{le.name}}</a></td>
                                                                <td><label ng-model="le.subject">{{le.subject}}</td>
                                                                <td><label ng-model="le.dateUploaded">{{le.dateUploaded}}</td>
                                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label ng-model="le.rating">{{le.rating}}</td>
                                                                <td><label ng-model="le.comments">{{le.comments}}</td>
                                                                <td ng-if="le.status==0"><a href="#responsive_approve" data-toggle="modal"><i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></a></td>
                                                                <td ng-if="le.status==1"><a href="#responsive_approve" data-toggle="modal"><i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></a></td>
                                                                <td ng-if="le.status==2"><a href="#responsive_approve" data-toggle="modal"><i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></a></td>
                                                                <td><label ng-model="le.rev">{{le.rev}}</td>
                                                                <td><label ng-model="le.uploadedBy">{{le.uploadedBy}}</td>
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

	<div class="footer">
		<footer id="footer-wrap-index">
			<div class="container">
	            <div class="copyright-here pull-left">
					Copyright &copy; LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    </div>
	    </footer>
        </div>
    </div>
	<script src="js/js-flat-ui/jquery-1.8.3.min.js"></script>
	<script src="js/js-flat-ui/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="js/js-flat-ui/jquery.ui.touch-punch.min.js"></script>
	<script src="js/js-flat-ui/flatui-checkbox.js"></script>
	<script src="js/js-flat-ui/flatui-radio.js"></script>
	<script src="js/js-flat-ui/jquery.tagsinput.js"></script>
	<script src="js/js-flat-ui/jquery.placeholder.js"></script>
	<script src="js/js-flat-ui/jquery.stacktable.js"></script>
	<script src="js/datatables/jquery.dataTables.min.js"></script>
	<script src="js/datatables/dataTables.bootstrap.js"></script>        
	<script src="js/backstretch-jquery/jquery.backstretch.min.js"></script>
	<script src="js/datatables/jquery.dataTables.min.js"></script>            
	<script src="js/datatables/dataTables.bootstrap.js"></script>
        <script src="js/main.js"></script>
	<script src="css/bootstrap3/js/tooltip.js"></script>
	<script src="css/bootstrap3/js/popover.js"></script>
	<script src="css/bootstrap3/dist/js/bootstrap.js"></script>
        <script src="js/angular/angular.js"></script>
        <script src="js/angular/ngStorage.js"></script>
        <script src="js/loop.js" type="text/javascript"></script>
	<script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
	<script src="js/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
	<script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
	<script>
	$("#banner-wrap").backstretch("img/img-banner.jpg");
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#defaultForm').bootstrapValidator({
		        message: 'This value is not valid',
		        submitHandler: function(validator, form) {
	             	form.find('.alert').html('Password Changed.').show();
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
