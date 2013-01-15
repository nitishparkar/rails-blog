// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {

	if($('.pagination').length) {
		$(window).scroll(function() {
			
		   var url = $('.pagination .next_page').attr('href');
		   if(url && $(window).scrollTop() + $(window).height() > $(document).height() - 10) {
		   	   //console.log('scroll');
		   	   $('.pagination').text('fetching more records..');
		       $.getScript(url);
		   }
		});
	}

	$('#created').click(function(){
		var sorting_direction = $(this).attr('class');
        
        if(sorting_direction === 'u') {
            $(this).html('v');
        } else {
            $(this).html('^');
        }
        $(this).toggleClass('u d');
        
        
        $bps = $('#blog-posts').children();

       	$bps.sort(function(a, b){
       		//console.log( Date.parse($(a).find('#created').text()) - Date.parse($(b).find('#created').text()) );
       		if(sorting_direction === 'u') {
        		return Date.parse($(a).find('#created').text()) - Date.parse($(b).find('#created').text());
        	} else {
        		return Date.parse($(b).find('#created').text()) - Date.parse($(a).find('#created').text());
        	}
        });

        $('#blog-posts').empty();
        $('#blog-posts').prepend($bps);
	});

	$('#modified').click(function(){
		var sorting_direction = $(this).attr('class');
        
        if(sorting_direction === 'u') {
            $(this).html('v');
        } else {
            $(this).html('^');
        }
        $(this).toggleClass('u d');
        
        
        $bps = $('#blog-posts').children();

       	$bps.sort(function(a, b){
       		//console.log( Date.parse($(a).find('#modified').text()) - Date.parse($(b).find('#modified').text()) );
       		if(sorting_direction === 'u') {
        		return Date.parse($(a).find('#modified').text()) - Date.parse($(b).find('#modified').text());
        	} else {
        		return Date.parse($(b).find('#modified').text()) - Date.parse($(a).find('#modified').text());
        	}
        });

        $('#blog-posts').empty();
        $('#blog-posts').prepend($bps);
	});

	filterFunction = function() {
		search_term = $.trim($('#global_search').val()).toLowerCase();
		user_filter = $.trim($('#user_search').val()).toLowerCase();
		
		$('.blog-post').each(function() {
			flag = true;
			
			if(user_filter.length) {
				if(($(this).find('#author').text().toLowerCase()).indexOf(user_filter) < 0) {
					flag = false;
				}
			}

			if(search_term.length) {
				//console.log($(this).find('.post-header h2').html().toLowerCase())
				if( (($(this).find('.post-header h2').text().toLowerCase()).indexOf(search_term) < 0)
					&& (($(this).find('.post-content').text().toLowerCase()).indexOf(search_term) < 0) ) {
					flag = false;
				}
			}


			if(flag) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	}


	$('#global_search, #user_search').keyup(function(evt) {
		filterFunction();
		//console.log('called');
	});
	
});