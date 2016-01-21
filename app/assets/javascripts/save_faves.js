function saveToFavesButton(location, key) {
  $('.save-to-fave-btn-'+key).on("click", function(event){
    var button = this;
    event.preventDefault();
    saveFavorite(location, button, key);
    });
}

function saveFavorite(location, button, key) {
  data = {"id": location["id"], "category": key, name: location["name"], "image_url": location["image_url"], "address": location["address"]}
  $.post('/favorites', data, disableFavoriteButton(button));
}

function disableFavoriteButton(button) {
  button.setAttribute("disabled", true);
  button.innerText = 'Saved'
}
