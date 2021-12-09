/* JS Document */

/******************************

[Table of Contents]

1. Vars and Inits
2. Set Header
3. Init Menu
4. Init Main Slider
5. Init Double Arrow
6. Init Search Form
7. Init Hamburger
8. Init Vertical Slider
9. Init Services Slider
10. Init Parallax
11. Init Scrolling


******************************/

$(document).ready(function()
{
	"use strict";

	/* 

	1. Vars and Inits

	*/

	var searchActive = false;
	var menuActive = false;
	var header = $('.header');
	var ctrl = new ScrollMagic.Controller();

	setHeader();

	$(window).on('resize', function()
	{
		setHeader();
	});

	$(document).on('scroll', function()
	{
		setHeader();
	});

	initMainSlider();
	initDoubleArrow();
	initSearchForm();
	initHamburger();
	initVSlider();
	initServicesSlider();
	initParallax();
	initScrolling();

	/* 

	2. Set Header

	*/

	function setHeader()
	{
		if(window.innerWidth < 992)
		{
			if($(window).scrollTop() > 100)
			{
				header.addClass('scrolled');
			}
			else
			{
				header.removeClass('scrolled');
			}
		}
		else
		{
			if($(window).scrollTop() > 100)
			{
				header.addClass('scrolled');
			}
			else
			{
				header.removeClass('scrolled');
			}
		}
		if(window.innerWidth > 991 && menuActive)
		{
			closeMenu();
		}
	}

	/* 

	4. Init Main Slider

	*/

	function initMainSlider()
	{
		if($('.hero_slider').length)
		{
			var heroSlider = $('.hero_slider');
			heroSlider.owlCarousel(
			{
				items: 1,
				loop: true,
				autoplay:false,
				animateOut: 'slideOutDown',
				animateIn: 'flipInX',
				dots:false,
				nav:false,
				autoplayTimeout:5000,
				autoplaySpeed:800,
				smartSpeed:800
			});

			if($('.hero_slider_prev').length)
			{
				var prev = $('.hero_slider_prev');

				prev.on('click', function()
				{
					heroSlider.trigger('prev.owl.carousel');
				});
			}

			if($('.hero_slider_next').length)
			{
				var prev = $('.hero_slider_next');

				prev.on('click', function()
				{
					heroSlider.trigger('next.owl.carousel');
				});
			}
		}
	}

	function initDoubleArrow()
	{
		if($('.double_arrow').length)
		{
			$('.double_arrow').on('click', function()
			{

			});
		}
	}

	function initSearchForm()
	{
		if($('.search_form').length)
		{
			var searchForm = $('.search_form');
			var searchInput = $('.search_input');
			var searchButton = $('.search_button');

			searchButton.on('click', function(event)
			{
				event.stopPropagation();

				if(!searchActive)
				{
					searchForm.addClass('active');
					searchActive = true;
					searchInput.focus();

					$(document).one('click', function closeForm(e)
					{
						if($(e.target).hasClass('search_input'))
						{
							$(document).one('click', closeForm);
						}
						else
						{
							searchForm.removeClass('active');
							searchActive = false;
						}
					});
				}
				else
				{
					searchForm.removeClass('active');
					searchActive = false;
				}
			});	
		}
	}

	/* 

	7. Init Hamburger

	*/

	function initHamburger()
	{
		if($('.hamburger_container').length)
		{
			var hamb = $('.hamburger_container');

			hamb.on('click', function(event)
			{
				event.stopPropagation();

				if(!menuActive)
				{
					openMenu();
					
					$(document).one('click', function cls(e)
					{
						if($(e.target).hasClass('menu_mm'))
						{
							$(document).one('click', cls);
						}
						else
						{
							closeMenu();
						}
					});
				}
				else
				{
					$('.menu_container').removeClass('active');
					menuActive = false;
				}
			});
		}
	}

	function openMenu()
	{
		$('.menu_container').addClass('active');
		menuActive = true;
	}

	function closeMenu()
	{
		$('.menu_container').removeClass('active');
		menuActive = false;
	}

	/* 

	8. Init Vertical Slider

	*/

	function initVSlider()
	{
		if($('.v_slider').length)
		{
			var vSlider = $('.v_slider');

			vSlider.slick(
			{
				infinite: false,
				vertical: true,
				arrows: false,
				draggable: false,
				dots: true,
				responsive:
				[
					{
						breakpoint: 575,
						settings: 
						{
							draggable: true,
							vertical: false,
							dots: false
						}
					}
				]
			});
		}
	}

	/* 

	9. Init Services Slider

	*/

	function initServicesSlider()
	{
		if($('.services_slider').length)
		{
			var servicesSlider = $('.services_slider');

			servicesSlider.owlCarousel(
			{
				loop: true,
				center: true,
				margin: 67,
				stagePadding: 153,
				mouseDrag: true,
				dots: true,
				dotsSpeed: 600,
				responsive:
				{
					0:
					{
						items:1,
						margin: 15,
						center: false,
						stagePadding: 15,
						dots: false
					},
					575:
					{
						items:3,
						center: true,
						stagePadding: 350
					},
					1440:
					{
						items:4,
						margin: 67,
						stagePadding: 153,
						dots: true,
					}
				}
			});

			// Handle Left Nav Arrow
			if($('.services_slider_nav_left').length)
			{
				$('.services_slider_nav_left').on('click', function()
				{
					servicesSlider.trigger('prev.owl.carousel');
				});
			}

			// Handle Right Nav Arrow
			if($('.services_slider_nav_right').length)
			{
				$('.services_slider_nav_right').on('click', function()
				{
					servicesSlider.trigger('next.owl.carousel');
				});
			}
		}
	}

	/* 

	10. Init Parallax

	*/

	function initParallax()
	{
		// Add parallax effect to home slider
		if($('.slider_prlx').length)
		{
			var homeBcg = $('.slider_prlx');

			var homeBcgScene = new ScrollMagic.Scene({
		        triggerElement: homeBcg,
		        triggerHook: 1,
		        duration: "100%"
		    })
		    .setTween(TweenMax.to(homeBcg, 1, {y: '15%', ease:Power0.easeNone}))
		    .addTo(ctrl);
		}

		// Add parallax effect to every element with class prlx
		// Add class prlx_parent to the parent of the element
		if($('.prlx_parent').length && $('.prlx').length)
		{
			var elements = $('.prlx_parent');

			elements.each(function()
			{
				var ele = this;
				var bcg = $(ele).find('.prlx');

				var slideParallaxScene = new ScrollMagic.Scene({
			        triggerElement: ele,
			        triggerHook: 1,
			        duration: "200%"
			    })
			    .setTween(TweenMax.from(bcg, 1, {y: '-30%', ease:Power0.easeNone}))
			    .addTo(ctrl);
			});
		}
	}

	/*

	11. Init Scrolling

	*/

	function initScrolling()
    {
    	if($('.nav_links').length)
    	{
    		
			/* Clicking on any element with class .nav_links scrolls down to the element set in the data-scroll-to value */
			
    		var links = $('.nav_links');
	    	links.each(function()
	    	{
	    		var ele = $(this);
	    		var target = ele.data('scroll-to');
	    		ele.on('click', function(e)
	    		{
	    			e.preventDefault();
	    			$(window).scrollTo(target, 1500, {offset: -80, easing: 'easeInOutQuart'});
	    		});
	    	});
    	}	
    }
});