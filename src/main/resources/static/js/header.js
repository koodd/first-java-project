$(function(){
    tabMenu();
});
$('ol.webMenu>li').on('mouseenter',function(){
    $('ol.webMenu li ul').stop().slideUp();
    $(this).find('ul').stop().slideDown(500);
});

$('ol.webMenu>li').on('mouseleave',function(){
    $(this).find('ul').stop().slideUp(900);
});