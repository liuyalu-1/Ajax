<%@ page  pageEncoding="UTF-8" contentType="text/html;UTF-8" isELIgnored="false"    %>
<html>
<head>
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script>
    $(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/AllUser",//访问后台的url地址
            type:"GET",
            dataType:"json",
            success:function (data) {
                for(var i=0;i<data.length;i++){
                    //创建tr标签
                    var tr=$("<tr>");
                    //创建第一个单元格
                    var id=$("<td>"+data[i].id+"</td>");
                    //创建第二个单元格
                    var username=$("<td>"+data[i].username+"</td>");
                    var password=$("<td>"+data[i].password+"</td>");
                   var age= $("<td>"+data[i].age+"</td>");
                    tr.append(id);
                    tr.append(username);
                    tr.append(password);
                    tr.append(age);
                    $("#table").append(tr);
                }
            }
        });
    })
</script>
</head>
<body>
<table id="table" cellspacing="0px" cellpadding="0px" width="80%" border="1px" align="center">
    <tr bgcolor="green">

        <th >用户ID</th>
        <th>用户名</th>
        <th>密码</th>
        <th>年龄</th>
    </tr>
</table>

</body>

</html>