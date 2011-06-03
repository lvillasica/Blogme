// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  $("#main").hide().slideDown(1000);
  $("#main_lnks").hide().fadeIn(1000);
  $("#hide").live('click', function() {
    $("#comments_content").slideUp(1000);
  });
});


