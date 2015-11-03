<jsp:include page="include/headerScript.jsp"/>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Advanced Search</title>
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
            <!--[if IE 7]> -->
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
                          <li><a href="developer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
                          <li class=" tour-step tour-step-two"><a class="active-tab"  href="developer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
                          <li><a href="uploadLE-dev"><i class="icon-upload-alt icon-large default"></i> Upload LE</a></li>
                          <li class="active tour-step tour-step-fourteen"><a class="active-tab" href="advanced-search-dev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
                </ul>

		<div class="clearfix"></div>

		<div id="content-wrap" ng-controller="advanceSearchController">
			<div class="container">
				<form class="form-horizontal" method="POST">

					<div class="row">
						<div class="col-md-6 col-md-push-3">
							<div class="input-group advanced-search tour-step tour-step-fifteen">
								<span class="input-group-addon"><i class="icon-search"></i></span>
								<input type="text" name="searchName" class="form-control" placeholder="Search" ng-model="searchTitle">
							</div>
						
							<div class="well tour-step tour-step-sixteen">
								<label class="checkbox" for="checkbox1" ng-click="showSubject()">
								    <input name="subjectCheck" type="checkbox" id="checkbox1" data-toggle="checkbox">
								    Subject
								</label>

								<label class="control-label pull-left" for="select01">
									Choose Subject &nbsp;
								</label>
								
								<input type="text" name="subject" class="form-control col-md-6" name="subject" placeholder="e.g. Algebra, Physics" ng-model="searchSubject" />
								<div class="clearfix"></div>
							</div>

							<div class="well tour-step tour-step-seventeen">
								<div class="checkbox"><label class="" for="checkbox2" ng-click="showDate()">
								    <input type="checkbox" id="checkbox2" data-toggle="checkbox">
								    Date
								</label></div>
                                                            
								<div class="controls date col-md-6">
									<label class="control-label pull-left date" for="select01">From &nbsp;</label>
									<div id="dateFrom" class="bfh-datepicker" data-format="y-m-d">
										<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker" >
										    <span class="add-on"><i class="icon-calendar"></i></span>
										    <input type="text" class="input-medium form-control">
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
									<label class="control-label pull-left" for="select01" >To &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
									<div id="dateTo" class="bfh-datepicker" data-format="y-m-d">
										<div class="input-prepend bfh-datepicker-toggle" data-toggle="bfh-datepicker">
										    <span class="add-on"><i class="icon-calendar"></i></span>
										    <input type="date" class="input-medium form-control">
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
								<div class="checkbox"><label class="" for="checkbox3" ng-click="showOrderBy">
								    <input name="orderCheck" type="checkbox" id="checkbox3" data-toggle="checkbox" value="option3">
								    Order By
								</label></div>

								<label class="control-label pull-left" for="select01">
									Choose Order &nbsp;
								</label>

								<select class="form-control col-md-6" name="order" id="select01" ng-model="searchOrderBy">
								    <option value="uploadDate">Date</option>
								    <option value="downloads">Popularity</option>
								    <option value="title">Name</option>
							  	</select>
							  	<div class="clearfix"></div>
							</div>

	 						<div class="clearfix"></div>
							
							<div class="form-actions advanced-search">
                                                            <a class="btn btn-primary tour-step tour-step-nineteen" ng-click="showResults()">Search</a>
							    <a class="btn btn-default" ng-href="developer-update">Cancel</a>
							    <button type="button" class="btn btn-info btn-lg btn-block main" onclick="document.location='http://localhost/jiary/index.php/journal/jiary_view'">Jiary View</button> -->
							</div>
				        </div>
					</div>
				</form>
			</div>
		</div>	
  		<div class="clearfix"></div>
        <div class="push"></div>

	<div class="footer">
		<footer id="footer-wrap-index">
	            <div class="copyright-here pull-left advanced-search">
					Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    </div>
	    </footer>
    </div>
	<!-- Load JS here for greater good =============================-->
	<jsp:include page="include/mainScripts.jsp"/>
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
