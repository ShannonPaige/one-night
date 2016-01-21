function learnMoreButton(key) {
  $('.learn-more-btn-'+key).click(function(event){
    var button = this;
    $('.learn-more-'+key).toggle("fast");
    event.preventDefault();
    changeLearnButton(button)
    });
}

function changeLearnButton(button) {
  if (button.innerText === 'Learn More') {
    button.innerText = 'Less'
  } else {
    button.innerText = 'Learn More'
  }
}
