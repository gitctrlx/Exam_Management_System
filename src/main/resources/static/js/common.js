/*
动态加载分页面到基座页面的公共的函数
设置一个json类型参数
类似如下
{
"url": "footer.html",
"domId": "footer",
"func": function(){}
}
*/
var loadHtml = function(paramJson){
	$.ajax({
		type:"get",
		url:"./" + paramJson.url, //需要获取的页面内容
		async:true,
		success:function(data){ // data就是读取到的分页面的所有html代码内容
			$("#" + paramJson.domId).html(data) //将获取到的内容放到当前页面的指定的id的块中
			// 加载分页面到当前页面的指定的id的块中之后，要执行的自定义函数
			if(paramJson.func){ // 判断是否存在func的键值对
			    /*
			    这里注意：paramJson.func代表获取到func对应值，这里就是匿名函数function(){}对象
			    这样只是获取匿名函数对象，没有执行函数
			    执行函数需要在后面加上()，paramJson.func()才是执行paramJson.func对应的匿名函数
			    */
			    paramJson.func();
			}
		}
	});
}

/*
公共的根据页面输入项的id获取值，并且组装成一个json对象，返回json对象
参数是页面输入项的id的数组
*/
var createParamsJson = function(paramsIds){
    var params = {};
    $.each(paramsIds, function(index, paramsId){
        params[paramsId] = $("#" + paramsId).val();
    });
    return params;
}

/*
公共的新增修改提交函数
参数json对象
例如
{
    paramsIds: ["roleCode","roleName"], // 页面输入项的id的数组
    objId: "objId", // 新增修改页隐藏域的id属性的值
    objName: "角色", // 操作的模块名
    firstUrl: "role", // ajax的url的一级路径
    otherParams: {ids: getZTreeNodesChecked(), name: "张三"} // 页面的额外参数
}
*/
var addOrUpdate = function(paramsJson){
    //var params = createParamsJson(["roleCode","roleName"]);
    var params = createParamsJson(paramsJson.paramsIds); // 根据页面输入项的id的数组，组装请求json对象params

    //params["ids"] = getZTreeNodesChecked(); // 各个页面不同，可能存额外的请求参数
    $.each(paramsJson.otherParams, function(k, v){ // 如果有额外的参数，组装到请求json对象params中
        params[k] = v;
    });

    //var objId = $("#objId").val(); // 从页面的隐藏域中获取值，我们的新增和修改页的隐藏域就1个，专门用来放数据的主键id的值
    var objId = $("#" + paramsJson.objId).val();

    var myUrl = "add";
    var str = "新增";

    console.log(objId != "");
    // 判断是新增页还是修改页，只要判断objId有没有值即可，有值就是修改页
    if(objId != ""){ // 有值，是修改页
        // 因为要根据id值update数据，所有给params增加一个id参数
        params["id"] = objId;
        myUrl = "update";
        str = "修改";
    }

    str += paramsJson.objName; // 在新增或者修改字样之后拼接模块名称，例如新增角色、修改菜单

    // ajax提交后台
    $.ajax({
        type : "post",
        url : "/" + paramsJson.firstUrl + "/" + myUrl,
        data : params,
        dataType : "json",
        success : function(data) {
            var msg = data.code == "200" ? "成功" : "失败";
            alert(str + msg);
        }
    });
}

/*
公共组装JSGrid表格
参数json对象
例如
{
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
}
*/
var createJSGridTable = function(paramsJson){
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
            filter["search"] = $("#" + paramsJson.searchId).val(); // 获取表格页面的查询框的值，放到filter对象中
                return $.ajax({
                            type: "post",
                            url: paramsJson.url, // 后端controller的url
                            dataType: "json",
                            data: filter
                        });
            }
        },
        pageIndex: paramsJson.pageIndex, // 当前页数，是第几页，从1开始
        pageSize: paramsJson.pageSize, // 每页数据条数
        pageButtonCount: paramsJson.pageButtonCount, // 展示最大可选页码数量
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
        fields: paramsJson.fields
    });
}

/*
公共根据id删除数据
参数是json对象
例如
{
    url: "/role/del", // 请求后端的url
    objName: "角色", // 删除模块的名称
    objId: id
}
*/
var delById = function(paramsJson){
    // ajax删除
    $.ajax({
        type : "post",
        url : paramsJson.url,
        data : {"id": paramsJson.objId},
        dataType : "json",
        success : function(data) {
            // 这里的data就是后端返回的Message转换的json对象
            var msg = data.code == "200" ? "成功" : "失败";

            alert("删除" + paramsJson.objName + msg);
        }
    });
}

/*
公共组装下拉列表，数据来源是ajax去后端获取
参数json对象
例如
{
    url: "/major/getByFacultyId", // 请求url
    requestParams: {}, // 请求参数
    optionValue: "id", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的value
    optionText: "majorName", // 遍历后端返回的json数组时，取数组中json对象的哪个属性对应的值作为选项option的文本值
    selectId: "majorId", // 下拉列表的id，把组装的option放到哪个下拉列表中
    func: function(){} // 在组装完成下拉列表之后的其他操作，自定义函数，选填
}
*/
var createSelect = function(paramsJson){
    $.ajax({
        type : "post",
        url : paramsJson.url,
        data : paramsJson.requestParams,
        dataType : "json",
        success : function(data) {
            // 组装下拉列表
            //console.log(data);
            var options = '<option value="">--请选择--</option>';
            $.each(data, function(index, obj){
                //options += '<option value="' + obj.id + '">' + obj.majorName + '</option>';
                options += '<option value="' + obj[paramsJson.optionValue] + '">' + obj[paramsJson.optionText] + '</option>';
            });
            $("#" + paramsJson.selectId).html(options);

            if(paramsJson.func){ // 判断func是否存在
                // 如果存在执行func函数
                paramsJson.func();
            }
        }
    });
}
