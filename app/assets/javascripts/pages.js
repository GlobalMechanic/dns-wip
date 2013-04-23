$(document).on('keyup change', '.edit_page input, .edit_page textarea, .edit_asset input, .edit_asset textarea', function() {
    // Debounce by a bit.
    var that = this;
    clearTimeout($.data(that, 'scrollTimer'));
    $.data(that, 'scrollTimer', setTimeout(function() {
      $(that).parents('form').submit();
    }, 500));
});

$(document).on('submit', '.edit_page, .edit_asset', function() {
  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: $(this).serialize(),
  });
  return false;
});
