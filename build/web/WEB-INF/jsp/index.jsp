<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
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
						<a class="navbar-brand" href="<?php echo base_url() ?>index.php">
							<img src="<?php echo base_url() ?>img/loop-logo.svg" width="116px" height="28px" alt="LOOP Logo"/>
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
    </body>
</html>
