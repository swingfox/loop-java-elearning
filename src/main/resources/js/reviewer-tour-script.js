
// reviewer-tour script

// $(function() {
//   var $demo, duration, remaining, tour;
//   $demo = $("#demo");
//   duration = 5000;
//   remaining = duration;
//   tour = new Tour({
//     onStart: function() {
//       return $demo.addClass("disabled", true);
//     },
//     onEnd: function() {
//       return $demo.removeClass("disabled", true);
//     },
//     debug: true,
//     steps: [
//       {
//         path: "/",
//         element: "#demo",
//         placement: "bottom",
//         title: "Welcome to Bootstrap Tour!",
//         content: "Introduce new users to your product by walking them through it step by step."
//       }, {
//         path: "/",
//         element: "#usage",
//         placement: "top",
//         title: "A super simple setup",
//         content: "Easy is better, right? The tour is up and running with just a      few options and steps."
//       }, {
//         path: "/",
//         element: "#license",
//         placement: "top",
//         title: "Best of all, it's free!",
//         content: "Yeah! Free as in beer... or speech. Use and abuse, but don't forget to contribute!"
//       }, {
//         path: "/api",
//         element: "#options",
//         placement: "top",
//         title: "Flexibilty and expressiveness",
//         content: "There are more options for those who want to get on the dark side.<br>\nPower to the people!",
//         reflex: true
//       }, {
//         path: "/api",
//         element: "#duration",
//         placement: "top",
//         title: "Automagically expiring step",
//         content: "A new addition: make your tour (or step) completely automatic. You set the duration, Bootstrap\nTour does the rest. For instance, this step will disappear in <em>5</em> seconds.",
//         duration: 5000
//       }, {
//         path: "/api",
//         element: "#methods",
//         placement: "top",
//         title: "A new shiny Backdrop option",
//         content: "If you need to highlight the current step's element, activate the backdrop and you won't lose\nthe focus anymore!",
//         backdrop: true
//       }, {
//         path: "/api",
//         element: "#reflex",
//         placement: "bottom",
//         title: "Reflex mode",
//         content: "Reflex mode is enabled, click on the text in the cell to continue!",
//         reflex: true
//       }, {
//         path: "/api",
//         title: "And support for orphan steps",
//         content: "If you activate the orphan property, the step(s) are shown centered in the page, and you can\nforget to specify element and placement!",
//         orphan: true,
//         onHidden: function() {
//           return window.location.assign("/");
//         }
//       }
//     ]
//   }).init().start();
//   if (tour.ended()) {
//     $('<div class="alert alert-info alert-dismissable"><button class="close" data-dismiss="alert" aria-hidden="true">&times;</button>You ended the demo tour. <a href="#" data-demo>Restart the demo tour.</a></div>').prependTo(".content").alert();
//   }
//   $(document).on("click", "[data-demo]", function(e) {
//     e.preventDefault();
//     if ($(this).hasClass("disabled")) {
//       return;
//     }
//     tour.restart();
//     return $(".alert").alert("close");
//   });
//   $("html").smoothScroll();
//   return $(".gravatar").each(function() {
//     var $this, email;
//     $this = $(this);
//     email = md5($this.data("email"));
//     return $(this).attr("src", "http://www.gravatar.com/avatar/" + email + "?s=60");
//   });
// });


// (function(){
// var $tourdemo;
// $tourdemo = $("#tour-demo");
// var name = "Friend";
// var tour = new Tour({

//   onStart: function() {
//       return $tourdemo.addClass("disabled", true);
//     },
//     onEnd: function() {
//       return $tourdemo.removeClass("disabled", true);
//     },
//     debug: true,
//     steps: [
//       {
//         path: "/",
//         element: "#tour-demo",
//         placement: "bottom",
//         title: "Welcome to Bootstrap Tour!",
//         content: "Introduce new users to your product by walking them through it step by step."
//       },

//       }
//     ]
//   }).init().start();
//   if (tour.ended()) {
//     $('<div class="alert alert-info alert-dismissable"><button class="close" data-dismiss="alert" aria-hidden="true">&times;</button>You ended the demo tour. <a href="#" data-demo>Restart the demo tour.</a></div>').prependTo(".content").alert();
//   }
//   $(document).on("click", "[data-demo]", function(e) {
//     e.preventDefault();
//     if ($(this).hasClass("disabled")) {
//       return;
//     }
//     tour.restart();
//     return $(".alert").alert("close");
//   });
//   $("html").smoothScroll();
//   return $(".gravatar").each(function() {
//     var $this, email;
//     $this = $(this);
//     email = md5($this.data("email"));
//     return $(this).attr("src", "http://www.gravatar.com/avatar/" + email + "?s=60");
//   });
// });


// reviewer-tour script

(function(){
var name = "Friend";
var tour = new Tour({
  storage : false
});

tour.addSteps([
  {
    element: ".tour-step.tour-step-one",
    placement: "bottom",
    title: "Welcome Reviewer!",
    content: "This is a quick tour of LOOP, click Next (or the left/right arrow keys) to continue."
  },

  {
    element: ".tour-step.tour-step-two",
    placement: "bottom",
    // title: function(){ return "Welcome, " + name; },
    title: "This is the Learning Objects Tab!",
    content: "Right now, you are here. This is where the learning objects you have uploaded are displayed."
  },

  {
    element: ".tour-step.tour-step-three",
    placement: "top",
    backdrop: true,
    title: "This here is the Learning Objects table.",
    // content: "Click on the orange table-headers to sort the columns in ascending or descending order."
    content: "All the learning objects you upload will be displayed here."
  },

  {
    element: ".tour-step.tour-step-four",
    placement: "top",
    backdrop: true,
    title: "Color Coded Rating System",
    content: "The color on the left side of every learning object corresponds to this rating system: Red: 1-2, Yellow: 3-4, Green: 5"
    // content: "The color on the left side of every learning object corresponds to this rating system: Red means the learning object has a rating of 1 or 2, Yellow means it is given a rating of 3 or 4, and Green means it is rated 5."
  },

  {
    element: ".tour-step.tour-step-five",
    placement: "left",
    backdrop: true,
    title: "Looking for a specific learning object?",
    content: "Find it instantly by typing the learning object's Name, Subject, Date Uploaded or Rating here."
  },

  {
    element: ".tour-step.tour-step-six",
    placement: "right",
    backdrop: true,
    reflex: true,
    title: "Start uploading learning objects!",
    content: "Clicking this tab will take you to the upload page. Upload something and add it to the learning objects table. Click Me to Continue!"
  },

  //Upload Page

  { //Step 1
    element: ".tour-step.tour-step-seven",
    placement: "bottom",
    title: "Welcome to the Upload page!",
    content: "Click next, when you're ready."
  },

  { //Step 2
    element: ".tour-step.tour-step-eight",
    placement: "right",
    title: "First, choose a file to Upload",
    content: "Click this button to locate the learning object you want to upload."
  },

  { //Step 3
    element: ".tour-step.tour-step-nine",
    placement: "left",
    backdrop: true,
    title: "Give the file a name.",
    content: "Name the learning object."
  },

  { //Step 4
    element: ".tour-step.tour-step-ten",
    placement: "right",
    backdrop: true,
    title: "Where does this topic belong to?",
    content: "Specify the learning object's subject."
  },

  { //Step 5
    element: ".tour-step.tour-step-eleven",
    placement: "left",
    backdrop: true,
    title: "Say something about it.",
    content: "Describe what the learning object is about."
  },

  { //Step 6
    element: ".tour-step.tour-step-twelve",
    placement: "top",
    title: "Finally!",
    content: "When you've finalized everything, click this button and your done!"
  },

  { //Step 7
    element: ".tour-step.tour-step-thirteen",
    placement: "right",
    backdrop: true,
    reflex: true,
    title: "Looking for a specific learning object?",
    content: "Clicking this tab will take you to the Advanced Search page. Click it to Continue!"
  },

  //Advanced Search Page

  { //Step 1
    element: ".tour-step.tour-step-fourteen",
    placement: "bottom",
    title: "Welcome to the Advanced Search page!",
    content: "This section lets you find any specific Learning Object you're looking for."
  },

  { //Step 2
    element: ".tour-step.tour-step-fifteen",
    placement: "bottom",
    backdrop: true,
    title: "What is its name again?",
    content: "Type the Learning Object's name here."
  },

  { //Step 3
    element: ".tour-step.tour-step-sixteen",
    placement: "left",
    backdrop: true,
    title: "Search by Subject",
    content: "If you want to search a learning object by subject then select this and type in the subject."
  },

  { //Step 4
    element: ".tour-step.tour-step-seventeen",
    placement: "left",
    backdrop: true,
    title: "Search by Date",
    content: "When did you upload the learning object?"
  },

  { //Step 5
    element: ".tour-step.tour-step-eighteen",
    placement: "left",
    backdrop: true,
    title: "Want a specific order?",
    content: "You can choose how the Learning Object list is ordered; by Date, Popularity or Name."
  },

  { //Step 6
    element: ".tour-step.tour-step-nineteen",
    placement: "top",
    title: "Click this to Search!",
    content: "Yes, you guessed it! Click this button to see if we have Learning Object you are looking for."
  },

  //End of Tour
  /*
  { //Step 7
    orphan: true,
    backdrop: true,
    title: "That's pretty much it!",
    content: "Was that so hard? You are now a certified PRO. Have fun using LOOP!"
  },
  */


]);

// Initialize the tour
tour.init();

// Start the tour
tour.start();

}());


