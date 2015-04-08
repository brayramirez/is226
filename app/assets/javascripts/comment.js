$(document).ready(function(){

  $('.js-submit-comment').on('click', function(e){
    e.preventDefault();

    var $form = $('.js-comment-form'),
        $contentField = $('.js-comment-content'),
        url = $form.prop('action'),
        data = $form.serialize();

    if ($contentField.val().length === 0) {
      console.log('empty!!');
      return;
    }

    // TODO: check errors
    $.ajax({
      url: url,
      data: data,
      dataType: 'json',
      type: 'POST',
      success: function(result){
        console.log('Result!');
        console.log(result);

        var $template = $(JST['comments/show'](result));

        $('.js-comments-container').prepend($template);
        $contentField.val('');
      }
    })
  });

});