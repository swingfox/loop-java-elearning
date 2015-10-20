<%-- 
    Document   : currentUser.jsp
    Created on : Oct 20, 2015, 4:32:18 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper" ng-app="loop">
    
    <form  method="post" ng-controller="LoginCtrl">
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
                                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Old Password" ng-model="ConfirmPass"/>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="enterNewPassword" name="newPassword" placeholder="Enter New Password"  ng-model="newPass"/>
                                    </div>
                                    <div class="form-group last">
                                        <input type="password" class="form-control last" id="confirmNewPassword" name="confirmNewPassword" placeholder="Confirm New password" ng-model="newPass2"/>
                                    </div>
                                </div> 
                            </div>
                        </div>
                        <div class="modal-footer"> 
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3 ">
                                    <button type="button" class="btn btn-primary" id="changepassword" ng-click="ChangePass(ConfirmPass,newPass,newPass2)" data-dismiss="modal"><i class="icon-ok icon-large default"></i> Save</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <form id="emailForm">
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
                                        <input type="password" class="form-control" id="emailPassword" name="emailPassword" placeholder="Enter Password" ng-model="ConfirmPass" required/>
                                    </div>
                                    <div class="form-group last">
                                        <input type="text" class="form-control last" id="enterNewEmail" name="enterNewEmail" placeholder="Enter New Email" ng-model="newEmail" required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row">
                                <div class="col-md-8 col-md-offset-3">
                                    <button type="submit" class="btn btn-primary" id="changeEmail" ng-click="ChangeEmail(ConfirmPass,newEmail)" data-dismiss="modal"><i class="icon-ok icon-large default"></i> Save</button>
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
                    
<div class="navbar-collapse collapse" ng-controller="LoginCtrl">
                                                <ul class="nav navbar-nav navbar-right"> 
                                                    <li class="dropdown">
                                                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icomoon-user2"></i> Hello, {{username}} {{userId}}<b class="caret"></b></a>

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