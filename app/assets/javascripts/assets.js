$('#new_asset').fileupload({
  dataType: 'json',
  add: function(e, data) {
    data.context = $($.parseHTML('<div class="progress progress-striped active"><div class="bar" style="width: 0%;"></div></div>'));
    $('#new_asset').prepend(data.context);
    data.submit();
  },
  progress: function(e, data) {
    if (data.context) {
      progress = parseInt(data.loaded / data.total * 100, 10);
      data.context.find('.bar').css('width', progress + '%');
    }
  },
  done: function (e, data) {
    // Drop in return form from rails.
    data.context.replaceWith('<img src="' + data.result.asset.url + '">')
  },
  fail: function(e, data, three) {
    data.context.find('.progress').remove()
    data.context.parent().append('<div class="alert">' + JSON.parse(data.jqXHR.responseText).asset[0] + '</div>');
  }
});
