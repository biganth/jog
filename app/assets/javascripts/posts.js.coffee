$ ()->
  $("form.new_post").on "ajax:success", (event, data, status, xhr) ->
    $('#new-post-modal').modal('hide')
    $('table tbody').append('<tr><td>' + data.title + '</td><td>' + data.content + '</td></tr>')