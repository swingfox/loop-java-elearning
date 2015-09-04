
<!--
<?php
	session_start();//to use session variables
	require './application/controllers/LOController.php';
	$los = unserialize($_SESSION['los']);
	$index = $counter;
	$lo = $los[$index];
	$_SESSION['lo'] = serialize($lo);
	$id = $lo->getID();
	$rev = $lo->getRev();
	$dev = $lo->getUploadedBy();
	$name = $lo->getName();
	$status = $lo->getStatus();
	$filepath = $lo->getFilepath();

	$path = base_url().'uploads/';
?>
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>LOOP | History</title>
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
            <!--<?php $this->layout->header() ?>-->

    </head>
    <body>
        <!-- <div id="wrapper"> -->
	<div class="wrapper">
    	<!--<?php $this->layout->modal_footer() ?>-->
		
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

						<!--<?php $this->layout->user_menu() ?>-->
					
					</div>
				<!-- </div> -->
			</nav>
		</div>

		<div class="clearfix"></div>

		<div id="breadcrumb-wrap">
			<!-- <div class="container"> -->
				<ol class="breadcrumb">
					<li><a class="breadcrumb-link" href="<?php echo base_url().'index.php'?>">Back to Learning Object List</a></li>
					<li class="active">History - <!--<?php echo $name?>--></li>
				</ol>
			<!-- </div> -->
		</div> 

		<div class="clearfix"></div>

		<form name="uniquetest" method="post" action="<?php echo base_url().'redirect/deleteLO_admin/'?>">
            <div class="modal fade" id="responsive_confirmDelete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">Delete</span>
                        </div>
                        <div class="modal-body">  
                            <div class="row">
                                <div class="col-md-10 col-md-push-1">                                 
                                    <label class="file-action">Are you sure you want to delete this Learning Object?</label>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-push-3">      
                                <input type="hidden" value="" id="counters" name="counters">                                                                  
                                    <button type="button" class="btn btn-primary" onclick="document.uniquetest.submit()"><i class="icon-ok icon-large default"></i> Yes &nbsp;</button>
                            		<button type="button" class="btn btn-default" data-dismiss="modal" style="color: red;"><i class="icon-remove icon-large default"></i> &nbsp; No &nbsp;</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <form name="tester" method="post" action="<?php echo base_url().'redirect/plusrevLO/'?>">
            <div class="modal fade" id="responsive_addReviewer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content fileAction">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">Add Reviewer</span>
                        </div>
                        <div class="modal-body">  
                            <div class="row">
                                <div class="col-md-10 col-md-push-1">                                 
                                    <label class="file-action">Choose a Reviewer for the Learning Object</label>
                                   <!-- <?php 
	                                    require './application/controllers/AdminController.php';
						        		$controller = new AdminController;
						        		$siteUsers = @$controller->getAllSiteUsersRev();						        		
										$indexer = 0;
										$siteUser = current($siteUsers);
					        		
						        		echo '<select name="reviewer" class="btn btn-default">';
						        			echo '<option value="">--none--</option>';
							        		while($siteUser != null){
							        			echo '<option value="'.$siteUser->getUserName().'">'.$siteUser->getUserName().'</option>';
												next($siteUsers);
												$siteUser = current($siteUsers);
												$indexer++;

							        		}        			
						        		echo '</select>';
					        		?>-->
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-push-3">      
                                <input type="hidden" value="<?php echo $counter?>" id="counters" name="counters">                                                                  
                                    <button type="button" class="btn btn-primary" onclick="document.tester.submit()"><i class="icon-ok icon-large default"></i> Yes &nbsp;</button>
                            		<button type="button" class="btn btn-default" data-dismiss="modal" style="color: red;"><i class="icon-remove icon-large default"></i> &nbsp; No &nbsp;</button>
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
		<!-- Gi sugdan -->

		<div class="clearfix"></div>
		<!-- <div id="content-wrap"> -->

		<div id="content-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">
						
						<div class="table-responsive">
						 	<!-- <table class="datatable table table-bordered"> -->
						 	<table class="datatable table table-hover">


						    <thead>
								<tr>
									<th class="color-code">#</th>
									<th>Name</th>
									<th>Subject</th>
									<!-- <th>Date Uploaded</th> -->
									<th>Uploaded</th>
									<th>Rating</th>
									<th>Comments</th>
									<th>Reviewer</th>
								</tr>
							</thead>
					        <tbody>
                                                    <!--
						        <?php
						        $controller = new LOController();
						        $LOs = $controller->getLOHistory($name,$dev);
						        $_SESSION['histlos'] = serialize($LOs);
						        $LO = current($LOs);
						        $count = count($LOs);
						        $i=0;
						        while($LO!=NULL){						       		
								  	echo '<tr>';										
										echo '<td>'.($i+1).'</td>';
										if(($i+1)!=$count)
											echo '<td><a href="'.$path.$LO->getFilepath().'">'.$LO->getName().'</a></td>';
										else
											echo '<td>'.$LO->getName().'</a></td>';
										echo '<td>'.$LO->getSubject().'</td>';
										// echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LO->getDateUploaded().'</td>';
										echo '<td>'.$LO->getDateUploaded().'</td>';
										echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LO->getRating().'</td>';
										echo '<td>'.$LO->getComments().'</td>';
										echo '<td>'.$LO->getRev().'</td>';;
										echo '<input type="hidden" name="downloadlo" value="'.$counter.'"/>';
									echo '</tr>';
									next($LOs);
									$LO = current($LOs);
									$i++;							
								}
						        ?>-->													
							</tbody>
						  </table>
						</div>
						<div>
							<input type="hidden" value="<?php echo $index?>" id="ctr" name="ctr">
                            <input type="hidden" value="" id="counters" name="counters">

                           <a href="#responsive_addReviewer" class="btn btn-default" data-dismiss="modal" data-toggle="modal"><i class="icon-plus-sign icon-large default"></i> Add Reviewer</a>
							<a hrefredirect="" type="button" class="btn btn-primary"><i class="icon-edit icon-large"></i> Review</a>
							<a href="#responsive_confirmDelete" class="btn btn-primary" data-dismiss="modal" data-toggle="modal"><i class="icon-trash icon-large default"></i> Delete</a>
				    		<a href="" class="btn btn-default"> Back</a>
						</div>
					</div>
				</div>
				
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div>
				<div class="clearfix"></div>				
			</div>
		</div> 

  		<div class="clearfix"></div>

        <div class="push"></div>
	</div>

	<div class="footer">
		<footer id="footer-wrap-index">
			<!-- <div class="container"> -->
	            <div class="copyright-here pull-left download">
					Copyright &copy; <!--<?php echo date("Y"); ?>--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    <!-- </div> -->
	    </footer>
    </div>

	<!-- Load JS here for greater good =============================-->

	<!--?php $this->layout->footer_subpages() ?-->

	<!--<?php $this->layout->footer() ?>-->

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
