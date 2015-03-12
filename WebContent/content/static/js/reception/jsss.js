

$(document).ready(function(){
	autoroll();
	hookThumb();
})
var i=-1; //第i+1个tab开始
function autoroll(){
	n = $('.app_qh .qh_1').length-1;
	i++;
	if(i > n){
	i = 0;
	}
	slide(i);
	
}

function slide(i){
	$('.qh_1').fadeOut(200);
	$('.qh_1').eq(i).fadeIn(500);
}

function hookThumb(){    
	$('.qhleft').click(
	function(){
			i--;
			n = $('.app_qh .qh_1').length-1;
			if(i < 0){
			i = n;
			}
			slide(i);
	});  
	$('.qhright').click(
	function(){
			i++;
			n = $('.app_qh .qh_1').length-1;
			if(i > n){
			i = 0;
			}
			slide(i); 
	}); 
}