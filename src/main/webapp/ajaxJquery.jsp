<%@ page  pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false"  %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //给input标签添加丢失焦点事件
            $("#input").blur(function () {
                //获取用户输入的用户名
                var username=$("input").val();
                 //alert(username);
                //Ajax步骤
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/queryAllUser",//访问后台的url
                    type:"POST",//指定异步请求方式
                    data:"username="+username,//发送给后台的数据
                    dataType:"text",//指定后台响应的数据格式
                    success:function(data){//()里的形参随便写
                        $("#span").empty();//清空标签内部
                        $("#span").append(data); //监听响应,
                        //append(子对象)，添加成父对象的最后一个儿子对象
                    }
                });
            });
        })
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/queryAllUser" method="post">
    用户名 <input id="input" name="user.username" type="text"  /> <span id="span"></span> <br/>
    密码 <input name="user.password" type="password" /> <br/>
    年龄 <input name="user.age" type="text" /> <br/>
    <input type="submit" value="提交"/>
</form>



</body>


</html>