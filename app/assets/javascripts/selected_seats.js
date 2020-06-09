  var selected_seats = [];
  $('.ss').on('click', function(event) {


    if($(this).hasClass('seated')) return;
    if($(this).hasClass('seat')) {
        $(this).removeClass('seat');
        $(this).css('background', '#949494');
        var index = selected_seats.indexOf(event.target.id);
        if (index !== -1) selected_seats.splice(index, 1)
        $("#selected_seats").val(selected_seats);
        $(".gia").text(Number(selected_seats.length)*45000 + "  VND");
    } else {
      $(this).css('background', 'red');
      $(this).addClass('seat');
      selected_seats.push(event.target.id);
      $(".gia").text(Number(selected_seats.length)*45000 + "  VND");
      $("#selected_seats").val(selected_seats);
    }
  });


