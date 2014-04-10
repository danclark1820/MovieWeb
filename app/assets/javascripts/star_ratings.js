$(function(){
  $('.rating_star').click(function(){
    var starClicked = $(this);
    var stars = starClicked.attr('value');
    var movieId = starClicked.attr('data-movie-id');

    for(i=1; i <= 5; i++){
      star = $('#movie_' + movieId + '_' + i);
      if (i <= stars){
        star.addClass('activated');
      } else {
        star.removeClass('activated');
      }
    }

  });
});
