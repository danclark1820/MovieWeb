$(function(){
  $('.rating_star').click(function(){
    var starClicked = $(this);
    var stars = starClicked.attr('data-stars');
    var movieID = starClicked.attr('data-movie-id');

    starClicked.addClass.addClass('activated');

  });
});
