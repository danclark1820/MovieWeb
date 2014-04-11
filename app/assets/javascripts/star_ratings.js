function(){
    $('.star').click( function(e) {
    var starClicked  = $(e.target);
    var numStars     = starClicked.attr('value');
    var movieId      = starClicked.attr('data-movie-id');
    var userRatingId = starClicked.attr('data-user-rating-id');
    var ratingData   = {
      movie_id: movieId,
      stars: numStars
    };

    if ( userRatingId === ""){
      requestType = "POST";
      path = "/ratings";
    } else {
      requestType = "PUT";
      path = "/ratings/" + movieId;
    }

    hightlightStars(numStars, movieId);
    submitVote(requestType, path, ratingData);
  });
});

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
      star.addClass('fa-star');
      star.removeClass('fa-star-o');
    } else {
      star.addClass('fa-star-o');
      star.removeClass('fa-star');
    }
  }
};
