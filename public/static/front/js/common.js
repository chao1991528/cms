(function (doc, win) {
    var docEl = doc.documentElement,
            resizeEvt = 'orientationchange' in window ? 'orientationchange' : 'resize',
            recalc = function () {
                var clientWidth = docEl.clientWidth;
                if (!clientWidth)
                    return;
                if (clientWidth >= 640) {
                    docEl.style.fontSize = '100px';
                } else {
                    docEl.style.fontSize = 100 * (clientWidth / 640) + 'px';
                }
            };

    if (!doc.addEventListener)
        return;
    win.addEventListener(resizeEvt, recalc, false);
    doc.addEventListener('DOMContentLoaded', recalc, false);
})(document, window);

/*layer弹框*/
function layer(text) {
    $('#layer').remove();
    var layer = ('<div id="layer" class="layer"><div>' + text + '</div></div>');
    $('body').append(layer);
    var time = setInterval(function () {
        $('#layer').fadeOut();
        clearInterval(time);
    }, 1500);//1.5s后自动隐藏
}


