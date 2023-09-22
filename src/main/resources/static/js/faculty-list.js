$(function () {
    createTable();
});

// 组装表单
var createTable = function(){
    createJSGridTable({
        url: "/faculty/list", // 后端controller的url
        searchId: "search", // 查询输入框的id
        pageIndex: 1, // 当前页数，是第几页，从1开始
        pageSize: 3, // 每页数据条数
        pageButtonCount: 10, // 展示最大可选页码数量
        fields: [ // 列表列的组装
            { name: "id", title: "id", type: "text", width: 20 },
            { name: "facultyName", title: "院系名", type: "text", width: 80 },

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
    delById({
        url: "/faculty/del", // 请求后端的url
        objName: "院系", // 删除模块的名称
        objId: id
    });
}

// 修改
var update = function(id){
    /*
    1、点击修改按钮，把正文部分加载为新增页
    2、在传递的json对象参数中，加入func属性，用来回填要修改的数据到新增页
    */
    loadHtml({
        "url": "faculty-add.html",
        "domId": "content",
        "func": function(){
            // 使用ajax根据id查询要修改的那条数据，把数据回填到新增页
            $.ajax({
                type : "post",
                url : "/faculty/getFacultyById",
                data : {"id": id},
                dataType : "json",
                success : function(data) {
                    // 这里回填数据
                    console.log(data);
                    var faculty=data;

                    $("#my-title").text("院系修改");
                    $("#objId").val(faculty.id);
                    $("#facultyName").val(faculty.facultyName);




                }
            });
        }
    });
}
