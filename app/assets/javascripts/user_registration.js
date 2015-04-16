$(document).ready(function(){

  var initializeForm = function($selector){
    var $buyerType = $('.js-buyer-type'),
        $bidderCategory = $('.js-bidder-category'),
        accountType = $selector.val();

    if (accountType == 'buyer'){
      $buyerType.removeClass('hidden');
      $bidderCategory.addClass('hidden');
    }
    else {
      $buyerType.addClass('hidden');
      $bidderCategory.removeClass('hidden');
    }
  }


  initializeForm($('.js-account-type:checked'));


  $('.js-account-type').on('click', function(e){
    var $buyerType = $('.js-buyer-type'),
        $bidderCategory = $('.js-bidder-category')

    initializeForm($(this));
  });


  $('.js-chosen-select').chosen({
    allow_single_deselect : true,
    no_results_text : 'No results matched.',
    width : '100%'
  });

});
