
<!DOCTYPE html>
<html lang="en" ng-app="loop">
    <head>
        <title>LOOP | Review List</title>
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
	<div class="wrapper" ng-controller="LoginCtrl">
    	<!--<?php $this->layout->modal_footer() ?>-->
		
		<div id="header-wrap">
			<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
				
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
					
					 <div class="navbar-collapse collapse" >
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
				
			</nav>
		</div>


<!-- ========================================================================================================================

MAKE THIS BOOTSTRAP 3

========================================================================================================================= -->

		<!-- File Action Update-->
        <form method="post" action="'.base_url().'index.php/account/change_password">
            <div class="modal fade" id="responsive_fileActionDeveloper" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">File Action</span>
                        </div>
                        <div class="modal-body">  
                            <div class="row">
                                <div class="col-md-10 col-md-push-1">
                                    <!-- <p><input class="col-xs-12 col-md-12 sign-up" id="password" type="password" name="password" placeholder="Enter Old Password"></p>
                                    <p><input class="col-xs-12 col-md-12 sign-up" id="enterNewPassword" type="password" name="newPassword" placeholder="Enter New Password"></p>
                                    <p><input class="col-xs-12 col-md-12 sign-up last" id="confirmNewPassword" type="password" name="confirmNewPassword" placeholder="Confirm New Password"></p> -->
                                    <label class="file-action">What would you like to do with this Learning Object?</label>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-push-3">
                                    <!-- <button type="submit" class="btn btn-primary">Save changes</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> -->
                                    <a href="#responsive_confirmUploadRev" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"><i class="icon-upload-alt icon-large default"></i> Upload Revision</a>
						    		<a href="#responsive_confirmDelete" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"><i class="icon-trash icon-large default"></i> Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

		<!-- File Action Update-->
        <form method="post" action="'.base_url().'index.php/account/change_password">
            <div class="modal fade" id="responsive_fileActionDeveloper" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">File Action</span>
                        </div>
                        <div class="modal-body">  
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <!-- <p><input class="col-xs-12 col-md-12 sign-up" id="password" type="password" name="password" placeholder="Enter Old Password"></p>
                                    <p><input class="col-xs-12 col-md-12 sign-up" id="enterNewPassword" type="password" name="newPassword" placeholder="Enter New Password"></p>
                                    <p><input class="col-xs-12 col-md-12 sign-up last" id="confirmNewPassword" type="password" name="confirmNewPassword" placeholder="Confirm New Password"></p> -->
                                    <label class="file-action">What would you like to do with this Learning Object?</label>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <!-- <button type="submit" class="btn btn-primary">Save changes</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> -->
                                    <a href="#responsive_confirmUploadRev" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"><i class="icon-upload-alt icon-large default"></i> Upload Revision</a>
						    		<a href="#responsive_confirmDelete" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"><i class="icon-trash icon-large default"></i> Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

		<div class="clearfix"></div>

    	<ul class="nav nav-tabs main-views">
			<li><a href="/loop-XYZ/store/reviewer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
			 <li><a class="active-tab" href="/loop-XYZ/store/reviewer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
			<!-- <li class="active"><a class="active-tab" href="<?php echo base_url()?>redirect/reviewlist_rev"><i class="icomoon-signup"></i> Review List</a></li> -->
			<li class="active"><a class="active-tab" href="/loop-XYZ/store/reviewer-list"><i class="icon-edit icon-large default"></i> Review List</a></li>
			<li><a href="/loop-XYZ/store/advanced-search-rev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
		</ul>

		<div class="clearfix"></div>

  		<div id="content-wrap-rev">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">						
						<div class="table-responsive">
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
						  <table class="datatable table table-hover" ng-controller="LEList">
						    <thead>
								<tr>
									<th class="color-code"><!-- <img src="<?php echo base_url() ?>img/icon-colorcode.png" alt="color code" /> --></th>
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
                                                    <tr ng-repeat="le in les | filter:searchText | filter: { rev : username }">
                                                        <td>
                                                            <img ng-if="le.rating==1" src="http://localhost/loop.com/img/icon-red.png" alt="For Review">
                                                            <img ng-if="le.rating==2" src="http://localhost/loop.com/img/icon-orange.png" alt="For Review">
                                                            <img ng-if="le.rating==3" src="http://localhost/loop.com/img/icon-yellow.png" alt="For Review">
                                                            <img ng-if="le.rating==4" src="http://localhost/loop.com/img/icon-yellowgreen.png" alt="For Review">
                                                            <img ng-if="le.rating==5" src="http://localhost/loop.com/img/icon-green.png" alt="For Review">

                                                        </td>
                                                       <td><a href="'" onclick=""><label ng-model="name">{{le.name}}</a></td>
                                                       <td><label ng-model="subject">{{le.subject}}</td>
                                                       <td><label ng-model="dateUploaded">{{le.dateUploaded}}</td>
                                                       <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label ng-model="rating">{{le.rating}}</td>
                                                       <td><label ng-model="comments">{{le.comments}}</td>    
                                                       <td ng-if="le.status==0"><i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>
                                                        <td ng-if="le.status==1"><i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>
                                                        <td ng-if="le.status==2"><i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>
                                                       <td><label ng-model="rev">{{le.rev}}</td>   
                                                       <td><label ng-model="uploadedBy">{{le.uploadedBy}}</td>                                              
                                                   </tr>
                                                    <!--
					        <?php  

				        		require './application/controllers/LOController.php';
				        		$controller = new LOController();
				        		//$controller = new LEController();
				        			//Either Controller works for both LE and LO for review-list.php
				        		// $username = 'Details'.$username;
							

						$controller = new LOController;
						$user = $this->session->userdata('username');
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
							$LOs = $controller->searchLORevLater($_POST['searchName'],$subject,$dateFrom,$dateTo,$order,$user);
							//$_POST['searchName'] = null;
						}
						else{//new condition for advanced search		
                            $LOs = @$controller->getUserRevList($user);
						}
						$_SESSION['obj'] = serialize($LOs);
						$counter = 0;
						$LO = current($LOs);
						//print_r($LOs);
						while($LO != null)
						{	
								echo '<form name="form'.$counter.'" action="<?php echo base_url()?>/redirect/history" method="POST">';
								echo '<tr>';
								if($LO->getRating()==1)
								echo '<td><img src="'.base_url().'img/icon-red.png" alt="For Review" /></td>';
							else if($LO->getRating()==2)
								echo '<td><img src="'.base_url().'img/icon-orange.png" alt="For Review" /></td>';
							else if($LO->getRating()==3)
								echo '<td><img src="'.base_url().'img/icon-yellow.png" alt="For Review" /></td>';
							else if($LO->getRating()==4)
								echo '<td><img src="'.base_url().'img/icon-yellowgreen.png" alt="For Review" /></td>';
									// echo '<td><a href="#responsive_fileActionReviewer" data-toggle="modal" >'.$LO->getName().'</a></td>';
								echo '<td><a href="'.base_url().'redirect/history/'.$LO->getType().'/'.$counter.'" onclick="document.form'.$counter.'.submit()">'.$LO->getName().'</a></td>';
								echo '<td>'.$LO->getSubject().'</td>';
								echo '<td>&nbsp;&nbsp;'.$LO->getType().'</td>';
								echo '<td>'.$LO->getDateUploaded().'</td>';
								if($LO->getStatus() == 0)
											echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>';
										else if($LO->getStatus() == 2)
											echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>';
										else if($LO->getStatus() == 1)
											echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>';
								echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LO->getRating().'</td>';
								echo '<td>'.$LO->getComments().'</td>';
								echo '<input type="hidden" name="downloadLO" value="'.$counter.'"/>';
								echo '</tr>';
								echo '</form>';
								next($LOs);
								$LO = current($LOs);
								$counter++;
						}
						if($counter == 0){
							echo '<tr>';
							echo '<td>'.'</td>';
							echo '<td colspan=5><h2 style="color: #000; font-weight:bold;">No Learning Objects and Learning Elements found.</h2><br>
												No Learning Objects and Learning Elements found. Please <a href="'. base_url().'redirect/LE_rev" class="btn btn-success">CLICK HERE</a> to refresh the list.</td>';
							echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';
									echo '<td style="display: none">'.'</td>';

							echo '</tr>';
						}
					?>-->
								
													
							</tbody>
						  </table>
						</div>

					</div>
				</div>
				
				<div class="clearfix" id="before-features" ></div>
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
        </div>
	<div class="footer">
		<footer id="footer-wrap-index">
			<div class="container">
	            <div class="copyright-here pull-left">
					Copyright &copy; <!--<?php echo date("Y"); ?>--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    </div>
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
	</script>
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
        <script>

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
