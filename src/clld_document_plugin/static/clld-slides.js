function nextSlide() {
    var target = $('.slide.active').next('.slide');
    if (target.length == 0) {
        target = $('.slide:first');
    }
    $('.slide.active').removeClass('active');
    target.addClass('active');
    $('html, body').scrollTop(target.offset().top - 40);
}

function previousSlide() {
    var target = $('.slide.active').prev('.slide');
    if (target.length == 0) {
        target = $('.slide:last');
    }
    $('.slide.active').removeClass('active');
    target.addClass('active');
    $('html, body').scrollTop(target.offset().top -40);
}


window.addEventListener("keydown", (e) => {
    if (e.key === "ArrowLeft") {
        previousSlide();
    } else if (e.key === "ArrowRight") {
        nextSlide();
    }
})

$(".next").click(function() {
    nextSlide();
});

$(".previous").click(function() {
    previousSlide();
});