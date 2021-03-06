<!DOCTYPE html>
<html lang="en">
    <head>
        <title>LOOP | <History</title>
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
    <body><jsp:include page="include/CurrentUser.jsp"/>
		<div class="clearfix"></div>

		<div id="breadcrumb-wrap">
			<!-- <div class="container"> -->
				<ol class="breadcrumb">
					<li><a class="breadcrumb-link" href="/loop-XYZ/store/review-list">Back to Review List</a></li>
					<li class="active">History - <!--<?php echo $name?></li>-->
				</ol>
			<!-- </div> -->
		</div> 

		<div class="clearfix"></div>

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
						        <!--<?php
						        $controller = new LEController();
						        $LEs = $controller->getLEHistory($name,$dev);
						        $_SESSION['histles'] = serialize($LEs);
						        $LE = current($LEs);
						        $count = count($LEs);
						        $i=0;
						        while($LE!=NULL){						       		
								  	echo '<tr>';										
										echo '<td>'.($i+1).'</td>';
										if(($i+1)!=$count)
											echo '<td><a href="'.$path.$LE->getFilepath().'">'.$LE->getName().'</a></td>';
										else
											echo '<td>'.$LE->getName().'</a></td>';
										echo '<td>'.$LE->getSubject().'</td>';
										// echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LO->getDateUploaded().'</td>';
										echo '<td>'.$LE->getDateUploaded().'</td>';
										echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LE->getRating().'</td>';
										echo '<td>'.$LE->getComments().'</td>';
										echo '<td>'.$LE->getRev().'</td>';
										echo '<input type="hidden" name="downloadlo" value="'.$counter.'"/>';
									echo '</tr>';
									next($LEs);
									$LE = current($LEs);
									$i++;							
								}
						        ?>		-->											
							</tbody>
						  </table>
						</div>
						<div>
							<input type="hidden" value="<?php echo $index?>" id="ctr" name="ctr">
                            <input type="hidden" value="" id="counters" name="counters">

							<!--<?php
								if($status == 0)
								echo '<a href="'.base_url().'redirect/downloadNow/'.$counter.'/'.$filepath.'" class="btn btn-primary"><i class="icon-download-alt icon-large"></i> Download</a>';
								if($status == 2 && $rev == $username)
						 		echo '<a href="'.base_url().'redirect/review_rev/'.$counter.'/'.$filepath.'" class="btn btn-primary"><i class="icon-edit icon-large"></i> Review</a>';
							?>-->
				    		<a href="redirect/review_list" class="btn btn-default"> Back</a>
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
	            <div class="copyright-here pull-left download">
					Copyright &copy;  LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
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
