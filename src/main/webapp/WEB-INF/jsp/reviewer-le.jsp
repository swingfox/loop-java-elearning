<jsp:include page="include/headerScript.jsp"/>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Review View</title>
        <meta charset="utf-8">
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
            <!--[if IE 7]-->
              <link href="fonts/font-awesome/css/font-awesome-ie7.min.css" rel="stylesheet" />
            <!--[endif]-->

            <!-- 1280 grid -->
            <link type="text/css" href="css/css-include/1280grid.css" rel="stylesheet" />

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


    	<ul class="nav nav-tabs main-views">
		 <li><a class="active-tab" href="/loop-XYZ/store/reviewer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
		  <li class="active"><a class="active-tab" href="/loop-XYZ/store/reviewer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
		  <li><a href="/loop-XYZ/store/review-list"><i class="icon-edit icon-large default"></i> Review List</a></li>
		  <!--<li><a href="/loop-XYZ/store/advanced-search-rev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>-->
		</ul>
		<div class="clearfix"></div>
  		<div id="content-wrap" ng-controller="LoginCtrl">
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

                                    <table class="datatable table table-hover" ng-controller="LEList" id="les">
                                        <thead>
                                                    <tr>
                                                            <th class="color-code"><!-- <img src="<?php //echo base_url() ?>img/icon-colorcode.png" alt="color code" /> --></th>
                                                            <th>Name</th>
                                                            <th>Subject</th>
                                                            <!-- <th>Date Uploaded</th> -->
                                                            <th>Uploaded</th>
                                                            <th>Rating</th>
                                                            <th>Comments</th>
                                                            <th>Status</th>
                                                            <th>Reviewer</th>
                                                            <th>Author</th>
                                                    </tr>
                                            </thead>
                                    <tbody >
                                         <tr ng-repeat="le in les | filter:searchText | filter: { rev : null  }">
                                             <td>
                                                <img ng-if="le.rating==1" src="img/icon-red.png" alt="For Review">
                                                <img ng-if="le.rating==2" src="img/icon-orange.png" alt="For Review">
                                                <img ng-if="le.rating==3" src="img/icon-yellow.png" alt="For Review">
                                                <img ng-if="le.rating==4" src="img/icon-yellowgreen.png" alt="For Review">
                                                <img ng-if="le.rating==5" src="img/icon-green.png" alt="For Review">

                                            </td>
                                            <td><a ng-click="GetLE(le)"><label>{{le.title}}</a></td>
                                            <td><label>{{le.subject}}</td>
                                            <td><label>{{le.uploadDate | date : "MMMM dd, yyyy"}}</td>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label>{{le.rating}}</td>
                                            <td><label>{{le.comments}}</td>
                                            <td ng-if="le.status==0"><i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>
                                            <td ng-if="le.status==1"><i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>
                                            <td ng-if="le.status==2"><i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>
                                            <td><label>{{le.rev}}</td>
                                            <td><label>{{le.uploadedBy}}</td>
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
					Copyright &copy;LOOP | Learning Object Organizer Plus. All rights reserved.
		    	</div>
		    </div>
	    </footer>
        </div>
        
<jsp:include page="include/mainScripts.jsp"/>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('#defaultForm').bootstrapValidator({
		        message: 'This value is not valid',
		        submitHandler: function(validator, form) {
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
