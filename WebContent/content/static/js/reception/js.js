
/*  ---------------  TAB切换  --------------------------  */

function tabSlider(obj,objs,objsn){
	$(function(){
	$(obj + ':first').addClass(objs);
	$(objsn + ':first').css('display','block');
		autoroll();
		hookThumb();
	})
	 var i=-1;//第i+1个tab开始
		
	function autoroll(){
		nca = $(obj).length-1;
		i++;
		if(i > nca){
		i = 0;
		}
		slide(i);
	}
	
	function slide(i){
		$(obj).eq(i).addClass(objs).siblings().removeClass(objs);
		$(objsn).eq(i).css('display','block').siblings(objsn).css('display','none');
	}
	
	function hookThumb(){    
		$(obj).hover(
		function(){
				i = $(this).prevAll().length;
				slide(i); 
		},function(){
			this.blur();            
			return false;
		}); 
	}
}

function tabSliderCon(obj,objs,objsn){
	$(function(){
	$(obj + ':first').addClass(objs);
	$(objsn + ':first').css('display','block');
		autoroll();
		hookThumb();
	})
	 var i=-1;//第i+1个tab开始
		
	function autoroll(){
		nca = $(obj).length-1;
		i++;
		if(i > nca){
		i = 0;
		}
		slide(i);
	}
	
	function slide(i){
		$(obj).eq(i).addClass(objs).siblings().removeClass(objs);
		$(objsn).eq(i).css('display','block').siblings(objsn).css('display','none');
	}
	
	function hookThumb(){    
		$(obj).click(
		function(){
				i = $(this).prevAll().length;
				slide(i); 
		},function(){
			this.blur();            
			return false;
		}); 
	}
}


function tabSliderclock(obj,objs,objsn){
	$(function(){
		$(obj + ':first').addClass(objs);
		$(objsn + ':first').css('display','block');
		autoroll();
		hookThumb();
	})
	 var i=-1;
		
	function autoroll(){
		nca = $(obj).length-1;
		i++;
		if(i > nca){
		i = 0;
		}
		slide(i);
	}
	
	function slide(i){
		$(obj).eq(i).addClass(objs).siblings().removeClass(objs);
		$(objsn).eq(i).css('display','block').siblings(objsn).css('display','none');
	}
	
	function hookThumb(){    
		$(obj).live("click",function(){
				i = $(this).prevAll().length;
				slide(i); 
		},function(){
			this.blur();            
			return false;
		}); 
	}
}
//tab开始
$(document).ready(function(){
	tabSlider(".scrollUl li","sd01",".bor03 div");
	tabSliderclock(".side_tit a","side_titons",".zc_box");
	tabSliderclock(".side_tit a","side_titons",".zc_box");
	tabSliderclock(".acutil li","acutilclk",".acutul");
	tabSliderclock(".suptil li","suptlonc",".supall");
	tabSliderclock(".acutal li","acutallick",".acutar");
	tabSliderclock(".settil li","setonc",".setcan");
	tabSlider(".cont_gr3_sort a","cont_gr3_sort_on",".cont_gr3_all");
})


/* ---------------   付款方式  --------------------------  */
$(function(){ 								    
		var $category = $('.acutal ul li:gt(4)');     	    	
		$category.hide();							   
		var $toggleBtn = $('p.acutalbtn');             
		$toggleBtn.click(function(){
		      if($category.is(":visible")){
					$category.hide();                   		 
					$(this).text("所有付款方式");                  
			  }else{
					$category.show();                   		 
					$(this).text("所有付款方式"); 
			  }
			return false;					      	
		})
		
		$(".acutal li").click(function(){
			$(".acutal").css("height","");
			var acutonck = $(this).prevAll().length;
			var h1 =$(".acutal").outerHeight();
			var h2 = $(".acutar").eq(acutonck).outerHeight();
			if( h1 < h2 ){
				$(".acutal").height(h2);
				}
			})
		$(".acubclk").click(function(){
				$(".acual").toggle();
				$(".acuta").toggle();
			})
})


$(function(){
		var h1 =$(".acutal").outerHeight();
		var h2 = $(".acutarall").outerHeight();
		if( h1 < h2 ){
			$(".acutal").height(h2);
			}
	})
/* ---------------   shcabtlbtny--hover  --------------------------  */
		$(document).ready(function(){
			$(".shcabtlbtn").hover(function(){
				$(this).find(".shcabtca").css("display","block");
			},function(){
				$(this).find(".shcabtca").css("display","none");
			});
			$(".scligdata").hover(function(){
				$(this).find(".shcabtca").css("display","block");
			},function(){
				$(this).find(".shcabtca").css("display","none");
			});
			
		
		});
		

		
/* ---------------   保险信息弹出  --------------------------  */
		$(document).ready(function(){
			$(".shcachomcrock").click(function(){
				$(".shcks").css("display","block");
			});
			$(".shcrockno").click(function(){
				$(".shcks").css("display","none");
			});
			
		
		});
		
/* ---------------   搜索弹出  --------------------------  */
				$(function(){
                    $(".qbfl a").click(function(){              
                        $(".qbflsel").slideToggle()
                    });
                    $(".qbflsel a").click(function(){              
                        $(".qbflsel").slideUp()
                    });
                    $(".qbflsel>ul>li").hover(function(){              
                        $(this).addClass("qdflonc").siblings().removeClass("qdflonc");
                    },function(){              
                        $(this).removeClass("qdflonc");
                    });
                })
		
/* ---------------   客服中心点击收起显示  --------------------------  */
$(function(){
    $(".filelst").toggle(function(){              
	$(this).next("div").slideToggle("normal");
	$(this).find("span").text("+");
	},function(){              
	$(this).next("div").slideToggle("normal");
	$(this).find("span").text("-");
	});
	$(".flrtopr3 li").click(function(){
		var flstonck =	$(this).prevAll().length;
		$(".filerls").eq(flstonck).find(".filelst").next("div").slideDown("normal");
		$(".filerls").eq(flstonck).find(".filelst").find("span").text("-");
		});
	$(".flrtopr li").click(function(){
		var flstonck =	$(this).prevAll().length;
		$(".filerls").eq(flstonck).find(".filelst").next("div").slideDown("normal");
		$(".filerls").eq(flstonck).find(".filelst").find("span").text("-");
		});
})		



		
/* ---------------   客服中心点击收起显示  --------------------------  */

$(function(){ 								    //  等待DOM加载完毕.
		var $category = $('.flrtopr ul li:gt(7)');     	    //  获得索引值大于5的品牌集合对象(除最后一条)	
		$category.hide();							    //  隐藏上面获取到的jQuery对象。
		var $toggleBtn = $('.flrtoprt');             //  获取“显示全部品牌”按钮
		$toggleBtn.click(function(){
		      if($category.is(":visible")){
					$category.hide();                   		 //  隐藏$category
			  }else{
					$category.show();                   		 //  显示$category
			  }
			return false;					      	//超链接不跳转
		})
})
		
/* ---------------   客服中心点击收起显示  --------------------------  */

$(function(){
    $(".dlzc li").hover(function(){              
		$(this).find("div").slideToggle("normal");
		$(this).children("a").addClass("dlzcaon");
	},function(){              
		$(this).find("div").slideToggle("normal");
		$(this).children("a").removeClass("dlzcaon");	
	});
})	
		
/* ---------------   产品列表详细  --------------------------  */

           
		$(function(){
			$(".menu li").hover(function(){              
			$(this).find("div").addClass("menuhove");
			},function(){              
			$(this).find("div").removeClass("menuhove");
			});
			$(".sdmenu>div").click(function(){              
			$(this).find("div").slideToggle("normal").parent("div").removeClass("collapsed");               
			$(this).siblings().has("div").children("div").slideUp("normal").parent("div").addClass("collapsed");
			});
		})
			
			
			
			
			
/* ---------------   小图切换  --------------------------  */
			$(document).ready(function (){
						
	
						//小图片左右滚动
						$("div.arrow-btnright").click(function() {
							//小图片左右滚动
							var $slider = $(this).prev(".slider").find('ul');
							var $slider_child_l = $slider.find('li').length;
							var $slider_width = $slider.find('li').width() + 6;
							$slider.width($slider_child_l * $slider_width);
							var slider_count = $(this).siblings(".slidernumb").text();
							if ($slider_child_l < 6 || slider_count >= $slider_child_l - 6) {
								return false;
							}

							slider_count++;
							$(this).siblings(".slidernumb").text(slider_count);
							$slider.animate({left: '-=' + $slider_width + 'px'}, 'fast');
						});

						$("div.arrow-btnleft").click(function() {
							//小图片左右滚动
							var $slider = $(this).next(".slider").find('ul');
							var $slider_child_l = $slider.find('li').length;
							var $slider_width = $slider.find('li').width() + 6;
							$slider.width($slider_child_l * $slider_width);
							var slider_count = $(this).siblings(".slidernumb").text();

							if (slider_count <= 0) {
								return false;
							}
							slider_count--;
							$(this).siblings(".slidernumb").text(slider_count);
							$slider.animate({left: '+=' + $slider_width + 'px'}, 'fast');
						});
						
							$(".slider li").click(function(){
								$(this).addClass("current").siblings().removeClass("current");
								var onclkj = $(this).parents("h").siblings("a").find("img");
								$(onclkj).attr('src',$(this).find("img").attr("src"));
							});
						
					});
					
			$(document).ready(function (){
						
	
						//小图片左右滚动
						var $slider = $('.lb_picle ul');
						var $slider_child_l = $('.lb_picle ul li').length;
						var $slider_width = $('.lb_picle ul li').width() + 8;
						$slider.width($slider_child_l * $slider_width);
						
						var slider_count = 0;
						
						if ($slider_child_l < 5) {
							$('#btn-right').css({cursor: 'auto'});
							$('#btn-right').removeClass("dasabled");
						}
						
						$('#btn-right').click(function() {
							if ($slider_child_l < 5 || slider_count >= $slider_child_l - 5) {
								return false;
							}
							
							slider_count++;
							$slider.animate({left: '-=' + $slider_width + 'px'}, 'fast');
							slider_pic();
						});
						
						$('#btn-left').click(function() {
							if (slider_count <= 0) {
								return false;
							}
							slider_count--;
							$slider.animate({left: '+=' + $slider_width + 'px'}, 'fast');
							slider_pic();
						});
						
						function slider_pic() {
							if (slider_count >= $slider_child_l - 5) {
								$('#btn-right').css({cursor: 'auto'});
								$('#btn-right').addClass("dasabled");
							}
							else if (slider_count > 0 && slider_count <= $slider_child_l - 5) {
								$('#btn-left').css({cursor: 'pointer'});
								$('#btn-left').removeClass("dasabled");
								$('#btn-right').css({cursor: 'pointer'});
								$('#btn-right').removeClass("dasabled");
							}
							else if (slider_count <= 0) {
								$('#btn-left').css({cursor: 'auto'});
								$('#btn-left').addClass("dasabled");
							}
						}
						
					});
					
					
/* ---------------   幻灯片片切换   --------------------------  */


$(function (){
					
			var slid = $('.lb_pic2 li'),controls = $('.lb_piconcs2 li');
			slid.addClass('none');
			slid.eq(0).removeClass('none');
			controls.eq(0).addClass('lb_piconcson');
		
			var slideindex = 0;
			function switchi() {
				if(slideindex == slid.length - 1){
					slideindex = 0;
				}else {
					slideindex = slideindex + 1;
				}
				slid.addClass('none');
				slid.eq(slideindex).removeClass('none');
				controls.removeClass('lb_piconcson');
				controls.eq(slideindex).addClass('lb_piconcson');
			}
			
			var timer = setInterval(switchi, 3000);
		
			function options(indexs) {
				slid.addClass('none');
				slid.eq(indexs).removeClass('none');
				controls.removeClass('lb_piconcson');
				controls.eq(slideindex).addClass('lb_piconcson');
			}
		
			$('.lb_piconcs2 li').hover(function(){
				slideindex = $(this).index();
				clearInterval(timer);
				options(slideindex);
			},function(){
				timer = setInterval(switchi, 3000);
			});
			
		});
		
		
$(function (){
					
			var slid = $('.bannerpic li'),controls = $('.smallbox span');
			slid.addClass('none');
			slid.eq(0).removeClass('none');
		
			var slideindex = 0;
			function switchi() {
				if(slideindex == slid.length - 1){
					slideindex = 0;
				}else {
					slideindex = slideindex + 1;
				}
				slid.addClass('none');
				slid.eq(slideindex).removeClass('none');
			}
			
			var timer = setInterval(switchi, 3000);
		
			function options(indexs) {
				slid.addClass('none');
				slid.eq(indexs).removeClass('none');
			}
		
			$('.smallbox span').hover(function(){
				slideindex = $(this).index();
				clearInterval(timer);
				options(slideindex);
			},function(){
				timer = setInterval(switchi, 3000);
			});
			
		});
$(function (){
					
			var slid = $('.lb_pic1 li'),controls = $('.lb_piconcs1 li');
			slid.addClass('none');
			slid.eq(0).removeClass('none');
			controls.eq(0).addClass('lb_piconcson');
		
			var slideindex = 0;
			function switchi() {
				if(slideindex == slid.length - 1){
					slideindex = 0;
				}else {
					slideindex = slideindex + 1;
				}
				slid.addClass('none');
				slid.eq(slideindex).removeClass('none');
				controls.removeClass('lb_piconcson');
				controls.eq(slideindex).addClass('lb_piconcson');
			}
			
			var timer = setInterval(switchi, 3000);
		
			function options(indexs) {
				slid.addClass('none');
				slid.eq(indexs).removeClass('none');
				controls.removeClass('lb_piconcson');
				controls.eq(slideindex).addClass('lb_piconcson');
			}
		
			$('.lb_piconcs1 li').hover(function(){
				slideindex = $(this).index();
				clearInterval(timer);
				options(slideindex);
			},function(){
				timer = setInterval(switchi, 3000);
			});
			
		});
		
		

$(function (){
			
	var slid = $('ul.banner_grlistlogo li'),controls = $('.banner_grlistbt li');
	slid.addClass('none');
	slid.eq(0).removeClass('none');
	controls.eq(0).addClass('actives');

	var slideindex = 0;
	function switchi() {
		if(slideindex == slid.length - 1){
			slideindex = 0;
		}else {
			slideindex = slideindex + 1;
		}
		slid.addClass('none');
		slid.eq(slideindex).removeClass('none');
		controls.removeClass('actives');
		controls.eq(slideindex).addClass('actives');
	}
	
	var timer = setInterval(switchi, 3000);

	function options(indexs) {
		slid.addClass('none');
		slid.eq(indexs).removeClass('none');
		controls.removeClass('actives');
		controls.eq(indexs).addClass('actives');
	}

	$('a.options').click(function(){
		var drec = $(this).data('drec');
		if(drec == 'pre') {
			if(slideindex == 0) {
				slideindex = 2;
			}else {
				slideindex = slideindex - 1;
			}
		}else {
			if(slideindex == 2) {
				slideindex = 0;
			}else {
				slideindex = slideindex + 1;
			}
		}
		clearInterval(timer);
		options(slideindex);
		timer = setInterval(switchi, 3000);
	});

	$('.banner_grlistbt li').hover(function(){
		slideindex = $(this).index();
		clearInterval(timer);
		options(slideindex);
	},function(){
		timer = setInterval(switchi, 3000);
	});
	
})		
					
					
/* ---------------   右侧客户服务切换   --------------------------  */


$(function(){
    $(".fdan").hover(function(){              
		$(this).animate({right:'0'});
	},function(){                   
		$(this).animate({right:'-82px'});
	});
})	
					
/* ---------------   移动显示隐藏div信息   --------------------------  */


$(document).ready(function(){
				//Full Caption Sliding (Hidden to Visible)
				$('.right_cen_3 li').hover(function(){
					$(this).find('span').stop().animate({bottom:'0px'},{queue:false,duration:160});
				}, function() {
					$(this).find('span').stop().animate({bottom:"-"+$(this).find('span').innerHeight()},{queue:false,duration:160});
				});
				//Full Caption Sliding (Hidden to Visible)
				$('.pic_right_2>div').find('div').stop().animate({bottom:"-"+$(this).find('div').innerHeight()},{queue:false,duration:160});
				$('.pic_right_2>div').hover(function(){
					$(this).find('div').stop().animate({bottom:'0px'},{queue:false,duration:160});
				}, function() {
					$(this).find('div').stop().animate({bottom:"-"+$(this).find('div').innerHeight()},{queue:false,duration:160});
				});
			});
			
			
					
/* ---------------   列表点击显示更多   --------------------------  */


$(document).ready(function(){
				//Full Caption Sliding (Hidden to Visible)
				$('.nytjsxn .tjsr .gd').toggle(function(){
					$(this).parent("li").css("height","auto");
					$(this).addClass("gdgt");
				},function(){
					$(this).parent("li").css("height","37px");
					$(this).removeClass("gdgt");
				});
			});
					
/* ---------------   列表点击显示更多   --------------------------  */



$(document).ready(function(){
				//Full Caption Sliding (Hidden to Visible)
				$('.gr3_list_1 dl').hover(function(){
					$(this).find(".gr3bordino").css("display","block");
				},function(){
					$(this).find(".gr3bordino").css("display","none");
				});
			});



					
/* ---------------   其它图片颜色变暗   --------------------------  */


$(window).load(function(){
					
						
						$('.fltp li').hover(function(){
							$(this).find('img').css({ 'opacity' : 1});
							$(this).siblings('li').find('img').css({'opacity' : 0.5}) ;
						});
						$('.fltp').bind('mouseleave',function(){
							$(this).find('img').css('opacity', 1);
						});
						$('.fltpzs li,.fltpz3 li').hover(function(){
							$(this).parents(".fltpzs,.fltpz3").find('img').css({'opacity' : 0.5}) ;
							$(this).find('img').css({ 'opacity' : 1});
						});
						$('.fltpzs,.fltpz3').bind('mouseleave',function(){
							$(this).find('img').css('opacity', 1);
						});
						$('.ppjq li a').hover(function(){
							$(this).parents(".ppjq").find('img').css({'opacity' : 0.5}) ;
							$(this).find('img').css({ 'opacity' : 1});
						});
						$('.ppjq').bind('mouseleave',function(){
							$(this).find('img').css('opacity', 1);
						});
						$('.cont_cent_left1 a').hover(function(){
							$(this).parents(".cont_cent_left").find('img').css({'opacity' :  0.5}) ;
							$(this).find('img').css({ 'opacity' : 1});
						});
						$('.cont_cent_left1').bind('mouseleave',function(){
							$(this).find('img').css('opacity', 1);
						});
					
					});
					
/* ---------------   点击切换按钮效果   --------------------------  */

function oncks(oncs,oncne){
	$(oncs).click(function(){
		$(this).addClass(oncne).siblings().removeClass(oncne);
		});
	
}

//tab开始
$(document).ready(function(){ 
	oncks(".acutil li","acutilclk");
	oncks(".suptil li","suptlonc");
	oncks(".orderssel li","ordersselon");
})


					
/* ---------------   首页焦点图切换   --------------------------  */


$(function(){
				(function(){
					var curr = 0;
					$(".bannerli li").each(function(i){
						$(this).click(function(){
							curr = i;
							$(".banner>a").eq(i).fadeIn("slow").siblings("a").hide();
							$(this).siblings("li").removeClass("bannerlio").end().addClass("bannerlio");
							return false;
						});
					});
					
					var pg = function(flag){
						//flag:true表示前翻， false表示后翻
						if (flag) {
							if (curr == 0) {
								todo = 2;
							} else {
								todo = (curr - 1) % 3;
							}
						} else {
							todo = (curr + 1) % 3;
						}
						$(".bannerli li").eq(todo).click();
					};
					
					//前翻
					$("#prev").click(function(){
						pg(true);
						return false;
					});
					
					//后翻
					$("#next").click(function(){
						pg(false);
						return false;
					});
					
					//自动翻
					var timer = setInterval(function(){
						todo = (curr + 1) % 3;
						$(".bannerli li").eq(todo).click();
					},3000);
					
					//鼠标悬停在触发器上时停止自动翻
					$(".banner>a").hover(function(){
							clearInterval(timer);
						},
						function(){
							timer = setInterval(function(){
								todo = (curr + 1) % 3;
								$(".bannerli li").eq(todo).click();
							},3000);			
						}
					);
				})();
			});
			


					
/* ---------------   购物车点击隐藏点击显示   --------------------------  */
$(function(){
	$(".shcabrb>a").live("click",function(){
				$(".shcabrb").hide();
				$(".shcabr").hide();
				$(".shcabtl").hide();
				$(".shcabrp").hide();
				$(".shcabril").addClass("shcabrilon").removeClass("shcabril");
			});
	$(".shcabrilon").live("click",function(){
				$(".shcabrb").show();
				$(".shcabr").show();
				$(".shcabtl").show();
				$(".shcabrp").show();
				$(".shcabrilon").addClass("shcabril").removeClass("shcabrilon");
			});
	});
	

					
/* ---------------   头部   --------------------------  */	
var initTop = 50;
$(window).scroll(function(){
 var scrollTop = $(document).scrollTop();
 if(scrollTop >= initTop || scrollTop < 70){
  $(".menu").css({"position":"absolute",  "top":"12px"});
 } else {
  $(".menu").css({"position":"fixed",  "top":"71px"}); 
 };
 initTop = scrollTop;
 if(scrollTop > 70){$(".topnone").slideUp(200);}else{$(".topnone").slideDown(100);};
});
/*        ---- 尺码选择器 ----*/
$(function(){
	function sztase( res,ren){
		var $stastl = $("<div  class='stastl'></div>");
		var $stastr = $("<div  class='stastr'></div>");
		sztanull();
		$(".sztaszts .setatilx li" + ":lt(" + (ren+1) +")" + ":gt(" + (res-1) +")").addClass("setatilxon");
		$(".sztaszts .setatiln li" + ":lt(" + (ren+1) +")" + ":gt(" + (res-1) +")").addClass("setatilnon");
		$(".sztaszts .sztasztssel li" + ":lt(" + (ren+1) +")" + ":gt(" + (res-1) +")").addClass("sztasztsselon");
		var $paseltl = $(".sztaszts .sztasztssel li" + ":eq(" + res +")");
		var $paseltr = $(".sztaszts .sztasztssel li" + ":eq(" + ren +")");
		$paseltl.append($stastl);
		$paseltr.append($stastr);
	}
	function sztanull(){
		$(".sztaszts .sztasztssel li>div").remove();
		$(".sztaszts .setatilx li").removeClass("setatilxon");
		$(".sztaszts .setatiln li").removeClass("setatilnon");
		$(".sztaszts .sztasztssel li").removeClass("sztasztsselon");
	}
	$(".sztasize li").click(function(){
			$(this).addClass("sztasizeonc").siblings().removeClass("sztasizeonc");
			var sztasn =	parseInt($(this).find(".sztasizenumno .sztnumnof").text());
			var sztass =	parseInt($(this).find(".sztasizenumno .sztnumnol").text());
			if( !!sztasn && !!sztass){
				sztase(sztasn,sztass);
				}
				else{ sztanull();};
		});
	})

/*        ---- 头部导航切换 ----   */

	
function tabnavlister(obj,objs,objsn,objall){
				$(function(){
				$(obj + ':first-child').addClass(objs);
				$(objsn + ':first-child').css('display','block');
					hookThumbva();
				})
				
				function slideva(i,ts){
					$(ts).parent().children(obj).eq(i).addClass(objs).siblings().removeClass(objs);
					$(ts).parent().next().children(objsn).eq(i).css('display','block').siblings(objsn).css('display','none');
				}
				
				function hookThumbva(){    
					$(obj).hover(
					function(){
							i = $(this).prevAll().length;
							slideva(i,this); 
					},function(){
						this.blur();            
						return false;
					}); 
				}
			}
			$(document).ready(function(){
				tabnavlister(".nav_column_list p","navlionc",".nav_column_all",".nav-columnall");				
			})
            