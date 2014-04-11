var rates = function(isNew){
  var starClicked = $(window.event.srcElement);
  var stars = starClicked.attr('value');
  var movieId = starClicked.attr('data-movie-id');
  var ratingData = {
    movie_id: movieId,
    stars: stars
  };

  if (isNew === ""){
    requestType = "POST";
    path = "/ratings";
  } else {
    requestType = "PUT";
    path = "/ratings/" + movieId;
  }

  hightlightStars(stars, movieId);
  submitVote(requestType, path, ratingData);
  };

var submitVote = function(requestType, path, data){
  $.ajax(
  {
    type: requestType,
    url: path,
    data: {
      rating: data
    }
  });
};

var hightlightStars = function(stars, movieId) {
  for(i = 1; i <= 5; i++){
    star = $('#movie_' + movieId + '_' + i);
    if (i <= stars) {
      star.addClass('activated');
    } else {
      star.removeClass('activated');
    }
  }
};
