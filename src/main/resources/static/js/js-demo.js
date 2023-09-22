/*
函数
*/
var func0 = function(){
    //弹出提示框
    alert("第一个函数");
    // 在浏览器控制台打印
    console.log("第一个函数");
}

function func1(){
    alert("第二个函数");
}

/*
变量，
var 变量名 = 变量值
全局变量，能够被所有js看到
局部变量，在一组大括号内部使用的
*/
var m = 0;

var func2 = function(){
    m += 1;
    alert(m);
}

var func3 = function(){
    var n = 1; // 局部变量
}

/*
判断，循环遍历
*/
var func4 = function(){
//    if(){
//
//    }else{
//
//    }
    // 循环遍历，使用jQuery的
    var arr = [1,3,5,8]; // js中只有数组的概念，使用中括号

    /*
    $.each(参数1，参数2)
    参数1，被遍历的集合
    参数2，匿名函数，function(index, v){}
        匿名函数中，有2个参数，（当前遍历次数元素的索引下标，当前遍历次数的元素）
    */
    $.each(arr, function(index, v){
        // 当前遍历次数的逻辑
        console.log("索引下标：" + index + ", 值：" + v);
    });
}

/*
如果要是需要像java的map集合或者java对象的属性名属性值，或者是Python的字典，这种(k -> v)键值对结构
在js中使用json对象来表示
json数据格式，基本所有语言都支持
*/
var func5 = function(){
    // json对象是用一组大括号括起来
    var student = {
        "name": "张三",
        "age": 14,
        "father": {
            "name": "张大三",
            "age": 40,
            "father": {
                "name": "张老汉"
            }
        },
        "brother": ["张二","张四"],
        "brotherInfo": [
            {"name": "张二", "age": 15},
            {"name": "张四", "age": 13}
        ]
    };

    console.log(student.name);
    console.log(student["name"]);
    console.log(student.father.name);
    console.log(student.father.father.name);

    console.log(student.brother[0]);
    console.log(student.brotherInfo[1].age);

    // 给json对象动态添加新的键值对，或者修改键对应的值
    student["address"] = "新华大街111号"; // 添加新的kv对
    console.log(student.address);

    student.name = "zhangsan"; // 修改键对应的值
    console.log(student.name);

    student["age"] = 11; // 修改键对应的值
    console.log(student.age);

    // 遍历json
    $.each(student, function(k, v){
        console.log("键：" + k + ", 值：" + v);
    });
}

var func6 = function(){

    // $("#t-0")，获取id属性值为t-0的标签对象

    /*
    html标签大概分成2种类别
    1、表单标签，input系列（文本框，密码框，单选钮，复选框...），下拉列表
    2、普通标签，div，span，p，table....
    */

    // 表单标签的值的操作，都是.val()，获取值.val()，设置值.val(xxx)
//    var v0 = $("#t-0").val(); // 获取输入的值
//    alert(v0);
//    $("#t-0").val("你好"); // 设置值

//    alert($("#s-0").val()); // 下拉列表获取选中选项的值
//    $("#s-0").val(1); // 设置下拉列表中选项值是1的选项为选中

    // 普通标签
//    alert($("#d-0").text()); // 获取文本值
//    $("#d-0").text("你好你好"); // 设置文本值

//    alert($("#d-1").html()); // 获取标签的的所有html内容，包括内部的标签
//    $("#d-1").html("<h2>你好您</h2>"); // 设置html内容

    // $(".c-0")，根据标签的class属性获取对象，可能是一个数组
//    alert($(".c-0").length);

    // 对于标签对象数组的遍历
//    $(".c-0").each(function(index){
//        // $(this)，当前遍历次数的元素对象
//        var t = $(this).text();
//        console.log("第" + index + "个元素对象的文本值是" + t);
//    });

    // $("div"),根据标签获取对象，可能是一个数组
//    alert($("div").length);

    // 根据标签某些属性(可以是自定义属性)的值来获取标签对象
//    $("input[type='text']").each(function(){
//        console.log($(this).val()); // 表单元素用val()
//    });

//    $("div[aaa='yy']").each(function(){
//        console.log($(this).text()); // 普通元素用text()
//    });

    // 获取标签的直系子元素指定的标签对象，可能是一个数组
//    alert($("#d-2 > div").length);
    //alert($("#d-2 > span").length);

    // 获取标签的所有后代子元素指定的标签对象，可能是一个数组
//    alert($("#d-2 div").length);

    /*
    #d-3 > div，得到id为d-3的元素所有直系的div子元素
    "#d-3 > div:eq(1)，得到id为d-3的元素所有直系的div子元素的数组中的索引值为1的div子元素
    */
//     alert($("#d-3 > div:eq(1)").text());

    // 获取标签对象的父标签对象
//    $("#span-0").parent();
//    alert($("#span-0").parent().html())

    // 可以使用标签对象.find方法来获取内部的子标签对象
//    alert($("#span-0").parent().find("div").length);

    // .attr，获取/设置标签对象属性（属性可以是自定义的）的值
//    alert($("#d-4").attr("class"));  // 获取属性值
//    $("#d-4").attr("class", "kkkk"); // 设置属性的值
//    alert($("#d-4").attr("abc"));
    $("#d-4").attr("bbb", "9999");

}


var func7 = function(){
    alert($("#s-0").val());
}


