/*
根据选择不同的菜单级别下拉列表中的选项，动态的加载不同的选项到父菜单下拉列表
所谓的下拉列表的选项的选中，实际上就是下拉列表的选中的选项改变，怎么判断？就是给select标签加上一个onchange事件，负责监听选项的改变
给onchange事件关联一个函数，当选项改变时，就会触发这个函数
*/
var createParentMenus = function(parentId){
    var menuLevel = $("#menuLevel").val(); // 获取当前下拉列表被选中的选项的value值

    var option = "";

    if(menuLevel == "1"){ // 如果是一级菜单
        option += '<option value="0">默认父菜单</option>';
        $("#parentId").html(option); // 把选项通过js加载到下拉列表中
        return false; // 终止程序
    }

    if(menuLevel == "2"){ // 如果是二级菜单
        // 通过一个ajax，去后端读取数据库中所有的一级菜单数据
        $.ajax({
            type : "post",
            url : "/menu/firstMenus",
            data : {},
            dataType : "json",
            success : function(data) {
                console.log(data);
                // 遍历data，组装option
                option += '<option value="">--请选择--</option>';
                $.each(data, function(index, menu){
                    option += '<option value="' + menu.id + '">' + menu.menuName + '</option>';
                });
                $("#parentId").html(option); // 把选项通过js加载到下拉列表中

                // 判断parentId参数是否存在，如果要存在，根据parentId设置下拉列表的选中
                if(parentId){
                    $("#parentId").val(parentId);
                }
            }
        });


//        var tmp = [
//            {id: "1", menuName: "临时菜单1"},
//            {id: "2", menuName: "临时菜单2"},
//            {id: "3", menuName: "临时菜单3"}
//        ];
//
//        option += '<option value="">--请选择--</option>';
//        // 遍历tmp，组装option选项
//        $.each(tmp, function(index, menu){
////            var id = menu.id;
////            var menuName = menu.menuName;
////            option += '<option value="' + id + '">' + menuName + '</option>';
//            option += '<option value="' + menu.id + '">' + menu.menuName + '</option>';
//        });
//
//        $("#parentId").html(option); // 把选项通过js加载到下拉列表中
    }
}

/*
 提交表单，新增和修改页共用
*/
var subForm = function(){
    // 获取表单上的所有的输入项的值
//    var menuCode = $("#menuCode").val();
//    var menuName = $("#menuName").val();
//    var menuUrl = $("#menuUrl").val();
//    var menuLevel = $("#menuLevel").val();
//    var parentId = $("#parentId").val();
//    var sort = $("#sort").val();

    // json对象的key与实体类属性名对应，可以在后端视图实体类对象整体接收请求参数
    var params = {
        menuCode: $("#menuCode").val(),
        menuName: $("#menuName").val(),
        menuUrl: $("#menuUrl").val(),
        menuLevel: $("#menuLevel").val(),
        parentId: $("#parentId").val(),
        sort: $("#sort").val()
    };

    var objId = $("#objId").val();
    var myUrl = "add";
    var str = "新增菜单";

    console.log(objId != "");
    // 判断是新增页还是修改页，只要判断objId有没有值即可，有值就是修改页
    if(objId != ""){ // 有值，是修改页
        // 因为要根据id值update数据，所有给params增加一个id参数
        params["id"] = objId;
        myUrl = "update";
        str = "修改菜单";
    }


    // ajax提交后台
    $.ajax({
        type : "post",
        url : "/menu/" + myUrl,
        data : params,
        dataType : "json",
        success : function(data) {
            /*
            {
            code: "200"
            }
            */
//            var msg = "失败";
//            if(data.code == "200"){
//                msg = "成功";
//            }

            var msg = data.code == "200" ? "成功" : "失败";

            alert(str + msg);
        }
    });
}