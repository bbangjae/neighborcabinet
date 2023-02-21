/**
 * header.js
 */
 
$(document).ready(function(){
	
	var sidebar = $('#header_sidebar');
	var sidebar_background = $('#outside_sidebar');
	
	$('#user_button').on('click', function(){
        if(sidebar.css('right') != '0px') {
        	sidebar.animate({right:0}, 50);
        	sidebar_background.css('z-index', '2500');
        	sidebar_background.css('background-color', 'rgba(0,0,0,0.5)');
        	sidebar_background.css('box-shadow', 'rgba(0,0,0,0.5) 0 0 0 9999px;');
        }
    });
    $('#sidebar_closeBtn').on('click', function(){
    	if(sidebar.css('right') == '0px') {
    		sidebar.animate({right:-410}, 50);
    		sidebar_background.css('z-index', '-1');
    		sidebar_background.css('background-color', 'transparent');
    	}
    });
    $(document).mouseup(function (e){
		if(sidebar.has(e.target).length==0) {
			sidebar.animate({right:-410}, 50);
			sidebar_background.css('z-index', '-1');
    		sidebar_background.css('background-color', 'transparent');
		}
	});
	
	$('#header_searchInput').on('keydown', function(e){

		var keyCode = e.which;


		if (keyCode === 13) { // Enter Key
			e.preventDefault();
			let url=($(location).attr('pathname'));
			let searchInput=$('#header_searchInput').val();
			$.ajax({
				type:"post",
				url:"/map/Search",
				data:{"searchInput":searchInput},
				success:function(result) {
					console.log(url.indexOf('map'));
					if (url.indexOf('map')===-1){
						location.href = "/map/SearchForm/" + result;
						if(result===0)
							location.href = "/map/SearchForm2/" + searchInput;
				}
					else {
						if (!(result === 0))
							searchTitleToCoordinate(result);
						else
							searchAddressToCoordinate(searchInput);
					}
				}
			})
		}
	});

	$('#header_searchBtn').on('click', function(e) {
		e.preventDefault();
		let url=($(location).attr('pathname'));
		let searchInput=$('#header_searchInput').val();
		$.ajax({
			type:"post",
			url:"/map/Search",
			data:{"searchInput":searchInput},
			success:function(result) {
				if (url.indexOf('map')===-1){
					location.href = "/map/SearchForm/" + result;
					if(result===0)
						location.href = "/map/SearchForm2/" + searchInput;
				}
				else {
					if (!(result === 0))
						searchTitleToCoordinate(result);
					else
						searchAddressToCoordinate(searchInput);
				}
			}
		})
	});

});

