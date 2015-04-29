$(document).ready(function(){

  var progressBarSelector = '.js-progress .progress-bar';


  $('.js-fileupload').fileupload({
    autoUpload: true
  }).bind('fileuploadstart', function(e){
    $(progressBarSelector).css('width', '0%');
    $('.js-progress').removeClass('hidden');
  }).bind('fileuploadprogressall', function(e, data){
    var progress = parseInt(data.loaded / data.total * 100, 10) - 10;

    $(progressBarSelector).css('width', progress + '%');
  }).bind('fileuploaddone', function(e, data){
    var response = data.result,
        $template = $(JST['attachments/attachment']({
                      'account': response.account,
                      'id': response.id,
                      'filename': response.filename,
                      'url': response.url,
                      'created_at': response.created_at
                    }));

    $(progressBarSelector).css('width', '100%');
    $('.js-attachment-container').prepend($template);

    $('.js-progress').addClass('hidden');
    $(progressBarSelector).css('width', '0%');
  }).bind('fileuploadfail', function(e, data){
    var response = data.jqXHR.responseJSON.error;
        $template = $(JST['common/shared']({
                      'errors': response
                    }));

    $('.js-container').prepend($template);
  });

});
