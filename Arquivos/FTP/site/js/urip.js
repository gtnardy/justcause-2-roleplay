$(document).ready(function(){
	/* =========================
	   ScrollReveal
	   (on scroll fade animations)
	============================*/
	var revealConfig = { vFactor: 0.20 }
	window.sr = new scrollReveal(revealConfig);


	/* =========================
	   Detect Mobile Device
	============================*/
	var isMobile = {
	    Android: function() {
	        return navigator.userAgent.match(/Android/i);
	    },
	    BlackBerry: function() {
	        return navigator.userAgent.match(/BlackBerry/i);
	    },
	    iOS: function() {
	        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
	    },
	    Opera: function() {
	        return navigator.userAgent.match(/Opera Mini/i);
	    },
	    Windows: function() {
	        return navigator.userAgent.match(/IEMobile/i);
	    },
	    any: function() {
	        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
	    }
	};


	/* ===========================
	   jQuery One Page Navigation
	==============================*/
	$('#main-nav').onePageNav({
	    filter: ':not(.external)'
	});


	/* ===============
	   Dropdown Menu
	==================*/
	$('ul.main-nav > li:has(ul)').addClass("dropdown");

    function dequeue(){
	$(this).dequeue();
	};

	$('ul.main-nav > li > a').click(function() {

		var checkElement = $(this).next();

		$('ul.main-nav li').removeClass('active');
		$(this).closest('li').addClass('active');

		if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
			$(this).closest('li').removeClass('active');
			checkElement.slideUp(200, dequeue);
		}

		if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
			$('ul.main-nav ul:visible').slideUp('normal');
			checkElement.slideDown(200, dequeue);
		}

		if (checkElement.is('ul')) {
			return false;
		} else {
			return true;
		}
	});


	/* ===========================
	   Custom Smooth Scroll For an Anchor
	==============================*/
	$(function() {
	  $('a.scroll-to[href*=#]:not([href=#])').click(function() {
	    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
	      var target = $(this.hash);
	      target = target.length ? target : $('[id=' + this.hash.slice(1) +']');
	      if (target.length) {
	        $('html,body').animate({
	          scrollTop: target.offset().top - 50
	        }, 1000);
	        return false;
	      }
	    }
	  });
	});

	/* ===========================
	   Scroll to Top Button
	==============================*/
	$(window).scroll(function() {
        if($(this).scrollTop() > 100){
            $('#to-top').stop().animate({
                bottom: '30px'
                }, 750);
        }
        else{
            $('#to-top').stop().animate({
               bottom: '-100px'
            }, 750);
        }
    });

    $('#to-top').click(function() {
        $('html, body').stop().animate({
           scrollTop: 0
        }, 750, function() {
           $('#to-top').stop().animate({
               bottom: '-100px'
           }, 750);
        });
    });


	/* ===========================
	   Headhesive JS
	   (sticky header on scroll)
	==============================*/

	// Set headhesive options
    var options = {
        classes: {
            clone:   'header-clone',
            stick:   'header-stick',
            unstick: 'header-unstick'
        }
    };
	var headhesive = new Headhesive('.the-header', options);

	// Remove class of the clone header
	// so we can distinguish between the original and the clone header.
	$('.header-clone').removeClass('the-origin-header');


	/* ==========================
	   Progress Bar Animation
	=============================*/
	var skillbar = $('#skillbar').waypoint({
		handler: function() {
			$('.progress-bar').each(function(){
				$(this).animate({
					width:$(this).attr('data-percent')
				},500)
			})
		},
		offset: '150%'
	});


	/* =================================
	   Swipebox JS
	   (Lightbox for Video & Portfolio)
	====================================*/

	// Swipebox Video
	$( '.swipebox-video' ).swipebox();

	// Swipebox Gallery
	$( '.swipebox' ).swipebox();


	/* =================================
	   CounterUp JS
	====================================*/
    $('.counter').counterUp({
	    delay: 10,
	    time: 1000
	});

	/* =================================
	   AjaxChimp JS
	   (Integrate subscribe form w/ Mailchimp)
	====================================*/
	$('.the-subscribe-form').ajaxChimp({
		callback: mailchimpCallback,
	    url: 'http://worksofwisnu.us6.list-manage.com/subscribe/post?u=b57b4e6ae38c92ac22d92a234&amp;id=17754c49aa'
	    // Replace the URL above with your mailchimp URL (put your URL inside '').
	});

	// callback function when the form submitted, show the notification box
	function mailchimpCallback(resp) {
        if (resp.result === 'success') {
            $('#subscribe-success-notification').addClass('show-up');
        }
        else if (resp.result === 'error') {
             $('#subscribe-error-notification').addClass('show-up');
        }
    }


	/* =================================
	   Add Custom Class to Open Toggle Panel
	====================================*/
	$('.panel-heading a').click(function() {

		var clickElement = $(this);

		if (clickElement.parents('.panel-heading').is('.panel-active')) {
			$('.panel-heading').removeClass('panel-active');
		} else {
			$('.panel-heading').removeClass('panel-active');
			clickElement.parents('.panel-heading').addClass('panel-active');
		}
	});


	/* ==================================
	   Quicksand JS
	   (Filter team photo and portfolio)
	=====================================*/

	// Filter team photo
	var $teamClone = $("#team_grid").clone();

	$(".filter a").click(function(e){
		$(".filter li").removeClass("current");

		var $filterClass = $(this).parent().attr("class");

		if ($filterClass == "all") {
			var $filteredTeam = $teamClone.find("li");
		} else {
			var $filteredTeam = $teamClone.find("li[data-type~="+$filterClass+"]");
		}

		$("#team_grid").quicksand( $filteredTeam, {
			easing: "easeOutSine",
			adjustHeight: "dynamic",
			duration: 500,
			useScaling: true
		});

		$(this).parent().addClass("current");

		e.preventDefault();
	})

	// Filter Portfolio Gallery
	var $portfolioClone = $("#portfolio_grid").clone();

	$(".portfolio-filter a").click(function(e){
		$(".portfolio-filter li").removeClass("current");

		var $filterClass = $(this).parent().attr("class");

		if ($filterClass == "all") {
			var $filteredPortfolio = $portfolioClone.find("li");
		} else {
			var $filteredPortfolio = $portfolioClone.find("li[data-type~="+$filterClass+"]");
		}

		$("#portfolio_grid").quicksand( $filteredPortfolio, {
			easing: "easeOutSine",
			adjustHeight: "dynamic",
			duration: 500,
			useScaling: true
		});

		$(this).parent().addClass("current");

		e.preventDefault();
	})

	// Mobile Select Filter
	$("#mobile-team-filter").click(function(){
		$(this).toggleClass("select-active");
		$("ul.filter").toggleClass("filter-active");
	});

	$("#mobile-portfolio-filter").click(function(){
		$(this).toggleClass("select-active");
		$("ul.portfolio-filter").toggleClass("filter-active");
	});


	/* ==============================
	   Change Footer Background
	   (when Social Icons hovered)
	=================================*/
	if(!isMobile.any()){
		$(".footer-social .icon-facebook-with-circle").hover(function(){$("#main-footer").toggleClass("footer-facebook-hovered")});
		$(".footer-social .icon-twitter-with-circle").hover(function(){$("#main-footer").toggleClass("footer-twitter-hovered")});
		$(".footer-social .icon-linkedin-with-circle").hover(function(){$("#main-footer").toggleClass("footer-linkedin-hovered")});
		$(".footer-social .icon-instagram-with-circle").hover(function(){$("#main-footer").toggleClass("footer-instagram-hovered")});
		$(".footer-social .icon-google-with-circle").hover(function(){$("#main-footer").toggleClass("footer-google-hovered")});
		$(".footer-social .icon-youtube-with-circle").hover(function(){$("#main-footer").toggleClass("footer-youtube-hovered")});
		$(".footer-social .icon-dribbble-with-circle").hover(function(){$("#main-footer").toggleClass("footer-dribbble-hovered")});
		$(".footer-social .icon-pinterest-with-circle").hover(function(){$("#main-footer").toggleClass("footer-pinterest-hovered")});
		$(".footer-social .icon-vimeo-with-circle").hover(function(){$("#main-footer").toggleClass("footer-vimeo-hovered")});
		$(".footer-social .icon-steam2").hover(function(){$("#main-footer").toggleClass("footer-steam-hovered")});
	}

});



