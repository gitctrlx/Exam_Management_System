$(function(){
    /*
    判断一下当前是新增还是修改，如果修改的逻辑，不要在这里加载下拉列表
    */
    if($("#objId").val() == ""){ // 如果是新增
        addOrUpdate();

    }
})




/*
 提交表单，新增和修改页共用
*/
var subForm = function(){
    addOrUpdate({
        paramsIds: ["facultyName"], // 页面输入项的id的数组
        objId: "objId", // 新增修改页隐藏域的id属性的值
        objName: "院系", // 操作的模块名
        firstUrl: "faculty", // ajax的url的一级路径，他的二级路径已经封装了（add、update）
        otherParams: {} // 页面的额外参数
    });
}

