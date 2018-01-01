

function deleteSong(songId) {

  // var url = $(location).attr('href');
  // var pieces = url.split("/");
  // var songId = pieces.slice(-1)[0];
  // var songId = this.id;
  // var songId = $(this).attr('id');

  console.log(songId);
  console.log(url);
  // console.log($(this));

  $.ajax({
    type: "DELETE",
    url: "/songs/" + songId,
    contentType: "application/json",
    dataType: "json"})

  .done(function(data) {
    $("#item-"+songId).remove()
  })
};

function submitDelete(event) {
  event.preventDefault();
  deleteSong(event.target.id)
};


$(document).ready(function() {
  // $("form").bind('submit', submitSong);
  $(".destroy-song").on('click', submitDelete);
});
