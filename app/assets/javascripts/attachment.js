$(document).ready(function(){

  $('.js-fileupload').fileupload({
    autoUpload: true
  }).bind('fileuploadprogressall', function(e, data){
    var progress = parseInt(data.loaded / data.total * 100, 10);
    $('#progress .bar').css('width', progress + '%');
  }).bind('fileuploaddone', function(e, data){
    var response = data.result,
        $template = $(JST['attachments/attachment']({
                      'account': response.account,
                      'id': response.id,
                      'filename': response.filename,
                      'url': response.url,
                      'created_at': response.created_at
                    }));

    $('.js-attachment-container').prepend($template);
  });
});
