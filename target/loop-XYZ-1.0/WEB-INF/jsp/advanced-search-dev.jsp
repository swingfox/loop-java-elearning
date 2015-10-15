<!--NOTE:-->
<!--Functions in php that have not been transfered/revised here:-->
    <!--?php $this->layout->modal_footer() ?>-->
    <!--?php echo date("Y"); ?-->
<!DOCTYPE html>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Advanced Search</title>

<!--?php $this->layout->header() ?-->
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
            <!--[if IE 7]>
              <link href="'.$this->base_url.'fonts/font-awesome/css/font-awesome-ie7.min.css" rel="stylesheet" />
            <![endif]-->

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
	                    
	                    <a class="navbar-brand" href="/loop-XYZ/store/developer-update">
							<img src="img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
						</a>
	                </div>
					
                                <div class="navbar-collapse collapse" ng-controller="LoginCtrl">

						<!--?php $this->layout->user_menu() ?-->
                                                <ul class="nav navbar-nav navbar-right"> 
                                                    <li class="dropdown">
                                                        <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-user"></i> Hello, '. $this->CI->session->userdata('username') .' <b class="caret"></b></a>-->

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
				<!-- </div> -->
			</nav>
		</div>

		<div class="clearfix"></div>

    	<ul class="nav nav-tabs main-views">
		  <li><a href="/loop-XYZ/store/developer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
		  <li class=" tour-step tour-step-two"><a class="active-tab"  href="/loop-XYZ/store/developer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
		  <li><a href="/loop-XYZ/store/upload-dev"><i class="icon-upload-alt icon-large default"></i> Upload LO</a></li>
		  <li><a href="/loop-XYZ/store/uploadLE-dev"><i class="icon-upload-alt icon-large default"></i> Upload LE</a></li>
		  <li class="active tour-step tour-step-fourteen"><a class="active-tab" href="/loop-XYZ/store/advanced-search-dev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
		</ul>

		<div class="clearfix"></div>


		<!-- Gi sugdan -->

		<div id="content-wrap">
			<div class="container">
				<form class="form-horizontal" action="/loop-XYZ/store/developer-update" method="POST">

					<div class="row">
						<div class="col-md-6 col-md-push-3">
							<div class="input-group advanced-search tour-step tour-step-fifteen">
								<span class="input-group-addon"><i class="icon-search"></i></span>
								<input type="text" name="searchName" class="form-control" placeholder="Search">
							</div>
						
							<div class="well tour-step tour-step-sixteen">
								<label class="checkbox" for="checkbox1">
								    <input name="subjectCheck" type="checkbox" checked="checked" id="checkbox1" data-toggle="checkbox" value="option1">
								    Subject
								</label>

								<label class="control-label pull-left" for="select01">
									Choose Subject &nbsp;
								</label>
									

								
	
								<!-- <div class="controls">
								  	<input type="text" name="subject" placeholder="e.g. Algebra, Physics" />
								</div> -->
								
								<input type="text" name="subject" class="form-control col-md-6" name="subject" placeholder="e.g. Algebra, Physics" />
								<!-- <input type="text" class="form-control" placeholder="Text input"> -->
								<div class="clearfix"></div>
							</div>




							<div class="well tour-step tour-step-seventeen">
								<div class="checkbox"><label class="" for="checkbox2">
								    <input name="dateCheck" type="checkbox" id="checkbox2" data-toggle="checkbox" value="option2">
								    Date
								</label></div>

								

								<!-- <div class="controls date">
									<label class="control-label" for="select01">From</label>
									<div class="bfh-datepicker" data-format="y-m-d" data-date="2013-09-01">
										<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
										    <span class="add-on"><i class="icon-calendar"></i></span>
										    <input name="dateFrom" type="text" class="input-medium form-control" readonly="">
										</div>

										<div class="bfh-datepicker-calendar">
										    <table class="calendar table table-bordered">
										     	<thead>
											        <tr class="months-header">
											          	<th class="month" colspan="4">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											         	</th>

											          	<th class="year" colspan="3">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											          	</th>
											        </tr>
											        <tr class="days-header"></tr>
										     	</thead>
										      	<tbody></tbody>
										    </table>
										</div>
									</div>
								</div> 

								<div class="controls date">
									<label class="control-label" for="select01">To</label>
									<div class="bfh-datepicker" data-format="y-m-d" data-date="2013-09-10">
										<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
										    <span class="add-on"><i class="icon-calendar"></i></span>
										    <input name="dateTo" type="text" class="input-medium form-control" readonly="">
										</div>

										<div class="bfh-datepicker-calendar">
										    <table class="calendar table table-bordered">
										     	<thead>
											        <tr class="months-header">
											          	<th class="month" colspan="4">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											         	</th>

											          	<th class="year" colspan="3">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											          	</th>
											        </tr>
											        <tr class="days-header"></tr>
										     	</thead>
										      	<tbody></tbody>
										    </table>
										</div>
									</div>
								</div>  -->








								<div class="controls date col-md-6">
									<label class="control-label pull-left date" for="select01">From &nbsp;</label>
									<div class="bfh-datepicker" data-format="y-m-d" data-date="2013-09-01">
										<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
										    <span class="add-on"><i class="icon-calendar"></i></span>
										    <input name="dateFrom" type="text" class="input-medium form-control" readonly="">
										</div>

										<div class="bfh-datepicker-calendar">
										    <table class="calendar table table-bordered">
										     	<thead>
											        <tr class="months-header">
											          	<th class="month" colspan="4">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											         	</th>

											          	<th class="year" colspan="3">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											          	</th>
											        </tr>
											        <tr class="days-header"></tr>
										     	</thead>
										      	<tbody></tbody>
										    </table>
										</div>
									</div>
								</div> 

								<div class="controls date col-md-6">
									<!-- <label class="control-label pull-left" for="select01">To &nbsp;</label> -->
									<label class="control-label pull-left" for="select01" >To &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<div class="bfh-datepicker" data-format="y-m-d" data-date="2013-09-10">
										<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
										    <span class="add-on"><i class="icon-calendar"></i></span>
										    <input name="dateTo" type="text" class="input-medium form-control" readonly="">
										</div>

										<div class="bfh-datepicker-calendar">
										    <table class="calendar table table-bordered">
										     	<thead>
											        <tr class="months-header">
											          	<th class="month" colspan="4">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											         	</th>

											          	<th class="year" colspan="3">
												            <a class="previous" href="#"><i class="icon-chevron-left"></i></a>
												            <span></span>
												            <a class="next" href="#"><i class="icon-chevron-right"></i></a>
											          	</th>
											        </tr>
											        <tr class="days-header"></tr>
										     	</thead>
										      	<tbody></tbody>
										    </table>
										</div>
									</div>
								</div> 

							<div class="clearfix"></div>
							</div>

							<div class="well tour-step tour-step-eighteen">
								<div class="checkbox"><label class="" for="checkbox3">
								    <input name="orderCheck" type="checkbox" id="checkbox3" data-toggle="checkbox" value="option3">
								    Order By
								</label></div>

								<label class="control-label pull-left" for="select01">
									Choose Order &nbsp;
								</label>

								
	
								
								<!-- <div class="controls">
									<select name="order" id="select01">
									    <option value="dateUploaded">Date</option>
									    <option value="downloads">Popularity</option>
									    <option value="name">Name</option>
								  	</select>
								</div> -->

								<select class="form-control col-md-6" name="order" id="select01">
								    <option value="dateUploaded">Date</option>
								    <option value="downloads">Popularity</option>
								    <option value="name">Name</option>
							  	</select>
							  	<div class="clearfix"></div>
							</div>

	 						<div class="clearfix"></div>
							
							<div class="form-actions advanced-search">
								<button type="submit" class="btn btn-primary tour-step tour-step-nineteen" >Search</button>
								<!-- <a href="index.php" class="btn btn-default">Cancel</a> -->
								
								<a class="btn btn-default" href="/loop-XYZ/store/developer-update">Cancel</a>
								<!-- <button type="reset" class="btn btn-default">Cancel</button> -->


								<!-- <button onclick="document.location='http://localhost/jiary/index.php/journal/create_entry'" class="btn btn-success btn-lg btn-block main" type="button">Create</button>
								<button type="button" class="btn btn-info btn-lg btn-block main" onclick="document.location='http://localhost/jiary/index.php/journal/jiary_view'">Jiary View</button> -->
							</div>
				        </div>
					</div>
				</form>
			</div>
		</div>	


  		<div class="clearfix"></div>

		
		
		<!-- Take this out if you want the original footer back -->
        <div class="push"></div>
	</div>

	<div class="footer">
		<footer id="footer-wrap-index">
			<!-- <div class="container"> -->
	            <div class="copyright-here pull-left advanced-search">
					Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    <!-- </div> -->
	    </footer>
    </div>
        
        <!-- echo '--><!-- Change Password Pop Up -->
        <form id="defaultForm" method="post">
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
                                    

                                    <!--' . $alert . '--><div class="form-group">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Old Password" required/>
                                    </div>

                                    <div class="form-group">
                                        <input type="password" class="form-control" id="enterNewPassword" name="newPassword" placeholder="Enter New Password" />
                                    </div>

                                    <div class="form-group last">
                                        <input type="password" class="form-control last" id="confirmNewPassword" name="confirmNewPassword" placeholder="Confirm New password" />
                                    </div>


                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3 ">
                                    <button type="submit" class="btn btn-primary" id="changepassword"><i class="icon-ok icon-large default"></i> Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- Change Email Pop Up -->
        <form id="emailForm" method="post">
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

                                   

                                   <!--' . $alert . '--> <div class="form-group">
                                        <input type="password" class="form-control" id="emailPassword" name="emailPassword" placeholder="Enter Password" required/>
                                    </div>

                                    <div class="form-group last">
                                        <input type="text" class="form-control last" id="enterNewEmail" name="enterNewEmail" placeholder="Enter New Email" required/>
                                    </div>
                                

                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary" id="changeEmail"><i class="icon-ok icon-large default"></i> Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </form>

	<!-- Load JS here for greater good =============================-->

	<!--?php $this->layout->footer_subpages() ?-->
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
            
            
            <script src="js/angular/angular.js"></script>
            <script src="js/angular/ngStorage.js"></script>
            <script src="js/loop.js" type="text/javascript"></script>

            <!-- Datepicker =================================================-->
            <!--script src="'.$this->base_url.'css/bootstrapformhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script-->
            <script src="css/bootstrapformhelpers/js/bootstrap-formhelpers.js"></script>
            
            <script src="css/bootstrap3/js/tooltip.js"></script>
            <script src="css/bootstrap3/js/popover.js"></script>

            <!-- Bootstrap tour =================================================-->
            <script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
            <script src="js/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
            <!--script src="'.$this->base_url.'js/developer-tour-script.js"></script-->

            <!-- Input File =================================================-->
            <script src="css/inputfile/jquery.inputfile.js"></script>

            <!-- Form Validator =================================================-->

            <script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>

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
