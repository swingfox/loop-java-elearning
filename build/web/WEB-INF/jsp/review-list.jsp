
<!DOCTYPE html>
<html lang="en">
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
           <!-- 
            <?php $this->layout->header_subpages() ?>
            <?php session_start();?>
           -->
    </head>
    <body>
        <!-- <div id="wrapper"> -->
	<div class="wrapper">
    	<!--<?php $this->layout->modal_footer() ?>-->
		
		<div id="header-wrap">
			<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
				<div class="container">
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

						<!--<?php $this->layout->user_menu() ?>-->
					
					</div>
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
			<li><a href="redirect/LO_rev"><i class="icomoon-list"></i> Learning Objects</a></li>
			 <li><a class="active-tab" href="redirect/LE_rev"><i class="icomoon-list"></i> Learning Elements</a></li>
			<!-- <li class="active"><a class="active-tab" href="<?php echo base_url()?>redirect/reviewlist_rev"><i class="icomoon-signup"></i> Review List</a></li> -->
			<li class="active"><a class="active-tab" href="<?php echo base_url()?>redirect/reviewlist_rev"><i class="icon-edit icon-large default"></i> Review List</a></li>
			<li><a href="<?php echo base_url()?>redirect/search_rev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
		</ul>

		<div class="clearfix"></div>

  		<div id="content-wrap-rev">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">						
						<div class="table-responsive">
						  <!-- <table class="datatable table table-bordered"> -->
						  <table class="datatable table table-hover">
						    <thead>
								<tr>
									<th class="color-code"><!-- <img src="<?php echo base_url() ?>img/icon-colorcode.png" alt="color code" /> --></th>
									<th>Name</th>
									<th>Subject</th>
									<th>Type</th>
									<!-- <th>Date Uploaded</th> -->
									<th>Uploaded</th>
									<th>Status</th>
									<th>Rating</th>
									<th>Comments</th>
								
								</tr>
							</thead>
					        <tbody>
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

	<div class="footer">
		<footer id="footer-wrap-index">
			<div class="container">
	            <div class="copyright-here pull-left">
					Copyright &copy; <!--<?php echo date("Y"); ?>--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    </div>
	    </footer>
    </div>

	<!-- Load JS here for greater good =============================-->

	<?php $this->layout->footer() ?>

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
