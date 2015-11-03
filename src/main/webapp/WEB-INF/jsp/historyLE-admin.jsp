<jsp:include page="include/headerScript.jsp"/>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | History</title>
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
	<jsp:include page="include/CurrentUser.jsp"/>
		<div class="clearfix"></div>

		<div id="breadcrumb-wrap">
                        <ol class="breadcrumb" ng-controller="LEList">
					<li><a class="breadcrumb-link" href="/loop-XYZ/store/admin-view6" ng-click="clearLE()">Back to Learning Element List</a></li>
					<li class="active">History - {{le.title}}</li>
				</ol>
		</div> 

		<div class="clearfix"></div>

            <form name="uniquetest" method="post" > <%--action="<?php echo base_url().'redirect/deleteLE_admin/'?>" --%>>
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
                                    <label class="file-action">Are you sure you want to delete this Learning Element?</label>
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

        <form name="tester" method="post" ng-controller="reviewerAccountCtrl"> 
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
                                    <label class="file-action">Choose a Reviewer for the Learning Element</label>
                                    <select ng-model="luckyReviewer">
                                        <option ng-repeat="reviewer in reviewerAccount" ng-title="{{reviewer.username}}" ng-selected="{{reviewer.username == luckyReviewer}}" value="{{reviewer.username}}">{{reviewer.username}}</option>
                                    </select>               
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-push-3">                                                                        
                                    <button type="button" class="btn btn-primary" ng-click="assignReviewer()" data-dismiss="modal"><i class="icon-ok icon-large default"></i> Yes &nbsp;</button>
                            		<button type="button" class="btn btn-default" style="color: red;" data-dismiss="modal"><i class="icon-remove icon-large default"></i> &nbsp; No &nbsp;</button>
                        		</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
		<div class="clearfix"></div>
		<div id="content-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-12 content">
						
						<div class="table-responsive">
						 	<table class="datatable table table-hover" ng-controller="reviewerAccountCtrl">
						    <thead>
								<tr>
									<th class="color-code">#</th>
									<th>Name</th>
									<th>Subject</th>
									<th>Uploaded</th>
									<th>Rating</th>
									<th>Comments</th>
									<th>Reviewer</th>
								</tr>
							</thead>
					        <tbody>
                                                     <tr ng-repeat="le in les | filter:searchText">
                                                        <td>
                                                            <img ng-if="le.rating==1" src="img/icon-red.png" alt="For Review">
                                                            <img ng-if="le.rating==2" src="img/icon-orange.png" alt="For Review">
                                                            <img ng-if="le.rating==3" src="img/icon-yellow.png" alt="For Review">
                                                            <img ng-if="le.rating==4" src="img/icon-yellowgreen.png" alt="For Review">
                                                            <img ng-if="le.rating==5" src="img/icon-green.png" alt="For Review">

                                                        </td>
                                                        <td><p classdownload-details ng-binding="download-details">{{le.title}}</p></td>
                                                        <td><label >{{le.subject}}</td>
                                                        <td><label >{{le.uploadDate | date:"MMMM d yyyy"}}</td>
                                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label >{{le.rating}}</td>
                                                        <td><label >{{le.comments}}</td>
                                                        <td><label >{{le.rev}}</td>
                                                         
                                                    </tr>									
							</tbody>
						  </table>
						</div>
						<div>
							<input type="hidden" <%--value="<?php echo $index?>"--%> id="ctr" name="ctr">
                                                        <input type="hidden" value="" id="counters" name="counters">

                                                        <a href="#responsive_addReviewer" class="btn btn-default" data-dismiss="modal" data-toggle="modal"><i class="icon-plus-sign icon-large default"></i> Add Reviewer</a>
							<a href="/loop-XYZ/store/reviewLE-admin" type="button" class="btn btn-primary"><i class="icon-edit icon-large"></i> Review</a>
							<a href="#responsive_confirmDelete" class="btn btn-primary" data-toggle="modal"><i class="icon-trash icon-large default"></i> Delete</a>

				    		<a href="/loop-XYZ/store/admin-view6" class="btn btn-default"> Back</a>
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
					Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
		    	</div>
		    <!-- </div> -->
	    </footer>
    </div>
        
        <!-- Delete modal-->
	<!-- Load JS here for greater good =============================-->
	<jsp:include page="include/mainScripts.jsp"/>
        <script>



             <!-- Change Password Script =================================================-->
                $(document).ready(function(){
                    $("#changepassword").click(function(e){
                        var form = $(this).parents("form");
                        var data = form.serialize();
                        change_password(data);
                        e.preventDefault();
                    });

                    var change_password = function(data){
                        $.ajax({
                            url: "index.php/account/check_password",
                            dataType: "json",
                            type: "POST",
                            data: data,
                            success: function(result){
                                if(result.status){
                                    $("#success").removeClass("hide");
                                    $("#error").addClass("hide");
                                    
                                    setTimeout(function(){
                                        location.reload();
                                    },1000);
                                }
                                else{
                                    $("#error").removeClass("hide");
                                    setTimeout(function(){
                                        $("#error").addClass("hide");
                                    },1500);
                                }
                                $("#changepassword").modal("show");
                            },
                            error: function(xhr){
                                alert(xhr.responseText);
                            }
                        });
                    }
                });
            </script>


  <!-- Change Email Script =================================================-->
   <script>
                $(document).ready(function(){
                    $("#changeEmail").click(function(e){
                        var form = $(this).parents("form");
                        var data = form.serialize();
                        change_email(data);
                        e.preventDefault();
                    });

                    var change_email = function(data){
                        $.ajax({
                            url: "index.php/account/check_password_email",
                            dataType: "json",
                            type: "POST",
                            data: data,
                            success: function(result){
                                if(result.status){
                                    $("#success1").removeClass("hide");
                                    $("#error1").addClass("hide");
                                    
                                    setTimeout(function(){
                                        location.reload();
                                    },1000);
                                }
                                else{
                                    $("#error1").removeClass("hide");
                                    setTimeout(function(){
                                        $("#error1").addClass("hide");
                                    },1500);
                                }
                                $("#changeEmail").modal("show");
                            },
                            error: function(xhr){
                                alert(xhr.responseText);
                            }
                        });
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