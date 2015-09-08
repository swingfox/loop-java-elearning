
// developer-tour script

(function(){
var name = "Friend";
var tour = new Tour({
	storage : false
});

tour.addSteps([
  {
    element: ".tour-step.tour-step-one",
    placement: "bottom",
    title: "Welcome Developer!",
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
// tour.start();

$('#tour').click(function(e){
    tour.start();

    // it's also good practice to preventDefault on the click event
    // to avoid the click triggering whatever is within href:
    e.preventDefault(); 
});

}());


// (function(){
// 	var name = "Friend";
// 	var tour = new Tour({
// 		storage : false
// 	});

// 	tour.addSteps([
// 	  {
// 	    element: ".tour-step.tour-step-one",
// 	    placement: "bottom",
// 	    title: "Welcome to our landing page!",
// 	    content: "What's your name? <br><input class='form-control' type='text' name='your_name'>",
// 	    onNext : function(tour){
// 	    	var nameProvided = $("input[name=your_name]").val();
// 	    	if ($.trim(nameProvided) !== ""){
// 	    		name = nameProvided;
// 	    	}
// 	    }
// 	  },
// 	  {
// 	    element: ".tour-step.tour-step-two",
// 	    placement: "bottom",
// 	    title: function(){ return "Welcome, " + name; },
// 	    content: "Here are the sections of this page, easily laid out."
// 	  },
// 	  {
// 	    element: ".tour-step.tour-step-three",
// 	    placement: "top",
// 	    backdrop: true,
// 	    title: "Main section",
// 	    content: "This is a section that you can read. It has valuable information."
// 	  },
// 	  {
// 	    element: ".tour-step.tour-step-four",
// 	    placement: "top",
// 	    orphan: true,
// 	    title: "Thank you.",
// 	    content: function(){ return "We can't wait to see what you think, "+name+"!" }
// 	  },

// 	]);

	// Initialize the tour
	// tour.init();

	// Start the tour
// 	tour.start();

// }());

