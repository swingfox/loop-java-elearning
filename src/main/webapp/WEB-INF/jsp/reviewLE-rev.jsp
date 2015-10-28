<!--?php
	session_start();//to use session variables
	require './application/controllers/LEController.php';
	$los = unserialize($_SESSION['obj']);
	$index = $id;
	$lo = $los[$index];
?-->
<!DOCTYPE html>
<html ng-app="loop" lang="en">
<head>
<title>LOOP | Review</title>

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
    <!-- 1280 grid -->
    <link type="text/css" href="css/css-include/1280grid.css" rel="stylesheet" />

    <!-- Bootstrap Tour -->
    <link href="js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
    <link href="js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />


    <!--link type="text/css" href="'.$this->base_url.'css/css-include/style.css" rel="stylesheet" /-->
    <link type="text/css" href="css/css-include/style-footer-try.css" rel="stylesheet" />

    <!-- Input File -->
    <link type="text/css" href="css/inputfile/jquery.inputfile.css" rel="stylesheet" />

    <!-- Form Validator -->
    <link rel="stylesheet" href="js/bootstrapvalidator/dist/css/bootstrapValidator.css" />

</head>
<body>	
	<jsp:include page="include/CurrentUser.jsp"/>
            <div class="clearfix"></div>

            <!-- <ul class="nav nav-tabs main-views">
                    <li class="active"><a class="active-tab" href="<?php echo base_url()?>redirect/LO_rev"><i class="icomoon-list"></i> Learning Objects</a></li>
                    <li><a href="<?php echo base_url()?>redirect/reviewlist_rev"><i class="icomoon-signup"></i> Review List</a></li>
                    <li ><a  href="<?php echo base_url()?>redirect/search_rev"><i class="icomoon-search"></i> Advanced Search</a></li>
            </ul> -->

            <div id="breadcrumb-wrap">
                <ol class="breadcrumb">
                    <li><a class="breadcrumb-link" href="/loop-XYZ/store/reviewer-le">Back to Review List</a></li>
                    <li class="active">Review Learning Element</li>
                </ol>
            </div> 

            <div class="clearfix"></div>

            <div id="content-review-rev" ng-controller="LECtrl">
                <div class="container">

                    <div class="alert alert-success">
                        <!-- <button type="button" class="close" data-dismiss="alert">&times;</button> -->
                        <a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>

                        <strong>Success!</strong>
                        <!-- You have successfully downloaded this Learning Object.
                        Please rate this Learning Object after you have reviewed it.  -->

                        You have successfully downloaded the Learning Element: "<!--?php
                        echo $lo->getName();
                        ?-->"
                        Please rate this Learning Element. 
                    </div>

				
                    <form method="post" ng-submit="submitReviewedLE()" role="form">
                        <div class="col-md-6 col-md-push-3">
	                    <div class="page-header download">
	                        <h2 class="download">Review</h2>
	                    </div>

	                    <label class="rate-this">Rate this Learning Object :</label>

	                    <div class="form-group">
                                <div class="well">
                                    <label class="radio review-rev" ng-click="changeRating(1)">
                                        <input type="radio" name="optionsRadios" value="1"   id="optionsRadios1" data-toggle="radio" checked>
                                        1<i class="icon-long-arrow-right"></i> It is Newly Uploaded and For Review. <span class="label label-danger custom">Red</span>
                                    </label>

                                    <label class="radio review-rev" ng-click="changeRating(2)">
                                        <input type="radio" name="optionsRadios" value="2"  id="optionsRadios2" data-toggle="radio">
                                        2<i class="icon-long-arrow-right"></i> It has been Reviewed but needs a lot of Revisions. <span class="label label-danger custom2">Orange</span>
                                    </label>

                                    <label class="radio review-rev" ng-click="changeRating(3)">
                                        <input type="radio" name="optionsRadios" value="3"  id="optionsRadios3" data-toggle="radio">
                                        3<i class="icon-long-arrow-right"></i> It has been Reviewed but needs more Revisions. <span class="label label-warning custom">Yellow</span>
                                    </label>

                                    <label class="radio review-rev" ng-click="changeRating(4)">
                                        <input type="radio" name="optionsRadios" value="4"  id="optionsRadios4" data-toggle="radio">
                                        4<i class="icon-long-arrow-right"></i> It has been Reviewed but still needs Admin's Approval. <span class="label label-warning custom2">Yellow Green</span>
                                    </label>

                                    <label class="radio" ng-click="changeRating(5)">
                                        <input type="radio" name="optionsRadios" value="5" id="optionsRadios5" data-toggle="radio">
                                        5<i class="icon-long-arrow-right"></i> It is Ready to Use. (Only the Admin can decide this).<span class="label label-success custom disabled">Green</span>
                                    </label>
                                </div>
                            </div>

                            <div class="form-group comments">  
                                <label class="control-label description" for="textarea">Comment :</label>  
                                <div class="controls"> 				           
                                    <textarea name="comments" ng-model="comment" class="form-control" placeholder="Write a Comment..." id="textarea" rows="3" required></textarea>
                                </div>  
                            </div>  

                            <div class="clearfix"></div>

                            <div class="form-actions advanced-search">
                                <input type="hidden" value="<?php echo $lo->getID(); ?>" id="id" name="id">
                                <input type="hidden" value="LE" id ="type" name="type">
                                <button type="submit" class="btn btn-primary"><i class="icon-ok icon-large"></i> Submit</button>

                                <a class="btn btn-default" href="/loop-XYZ/store/review-list">Cancel</a>
                            </div>
	                </div>
	            </form>

                    <div class="clearfix"></div>
                </div>
            </div> 

            <div class="clearfix"></div>
            <div class="push"></div>
	</div>

	<div class="footer">
            <footer id="footer-wrap-index">
                <div class="copyright-here pull-left review">
                    Copyright &copy; <!--?php echo date("Y"); ?--> LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
                </div>
	    </footer>
    </div>

	<!-- Load JS here for greater good =============================-->

    <!--?php $this->layout->footer_subpages() ?-->
    <script src="css/bootstrap3/assets/js/jquery.js"></script>
    <script src="css/bootstrap3/dist/js/bootstrap.js"></script>
    <script src="js/js-flat-ui/jquery-1.8.3.min.js"></script>
    <script src="js/js-flat-ui/jquery-ui-1.10.3.custom.min.js"></script>
    <script src="js/js-flat-ui/jquery.ui.touch-punch.min.js"></script>
    <script src="js/js-flat-ui/flatui-checkbox.js"></script>
    <script src="js/js-flat-ui/flatui-radio.js"></script>
    <script src="js/js-flat-ui/jquery.tagsinput.js"></script>
    <script src="js/js-flat-ui/jquery.placeholder.js"></script>
    <script src="js/js-flat-ui/jquery.stacktable.js"></script>
    <script src="http://vjs.zencdn.net/c/video.js"></script>
    
    <script src="js/main.js"></script>
    <script src="js/angular/angular.js"></script>
    <script src="js/loop.js"></script>

    <script src="js/backstretch-jquery/jquery.backstretch.min.js"></script>
    <script src="js/datatables/jquery.dataTables.min.js"></script>
    <script src="js/datatables/dataTables.bootstrap.js"></script>
    
    <!-- Datepicker =================================================-->
    <script src="css/bootstrapformhelpers/js/bootstrap-formhelpers.js"></script>
    <!-- Input File =================================================-->
    <script src="css/inputfile/jquery.inputfile.js"></script>

    <script src="css/bootstrap3/js/tooltip.js"></script>
    <script src="css/bootstrap3/js/popover.js"></script>

    <!-- Bootstrap tour =================================================-->
    <script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
    <script src="js/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>

    <!-- Form Validator =================================================-->
    <script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
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
                    url: "'.$this->base_url.'/index.php/account/check_password",
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
                    url: "'.$this->base_url.'/index.php/account/check_password_email",
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
