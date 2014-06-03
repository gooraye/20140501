/*Seekr微信原生底部弹出层控制*/
$(function () {
    $(".lolist").bind("click", function () {
        if ($(".list_detail").is(":hidden")) {
            $(".foot_screen").show();
            $(".list_tbtip").fadeIn(100);
            $(".list_detail").fadeIn(100);
        } else {
            $(".foot_screen").hide();
            $(".list_tbtip").fadeOut(100);
            $(".list_detail").fadeOut(100);
        }
        var liHNew = $(".list_detail .ulShow");
        var liH = $($(liHNew).find("li")[0]).css("width").replace("px", "");
        var topH = liH - 55;
        $($(liHNew).find("li")).css("height", liH + "px");
        $($(liHNew).find("li a span")).css("margin-top", topH / 2 + "px");
    });
    $(".foot_screen").bind("click", function () {
        $(".foot_screen").hide();
        $(".list_tbtip").fadeOut(100);
        $(".list_detail").fadeOut(100);
    })
});
document.addEventListener('WeixinJSBridgeReady', function onBridgeReady() {
WeixinJSBridge.call('hideToolbar');
});