$(document).ready(function(){

  $('.js-submit-comment').on('click', function(e){
    e.preventDefault();

    var $form = $('.js-comment-form'),
        editor = CKEDITOR.instances.comment_content,
        url = $form.prop('action');

    if (editor.getData().length === 0) {
      console.log('empty!!');
      return;
    }

    editor.updateElement();

    // TODO: check errors
    $.ajax({
      url: url,
      data: $form.serialize(),
      dataType: 'json',
      type: 'POST',
      success: function(result){
        console.log('Result!');
        console.log(result);

        var $template = $(JST['comments/show'](result));

        $('.js-comments-container').prepend($template);
        editor.setData('');
      }
    })
  });

});
