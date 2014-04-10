$(function(){
  $('.rating_star').click(function(){
    var starClicked = $(this);
    var stars = starClicked.attr('data-stars');
    var movieId = starClicked.attr('data-movie-id');

    for(i=1; i <= stars; i++){
      star = $('#movie_' + movieId + '_' + i);
      star.addClass('activated');
    }

  });
});
