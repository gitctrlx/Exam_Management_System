$(function () {
    createTable();
});

// 组装表单
var createTable = function(){
    $("#jsGrid1").jsGrid({
        height: "auto", // 这里不使用100%，如果不改加载数据之后，看不见
        width: "100%",

        sorting: true, // 排序
        paging: true, // 分页计算，底部上一页下一页展示
        pageLoading: true, //启动后台加载分页数据
        autoload: true, //自动加载，页面加载上来需要显示第一页数据，需要去自动请求后台一次
        controller: { // 请求后端的配置，主要是一个ajax，通过loadData加载数据
            loadData: function(filter){
            /*
            filter，是有JSGrid自己组装的一个json对象
            {
                pageIndex: 1,
                pageSize: 3,
                search: xxxx
            }
            */
            filter["search"] = $("#search").val(); // 获取表格页面的查询框的值，放到filter对象中
                return $.ajax({
                            type: "post",
                            url: "/menu/list",
                            dataType: "json",
                            data: filter
                        });
            }
        },
        pageIndex: 1, // 当前页数，是第几页，从1开始
        pageSize: 3, // 每页数据条数
        pageButtonCount: 10, // 展示最大可选页码数量
        pagePrevText: "上一页",
        pageNextText: "下一页",
        pageFirstText: "首页",
        pageLastText: "尾页",

        //data: db.clients,

        // 根据返回的数据json对象中的"data"属性组装表格
        /*
        这里当前组装的菜单menu的表格，json对象中的"data"属性的值List<Menu>，每行数据都是对于一个menu对象
        fields中的{ name: "Name", type: "text", width: 150 }为例
            1、name是当前这一列展示的是后端返回的数据中的那个属性的数据，name: "Name"展示的就是后端返回数据中的Name属性的值
            2、type是当前展示是以什么形式展示，type: "text"就是以普通文本形式展示
            3、width，当前这一列的宽度
            4、itemTemplate，可以对当前的列进行自定义的格式化，本身值是一个匿名函数function(value, item){}
                value，当前列原本应该对应的数据，看itemTemplate同级的name属性对应的值
                item，当前这一行数据的json对象
        */
        fields: [
            { name: "id", title: "id", type: "text", width: 20 },
            { name: "menuCode", title: "菜单编码", type: "text", width: 80 },
            { name: "menuName", title: "菜单名称", type: "text", width: 80 },
            { name: "menuUrl", title: "菜单url", type: "text", width: 100 },
            { name: "menuLevel", title: "菜单级别", type: "text", width: 40 },
            { name: "parentMenuName", title: "父菜单", type: "text", width: 80 },
            { name: "sort", title: "排序", type: "text", width: 40 },
            {
                name: "id", title: "操作", type: "text", width: 80, align: "center",
                itemTemplate: function(value, item){
                    // 返回值就是你要填充当前这一列的内容
                    return '<a href="javascript:void(0)" onclick="del(' + value + ')">删除</a>'
                        + '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="update(' + value + ')">修改</a>';
                }
            }
        ]
    });
}

// 删除
var del = function(id){
    // ajax删除
    $.ajax({
        type : "post",
        url : "/menu/del",
        data : {"id": id},
        dataType : "json",
        success : function(data) {
            // 这里的data就是后端返回的Message转换的json对象
            var msg = data.code == "200" ? "成功" : "失败";

            alert("删除菜单" + msg);
        }
    });
}

// 修改
var update = function(id){
    /*
    1、点击修改按钮，把正文部分加载为新增页
    2、在传递的json对象参数中，加入func属性，用来回填要修改的数据到新增页
    */
    loadHtml({
        "url": "menu-add.html",
        "domId": "content",
        "func": function(){
            // 使用ajax根据id查询要修改的那条数据，把数据回填到新增页
            $.ajax({
                type : "post",
                url : "/menu/getMenuById",
                data : {"id": id},
                dataType : "json",
                success : function(data) {
                    // 这里回填数据
                    console.log(data);
                    $("#my-title").text("修改菜单");
                    $("#objId").val(data.id);
                    $("#menuCode").val(data.menuCode);
                    $("#menuName").val(data.menuName);
                    $("#menuUrl").val(data.menuUrl);
                    $("#menuLevel").val(data.menuLevel);
                    $("#sort").val(data.sort);

                    /*
                    父菜单的问题
                    1、根据你现在的菜单级别加载父菜单
                    2、加载完父菜单要设置菜单的选中

                    根据common.js中loadHtml函数的源码，我们发现
                        执行的自定义函数func是在$("#" + paramJson.domId).html(data)之后执行
                        $("#" + paramJson.domId).html(data)用来加载分页面

                    在我们当前update中调用loadHtml函数时候，加载menu-add.html到正文部分
                    加载menu-add.html，包括其引用的js文件，其中就有menu-add.js
                    当前的这个ajax就是要执行的匿名函数func

                    我们就可以得出一个结论，在匿名函数func（也就是当前的ajax）中是可以调用menu-add.js的函数的

                    我们根据这个结论，就可以得出可以在当前这个ajax位置，调用menu-add.js的createParentMenus函数
                    createParentMenus函数是用来根据菜单级别加载父菜单下拉列表的
                    */

                    //createParentMenus(); // 根据你现在的菜单级别加载父菜单

                    /*
                    在调用了createParentMenus()函数之后，可以看到，能够根据你现在的菜单级别加载父菜单
                    但是还有一个小问题，在回填是二级菜单时，加载的父菜单是所有的一级菜单，但是没有设置一级菜单的选中
                    解决办法：
                        只需要对createParentMenus函数改造一下，加一个普通参数即可（父菜单id）
                    */

                    createParentMenus(data.parentId); // 根据你现在的菜单级别加载父菜单，加载完父菜单要设置菜单的选中


                }
            });
        }
    });
}