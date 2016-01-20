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
      renderSearchResults(response)
    },
    error: function(xhr) {
      "<div class='error'><h3>You must choose at least one category.</h3></div>";
    }
  });

}

function renderSearchResults(response) {
  $('.search-results').removeClass('hide')
  for (key in response) {
    var location = response[key]
    var image = response[key+'_url']
    '<div class="row">'
    if (key === "Event") {
      renderEvent(location)
    } else {
      renderCard(location, key, image)
    }
    + '</div>'
  }
 }

  function renderEvent(location) {
    $('#results').prepend(

      '<div class="col-md-2 category_card"><div class="thumbnail">'
      + '<div class="event-card"><img src="'
      + location["logo"]["url"]
      + '"><div class="caption"><h5>Event:</h5><h4>'
      +  location["name"]["text"]
      + '</h4><p><a href="/'
      + location["id"]
      + '?category=Event'
      + '" class = "btn btn-primary btn-xs"></div></div></div>'
    )
      saveToFavesButton(response);
    }

function renderCard(location, key, image) {
  $('#results').prepend(
    '<div class="col-md-2 category_card"><div class="thumbnail">'
    + '<div class="event-card"><img src="'
    + location["image_url"]
    + '"><div class="caption"><h5>'
    + key
    + ':</h5><h4>'
    +  location["name"]
    + '</h4><p><a href="/locations/'
    + location["id"]
    + '?category='
    + key
    + '" class="btn btn-primary btn-xs">Learn More</a><button class="save-to-fave btn btn-primary '
    + key
    +'">Save to Fave</button></p></div></div></div>'
  )
  saveToFavesButton(location);
}

function saveToFavesButton(location) {
  $('.save-to-fave').on("click", function(event){
    var button = this;
    event.preventDefault();
    saveFavorite(location, button);
    });
}

function saveFavorite(location, button) {
  data = {"id": location["id"], "category": location["category"], name: location["name"], "image_url": location["image_url"], "address": location["address"]}
  $.post('/favorites', data, disableFavoriteButton(button));
}

function disableFavoriteButton(button) {
  button.setAttribute("disabled", true);
  button.innerText = 'Saved'
}
