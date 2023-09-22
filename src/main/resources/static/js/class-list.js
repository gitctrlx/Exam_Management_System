$(function () {
    createTable();
});

// 组装表单
var createTable = function(){
    createJSGridTable({
        url: "/class/list", // 后端controller的url
        searchId: "search", // 查询输入框的id
        pageIndex: 1, // 当前页数，是第几页，从1开始
        pageSize: 3, // 每页数据条数
        pageButtonCount: 10, // 展示最大可选页码数量
        fields: [ // 列表列的组装
            { name: "id", title: "id", type: "text", width: 20 },
            { name: "facultyId", title: "院系号", type: "text", width: 80 },
            { name: "majorId", title: "专业号", type: "text", width: 80 },
            { name: "className", title: "班级名", type: "text", width: 80 },

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
        url: "/class/del", // 请求后端的url
        objName: "用户", // 删除模块的名称
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
        "url": "class-add.html",
        "domId": "content",
        "func": function(){
            // 使用ajax根据id查询要修改的那条数据，把数据回填到新增页
            $.ajax({
                type : "post",
                url : "/class/getClassById",
                data : {"id": id},
                dataType : "json",
                success : function(data) {
                    // 这里回填数据
                    //console.log(data);


                    $("#my-title").text("修改班级");
                    $("#objId").val(data.id);

                    $("#className").val(data.className);

                    /*
                    用户修改页下拉列表数据的回填选中
                    1、所有的下拉列表的加载都在这里完成，之前用户新增的时候会自动加载的下拉列表部分不要再加载
                    2、分别加载下拉列表，设置选中
                    */

                    // 加载院系下拉列表，设置选中
                    createSelect({
                        url: "/faculty/all", // 请求url
                        requestParams: {}, // 请求参数
                        optionValue: "id", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的value
                        optionText: "facultyName", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的文本值
                        selectId: "facultyId", // 下拉列表的id，把组装的option放到哪个下拉列表中
                        func: function(){
                            $("#facultyId").val(data.facultyId);
                        }
                    });

                    // 加载专业下拉列表，设置选中
                    createSelect({
                        url: "/major/getByFacultyId", // 请求url
                        requestParams: {
                            facultyId: user.facultyId // 院系id从从查询的user对象中获取
                        }, // 请求参数
                        optionValue: "id", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的value
                        optionText: "majorName", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的文本值
                        selectId: "majorId", // 下拉列表的id，把组装的option放到哪个下拉列表中
                        func: function(){
                            $("#majorId").val(data.majorId);
                        }
                    });


                }
            });
        }
    });
}
