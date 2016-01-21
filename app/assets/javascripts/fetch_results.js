function findYourNightButton() {
  $('#find-your-night').on("click", function(event){
    event.preventDefault();
    $('#results').empty()
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
      $('.error').addClass('hide')
      $('.search-form').addClass('hide')
      renderSearchResults(response)
    },
    error: function(xhr) {
      $('.error').removeClass('hide')
    }
  });

}
