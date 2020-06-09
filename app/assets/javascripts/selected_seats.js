  var selected_seats = [];
  $('.ss').on('click', function(event) {
    if($(this).hasClass('seated')) return;
    if($(this).hasClass('seat')) {
        $(this).removeClass('seat');
        $(this).css('background', '#949494');
        var index = selected_seats.indexOf(event.target.id);
        if (index !== -1) selected_seats.splice(index, 1)
        $("#selected_seats").val(selected_seats);
    } else {
      $(this).css('background', 'red');
      $(this).addClass('seat');
      selected_seats.push(event.target.id);
      $("#selected_seats").val(selected_seats);
    }
  })
