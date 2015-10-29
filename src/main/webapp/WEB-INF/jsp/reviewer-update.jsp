<jsp:include page="include/headerScript.jsp"/>
<html lang="en" ng-app="loop">
    <head>
        <title>LOOP | Review View</title>
        <meta charset="utf-8">
        <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
        <link href="css/bootstrap3/dist/css/bootstrap.css" rel="stylesheet" media="screen" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrapformhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
        <link href="css/bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" />
        <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/datatables/css/dataTables.bootstrap.css" />
        <link type="text/css" href="css/css-include/1280grid.css" rel="stylesheet" />
        <link href="js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
        <link href="js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />
        <link type="text/css" href="css/css-include/style-footer-try.css" rel="stylesheet" />
        <link type="text/css" href="css/inputfile/jquery.inputfile.css" rel="stylesheet" />
        <link rel="stylesheet" href="js/bootstrapvalidator/dist/css/bootstrapValidator.css" />
    </head>
    <body>
<jsp:include page="include/CurrentUser.jsp"/>
		<div class="clearfix"></div>

		
    	<ul class="nav nav-tabs main-views">
		 <li class="active"><a class="active-tab" href="/loop-XYZ/store/reviewer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
		  <li><a class="active-tab" href="/loop-XYZ/store/reviewer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
		  <!-- <li><a href="<?php echo base_url()?>redirect/reviewlist_rev"><i class="icomoon-signup"></i> Review List</a></li> -->
		  <li><a href="/loop-XYZ/store/review-list"><i class="icon-edit icon-large default"></i> Review List</a></li>
		  <li ><a  href="/loop-XYZ/store/advanced-search-rev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
		</ul>

		<div class="clearfix"></div>

                <div id="content-wrap-rev" ng-controller="LoginCtrl">
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
                                                        </div></div>

							<table class="datatable table table-hover" ng-controller="LOList" class="col-md-12">
							    <thead>
                                                                <tr role="row">
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



                                                            <tr ng-repeat="lo in los | filter:searchText | filter: {rev : username}" >

                                                                <td>
                                                                    <img ng-if="lo.rating==1" src="img/icon-red.png" alt="For Review">
                                                                    <img ng-if="lo.rating==2" src="img/icon-orange.png" alt="For Review">
                                                                    <img ng-if="lo.rating==3" src="img/icon-yellow.png" alt="For Review">
                                                                    <img ng-if="lo.rating==4" src="img/icon-yellowgreen.png" alt="For Review">
                                                                    <img ng-if="lo.rating==5" src="img/icon-green.png" alt="For Review">
                                                                    
                                                                </td>
                                                                <td><a ng-click="GetLO(lo)"><label ng-model="lo.title">{{lo.title}}</a></td>

                                                                <td><label ng-model="lo.subject">{{lo.subject}}</td>
                                                                <td><label ng-model="lo.uploadDate">{{lo.uploadDate | date : "medium"}}</td>
                                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label ng-model="lo.rating">{{lo.rating}}</td>
                                                                <td><label ng-model="lo.comments">{{lo.comments}}</td>                                                                
                                                                <td ng-if="lo.status==0"><i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>
                                                                <td ng-if="lo.status==1"><i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>
                                                                <td ng-if="lo.status==2"><i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>
                                                                <td><label >{{lo.rev}}</td>
                                                                <td><label>{{lo.uploadedBy}}</td>
                                                                
                                                            </tr>
                                                            <!--
						        <?php  

					        		require './application/controllers/LOController.php';
					        		$controller = new LOController();
					        		// $username = 'Details'.$username;
					        		//$user = $this->session->userdata('username');
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
										$LOs = $controller->searchLORev($_POST['searchName'],$subject,$dateFrom,$dateTo,$order);
										//$_POST['searchName'] = null;
									}
									else{//new condition for advanced search
										$LOs = @$controller->getAllLORev();
									}
									$_SESSION['los'] = serialize($LOs);
									$counter = 0;
									$LO = current($LOs);
									if($LO != null && isset($_POST['searchName'])){
										echo '<tr style="font-size:80%;"><td><i class="icon-search"></i></td><td colspan="8">Search Results for "'.$_POST['searchName'].'"....<a href='. base_url().'redirect/LO_rev>CLICK HERE</a> to reload all Learning Objects</td></tr>';
									echo '<td style="display: none">'.'</td>';
												echo '<td style="display: none">'.'</td>';
												echo '<td style="display: none">'.'</td>';
												echo '<td style="display: none">'.'</td>';
												echo '</tr>';

									}
									while($LO != null)
									{
										echo '<form name="form'.$counter.'" action="<?php echo base_url()?>/redirect/download" method="POST">';
										//echo "<script type='text/javascript'>alert('1');</script>";
										echo '<tr>';
										if($LO->getRating()==1)
								echo '<td><img src="'.base_url().'img/icon-red.png" alt="For Review" /></td>';
							else if($LO->getRating()==2)
								echo '<td><img src="'.base_url().'img/icon-orange.png" alt="For Review" /></td>';
							else if($LO->getRating()==3)
								echo '<td><img src="'.base_url().'img/icon-yellow.png" alt="For Review" /></td>';
										// echo '<td><a href="#responsive_fileActionReviewer" data-toggle="modal" >'.$LO->getName().'</a></td>';
										echo '<td><a href="'.base_url().'redirect/download/'.$counter.'" onclick="document.form'.$counter.'.submit()">'.$LO->getName().'</a></td>';
										echo '<td>'.$LO->getSubject().'</td>';
										// echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LO->getDateUploaded().'</td>';
										echo '<td>'.$LO->getDateUploaded().'</td>';
										echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'.$LO->getRating().'</td>';
										echo '<td>'.$LO->getComments().'</td>';
										echo '<input type="hidden" name="downloadLO" value="'.$counter.'"/>';
										if($LO->getStatus() == 0)
											echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Not Yet Reviewed" id="unreviewed" class="icon-check-empty icon-large"></i></td>';
										else if($LO->getStatus() == 2)
											echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Being Reviewed" id="being-reviewed" class="icon-edit icon-large"></i></td>';
										else if($LO->getStatus() == 1)
											echo '<td>&nbsp;&nbsp;&nbsp;&nbsp;<i rel="tooltip" title="Reviewed" id="reviewed" class="icon-check icon-large"></i></td>';
										echo '<td>'.$LO->getRev().'</td>';
										echo '<td>'.$LO->getUploadedBy().'</td>';
										echo '</tr>';
										echo '</form>';
										next($LOs);
										$LO = current($LOs);
										$counter++;
									}

									if($counter == 0){
											echo '<tr>';
												echo '<td colspan=9><h2 style="color: #000; font-weight:bold;">No Learning Objects found.</h2><br>
																No Learning Objects found.Please <a href="'. base_url().'redirect/LO_rev" class="btn btn-success">CLICK HERE</a> to refresh the list.</td>';	
												echo '<td style="display: none">'.'</td>';
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
											unset($_POST['searchName']);

						        ?>-->
									
														
								</tbody>
							  </table>
						</div>

					</div>
				</div>
				
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div> 
  		
	
        
        <div class="clearfix" id="before-features" ></div>
</div>
</div>

<div class="clearfix"></div>
<div class="push"></div>
</div>
</div>
<div class="footer">
<footer id="footer-wrap-index">
<div class="container">
<div class="copyright-here pull-left">
                Copyright &copy; LOOP | Learning Object Organizer Plus. All rights reserved.
</div>
</div>
</footer>
</div>
<jsp:include page="include/mainScripts.jsp"/>

<script>
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
