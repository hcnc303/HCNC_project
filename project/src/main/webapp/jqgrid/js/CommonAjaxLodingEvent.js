		function wrapWindowByMask(){
			//화면의 높이와 너비를 구한다.
			var maskHeight = $(document).height();
			var maskWidth = $(window).width();

			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
			$('#mask').css({'width':maskWidth,'height':maskHeight});

			//애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
			//$('#mask').fadeIn(1000);
			$('#mask').fadeTo("slow", 0.1);
		}

		$(document).ready(function(){

			var loading = $('<img id="loadingImg" alt="loading" src="resources/ITAM/img/common/ajax-loader.gif" />').appendTo(document.body).hide();
			$(window).ajaxStart(function(){
				loading.show();
				wrapWindowByMask();

			}).ajaxStop(function(){
				loading.hide();
				$('#mask').hide();
			});

		});