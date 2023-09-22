$(function(){
    /*
    判断当前的页面是新增页还是修改页，
    如果是新增页，就在加载新增页的时候自动执行加载菜单树，也就是在$(function(){})中执行
    如果是修改页，在回填数据的时候执行执行加载菜单树
    */
    if($("#objId").val() == ""){ // 新增页
        createMenuTree();
    }
})


// 创建树形结构
var createMenuTree = function(func){
//    var zNodes = [
//        {id: 1, parentId: 0, name: "一级菜单-1"},
//        {id: 11, parentId: 1, name: "1-1"},
//        {id: 12, parentId: 1, name: "1-2"},
//        {id: 2, parentId: 0, name: "一级菜单-2"},
//        {id: 21, parentId: 2, name: "2-1"},
//        {id: 22, parentId: 2, name: "2-2"}
//    ];

    var zTreeObj;//zTree 对象
    // zTree 的参数配置
    var setting = {
        view: {
            selectedMulti: true, //设置是否能够同时选中多个节点
            showIcon: true, //设置是否显示节点图标
            showLine: true, //设置是否显示节点与节点之间的连线 showTitle: true, //设置是否显示节点的 title 提示信息
        },
        data: { // 要组装的数据的格式的定义
            simpleData: { // 组装树形结构的数据是简单数据格式，就是一个json的数组
                enable: true, //设置是否启用简单数据格式（zTree 支持标准数据格式跟简单数据格式）
                idKey: "id", //设置启用简单数据格式时 id 对应的属性名称
                pIdKey: "parentId",//设置启用简单数据格式时 parentId 对应的属性名称,ztree根据 id 及 pId 层级关系构建树结构
                rootPId: "0" // 设置一个顶级的根节点
            },
            key: { // 当要组装树的数据的json结构与当前设置的不相符的时候，可以通过这里设置映射关系
                name: "menuName" // 在ztree节点展示中，节点的name属性的值从数据中的menuName对应的值获取
            }
        },
        check:{
            enable: true //设置是否显示 checkbox 复选框
        }
    };

    // ajax查询所有的菜单
    $.ajax({
        type : "post",
        url : "/menu/all",
        data : {},
        dataType : "json",
        success : function(data) {
            console.log(data);
            zTreeObj = $.fn.zTree.init($("#menuTree"), setting, data); // 组装菜单树
            if(func){ // 判断func是否存在，如果存在，执行func函数
                func();
            }
        }
    });
}

// 获取ztree中被选中的节点
var getZTreeNodesChecked = function(){
    // 根据id获取ztree对象
    var zTreeObj = $.fn.zTree.getZTreeObj("menuTree"); // 没有#

    // 得到所有的被选中的节点
    var nodes = zTreeObj.getCheckedNodes(true);

    var ids = "";
    // 遍历nodes
    $.each(nodes, function(index, node){
        /*
        这个node实际上是一个json对象，菜单树中，每个节点都一个菜单
        我们在新增角色的时候，要给角色关联菜单，角色菜单关联表中的字段（角色id和菜单id）
        所以我们只需要拿到被选中的菜单node的id值
        */
        ids += "," + node.id;
    });

    /*
    遍历完成之后，得到的ids类似",1,2,3,4,5,6"
    可以看到，在字符串拼接过程中，最终是在开头多了一个逗号，需要去掉，做一个字符串截取
    */
    ids = ids.substring(1,ids.length); // 截取字符串，从第二个字符开始到最后
    return ids;
}

/*
 提交表单，新增和修改页共用
*/
var subForm = function(){
    addOrUpdate({
        paramsIds: ["roleCode","roleName"], // 页面输入项的id的数组
        objId: "objId", // 新增修改页隐藏域的id属性的值
        objName: "角色", // 操作的模块名
        firstUrl: "role", // ajax的url的一级路径
        otherParams: {ids: getZTreeNodesChecked()} // 页面的额外参数
    });
    // json对象的key与实体类属性名对应，可以在后端视图实体类对象整体接收请求参数
//    var params = {
//        roleCode: $("#roleCode").val(),
//        roleName: $("#roleName").val()
//    };

    /*
    封装组装params，把你需要从页面哪些输入项获取值的这些输入项的id给拿出来
    */
//    var paramsIds = ["roleCode","roleName"];
//    params = createParamsJson(paramsIds);
//    var params = createParamsJson(["roleCode","roleName"]);
//
//    // 被选中的菜单树的所有节点的id，放到params中
//    params["ids"] = getZTreeNodesChecked();
//
//    var objId = $("#objId").val();
//    var myUrl = "add";
//    var str = "新增角色";
//
//    console.log(objId != "");
//    // 判断是新增页还是修改页，只要判断objId有没有值即可，有值就是修改页
//    if(objId != ""){ // 有值，是修改页
//        // 因为要根据id值update数据，所有给params增加一个id参数
//        params["id"] = objId;
//        myUrl = "update";
//        str = "修改角色";
//    }
//
//    // ajax提交后台
//    $.ajax({
//        type : "post",
//        url : "/role/" + myUrl,
//        data : params,
//        dataType : "json",
//        success : function(data) {
//            var msg = data.code == "200" ? "成功" : "失败";
//            alert(str + msg);
//        }
//    });
}