$('.edit_page input, .edit_page textarea, .edit_asset input, .edit_asset textarea').bind('keyup change', function() {
    // Debounce by a bit.
    var that = this;
    clearTimeout($.data(that, 'scrollTimer'));
    $.data(that, 'scrollTimer', setTimeout(function() {
      $(that).parents('form').submit();
    }, 500));
});

$('.edit_page, .edit_asset').bind('submit', function() {
  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: $(this).serialize(),
  });
  return false;
});
