$(function(){
  // $('.rating_star').click(function(){
  //   var starClicked = $(this);
  //   var stars = starClicked.attr('value');
  //   var movieId = starClicked.attr('data-movie-id');

    // for(i=1; i <= 5; i++){
    //   star = $('#movie_' + movieId + '_' + i);
    //   if (i <= stars){
    //     star.addClass('activated');
    //   } else {
    //     star.removeClass('activated');
    //   }
    // }
});

var rates = function(isNew){
  var star = $(window.event.srcElement);
  var movieId = star.attr('data-movie-id');
  var ratingData = {
    movie_id: movieId,
    stars: stars.attr('value')
  };

  if (isNew === ""){
    requestType = "POST";
    path = "/ratings";
  } else {
    requestType = "PUT";
    path = "/ratings/" + movieId;
  }
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
