function learnMoreButton() {
  $('.learn-more-btn').click(function(event){
    var button = this;
    $('.learn-more').toggle("slow");
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
