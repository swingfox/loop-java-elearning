
<!DOCTYPE html>
<html lang="en" ng-app="loop">
<head>
<title>LOOP | Admin - New Account Requests</title>

            <link href="img/favicon.ico" type="image/x-icon" rel="shortcut icon" />
            <link href="css/bootstrap3/dist/css/bootstrap.css" rel="stylesheet" media="screen" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="css/bootstrapformhelpers/css/bootstrap-formhelpers.css" rel="stylesheet" />
            <link href="css/bootstrap-modal-master/css/bootstrap-modal.css" rel="stylesheet" />
            <link href="fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
            <link rel="stylesheet" href="css/datatables/css/dataTables.bootstrap.css" />
            <link href="js/bootstrap-tour/build/css/bootstrap-tour.css" rel="stylesheet" />
            <link href="js/bootstrap-tour/build/css/bootstrap-tour.min.css" rel="stylesheet" />
            <link type="text/css" href="css/css-include/style-footer-try.css" rel="stylesheet" />
            <link type="text/css" href="css/inputfile/jquery.inputfile.css" rel="stylesheet" />
            <script type="text/javascript">
                function selectIndex(v){
                    document.getElementById("selectedIndex").value=v;
                
                }
            </script>
</head>
<body>  
    <div class="wrapper" ng-controller="LoginCtrl">
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
                                    <div class="form-group">
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
                                <div class="form-group">
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
                           <div class="navbar-collapse collapse" >
                                                <ul class="nav navbar-nav navbar-right"> 
                                                    <li class="dropdown">
<<<<<<< HEAD
                                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icomoon-user2"></i> Hello, {{username}} {{userId}}<b class="caret"></b></a>
=======
                                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icomoon-user2"></i> Hello, {{username}} {{userID}} {{userType}}<b class="caret"></b></a>
>>>>>>> 52e0440c1c65329dc19b9a12e1da0f137eacb6de
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
        <form method="post" action="account/accept">
            <div class="modal fade" id="responsive_fileActionAdmin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header light-theme">
                            <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <span class="popup">User Action</span>
                        </div>
                        <div class="modal-body">  
                            <div class="row">
                                <div class="col-md-10 col-md-push-1">                                 
                                    <label class="file-action">What would you like to do with this account request?</label>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-10 col-md-push-1">
                                    <button type="submit" class="btn btn-primary" onclick="#"><i class="icon-ok-sign icon-large default"></i> Accept</button>
                                    <button type="button" data-dismiss="modal" class="btn btn-default"></i> Cancel</button>
                                    <input type="hidden" id="selectedIndex" name="index" value="0"/>      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <ul class="nav nav-tabs main-views">
            <li class="active"><a class="active-tab" href="/loop-XYZ/store/admin-view"><i class="icon-plus-sign-alt icon-large default"></i> New Account Requests</a></li>
                <li><a href="/loop-XYZ/store/admin-view1"><i class="icon-folder-open icon-large default"></i> Developers</a></li>
                <li><a href="/loop-XYZ/store/admin-view2"><i class="icon-edit icon-large default"></i> Reviewers</a></li>
                <li><a href="/loop-XYZ/store/admin-view3"><i class="icon-time icon-large default"></i> Inactive Accounts</a></li>
                <li><a href="/loop-XYZ/store/admin-view4"><i class="icon-ban-circle icon-large default"></i> Blocked Accounts</a></li>
                <li><a href="/loop-XYZ/store/admin-view5"><i class="icomoon-list"></i> Learning Objects</a></li>
                <li><a href="/loop-XYZ/store/admin-view6"><i class="icomoon-list"></i> Learning Elements</a></li>
    </ul>
        <div class="clearfix"></div>
        <div id="content-wrap-rev">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 content">
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
                        <div class="table-responsive" ng-controller="newAccountRequestCtrl">
                            <table class="datatable table table-hover">
                                <thead>
                                    <tr>
                                        <th>Username</th>
                                        <th>Email Address</th>
                                        <th>Account Type</th>
                                    </tr>
                                </thead>
                                <tbody>
                                      <tr ng-repeat="user in userAccount | filter:searchText ">
                                            <td><a href="#responsive_fileActionAdmin" data-toggle="modal" onclick="onclick="selectIndex('.$counter.')"><label ng-model="user.username">{{user.username}}</a></td>
                                            <td><label ng-model="user.email">{{user.email}}</td>
                                            <td><label ng-model="user.usertype">{{user.usertype}}</td>
                                      </tr>
                     
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
                    Copyright &copy;  LOOP | Learning Object Organizer Plus. All rights reserved.<button id="aime" class="btn btn-default">Test</button>
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
                    Copyright &copy; LOOP | Learning Object Organizer Plus. All rights reserved.<!-- <button id="aime" class="btn btn-default">Test</button> -->
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

   <script> 
        $(document).ready(function(){
            var length_sel;
            // // alert($(document).height());
            // if($(document).height() > 799){
            //  $('footer').removeClass('navbar-fixed-bottom').addClass('navbar-static-bottom');
            // }


            //Sticky Footer Help
            
            var optionVal = $('tbody > tr:last-child()').index();

                $('.dataTables_filter label input').click(function(){
                    if(optionVal >= 8){
                        $('footer').removeClass('navbar-fixed-bottom').addClass('navbar-static-bottom');
                    }
                    else{
                        $('footer').addClass('navbar-fixed-bottom').removeClass('navbar-static-bottom');
                    }
                });
            



            // if( optionVal == '10'){
            // }
          /*  $('.datatable').dataTable({ 
                "sPaginationType": "bs_normal"
            });

            $('.datatable').each(function(){
                $(this).show();
                datatable_configuration_for_bootstrap_three($(this));
            });
*/
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
