<%@ page  pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false"  %>
<html>
<head>
    <script type="text/javascript">
        function checkusername() {
            //获取用户名
            var  input=document.getElementById("input");
            var username=input.value;
            //通过Ajax把用户名传入后台
            //创建异步请求对象  xhr
            if (window.ActiveXObject){
                xhr=new ActiveXObject("Microsoft.XMLHTTP");  //IE系
            } else {
                xhr=new  XMLHttpRequest(); //非IE系
            }
            //打开异步请求
            xhr.open("GET","${pageContext.request.contextPath}/user/queryAllUser?username="+username);
            //发送异步请求
            xhr.send();
            //监听响应
            xhr.onreadystatechange=function () {
                //响应正确完成
                if (xhr.readyState==4&&xhr.status==200){
                    var  messages=  xhr.responseText;
                    var  span=document.getElementById("span");
                    span.innerHTML=messages;
                }
            }
        }
    </script>
</head>
<body>
<form action="${pageContext.request.contextPath}/user/queryAllUser" method="post">
    用户名 <input id="input" name="user.username" type="text" onblur="checkusername()" /> <span id="span"></span> <br/>
    密码 <input name="user.password" type="password" /> <br/>
    年龄 <input name="user.age" type="text" /> <br/>
    <input type="submit" value="提交"/>
</form>



</body>


</html>