<!DOCTYPE html>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Upload</title>

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
    <!-- <div id="wrapper"> -->
    <div class="wrapper">
    <!--?php $this->layout->modal_footer(isset($status)?$status:FALSE) ?-->

                        <div id="header-wrap">
                            <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>

                                    <a class="navbar-brand" href="/loop-XYZ/store/developer-update">
                                        <img src="img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
                                    </a>
                                </div>

                                <div class="navbar-collapse collapse" ng-controller="LoginCtrl">

                                <!--?php $this->layout->user_menu() ?-->
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
                        </nav>
                    </div>

                    <div class="clearfix"></div>

                    <ul class="nav nav-tabs main-views">
                     <li><a href="/loop-XYZ/store/developer-update"><i class="icomoon-list"></i> Learning Objects</a></li>
                     <li class=" tour-step tour-step-two"><a class="active-tab"  href="/loop-XYZ/store/developer-le"><i class="icomoon-list"></i> Learning Elements</a></li>
                     <li class="active tour-step tour-step-seven"><a class="active-tab" href="/loop-XYZ/store/upload-dev"><i class="icon-upload-alt icon-large default"></i> Upload LO</a></li>
                     <li><a href="/loop-XYZ/store/uploadLE-dev"><i class="icon-upload-alt icon-large default"></i> Upload LE</a></li>
                     <li class="tour-step tour-step-thirteen"><a href="/loop-XYZ/store/advanced-search-dev"><i class="icon-search icon-large search-tab"></i> Advanced Search</a></li>
                    </ul>

                    <div class="clearfix"></div>

                    <div id="content-wrap">
                        <div class="container">
                            <div class="col-md-6 col-md-push-3">
                                <div class="page-header download">
                                    <!--?php
                                        if(!isset($lobject)){
                                                echo '<h2 class="download">Upload Learning Object</h2>';
                                        }
                                        else{
                                                                        echo '<h2 class="download">Upload Learning Object: Revision</h2>';
                                        }
                                    ?-->

                                </div>
                                <!--?php echo form_open_multipart('uploading/do_upload','id="myform"');?-->

                                <!-- <div class="col-md-6 col-md-push-3"> -->

                                <div class="control-group">

                                    <label class="control-label upload-file fileinput pull-left" for="fileInput">File Path :</label>
                                    <div class="controls">
                                        <input type="file" name="userfile" size="20" class="input-file tour-step tour-step-eight" required/>
                                        <!-- <input name="userfile" type="file" class="input-file" required/> -->
                                    </div>

                                    <div class="upload-requirement">*Only .json file types under 10 Mb are accepted for upload.<br/>
                                    *Please avoid using white spaces for avoidance of information mismatch. </div>
                                </div>
                                <div class="well upload tour-step tour-step-nine">		
                                    <label class="col-md-3 control-label upload-file" for="input01">Name:</label>					
                                        <!-- <label class="control-label pull-left" for="input01"> -->
                                        <!-- Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                                        <!-- Name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                                    </label>
                                    <!--?php
                                    if(!isset($lobject)){
                                            echo '<input type="text" class="form-control col-md-7" id="input01" name="filenames" placeholder="e.g. HTML5, Linear Equations"/>';
                                    }
                                    else{
                                            echo '<input type="text" class="form-control col-md-7" id="input01" name="filenames" value="'.$lobject.'" readonly/>';
                                    }

                                    ?-->
                                    <div class="clearfix"></div>
                                </div>

                                <div class="well upload tour-step tour-step-ten">
                                <label class="col-md-3 control-label upload-file" for="input01">Subject:</label>							
                                    <!-- <label class="control-label pull-left" for="input01"> -->
                                        <!-- Subject : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                                        <!-- Subject : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
                                </label>
                                <!--?php
                                        if(!isset($lsubj)){
                                                echo '<input type="text" class="form-control col-md-7" id="input01" name="subject" placeholder="e.g. Web Programming, Algebra" required/>';
                                        }
                                        else{
                                                echo '<input type="text" class="form-control col-md-7" id="input01" name="subject" value="'.$lsubj.'" readonly/>';
                                        }
                                ?-->
                                <div class="clearfix"></div>
                            </div>

                            <div class="well upload tour-step tour-step-eleven">
                                <label class="col-md-3 control-label upload-file" for="input01">Description:</label>							
                                <!-- <label class="control-label pull-left" for="input01"> -->
                                        <!-- Description : &nbsp; -->
                                        <!-- Description : -->
                                </label>
                                <input type = "hidden" name = "uploadType" value = "LO">
                                <input type="text" class="form-control col-md-7" id="input01" name="desc" placeholder="Write a description..." required/>								

                                <div class="clearfix"></div>
                            </div>
                            <div class="form-actions advanced-search">
                                <!-- <button type="submit" class="btn btn-primary"><i class="icon-upload-alt icon-large"></i> Upload</button> -->


                                <button type="submit" class="btn btn-primary tour-step tour-step-twelve"><i class="icon-upload-alt icon-large"></i> Upload</button>


                                <!-- <a href="index.php" class="btn btn-default">Cancel</a> -->
                                <!-- <button type="reset" class="btn btn-default">Cancel</button> -->

                                <!-- <button onclick="document.location='http://localhost/loop-sp-ci7/redirect/LO'" type="button" class="btn btn-default">Cancel</button> -->
                                <a class="btn btn-default" href="index.jsp">Cancel</a>

                                <!-- <button onclick="document.location='http://localhost/jiary/index.php/journal/create_entry'" class="btn btn-success btn-lg btn-block main" type="button">Create</button>
                                <button type="button" class="btn btn-info btn-lg btn-block main" onclick="document.location='http://localhost/jiary/index.php/journal/jiary_view'">Jiary View</button> -->
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        <div class="clearfix"></div>

    <div class="push"></div>
    </div>

    <div class="footer">
        <footer id="footer-wrap-index">
            <div class="copyright-here pull-left upload">
                Copyright &copy; LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
            </div>
        </footer>
    </div>

    <!-- Load JS here for greater good =============================-->

    <!--?php $this->layout->footer_subpages() ?-->
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

    <!-- Datepicker =================================================-->
    <!--script src="'.$this->base_url.'css/bootstrapformhelpers/js/bootstrap-formhelpers-datepicker.en_US.js"></script-->
    <script src="css/bootstrapformhelpers/js/bootstrap-formhelpers.js"></script>

    <script src="css/bootstrap3/js/tooltip.js"></script>
    <script src="css/bootstrap3/js/popover.js"></script>

    <!-- Bootstrap tour =================================================-->
    <script src="js/bootstrap-tour/build/js/bootstrap-tour.js"></script>
    <script src="js/bootstrap-tour/build/js/bootstrap-tour.min.js"></script>
    <!--script src="'.$this->base_url.'js/developer-tour-script.js"></script-->

    <!-- Input File =================================================-->
    <script src="css/inputfile/jquery.inputfile.js"></script>
    
    <script src="js/angular/angular.js"></script>
    <script src="js/angular/ngStorage.js"></script>
    <script src="js/loop.js" type="text/javascript"></script>

    <!-- Form Validator =================================================-->

    <script type="text/javascript" src="js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>';
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
                    url: "index.jsp/account/check_password_email",
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

    <script>
        $('input[type="file"]').inputfile({
        uploadText: '<i class="icon-folder-open"></i> Choose file',
        removeText: '<span class="glyphicon glyphicon-trash"></span>',
        restoreText: '<span class="glyphicon glyphicon-remove"></span>',

        uploadButtonClass: 'btn btn-primary tour-step tour-step-twelve',
        //removeButtonClass: 'btn btn-default'
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function(){

        jQuery.validator.addMethod("noSpace", function(value, element) { 
        return value.indexOf(" ") < 0 && value != ""; 
        }, "No space please and don't leave it empty");


        $("#myform").validate({
        rules: {
          filenames: {
              noSpace: true
          }
        }
        });
    </script>

</body>
</html>
