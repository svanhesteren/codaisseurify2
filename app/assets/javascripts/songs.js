function createSong(params) {

  console.log(params);



  $.ajax({
    type: "POST",
    url: "/artists/" + params.artist_id + "/songs",
    data: JSON.stringify({song: params}),
    contentType: "application/json",
    dataType: "json"
  })
  .done(function(data) {
    console.log(data);
    // <li id="item-<%= song.id %>"><%= link_to song.name, song_path(song) %> - <a href="" class="destroy-song" id="<%= song.id %>">Remove</a></li>
    // console.log($("#new_song"));
    // var item = $(`<li id="item-${@song.id}">`)
    // .append(`<a href=""`)


  })

  .fail(function(error) {
    console.log(error)

    // console.log($("#new_song"));
  });

}

function deleteSong(songId) {


  $.ajax({
    type: "DELETE",
    url: "/songs/" + songId,
    contentType: "application/json",
    dataType: "json"})

  .done(function(data) {
    $("#item-"+songId).remove()
  })
};

function submitSong(event) {
  event.preventDefault();
  console.log(event);
  var params = {
    artist_id: $("#song-artist-id").val(),
    name: $("#song-name").val(),
    album: $("#song-album").val(),
    rating: $("#song-rating").val(),
    songId: $("#song-id").val()
  }
  createSong(params);

}

function submitDelete(event) {
  event.preventDefault();
  deleteSong(event.target.id)
};


$(document).ready(function() {
  $("form").bind('submit', submitSong);
  $(".destroy-song").on('click', submitDelete);
});
