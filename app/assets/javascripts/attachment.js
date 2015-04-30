$(document).ready(function(){

  var progressBarSelector = '.js-progress .progress-bar';


  $('.js-fileupload').fileupload({
    autoUpload: true
  }).bind('fileuploadstart', function(e){
    $('.alert').parent().remove();

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

    var $template = $(JST['common/notice']({
                      'notice': 'File successfully uploaded'
                    }));
    $('.js-container').prepend($template);
  }).bind('fileuploadfail', function(e, data){
    var status = data.jqXHR.status,
        response = ['Unexpected error encountered. Please try again later.']

    if (status === 400) response = data.jqXHR.responseJSON.error

    var $template = $(JST['common/error']({ 'errors': response }));

    $('.js-container').prepend($template);
  }).bind('fileuploadalways', function(e, data){
    setTimeout(function(){
      $('.js-progress').addClass('hidden');
      $(progressBarSelector).css('width', '0%');
    }, 2000);
  });

});
