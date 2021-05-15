import $ from 'jquery';

$(function() {
    $('.submenu').on(' click', function() {
        $(this).children().toggleClass('hidden');
         $(this).children().toggleClass('z-10');
    });
});

$(function() {
      $('.sub').on('click', function(){

        });
});

