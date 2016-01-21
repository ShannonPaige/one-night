function renderSearchResults(response) {
  $('.search-results').removeClass('hide')
  for (key in response) {
    var location = response[key]
    var image = response[key+'_url']
    '<div class="row">'
    if (key === "Event") {
      renderEvent(location)
    } else {
      renderOther(location, key, image)
    }
    + '</div>'
  }
 }

function renderEvent(location) {
  $('#results').prepend(
    '<div class="col-md-2 category_card"><div class="thumbnail">'
    + '<div class="event-card"><img src="'
    + location["logo"]["url"]
    + '" width="100px"><div class="caption"><h5>Event:</h5><h4>'
    +  location["name"]["text"]
    + '</h4><p><a href="/'
    + location["id"]
    + '?category=Event'
    + '" class="btn btn-danger btn-sm">Learn More</a></p><p>'
    + '<button class="save-to-fave btn btn-danger btn-sm'
    +'">Save to Fave</button></p></div></div></div>'
  )
    saveToFavesButton(location, "Event");
  }

function renderOther(location, key, image) {
  $('#results').prepend(
    '<div class="col-md-2 category_card"><div class="thumbnail">'
    + '<div class="event-card"><img src="'
    + location["image_url"]
    + '"><div class="caption"><h5>'
    + key
    + ':</h5><h4>'
    +  location["name"]
    + '</h4><p>'
    + location["location"]["display_address"][1]
    + '<br />'
    + location["location"]["display_address"][0]
    + '<br />'
    + location["location"]["display_address"][2]
    + '</p><p class="learn-more hide">'
    + location["display_phone"]
    + '<br />Yelp Rating: <img src="'
    + location["rating_img_url"]
    + '">based on '
    + location["review_count"]
    + ' reviews. <br /><a href="'
    + location["url"]
    + ' target="_blank">View on Yelp</a></p>'
    // + '<p><a href="/locations/'
    // + location["id"]
    // + '?category='
    // + key
    // + '" class="btn btn-danger btn-sm">Learn More</a></p>'
    + '<p><button class="learn-more-btn btn btn-danger btn-sm'
    + '">Learn More</button></p>'
    + '<p><button class="save-to-fave btn btn-danger btn-sm'
    + '">Save to Fave</button></p>'
    + '</div></div></div>'
  )
  learnMoreButton();
  saveToFavesButton(location, key);
}
