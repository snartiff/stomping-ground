$(document).ready(function() {

  $('#upvote').on('click', function(event) {
    event.preventDefault();
    var upvote = this.href
    // debugger;

    var request = $.ajax({
      method: "GET",
      url: `${upvote}.json`
    });

    request.done(function(data) {
      $('#upvote-count').replaceWith(`${data.upvotes} Upvotes`);
      $('#downvote-count').replaceWith(`${data.downvotes} Downvotes`);
    });


  });

  $('#downvote').on('click', function(event) {
    event.preventDefault();
    var upvote = this.href
    // debugger;

    var request = $.ajax({
      method: "GET",
      url: `${downvote}.json`
    });

    request.done(function(data) {
      $('#upvote-count').replaceWith(`${data.upvotes} Upvotes`);
      $('#downvote-count').replaceWith(`${data.downvotes} Downvotes`);
    });


  });
});
