// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require fetch_results
//= require_tree .

$(document).ready(function() {
  findYourNightButton();
});

// function findYourNightButton() {
//   $('#find-your-night').click(function(event){
//     event.preventDefault();
//     });
// }
function findYourNightButton() {
  $('#find-your-night').on("click", function(event){
    event.preventDefault();
    fetchResults();
    });
}

function fetchResults() {
  var address = $('#address').val();
  var distance = $('#distance').val();
  var location_categories = [];

  if ($('#location_categories_bars').is(':checked')){
    location_categories.push("bars");}
  if ($('#location_categories_cannabis_clinics').is(':checked')){
    location_categories.push("cannabis_clinics");}
  if ($('#location_categories_events').is(':checked')){
    location_categories.push("events");}
  if ($('#location_categories_hotels').is(':checked')){
    location_categories.push("hotels");}
  if ($('#location_categories_museums').is(':checked')){
    location_categories.push("museums");}
  if ($('#location_categories_restaurants').is(':checked')){
    location_categories.push("restaurants");}

  $.ajax({
    type: 'GET',
    url: 'api',
    contentType: 'application/json; charset=utf-8',
    data: { location_categories: location_categories, address: address, distance: distance },
    dataType: 'json',
    success: function(response) {
      console.log("success");
    },
    error: function(xhr) {
      console.log(xhr.responseText);
    }
  });

  // $.ajax({
  //   type: 'GET',
  //   url: 'yelp?location_categories=' + location_categories + '&address=' + address + '&distance=' + distance,
  //   contentType: 'application/json; charset=utf-8',
  //   dataType: 'json',
  //   success: function() {
  //     console.log(success);
  //   },
  //   error: function(xhr) {
  //     console.log(xhr.responseText);
  //   }
  // });

}
