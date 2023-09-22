$(function(){
    /*
    判断一下当前是新增还是修改，如果修改的逻辑，不要在这里加载下拉列表
    */
    if($("#objId").val() == ""){ // 如果是新增
        createFaculty();
    }
})


// 加载院系下拉列表
var createFaculty = function(){
    createSelect({
        url: "/faculty/all", // 请求url
        requestParams: {}, // 请求参数
        optionValue: "id", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的value
        optionText: "facultyName", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的文本值
        selectId: "facultyId" // 下拉列表的id，把组装的option放到哪个下拉列表中
    });

    // ajax提交后台
//    $.ajax({
//        type : "post",
//        url : "/faculty/all",
//        data : {},
//        dataType : "json",
//        success : function(data) {
//            // 组装下拉列表
//            //console.log(data);
//            var options = '<option value="">--请选择--</option>';
//            $.each(data, function(index, faculty){
//                options += '<option value="' + faculty.id + '">' + faculty.facultyName + '</option>';
//            });
//            $("#facultyId").html(options);
//        }
//    });
}

// 加载专业下拉列表
var createMajor = function(){
    createSelect({
        url: "/major/getByFacultyId", // 请求url
        requestParams: {
            facultyId: $("#facultyId").val()
        }, // 请求参数
        optionValue: "id", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的value
        optionText: "majorName", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的文本值
        selectId: "majorId" // 下拉列表的id，把组装的option放到哪个下拉列表中
    });

    //var facultyId = $("#facultyId").val(); // 院系下拉列表当前的选中值

    // 根据院系id去查询专业
//    $.ajax({
//        type : "post",
//        url : "/major/getByFacultyId",
//        data : {
//            facultyId: $("#facultyId").val()
//        },
//        dataType : "json",
//        success : function(data) {
//            // 组装下拉列表
//            //console.log(data);
//            var options = '<option value="">--请选择--</option>';
//            $.each(data, function(index, major){
//                options += '<option value="' + major.id + '">' + major.majorName + '</option>';
//            });
//            $("#majorId").html(options);
//        }
//    });
}


/*
 提交表单，新增和修改页共用
*/
var subForm = function(){
    addOrUpdate({
        paramsIds: ["facultyId","majorId","className"], // 页面输入项的id的数组
        objId: "objId", // 新增修改页隐藏域的id属性的值
        objName: "班级", // 操作的模块名
        firstUrl: "class", // ajax的url的一级路径，他的二级路径已经封装了（add、update）
        otherParams: {} // 页面的额外参数
    });
}