var login = function(){
    // 获取输入的用户名和密码
    var username = $("#username").val();
    var password = $("#password").val();

    if(username == ""){
        alert("用户名不能为空！");
        return false; // 终止程序
    }

    if(password == ""){
        alert("密码不能为空！");
        return false; // 终止程序
    }

    console.log("步骤1");
    /*
    把用户名密码提交到后端，这里使用ajax
    ajax默认是异步请求，在前端这边ajax就是发起向后端的请求，然后这个ajax的代码就算过去了，会继续往后走其他代码
    ajax里面的success是后端逻辑处理完之后由后端反向调用，这个异步的点就在success，这个success相对其他的js逻辑的异步
    */
    $.ajax({
    	type : "post", // http请求方法，get和post
    	url : "/user/login", // 后端的url
    	data : {
    	    "username": username,
    	    "password": password
    	}, // 请求参数，json对象，如果后端是使用实体类对象来整体接收参数，要保证请求参数json中的key与实体类属性名对应
    	dataType : "json", // 指定需要后端返回json格式的字符串
    	success : function(data) { // success回调函数，后端处理完请求之后，后端会自主的调用success对应的函数，data是后端返回的具体的值
            console.log("回调success");
            console.log(data);
            // 根据返回值，判断后台登录校验成功还是失败
            if(data.code == "200"){
                // 跳转到index.html页面
                location.href = "index.html";
            }else{
                alert("登录失败！");
            }
    	}
    });

    console.log("步骤2");
}