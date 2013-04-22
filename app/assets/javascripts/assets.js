$('#new_asset').fileupload({
  dataType: 'json',
  add: function(e, data) {
    // $('body').addClass('drop');

    // data.context = $($($.parseHTML(tmpl("template-upload", data.files[0]))));
    // $('#upload-form .asset-uploads').append(data.context);
    // var reader = new FileReader();
    // reader.onload = function (event) {
    //   var image = $('<img width="80">').attr('src', event.target.result);
    //   data.context.find('.image').append(image);
    // };
    // reader.readAsDataURL(data.files[0]);
    data.submit();
  },
  progress: function(e, data) {
    // var progress;
    // if (data.context) {
    //   progress = parseInt(data.loaded / data.total * 100, 10);
    //   data.context.find('.bar').css('width', progress + '%');
    // }
  },
  done: function (e, data) {
    // data.context.find('.progress').removeClass('active').addClass('progress-success');
    // gm.uploads.push(data);
  },
  fail: function(e, data, three) {
    // data.context.find('.progress').remove()
    // data.context.append('<div class="alert">' + JSON.parse(data.jqXHR.responseText).asset[0] + '</div>');
  }
});
