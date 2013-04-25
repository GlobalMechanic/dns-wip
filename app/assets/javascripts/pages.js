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

// Make video 16:9
$(window).bind("load orientationchange resize", function() {  
    var videoWidth = $('body').find('#container').width();
    var videoHeight = videoWidth * 9/16;
    $('.video-js').css({ 'width': videoWidth + 'px', 'height': videoHeight + 'px' });
});
