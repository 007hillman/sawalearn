//this is all the javascript for the dashboard

import $ from 'jquery';

 $(function() {
      $('#unique_id').on('click', function(){
					let url = "/dash/user";
    $.ajax({
        url: url,
        success: function(data) {
            console.log('success')
        },
        error: function() {
            console.log('failure')
        }
    });
        });
});


