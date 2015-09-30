<!--NOTE:-->
<!--Functions in php that have not been transfered/revised here:-->
    <!--?php $this->layout->modal_footer() ?>-->
    <!--?php echo date("Y"); ?-->

<!DOCTYPE html>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Advanced Search</title>

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
	                    
	                    <a class="navbar-brand" href="/loop-XYZ/store/reviewer-update">
							<img src="img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
						</a>
	                </div>
					
					<div class="navbar-collapse collapse" ng-controller="LoginCtrl">
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
		  <li ><a href="/loop-XYZ/store/reviewer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
		  <li><a class="active-tab" href="/loop-XYZ/store/reviewer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
		  <!-- <li><a href="#"><i class="icomoon-signup"></i> Review</a></li> -->
		  <li><a href="/loop-XYZ/store/reviewer-list"><i class="icon-edit icon-large default"></i> Review List</a></li>
		  <li class="active"><a class="active-tab"  href="#"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
		</ul>


		<div class="clearfix"></div>


		<!-- Gi sugdan -->

		<div id="content-wrap">
			<div class="container">
				<form class="form-horizontal" action="redirect/LO_rev" method="POST">

					<div class="row">
						<div class="col-md-6 col-md-push-3">
							<div class="input-group advanced-search">
								<span class="input-group-addon"><i class="icon-search"></i></span>
								<input type="text" name="searchName" class="form-control" placeholder="Search">
							</div>
						
							<div class="well">
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
								
								<input type="text" class="form-control col-md-6" name="subject" placeholder="e.g. Algebra, Physics" />
								<!-- <input type="text" class="form-control" placeholder="Text input"> -->
								<div class="clearfix"></div>
							</div>




							<div class="well">
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

							<div class="well">
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
								<button type="submit" class="btn btn-primary">Search</button>
								<!-- <a href="index.php" class="btn btn-default">Cancel</a> -->
								
								<!-- <button type="reset" class="btn btn-default">Cancel</button> -->
								<a class="btn btn-default" href="index.php">Cancel</a>

								<!-- <button onclick="document.location='http://localhost/jiary/index.php/journal/create_entry'" class="btn btn-success btn-lg btn-block main" type="button">Create</button>
								<button type="button" class="btn btn-info btn-lg btn-block main" onclick="document.location='http://localhost/jiary/index.php/journal/jiary_view'">Jiary View</button> -->
							</div>
				        </div>
					</div>
				</form>
			</div>
		</div>





		
		<!-- <div id="content-wrap">
			<div class="container">
           		<form class="form-horizontal" action="developer.php" method="POST">
			        <fieldset class="col-md-6 col-md-offset-3">
						<legend>Advanced Search</legend>

						<div class="advanced-search form-group">
							<label class="control-label" for="input01"><i class="icon-search"></i> Search</label>
							<div class="controls advanced-search">
								<input type="text" name="searchName" class="input-xlarge form-control" id="input01">
							</div>

							<div class="well">
								<div class="checkbox"><label class="" for="checkbox1">
								    <input name="subjectCheck" type="checkbox" checked="checked" id="checkbox1" data-toggle="checkbox" value="option1">
								    Subject
								</label></div>

								<label class="control-label" for="select01">
									Choose Subject
								</label>

								<div class="controls">
								  	<input type="text" name="subject" placeholder="e.g. Algebra, Physics" class="form-control">
								</div>
							</div>

							<div class="well">
								<div class="checkbox"><label class="" for="checkbox2">
								    <input name="dateCheck" type="checkbox" id="checkbox2" data-toggle="checkbox" value="option2">
								    Date
								</label></div>

								<label class="control-label" for="select01">
									From
								</label>

								<div class="controls date">
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

								<label class="control-label" for="select01">
									To
								</label>

								<div class="controls">
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
							</div>

							<div class="well">
								<div class="checkbox"><label class="" for="checkbox3">
								    <input name="orderCheck" type="checkbox" id="checkbox3" data-toggle="checkbox" value="option3">
								    Order By
								</label></div>

								<label class="control-label" for="select01">
									Choose Order
								</label>
								
								<div class="controls">
									<select name="order" id="select01">
									    <option value="dateUploaded">Date</option>
									    <option value="downloads">Popularity</option>
									    <option value="name">Name</option>
								  	</select>
								</div>
							</div>

 						<div class="clearfix"></div>
						
						<div class="form-actions advanced-search">
							<button type="submit" class="btn btn-primary">Search</button>
							<a href="index.php" class="btn btn-default">Cancel</a>
						</div>
			        </div></fieldset>
				</form>

				<div class="clearfix"></div>

	  		</div>
  		</div>		 -->


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
	            <div class="copyright-here pull-left advanced-search">
					Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    <!-- </div> -->
	    </footer>
    </div>

	<!-- Load JS here for greater good =============================-->
        <script src="js/js-flat-ui/jquery-1.8.3.min.js"></script>
        <script src="js/js-flat-ui/jquery-ui-1.10.3.custom.min.js"></script>
        <script src="js/js-flat-ui/jquery.ui.touch-punch.min.js"></script>
        <script src="js/js-flat-ui/flatui-checkbox.js"></script>
        <script src="js/js-flat-ui/flatui-radio.js"></script>
        <script src="js/js-flat-ui/jquery.tagsinput.js"></script>
        <script src="js/js-flat-ui/jquery.placeholder.js"></script>
        <script src="js/main.js"></script>
        <script src="js/js-flat-ui/jquery.stacktable.js"></script>
        <script src="http://vjs.zencdn.net/c/video.js"></script>

        <script src="js/backstretch-jquery/jquery.backstretch.min.js"></script>

        <script src="js/datatables/jquery.dataTables.min.js"></script>

        <script src="js/datatables/dataTables.bootstrap.js"></script>
        
        <script src="js/angular/angular.js"></script>
        <script src="js/angular/ngStorage.js"></script>
        <script src="js/loop.js" type="text/javascript"></script>

        <script src="css/bootstrap3/js/tooltip.js"></script>
        <script src="css/bootstrap3/js/popover.js"></script>

        <!-- Bootstrap tour =================================================-->
        <script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
        <script src="bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
        <!--script src="'.$this->base_url.'js/reviewer-tour-script.js"></script-->

        <!-- Form Validator =================================================-->
        <script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
        <script src="css/bootstrap3/dist/js/bootstrap.js"></script>
        
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
