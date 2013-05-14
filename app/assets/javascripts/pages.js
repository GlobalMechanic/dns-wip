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

$('.edit_asset .up, .edit_asset .down').click(function() {
  var $asset = $(this).parents('.edit_asset');
  $asset.removeClass('active').addClass('active');
  if ($(this).hasClass('up')) {
    var $prev = $asset.prev('.edit_asset');
    $('html,body').animate({scrollTop: $(document).scrollTop() - $prev.height() }, 250);
    $asset.insertBefore($prev);
  }
  else if ($(this).hasClass('down')) {
    var $next = $asset.next('.edit_asset');
    $('html,body').animate({scrollTop: $(document).scrollTop() + $next.height() }, 250);
    $asset.insertAfter($next);
  }
  $('.edit_asset').each(function(index, asset) {
    $(asset).find('[name="asset[order]"]').val(index);
    $(asset).submit();
  });
});

// Make video 16:9
$(window).bind("load orientationchange resize", function() {  
    var videoWidth = $('body').find('#container').width();
    var videoHeight = videoWidth * 9/16;
    $('.video-js, .vjs-tech').css({ 'width': videoWidth + 'px', 'height': videoHeight + 'px' });
});
