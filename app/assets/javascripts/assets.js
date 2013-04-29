$('#new_asset').fileupload({
  dataType: 'json',
  add: function(e, data) {
    data.context = $($.parseHTML('<div class="progress progress-striped active"><div class="bar" style="width: 0%;"></div></div>'));
    $('#new_asset').parent().append(data.context);
    data.submit();
  },
  progress: function(e, data) {
    if (data.context) {
      progress = parseInt(data.loaded / data.total * 100, 10);
      data.context.find('.bar').css('width', progress + '%');
    }
  },
  done: function (e, data) {
    var template = $.parseHTML(data.result.template);
    data.context.replaceWith(template);
    _V_($(template).find('.video-js').attr('id'));
    var videoWidth = $('body').find('#container').width();
    var videoHeight = videoWidth * 9/16;
    $(template).find('.video-js, .vjs-tech').css({ 'width': videoWidth + 'px', 'height': videoHeight + 'px' });
  },
  fail: function(e, data, three) {
    data.context.find('.progress').remove()
    data.context.parent().append('<div class="alert">' + data.errorThrown + '</div>');
  }
});
