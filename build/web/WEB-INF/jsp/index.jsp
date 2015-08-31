<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOOP | Learning Object Organizer Plus</title>
    </head>

    <body>
        
    	<div id="wrapper">
    	<!-- Login LIGHT-->
        <form method="post" action="">
    		<!-- <div id="responsive_loginLight" class="modal hide fade" tabindex="-1" data-width="760"> -->
    		<div class="modal fade" id="responsive_loginLight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    			<div class="modal-dialog">
					<div class="modal-content">
					    <div class="modal-header light-theme">
						    <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
						    <span class="popup">Login</span>
					    </div>
					    
					    <div class="modal-body">  
						    <div class="row">
							    <div class="col-md-10 col-md-push-1">
                                    <!--<?php if(isset($status) && !$status){ ?>-->
                                    <p class="alert alert-danger"><i class="icon-warning-sign"></i> 
                                    <!--<?php echo $msg ?>-->
                                    </p>
                                    <!--<?php } ?>-->

							    	<!-- <p><input class="col-xs-12 col-md-12 sign-up" id="username" type="text" name="username" placeholder="Username" required></p>
								    <p><input class="col-xs-12 col-md-12 sign-up" id="password" type="password" name="password" placeholder="Password" required></p> -->
							    	
									<div class="form-group">
	                                	<input type="text" class="form-control" id="username" name="username" placeholder="Username" required/>
		                            </div>

									<div class="form-group">
		                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required/>
		                            </div>

								  <!--   <div class="forgot-pass">
						            	<span><a href="#" >Forgot Password?</a></span>
						            	<div class="clearfix"></div>
						            </div>
 -->
						            <div class="clearfix"></div>

						            <div class="login-as">
						            	<p>Login as:</p>
						            	<div class="clearfix"></div>
						            </div>

						            <div class="radio-options">
						            	<div class="row">
					    					<div class="col-md-4 col-md-push-1">
									          	<label class="radio log-in">  
										            <input type="radio" name="optionsRadios" id="optionsRadios1" value="developer" data-toggle="radio" checked="">
										            Developer
									          	</label>
									        </div>
											
											<div class="col-md-4 col-md-push-2">
									          	<label class="radio log-in">  
										            <!-- <input type="radio" name="optionsRadios" id="optionsRadios2" value="reviewer" data-toggle="radio" disabled> -->
										            <input type="radio" name="optionsRadios" id="optionsRadios2" value="reviewer" data-toggle="radio">
										            Reviewer
									          	</label>
									        </div>
									    </div>
							        </div>

									<div class="clearfix"></div>

									<div class="label-signup">
						            	<p>Haven’t Signed Up Yet?</p>
						            </div>

						            <div class="clearfix"></div>

						            <div class="option-signup">
						            	<a href="#responsive_signUpLight" data-toggle="modal" data-dismiss="modal">Sign Up >></a>
						            </div>
							    </div> 
					        </div>
					    </div>

					    <div class="modal-footer"> 
					    	<div class="row">
					    		<div class="col-md-8 col-md-push-3">
								    <button type="submit" class="btn btn-primary" value="Login"><i class="icon-signin icon-large default"></i> Login</button>
								    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
								</div>
							</div>
						</div>
					</div>
			    </div>
    		</div>
    	</form>
	
		<!-- Sign Up LIGHT-->
		<!-- <form id="defaultForm" name="sign_up" method="post" action="<?php //echo base_url() ?>index.php/account/sign_up"> -->
		<form id="defaultForm" name="sign_up" method="post" action="">
    		<!-- <div id="responsive_signUpLight" class="modal hide fade" tabindex="-1" data-width="760"> -->
    		<div class="modal fade" id="responsive_signUpLight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    			<div class="modal-dialog">
					<div class="modal-content">
					    <div class="modal-header light-theme">
						    <button type="button" class="close light-theme" data-dismiss="modal" aria-hidden="true">&times;</button>
						    <span class="popup">Sign Up</span>
					    </div>
                                            
					    <div class="modal-body">
						    <div class="row">
							    <div class="col-md-10 col-md-push-1">
							    	<!-- <p><input class="col-xs-12 col-md-12 sign-up" id="username" type="text" name="username" placeholder="Username" required></p>                                     
                                    <p><input class="col-xs-12 col-md-12 sign-up" id="email" type="text" name="email" placeholder="Email" required></p>
                                    <p><input class="col-xs-12 col-md-12 sign-up" id="password" type="password" name="password" placeholder="Password" required></p>
                                    <p><input class="col-xs-12 col-md-12 sign-up" id="confirmPassword" type="password" name="confirmPassword" placeholder="Confirm Password" required></p> -->
									<div class="alert alert-success" style="display: none;"></div>

									<div class="form-group">
	                                	<input type="text" class="form-control" id="username" name="username" placeholder="Username" />
		                            </div>

		                            <div class="form-group">
		                                <input type="text" class="form-control" id="email" name="email" placeholder="Email" />
		                            </div>

		                            <div class="form-group">
		                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" />
		                            </div>

		                            <div class="form-group">
		                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Retype password" />
		                            </div>

		                            <!-- <div class="form-group">
		                                <button type="submit" class="btn btn-primary">Sign up</button>
		                            </div> -->

                                        <div class="clearfix"></div>

							            <div class="login-as">
							            	<!-- <p>Choose Account:</p> -->
							            	<p class="choose-account">Use LOOP as a:</p>
							            	<div class="clearfix"></div>
							            </div>

							            <div class="radio-options">
							            	<div class="row">
						    					<div class="col-md-4 col-md-push-1">
										          	<label class="radio log-in">  <!-- login-wrap -->
											            <input type="radio" name="optionsRadios" id="optionsRadios1" value="developer" data-toggle="radio" checked="">
											            Developer
										          	</label>
										        </div>
												
												<div class="col-md-4 col-md-push-2">
										          	<label class="radio log-in">  <!-- login-wrap -->
											            <input type="radio" name="optionsRadios" id="optionsRadios2" value="reviewer" data-toggle="radio">
											            Reviewer
										          	</label>
										        </div>
										    </div>
								        </div>

								        <div class="clearfix"></div>

                                        <div class="label-signup">
						            	<p>Already Signed Up?</p>
						            </div>

						            <div class="clearfix"></div>

						            <div class="option-signup">
						            	<a href="#responsive_loginLight" data-toggle="modal" data-dismiss="modal">Login >></a>
						            </div>
							    </div>
						    </div>
					    </div>

					    <div class="modal-footer">
					    	<div class="row">
					    		<div class="col-md-8 col-md-push-3">
								    <button type="submit" class="btn btn-primary"><i class="icon-ok icon-large default"></i> Sign Up</button>
								    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
								</div>
							</div>
					    </div>
					</div>
				</div>
    		</div>	
    	</form>

		<!-- From Slider Trial -->
		<!-- <div id="headerSlideContainer">
		    <div id="headerSlideContent">
		        Header content goes here!
		    </div>
		</div> -->
	
		<div id="header-wrap">
			<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- <nav class="navbar navbar-inverse navbar-static-top" role="navigation"> -->
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>

						<a class="navbar-brand" href="index.jsp">
							<img src="img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
						</a>
					</div>
					<div class="navbar-collapse collapse">
						<!-- <ul class="nav navbar-nav">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li class="dropdown-header">Nav header</li>
									<li><a href="#">Separated link</a></li>
									<li><a href="#">One more separated link</a></li>
								</ul>
							</li>
						</ul> -->

						<!-- <form class="navbar-form navbar-right">
							<div class="form-group">
								<input type="text" placeholder="Email" class="form-control">
							</div>
							<div class="form-group">
								<input type="password" placeholder="Password" class="form-control">
							</div>
							<button type="submit" class="btn btn-primary">Sign in</button>
						</form> -->
						
		                    <ul class="nav pull-right index">
		                      	<li class="sign-up"><a class="btn index btn-index" href="#responsive_signUpLight" data-toggle="modal" id="sample-signup">Sign Up</a></li>
						        <li class="sign-up"><a class="btn index btn-index" href="#responsive_loginLight" data-toggle="modal" id="sample-login">Login</a></li>
								<!-- <li class="sign-up"><a class="btn index btn-index" href="#responsive_loginLight_LOOP" data-toggle="modal">Login</a></li> -->
		                    </ul>				                   
		                
					</div>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>

		<div id="banner-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6 banner-info">
						<!-- <h1><span>Loop</span></h1> -->
						<!-- <img src="<?php //echo base_url() ?>img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/> -->
						
						<!-- <img class="logo-huge" src="<?php //echo base_url() ?>img/loop-logo.svg" width="249px" height="60px" alt="LOOP Logo"> -->

						<!-- <h3>Learning Object Organizer Plus</h3> -->
						<h1>Learning Object Organizer Plus</h1>
						<br>
						<h3>A powerful tool for Developers and Reviewers.</h3>
						<br>
						
						<!-- <h5 class="banner-inform">Participate in the development of quality-assured learning objects for <abbr title="Cebu Institute of Technology - University">CIT-U</abbr>'s E-Learning system.</h5> -->
						<h5 class="banner-inform">Participate in the development of quality-assured learning objects for CIT-U's E-Learning system.</h5>
						<br>
						<h5 class="banner-inform">Be a part of the LOOP! Join us today.</h5>
						<br>

						<div class="clearfix"></div>

						<!-- <a href="#before-content" type="button" class="btn btn-primary banner-learnmore">
							<h5>Learn More &gt;&gt;</h5>
						</a> -->

				
						<div class="clearfix"></div>
					</div>

					

					<div class="col-md-6 banner-accounts">
						<!-- <ul class="nav pull-right index">
	                      	<li class="sign-up banner"><a class="btn index btn-index" href="#responsive_signUpLight" data-toggle="modal">Sign Up</a></li>
					        <li class="sign-up banner"><a class="btn index btn-index" href="#responsive_loginLight" data-toggle="modal">Login</a></li>
	                    </ul>	 -->

	                    <div class="clearfix"></div>

	                    <!-- <div class="col-md-12 img banner"> -->
	                    <div class="col-md-11 img banner">
                    		<!-- <img src="<?php //echo base_url() ?>img/img-content2.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/> -->
                    		<!-- <img src="<?php //echo base_url() ?>img/mac-mockup-loop.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/> -->
                    		<img src="img/mac-mockup-loop-rev.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/>
						</div>
						<div class="clearfix"></div>
					</div>


					

					<!-- <div class="clearfix"></div> -->

					<!-- <div class="col-md-6 banner-learnmore">
						<a href="#before-content" type="button" class="btn btn-primary">
							
								<!-h5><i class="icomoon-arrow-down"></i>Learn More &gt;&gt;</h5->
								<h5>Learn More <i class="icomoon-rocket"></i></h5>
							
						</a>
						<div class="clearfix"></div>
					</div> -->

					<div class="clearfix"></div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<a href="#before-content" type="button" class="scrolldown-arrow">
							<!-- <img src="<?php //echo base_url() ?>img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/> -->
							<center><img src="img/scrolldown-arrow.png"/></center>
						</a>						
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		
		<!-- <div class="clearfix"></div>

		<div id="invite-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-3 slogan-btn">
						<input href="#responsive_signUpLight" data-toggle="modal" type="submit" value="Sign Up. It’s Free!" class="btn btn-success btn-lg">
					</div>
					
					<div class="col-md-9 slogan">
						<h4>Login as a Developer or Reviewer and start using LOOP today!</h4>
					</div>
				</div>
			</div>
		</div> -->

		<div class="clearfix" id="before-content"></div>
		
		<div class="clearfix"></div>

		<!-- <div id="content-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-5 content">					
						<h2>What is LOOP?</h2>
						<p>Learning Object Organizer Plus (LOOP) is a great tool for developers and reviewers who are responsible
						 for preparing the learning objects that will be distributed to the students.</p>
						<p class="last">What are you waiting for? Sign up and login today! It’s as simple as 1-2-3.</p>
					</div>

					<!- <div class="col-md-7 pull-right img"> ->
					<div class="col-md-7 img">
                    	<img src="<?php //echo base_url() ?>img/img-content2.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/>
					</div>
				</div>
				
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div> -->

		<div id="maincontent-wrap">
			<h2 class="maincontent-title">What is LOOP?</h2>
			<div class="container">
				<div class="row">
					<div class="col-md-12 main-content">
						
						<!-- Version 1 -->
						<!-- <p> 
							Learning Object Organizer Plus or "LOOP" is a great tool for developers and reviewers who are responsible for preparing <br> 
							the learning objects that will be distributed to the students. It takes a lot of time and effort to prepare the learning <br>
							objects, we need your help. Dedicate your time to ensuring quality education through interactive learning.
						</p> -->

						<!-- Version 2 -->
						<!-- <p>
							Learning Object Organizer Plus or "LOOP" is a great tool for developers and reviewers who are responsible for preparing <br> 
							the learning objects that will be distributed to the students. Dedicate your time to ensuring quality education through interactive learning. ADD MORE CONTENT HERE.
						</p> -->

						<!-- Version 3 -->
						<p>
							Learning Object Organizer Plus or "LOOP" is a great tool for developers and reviewers who are responsible for preparing <br> 
							the learning objects that will be distributed to the students. Dedicate your time to ensuring quality education through interactive learning by signing up for a developer or a reviewer account.
						</p>
						
						<p class="last">What are you waiting for? Sign up and login today! It’s as simple as 1-2-3.</p>
					
						<!-- Version 4 -->
						<!-- <p>
							Learning Object Organizer Plus or "LOOP" is a great tool for developers and reviewers who are responsible for preparing <br> 
							the learning objects that will be distributed to the students. 
						</p>
						
						<p class="last">Dedicate your time to ensuring quality education through interactive learning by signing up for a developer or a reviewer account.</p> -->
					</div>
				</div>
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div>
		
		<div class="clearfix"></div>

		<div id="feature-wrap">

			<h2 class="title-area">Features</h2>

			<div class="container">
				<ul class="row">
					<li class="col-md-4 feature">
						<!-- <i class="icomoon-upload3 icon-4x"></i> -->
						<img src="img/feat-upload.png" alt="Upload"/>

						<h2 class="feature-title">Upload</h2>
						<p>Developers can upload new learning objects</p>
						
					</li>

					<li class="col-md-4 feature">	
						<!-- <i class="icomoon-download3 icon-4x"></i> -->
						<img src="img/feat-download.png" alt="Download"/>

						<h2 class="feature-title">Download</h2>
						<p>Reviewers can download learning objects</p>
					</li>

					<li class="col-md-4 feature last">
						<!-- <i class="icomoon-signup icon-4x"></i> -->
						<img src="img/feat-review.png" alt="Reviewer"/>

						<h2 class="feature-title">Review</h2>
						<p>Reviewers can review learning objects</p>
					</li>
				</ul>
			</div>
		</div>

		<div class="clearfix"></div>

		<!-- <div id="content-wrap-2"> -->
		<div id="content-wrap">
			<div class="container">
				<div class="row">
					

					<!-- <div class="col-md-5 content-2"> -->
					<div class="col-md-5 content">
						<!-- <h2>Upload <span class="account-type">[Developer Only]</span></h2> -->
						<h2>Upload</h2>
						
						<!-- <blockquote class="orange"> -->
						<blockquote>
							<!-- <p class="orange">Join and Contribute!</p> -->
							<p>Join and Contribute!</p>
						</blockquote>
						
						<!-- <p>Developers get to upload new Learning Objects or a revision of an existing one.</p> -->
						<p>Only developers are allowed to upload new learning objects or upload a revision of an existing one.</p>
						<p>To upload a learning object, all you need to do is locate the file, provide the necessary information, click upload and you're done. 
							It's quick and easy!</p>

					</div>

					<div class="col-md-7 img-upload">
						<img src="img/img-content-upload.png" class="img-responsive pull-right" alt="Responsive Design, Cross-Platform Viewing"/>
						
						<div class="clearfix"></div>
					</div>					
				</div>
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div>
		
		<div class="clearfix"></div>

		<div id="content-wrap-3">
			<div class="container">
				<div class="row">

					<div class="col-md-7 img-download">
                        <img src="img/img-content-download.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/>
					</div>


					<div class="col-md-5 content-4">
						<!-- <h2>Download <span class="account-type">[Reviewer Only]</span></h2> -->
						<h2>Download</h2>
						
						<!-- <blockquote class="orange-gray">
							<p>Before you can start reviewing, you need to <strong>download</strong> it first.</p>
						</blockquote> -->

						<blockquote>
							<!-- <p>Before you can start reviewing, you need to <strong>download</strong> it first.</p> -->
							<p>Before you can start reviewing, you need to download it first.</p>
						</blockquote>

						<!-- <p>Learning objects are useless if you cannot utilize 'em and save them to your device.</p>
						<p><abbr title="Learning Object Organizer Plus">LOOP</abbr> doesn't just store the uploaded learning objects; it also allows reviewers to download them.</p> -->
						
						<p>Learning objects are useless if you cannot utilize and save them to your device.</p>
						<p><abbr title="Learning Object Organizer Plus">LOOP</abbr> doesn't just store the learning objects the developers upload, it also enables reviewers to download them.</p>						

						<div class="clearfix"></div>
					</div>										
				</div>
				
				<div class="clearfix" id="before-features" ></div>
			</div>
		</div>

		<div class="clearfix"></div>

		<div id="content-wrap">
			<div class="container">
				<div class="row">
					

					<div class="col-md-5 content">
						<!-- <h2>Review <span class="account-type">[Reviewer Only]</span></h2> -->
						<h2>Review</h2>
						
						<!-- <blockquote class="orange-gray"> -->
						<blockquote>
							<p>Evaluate and Rate!</p>
						</blockquote>
						
						<!-- <p>We value concision and good organization.</p>
						<p>Reviewers can evaluate each downloaded Learning Objects to ensure quality and accuracy. LOOP also allows reviewers to 
							rate the Learning Objects to assess their status and consistency.</p> -->


						<p>We value concision and good organization.</p>
						<p>It's the reviewer's job to evaluate the learning objects and to ensure their quality. Reviewers rate the learning objects according to their accuracy and consistency.</p>
					</div>

					<div class="col-md-7 img-review">
						<img src="img/img-content-review.png" class="img-responsive pull-right" alt="Responsive Design, Cross-Platform Viewing"/>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="clearfix"></div>

		<!-- <div id="content-wrap-3">
			<div class="container">
				<div class="row">
					<div class="col-md-7 img">
                        <img src="<?php //echo base_url() ?>img/developer-view-chrome2.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/>
					</div>
					<div class="col-md-5 content-3">
						
						<h2>Simplified. Organized. Comprehensive.</h2>
						
						<blockquote class="orange-gray">
							<p>We help you get what you need faster.</p>
						</blockquote>

						<p>Loop uses Data Tables for a dynamic and real-time learning object searching experience.</p>
						<p>Your time is precious. We got your back.</p>											
					</div>					
				</div>
				
				<div class="clearfix" id="before-team" ></div>
			</div>
		</div> -->

		<div id="maincontent-wrap" class="main-views">
			<h2 class="maincontent-title">Simplified. Organized. Comprehensive.</h2>
			<div class="container">
				<div class="row">
					<div class="col-md-12 main-content">
						<!-- <p>We help you get what you need faster.</p> -->
						<p>You get what you need faster.</p>
					
						
					
						<div class="col-md-12 img-datatables">
							<img src="img/img-datatables-developer.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/>
						</div>

						<p class="desc">Main View for Developer</p>


						<!-- <p class="last">LOOP uses DataTables for a dynamic and real-time learning object searching experience.</p>

						<p>Your time is precious. We got your back.</p> -->

						<div class="col-md-12 img-datatables">
							<img src="img/img-datatables-reviewer.png" class="img-responsive" alt="Responsive Design, Cross-Platform Viewing"/>
						</div>

						<p class="desc">Main View for Reviewer</p>				

						<p class="last">LOOP uses DataTables for a dynamic and real-time learning object searching experience.</p>

						<p class="last">Your time is precious. We got your back.</p>		
					</div>
				</div>				
			</div>
		</div>


		<div class="clearfix"></div>

		<div id="content-wrap-4">
			<div class="container">
				<div class="row">
					<div class="col-md-5 content">
						<!-- <h2>Download <span class="account-type">[Reviewer Only]</span></h2> -->
						<!-- <h2>Learning Objects in Any Screen</h2> -->
						<h2>Learning Objects on any screen</h2>
						
						 <blockquote>
							<p>Register Once. Access Anywhere.</p>
						</blockquote>

						<!-- <p>Now every learning object you upload or review is accessible on any screen - desktop, tablet, or mobile - without compatibility issues. </p> 
						<p>Your learning objects are now in the palm of your hands.</p> -->

						<p>Every learning object you upload or review is accessible on any screen - desktop, tablet, or mobile - without compatibility issues. </p> 
						<p>Your learning objects are now in the palm of your hand.</p>
						

					</div>

					<!-- <div class="col-md-7 pull-right img"> -->
					<div class="col-md-7 img-alldevices">
                        <!-- <img src="<?php echo base_url() ?>img/developer-view-chrome-live.png" class="img-responsive pull-right" alt="Responsive Design, Cross-Platform Viewing"/> -->
                        <img src="img/img-alldevices.png" class="img-responsive pull-right" alt="Responsive Design, Cross-Platform Viewing"/>
					
						<div class="clearfix"></div>
					</div>					
				</div>
				
				<div class="clearfix" id="before-team" ></div>
			</div>
		</div>

		<div class="clearfix"></div>

		<div id="feature-wrap-team" class="bg">

			<h2 class="title-area team-member">Meet the Team</h2>

			<div class="container">
				<ul class="row">
					<li class="col-md-3 team-member">		
						<div class="member-photo">	
							<!-- <a target="_blank" href="https://www.facebook.com/dominicdosdos" id="doms" data-toggle="tooltip" data-placement="left" title="Hello There!"> -->
							<a target="_blank" href="https://www.facebook.com/dominicdosdos">						
								<img src="img/doms.jpg" alt="Dominic Dosdos" class="img-responsive-team img-circle">
							</a>
						</div>
						<h5 class="member-name">Dominic John Dosdos</h5>
						<p class="job">Team Lead &amp; Front-end Developer</p>						
					</li>

					<li class="col-md-3 team-member">		
						<div class="member-photo">
							<a target="_blank" href="https://www.facebook.com/jedstevenmorillo">			
								<img src="img/jed.jpg" alt="Jed Morillo" class="img-responsive-team img-circle">
							</a>
						</div>
						<h5 class="member-name">Jed Steven Morillo</h5>
						<p class="job">Systems Analyst &amp; Back-end Developer</p>						
					</li>

					<li class="col-md-3 team-member">		
						<div class="member-photo">
							<a target="_blank" href="https://www.facebook.com/silverfrost7">			
								<img src="img/aven.jpg" alt="Aven Benitez" class="img-responsive-team img-circle">
							</a>
						</div>
						<h5 class="member-name">Jay Aven Benitez</h5>
						<p class="job">Front-end Developer &amp; Quality Assurance Engineer</p>						
					</li>

					<li class="col-md-3 team-member last">		
						<div class="member-photo">	
							<a target="_blank" href="https://www.facebook.com/josef619235">		
								<img src="img/dave.jpg" alt="Dave Manatad" class="img-responsive-team img-circle">
							</a>
						</div>
						<h5 class="member-name">Joseph Dave Manatad</h5>
						<p class="job">Back-end Developer &amp; Documentation Officer</p>						
					</li>					
				</ul>
			
			
				<div id="invite-wrap-bite">
					<!-- <center>
						<img src="<?php //echo base_url() ?>img/invite-bite.png"/>
					</center> -->

					<!-- <img src="<?php //echo base_url() ?>img/invite-bite.png"/> -->				
				</div>
			</div>
		</div>
		

		<div class="clearfix"></div>
			

		<!-- REFORMAT THIS! IT SHOULD BE CENTER ALIGNED. THE SIGN UP BUTTON SHOULD BE ON THE BOTTOM.
		EMPHASIZE THIS PART -->

		


		<!-- Take this out -->
		<!-- <div id="invite-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-9 slogan">
						<h4>Login as a Developer or Reviewer and start using LOOP today!</h4>
						<h5>Join us, It's just a click away.</h5>
					</div>

					<div class="col-md-3 slogan-btn">

						
					

						<a class="btn btn-success banner-learnmore" type="button" href="#responsive_signUpLight" data-toggle="modal">
							<h5>Sign Up. It’s Free!</h5>
							
						</a>

					</div>
				</div>
			</div>
		</div> -->

		<div id="invite-wrap">
			<div class="container">
				<div class="row">
					<div class="col-md-6 slogan">
						<h4>Login as a Developer or Reviewer <br> and start using LOOP today!</h4>
						<h5 class="spec">Join us, It's just a click away.</h5>
						<a class="btn btn-success banner-learnmore" id="signUpFree" type="button" href="#responsive_signUpLight" data-toggle="modal">
							<!-- <h5>Sign Up. It’s Free!</h5> -->
							<h5>Sign me up for LOOP!</h5>
						</a>
					<div class="clearfix"></div>
					</div>

					<div class="col-md-6 slogan-pic">

						
					

						
						<img src="img/professor-mascot-inv-m.png" class="img-responsive pull-left"/>
						

					</div>
				</div>
			</div>
		</div>



		<div class="clearfix"></div>

		<div id="footer-top">
			<div class="container">
				<div class="row">
					<article class="col-md-4 footer-article">
						<h4>Browse</h4>
						<a href="#header-wrap"><h5>Home</h5></a>
						<!-- <a href="#before-content"><h5>About</h5></a> -->						
						<a href="#before-features"><h5>Features</h5></a>
						<a href="#before-team"><h5>Our Team</h5></a>
					</article>

					<article class="col-md-4 footer-article">
						<h4 class="footer">Connect With Us</h4>
							<ul id="media-icons">
								<li><a href="https://www.facebook.com/loop.elearning" target="_blank"><img src="img/icon-fb-hover.png" alt="Facebook"/></a></li>
								<li><a href="https://twitter.com/loop_elearning" target="_blank"><img src="img/icon-twitter-hover.png" alt="Twitter"/></a></li>
								<li><a href="https://plus.google.com/u/0/102433063088314112205/about" target="_blank"><img src="img/icon-gplus-hover.png" alt="Google Plus"/></a></li>
								<div class="clear"></div>	
							</ul>
					</article>

					<article class="col-md-4 footer-article">
						<h4 class="footer contact">Contact LOOP</h4>
						<p class="contact">For general concerns and</p>
						<p class="contact">inquiries contact us at : </p>
						<p class="contact gmail">loop.elearning@gmail.com</p>
					</article>
				</div>	
			</div>
		</div>


		<!-- THIS IS FROM THE OLD LOOP -->
		<!-- <div id="footer-top">
			<div class="container">
				<div class="row-fluid">
					<article class="span4 footer-article">
						<h4>Browse</h4>
						<a href="#header-wrap"><h5>Home</h5></a>
						<a href="#before-content"><h5>About</h5></a>
						<a href="#before-features"><h5>Features</h5></a>
					</article>

					<article class="span4 footer-article">
						<h4 class="footer">Connect With Us</h4>
							<ul id="media-icons">
								<li><a href="https://www.facebook.com/loop.elearning" target="_blank"><img src="images/icon-fb-hover.png" alt="Facebook"/></a></li>
								<li><a href="https://twitter.com/loop_elearning" target="_blank"><img src="images/icon-twitter-hover.png" alt="Twitter"/></a></li>
								<li><a href="https://plus.google.com/u/0/102433063088314112205/about" target="_blank"><img src="images/icon-gplus-hover.png" alt="Google Plus"/></a></li>
								<div class="clear"></div>	
							</ul>
					</article>

					<article class="span4 footer-article">
						<h4 class="footer contact">Contact LOOP</h4>
						<p class="contact">For general concerns and</p>
						<p class="contact">inquiries contact us at : </p>
						<p class="contact gmail">loop.elearning@gmail.com</p>
					</article>
				</div>	
			</div>
		</div> -->
		<!-- THIS IS FROM THE OLD LOOP -->
		

		<div class="clearfix"></div>

		<footer id="footer-wrap-index">
			<div class="container">
		    	<div class="copyright-here pull-left">
					Copyright &copy; LOOP | Learning Object Organizer Plus. All rights reserved.
		    	</div>
	  		</div>
    	</footer>
	</div>

	<script src="bootstrap-modal-master/js/bootstrap-modalmanager.js"></script>
	<script src="bootstrap-modal-master/js/bootstrap-modal.js"></script>
	<script type="text/javascript"></script>
	<script id="dynamic" type="text/javascript"></script>
	<script id="ajax" type="text/javascript"></script>

	<script>
		$(function() {
		  $('a[href*=#header-wrap], a[href*=#before-content], a[href*=#before-features], a[href*=#before-team]').click(function() {
		    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') 
		        || location.hostname == this.hostname) {

		      var target = $(this.hash);
		      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
		      if (target.length) {
		        $('html,body').animate({
		          scrollTop: target.offset().top
		        }, 1000);
		        return false;
		      }
		    }
		  });
		})
	</script>

	<script>
		// This is the distance in px between the uppder edge of the window and the upper edge of the header
		var headerPosition = $('#header-wrap').position().top;

		$(window).scroll(function() {
			var scrollPosition = $(window).scrollTop();

		    if ($(window).scrollTop() === 0) {
		        // We are at the top of the page and want to remove the class
		        $('.navbar.navbar-inverse.navbar-fixed-top').removeClass('navbar-fixed-top-black');
		        // $('.navbar.navbar-inverse.navbar-fixed-top').hide('a navbar-brand');
		        // $('.navbar.navbar-inverse.navbar-fixed-top').show('a navbar-brand');
		    } else {
		        $('.navbar.navbar-inverse.navbar-fixed-top').addClass('navbar-fixed-top-black');
		        // $('.navbar.navbar-inverse.navbar-fixed-top').hide('a navbar-brand');
		        // $('.navbar.navbar-inverse.navbar-fixed-top').show('a navbar-brand');
		    //     $('.navbar.navbar-inverse.navbar-fixed-top').animate({
		    //     	backgroundColor: 'black'
		    //     }, 1500);
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
	                //<?php if(isset($msg)){ ?>
	                //form.find('.alert').html('<?php echo $msg ?>').show();
	                //<?php } ?>
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
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: 'The password is required and can\'t be empty'
		                    },
		                    identical: {
		                        field: 'confirmPassword',
		                        message: 'The password and its confirm are not the same'
		                    }
		                }
		            },
		            confirmPassword: {
		                validators: {
		                    notEmpty: {
		                        message: 'The confirm password is required and can\'t be empty'
		                    },
		                    identical: {
		                        field: 'password',
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



