<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="http://getbootstrap.com/favicon.ico">

    <title>Drag-on IDE</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.servletContext.contextPath}/resources/node_modules/bootstrap/dist/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.servletContext.contextPath}/resources/app/app.css" rel="stylesheet">
	<link href="${pageContext.servletContext.contextPath}/resources/node_modules/jquery-ui/jquery-ui.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body><!-- ng-controller="Drag-onIDEController"-->
  	<input id="htmllauncher" type="hidden" value="${pageContext.servletContext.contextPath}" />
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">DRAG-ON IDE</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Home</a></li>
            <li><a href="#" data-toggle="modal" data-target="#uploadLOConfirmation">Upload Learning Object</a></li>
            <li><a href="#" data-toggle="modal" data-target="#uploadLEConfirmation">Upload Learning Element</a></li>
            <li><a href="#" data-toggle="modal" data-target="#uploadQuizConfirmation">Upload Learning Element</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <!--POP UP FOR LO UPLOAD-->
    <div class="modal fade" id="uploadLOConfirmation">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            Upload Learning Object
          </div>
          <form id="loForm">
          <div class="modal-body">
            
 			<input class="form-control required" type="text" name="title" placeholder="Enter Learning Object Title Here"></input>
 			<input type="hidden" name="author" value="DUMMYIDXX099" />
 			<textarea class="form-control required" name="description" placeholder="Learning Object Description Here"></textarea>
 			<textarea class="form-control required" name="objective" placeholder="Learning Object Objective Here"></textarea>
 			
 			<!-- h6>Upload Adobe Captivate Quiz in Zip form</h6>
 			<input class="btn btn-primary required" accept="application/zip" value="Quiz Zip here" type="file" name="quiz" /-->
            
          </div>
          <div class="modal-footer"> 
            <button class="btn btn-default btn-success">Upload</button>
            <button type="button" id="louCloser" class="btn btn-default btn-danger" data-dismiss="modal">Close</button>
          </div>
          </form>
        </div>
      </div>
    </div>
    <!--POP UP FOR LO UPLOAD-->

  <!--POP UP FOR LE UPLOAD-->
    <div class="modal fade" id="uploadLEConfirmation">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            Upload Learning Element
          </div>
          <form id="leForm">
          <div class="modal-body">
            
            
 			<input class="form-control required" type="text" name="title" placeholder="Enter Element Title Here"></input>
 			<input type="hidden" name="author" value="DUMMYIDXX099" /> <!-- TODO: insert id here jsp style -->
 			<textarea class="form-control required" name="description" placeholder="Element description here"></textarea>
 			<textarea class="form-control required" name="objective" placeholder="Learning Element Objective Here"></textarea>
 			<input class="btn btn-primary required" type="file" name="file" />
            
          </div>
          <div class="modal-footer"> 
            <button class="btn btn-default btn-success">Upload</button>
            <button type="button" id="leuCloser" class="btn btn-default btn-danger" data-dismiss="modal">Close</button>
          </div>
          </form>
        </div>
         
      </div>
    </div>
    <!--POP UP FOR LE UPLOAD-->
    <!--POP UP FOR Quiz UPLOAD-->
    <div class="modal fade" id="uploadQuizConfirmation">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            Upload Learning Element
          </div>
          <form id="quizForm">
          <div class="modal-body">
            
            
 			<input class="form-control required" type="text" name="title" placeholder="Enter Quiz Title Here"></input>
 			<input type="hidden" name="author" value="DUMMYIDXX099" /> <!-- TODO: insert id here jsp style -->
 			<textarea class="form-control required" name="description" placeholder="Quiz description here"></textarea>
 			<textarea class="form-control required" name="objective" placeholder="Quiz Objective Here"></textarea>
 			<input class="btn btn-primary required" type="file" name="file" />
            
          </div>
          <div class="modal-footer"> 
            <button class="btn btn-default btn-success">Upload</button>
            <button type="button" id="leuCloser" class="btn btn-default btn-danger" data-dismiss="modal">Close</button>
          </div>
          </form>
        </div>
         
      </div>
    </div>
    <!--POP UP FOR Quiz UPLOAD-->

    <div class="common">
      <div class="container-fluid">
        <div class="row">
      	
        <div id="pages" class="col-sm-8 col-sm-offset-4 col-md-9 col-md-offset-3 main sortable">
        	<button type="button" id="pageAddBtn">Add Page</button>
            <ul id="pageTitles">
    			<li><a href="#page-1">1</a><span class="ui-icon ui-icon-circle-close ui-closable-tab"></span></li>
  			</ul>
  			<div class="page" id="page-1">
  				<div class="well slot"><button type="button" class="le-obj-del" disabled="disabled">X</button>
  					
  					<iframe class="le-object html-le" src="${pageContext.servletContext.contextPath}/html-le-stage/webtest/test.html"></iframe>
  					
  				</div>
  			</div>
        </div>

        <div class="search-block" ng-controller="">
          <form id="searchForm">
            <input id="searchBox" class="form-control" type="text" placeholder="Search element..." />
          </form>
        </div>
        <div class="col-sm-4 col-md-3 sidebar">
          <ul class="nav nav-sidebar" id="resultList">
            
          </ul>
        </div>
        <div>
      </div>
    </div>
	  </div>
	</div>

	<script src="${pageContext.servletContext.contextPath}/resources/node_modules/jquery/dist/jquery.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/node_modules/jquery-ui/jquery-ui.js"></script>
  	<script src="${pageContext.servletContext.contextPath}/resources/node_modules/bootstrap/dist/js/bootstrap.js"></script>
  	<script src="${pageContext.servletContext.contextPath}/resources/node_modules/angular/angular.js"></script>
  	<script src="${pageContext.servletContext.contextPath}/resources/app/service.js"></script>
  	<script src="${pageContext.servletContext.contextPath}/resources/app/app.js"></script>
  	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  	<script src="${pageContext.servletContext.contextPath}/resources/app/ie10-viewport-bug-workaround.js"></script>
  </body>

  <!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  
  <!--script src="resource/node_modules/angular/angular.js"></script-->


</html>




<!--html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="/PseudoLOOP/LOIDE/api/file/upload" method="POST" enctype="multipart/form-data" >
 	<input type="text" name="title"></input>
 	<input type="text" name="author" />
 	<input type="text" name="description" />
 	<input type="file" name="file" />
 	<input type="submit" value="upload"/>
 </form>
</body>
</html-->