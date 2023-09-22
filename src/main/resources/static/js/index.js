// 此函数可以在页面加载这个js文件时自动执行
$(function(){
    // 加载脚部
    loadHtml({
        "url": "footer.html",
        "domId": "footer"
    });

    // 加载头部
    loadHtml({
        "url": "header.html",
        "domId": "header"
    });

    // 加载左侧菜单
    loadHtml({
        "url": "left-menu.html",
        "domId": "left-menu"
    });

    // 加载欢迎页到右侧正文部分
    loadHtml({
        "url": "welcome.html",
        "domId": "content"
    });
})

/*
加载指定的页面到index.html的正文部分
*/
var loadHtml2content = function(url){
    loadHtml({
        "url": url,
        "domId": "content"
    });
}