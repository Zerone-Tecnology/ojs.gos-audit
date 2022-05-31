$(".publication--item").click(function() { 
   
    //use a class, since your ID gets mangled

    // last version

    // if ($(this).hasClass('active')) {
    //     $(this).removeClass("active"); 
    // } else {
    //     $(".publication--item").removeClass('active');
    //     $(this).addClass("active");
    // }
         //add the class to the clicked element

        //  new version

        $(this).toggleClass("active");
});


$(document).on('click', 'a[href^="#"]', function (event) {
    event.preventDefault();

    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top
    }, 500);
});


// Tab

$('.x-nav li').on('click', function() {
    $('.x-tab-pane')
        .css('display', 'none')
        .filter('[data-cs-tab-index=' + $(this).children('a').attr('data-cs-tab-toggle') + ']')
        .css('display', 'flex');
});

$(".x-nav-tabs-item").click(function() {
    $(".x-nav-tabs-item").removeClass('active');
    $(this).toggleClass("active");
});


var language = document.getElementsByTagName("html")[0].getAttribute("lang");
if(language == 'uk-UA'){
    $('#search_month option[value="01"]').text('Қаңтар');
    $('#search_month option[value="02"]').text('Ақпан');
    $('#search_month option[value="03"]').text('Наурыз');
    $('#search_month option[value="04"]').text('Сәуір');
    $('#search_month option[value="05"]').text('Мамыр');
    $('#search_month option[value="06"]').text('Маусым');
    $('#search_month option[value="07"]').text('Шілде');
    $('#search_month option[value="08"]').text('Тамыз');
    $('#search_month option[value="09"]').text('Қыркүйек');
    $('#search_month option[value="10"]').text('Қазан');
    $('#search_month option[value="11"]').text('Қараша');
    $('#search_month option[value="12"]').text('Желтоқсан');
}