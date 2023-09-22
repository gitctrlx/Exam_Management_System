$(function () {
    createTable();
});

// 组装表单
var createTable = function(){
    createJSGridTable({
        url: "/role/list", // 后端controller的url
        searchId: "search", // 查询输入框的id
        pageIndex: 1, // 当前页数，是第几页，从1开始
        pageSize: 3, // 每页数据条数
        pageButtonCount: 10, // 展示最大可选页码数量
        fields: [ // 列表列的组装
            { name: "id", title: "id", type: "text", width: 20 },
            { name: "roleCode", title: "角色编码", type: "text", width: 80 },
            { name: "roleName", title: "角色名称", type: "text", width: 80 },
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

//    $("#jsGrid1").jsGrid({
//        height: "auto", // 这里不使用100%，如果不改加载数据之后，看不见
//        width: "100%",
//
//        sorting: true, // 排序
//        paging: true, // 分页计算，底部上一页下一页展示
//        pageLoading: true, //启动后台加载分页数据
//        autoload: true, //自动加载，页面加载上来需要显示第一页数据，需要去自动请求后台一次
//        controller: { // 请求后端的配置，主要是一个ajax，通过loadData加载数据
//            loadData: function(filter){
//            /*
//            filter，是有JSGrid自己组装的一个json对象
//            {
//                pageIndex: 1,
//                pageSize: 3,
//                search: xxxx
//            }
//            */
//            filter["search"] = $("#search").val(); // 获取表格页面的查询框的值，放到filter对象中
//                return $.ajax({
//                            type: "post",
//                            url: "/role/list",
//                            dataType: "json",
//                            data: filter
//                        });
//            }
//        },
//        pageIndex: 1, // 当前页数，是第几页，从1开始
//        pageSize: 3, // 每页数据条数
//        pageButtonCount: 10, // 展示最大可选页码数量
//        pagePrevText: "上一页",
//        pageNextText: "下一页",
//        pageFirstText: "首页",
//        pageLastText: "尾页",
//
//        //data: db.clients,
//
//        // 根据返回的数据json对象中的"data"属性组装表格
//        /*
//        这里当前组装的菜单menu的表格，json对象中的"data"属性的值List<Menu>，每行数据都是对于一个menu对象
//        fields中的{ name: "Name", type: "text", width: 150 }为例
//            1、name是当前这一列展示的是后端返回的数据中的那个属性的数据，name: "Name"展示的就是后端返回数据中的Name属性的值
//            2、type是当前展示是以什么形式展示，type: "text"就是以普通文本形式展示
//            3、width，当前这一列的宽度
//            4、itemTemplate，可以对当前的列进行自定义的格式化，本身值是一个匿名函数function(value, item){}
//                value，当前列原本应该对应的数据，看itemTemplate同级的name属性对应的值
//                item，当前这一行数据的json对象
//        */
//        fields: [
//            { name: "id", title: "id", type: "text", width: 20 },
//            { name: "roleCode", title: "角色编码", type: "text", width: 80 },
//            { name: "roleName", title: "角色名称", type: "text", width: 80 },
//            {
//                name: "id", title: "操作", type: "text", width: 80, align: "center",
//                itemTemplate: function(value, item){
//                    // 返回值就是你要填充当前这一列的内容
//                    return '<a href="javascript:void(0)" onclick="del(' + value + ')">删除</a>'
//                        + '&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="update(' + value + ')">修改</a>';
//                }
//            }
//        ]
//    });
}

// 删除
var del = function(id){
    delById({
        url: "/role/del", // 请求后端的url
        objName: "角色", // 删除模块的名称
        objId: id
    });
    // ajax删除
//    $.ajax({
//        type : "post",
//        url : "/role/del",
//        data : {"id": id},
//        dataType : "json",
//        success : function(data) {
//            // 这里的data就是后端返回的Message转换的json对象
//            var msg = data.code == "200" ? "成功" : "失败";
//
//            alert("删除角色" + msg);
//        }
//    });
}

// 修改
var update = function(id){
    /*
    1、点击修改按钮，把正文部分加载为新增页
    2、在传递的json对象参数中，加入func属性，用来回填要修改的数据到新增页
    */
    loadHtml({
        "url": "role-add.html",
        "domId": "content",
        "func": function(){
            // 使用ajax根据id查询要修改的那条数据，把数据回填到新增页
            $.ajax({
                type : "post",
                url : "/role/getRoleById",
                data : {"id": id},
                dataType : "json",
                success : function(data) {
                    // 这里回填数据
                    console.log(data);
                    var role = data.role; // 角色数据
                    var roleMenus = data.roleMenus; // 角色菜单关联数据的数组

                    $("#my-title").text("修改角色");
                    $("#objId").val(role.id);
                    $("#roleCode").val(role.roleCode);
                    $("#roleName").val(role.roleName);

                    /*
                    下面加载角色菜单的关联关系
                    1、加载菜单树，这个过程在你加载role-add.html的页面的时候就加载了

                    2、对菜单树的节点进行选中处理
                    */
                    createMenuTree(function(){
                        console.log(2);
                        // (1)获取菜单树的对象
                        var zTreeObj = $.fn.zTree.getZTreeObj("menuTree");

                        /*
                        (2)遍历roleMenus，根据roleMenus中每个roleMenu对象的菜单id获取zTreeObj中的菜单节点
                        zTreeObj菜单树中，节点node的id属性就是菜单id
                        */
                        $.each(roleMenus, function(index, roleMenu){
                            var menuId = roleMenu.menuId; // 得到当前要修改的角色关联的菜单id
                            /*
                            根据menuId从zTreeObj菜单树中拿到对应的节点
                            用的zTreeObj.getNodeByParam("id", menuId);
                            意思就是获取菜单树中节点node的id属性值是menuId值的节点
                            得到的节点就是当前要修改的角色关联的菜单树的节点，也就是应该被选中的节点
                            */
                            var node = zTreeObj.getNodeByParam("id", menuId);

                            /*
                            设置节点被选中
                            这里有问题，如果你设置一级节点选中，会自动选中一级节点下属的所有二级节点
                            这样会导致在回填数据的时候，可能会选中多余的二级节点

                            解决办法，只设置二级节点选中
                            */
                            if(node.parentId != 0){ // 判断是二级节点
                                zTreeObj.checkNode(node, true, true); // 设置节点选中
                            }
                        });
                    });
                }
            });
        }
    });
}