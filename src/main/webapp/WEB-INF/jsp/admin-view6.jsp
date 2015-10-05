<!--NOTE:-->
<!--Functions in php that have not been transfered/revised here:-->
    <!--?php $this->layout->modal_footer() ?>-->
    <!--?php echo date("Y"); ?-->
<!--?php
	session_start();
	$counter=0;
?-->
<!DOCTYPE html>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Admin - Learning Objects</title>

<!--?php $this->layout->header_subpages() ?-->
<link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />

            <!-- Bootstrap 3 -->
            <link href="css/bootstrap3/dist/css/bootstrap.css" rel="stylesheet" media="screen" />

            <!-- <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" media="screen" /> -->
            <!-- <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" /> -->

            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <!-- Date Picker -->
            <!--link href="'.$this->base_url.'css/bootstrap-formhelpers/docs/assets/css/bootstrap-responsive.css" rel="stylesheet" /-->
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
            <!--link type="text/css" href="'.$this->base_url.'css/css-include/1280grid.css" rel="stylesheet" /-->

            <!-- Bootstrap Tour -->
            <link href="js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
            <link href="js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />



            <!--link type="text/css" href="'.$this->base_url.'css/css-include/style.css" rel="stylesheet" /-->
            <link type="text/css" href="css/css-include/style-footer-try.css" rel="stylesheet" />
                
            <!-- Input File -->
            <link type="text/css" href="css/inputfile/jquery.inputfile.css" rel="stylesheet" />

<!--?php
	echo '--><script type="text/javascript">
			function select(i)
			{
				document.getElementById("counters").value = i;
				document.getElementById("ctr").value = i;
			}
		</script><!--';

?-->

</head>
<body>	
	<!-- <div id="wrapper"> -->
	<div class="wrapper">
    	<!--?php $this->layout->modal_footer() ?-->
		
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

		<div class="clearfix"></div>

    	<ul class="nav nav-tabs main-views">
    		<li><a href="/loop-XYZ/store/admin-view"><i class="icon-plus-sign-alt icon-large default"></i> New Account Requests</a></li>
			<li><a href="/loop-XYZ/store/admin-view1"><i class="icon-folder-open icon-large default"></i> Developers</a></li>
		    <li><a href="/loop-XYZ/store/admin-view2"><i class="icon-edit icon-large default"></i> Reviewers</a></li>
		    <li><a href="/loop-XYZ/store/admin-view3"><i class="icon-time icon-large default"></i> Inactive Accounts</a></li>
		    <li><a href="/loop-XYZ/store/admin-view4"><i class="icon-ban-circle icon-large default"></i> Blocked Accounts</a></li>
		    <li><a href="/loop-XYZ/store/admin-view5"><i class="icomoon-list"></i> Learning Objects</a></li>
			<!-- <li class="active"><a href="<?php //echo base_url()?>redirect/admin_view5"><i class="icon-list icon-large default"></i> Learning Objects</a></li> -->
			<li class="active"><a class="active-tab" href="/loop-XYZ/store/admin-view6"><i class="icomoon-list"></i> Learning Elements</a></li>
		</ul>

		<div class="clearfix"></div>

  		<div id="content-wrap-rev">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">
						
						<div class="table-responsive" ng-controller="LEListCtrl">
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
						        <tbody>
                                                            
                                                            <tr ng-repeat="le in les | filter:searchText">
                                                                <td>
                                                                <td><a href="'" onclick=""><label ng-model="name">{{le.name}}</a></td>
                                                                <td><label ng-model="le.subject">{{le.subject}}</td>
                                                                <td><label ng-model="le.dateUploaded">{{le.dateUploaded}}</td>
                                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label ng-model="le.rating">{{le.rating}}</td>
                                                                <td><label ng-model="le.comments">{{le.comments}}</td>
                                                                <td ng-if="le.status==0"><i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>
                                                                <td ng-if="le.status==1"><i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>
                                                                <td ng-if="le.status==2"><i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>
                                                                <td><label ng-model="le.rev">{{le.rev}}</td>
                                                                <td><label ng-model="le.uploadedBy">{{le.uploadedBy}}</td>
                                                                </td>
                                                            </tr>
						        <!--?php  

					        		require './application/controllers/LEController.php';
					        		$controller = new LEController;
						if(isset($_POST['searchName'])){
							$subject = null;
							$dateFrom = null;
							$dateTo = null;
							$order = null;
							//find by subject
							if(isset($_POST['subject']) && isset($_POST['subjectCheck'])){
								$subject = $_POST['subject'];
							}
							//find by date
							if(isset($_POST['dateFrom']) && isset($_POST['dateTo']) && isset($_POST['dateCheck'])){
								$dateFrom = $_POST['dateFrom'];
								$dateTo = $_POST['dateTo'];
							}
							//order by
							if(isset($_POST['order']) && isset($_POST['orderCheck'])){
								$order = $_POST['order'];
							}
							$LEs = $controller->searchLE($_POST['searchName'],$subject,$dateFrom,$dateTo,$order);
							//$_POST['searchName'] = null;
						}
						else{//new condition for advanced search
							$LEs = @$controller->getAllLE();
						}
						$_SESSION['les'] = serialize($LEs);
						$LE = current($LEs);
						if($LE != null && isset($_POST['searchName'])){
								echo '<tr style="font-size:80%;"><td><i class="icon-search"></i></td><td colspan="5">Search Results for "'.$_POST['searchName'].'"....<a href="'. base_url().'"redirect/LO>CLICK HERE</a> to reload all Learning Objects</td>';
								 	echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '</tr>';
								}
						while($LE != null)
						{
							echo '<form name="form'.$counter.'" action="<?php echo base_url()?>/redirect/history" method="POST">';
							echo '<tr>';
							if($LE->getRating()==1)
								echo '<td><img src="'.base_url().'img/icon-red.png" alt="For Review" /></td>';
							else if($LE->getRating()==2)
								echo '<td><img src="'.base_url().'img/icon-orange.png" alt="For Review" /></td>';
							else if($LE->getRating()==3)
								echo '<td><img src="'.base_url().'img/icon-yellow.png" alt="For Review" /></td>';
							else if($LE->getRating()==4)
								echo '<td><img src="'.base_url().'img/icon-yellowgreen.png" alt="For Review" /></td>';
							else if($LE->getRating() == 5)
								echo '<td><img src="'.base_url().'img/icon-green.png" alt="Ready To Use" /></td>';
							// echo '<td><a href="#responsive_fileActionReviewer" data-toggle="modal" >'.$LO->getName().'</a></td>';
							
							echo '<td><a onclick="select('.$counter.')" href="'.base_url().'redirect/history/LE/'.$counter.'" data-toggle="modal" >'.$LE->getName().'</a></td>';
							echo '<td>'.$LE->getSubject().'</td>';
							echo '<td>'.$LE->getDateUploaded().'</td>';
							echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LE->getRating().'</td>';
							echo '<td>'.$LE->getComments().'</td>';
							echo '<input type="hidden" name="downloadLO" value="'.$counter.'"/>';
							if($LE->getStatus() == 0)
								echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>';
							else if($LE->getStatus() == 2)
								echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>';
							else if($LE->getStatus() == 1)
								echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>';
							echo '<td>'.$LE->getRev().'</td>';
							echo '<td>'.$LE->getUploadedBy().'</td>';
							echo '</tr>';
							echo '</form>';
							next($LEs);
							$LE = current($LEs);
							$counter++;
						}
						if($counter == 0){
							echo '<tr>';
									echo '<td colspan=9><h2 style="color: #000; font-weight:bold;">No Learning Elements found.</h2><br>
														No Learning Elements found.Please <a href="'. base_url().'"redirect/upload class="btn btn-success">CLICK HERE</a> to refresh the list.</td>';			
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '</tr>';
						}
						        ?-->
									
														
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
					Copyright &copy; <?php echo date("Y"); ?> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    </div>
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

	<!-- Bootstrap tour =================================================-->
	<script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
	<script src="js/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>

	<!-- Form Validator =================================================-->
	<script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>

	<script>
	$("#banner-wrap").backstretch("img/img-banner.jpg");
	</script>

<!--	<script> 
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

                $('<i class="icomoon-search pull-left searchbar-icon"></i>').prependTo($('div:eq(0) > div > div:eq(0)',datatable.parents('.dataTables_wrapper')));
                $('div:eq(0) > div > div:eq(0) > div',datatable.parents('.dataTables_wrapper')).addClass('pull-right');
                
                search_input.addClass('form-control input-sm');
                search_input.width('140px'); //used to be 150
                length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
                length_sel.addClass('form-control input-sm').css({ padding: '5px 10px 5px 5px', cursor: 'pointer' });
                $('option', length_sel).css({ padding: '5px 8px' });
                var pagination = datatable.closest('.dataTables_wrapper').find('ul.pagination');
                pagination.addClass('pagination-sm');
            }
		});


		// $(document).ready( function () {
		// 	var oTable = $('#DataTables_Table_0').dataTable();
		// 	new FixedHeader( oTable );
		// });

	</script>
-->
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
