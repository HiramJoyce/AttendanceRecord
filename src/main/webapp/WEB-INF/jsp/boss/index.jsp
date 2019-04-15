<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${month} 考勤统计</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/normalize.css">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/calender/css/index.css"/>
    <link rel="stylesheet" href="https://at.alicdn.com/t/font_234130_nem7eskcrkpdgqfr.css">
    <link href="${ctx}/resource/datepicker/css/foundation-datepicker.css" rel="stylesheet" type="text/css">
    <style>
    @page { margin: 0; }
    </style>
</head>

<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active">
                    <a href="${ctx}/boss/"><i class="menu-icon fa fa-calendar"></i>考勤信息</a>
                </li>
                <li>
                    <a href="${ctx}/boss/leaves"> <i class="menu-icon fa fa-clipboard"></i>休假申请</a>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
</aside>
<!-- /#left-panel -->
<!-- Right Panel -->
<div id="right-panel" class="right-panel">
    <!-- Header-->
    <header id="header" class="header">
        <div class="top-left">
            <div class="navbar-header">
                <a class="navbar-brand" href="./"><img src="${ctx}/resource/admin/images/logo.png" alt="Logo"></a>
                <a class="navbar-brand hidden" href="./"><img src="${ctx}/resource/admin/images/logo2.png"
                                                              alt="Logo"></a>
                <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
            </div>
        </div>
        <div class="top-right">
            <div class="header-menu">
                <div class="user-area dropdown float-right">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        <img class="user-avatar rounded-circle" src="${ctx}/resource/admin/images/admin.jpg"
                             alt="User Avatar">
                    </a>
                    <div class="user-menu dropdown-menu">
                        <a class="nav-link" href="${ctx}/logout"><i class="fa fa-power -off"></i>Logout</a>
                    </div>
                </div>

            </div>
        </div>
    </header>
    <!-- /#header -->
    <!-- Content -->
    <div class="content">
        <div class="animated fadeIn">
            <div class="clearfix"></div>
            <div class="orders">
                <div class="row">
                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title">考勤记录</h4>
                                <form action="${ctx}/boss/" method="post">
                                <div class="input-group" style="width: 200px;">
                                <input type="text" id="monthDate" value="${month}" autocomplete="off" name="time" placeholder="月份"
                                               class="form-control" style="width: 100px;">
                                <button type="submit" class="btn btn-primary btn-sm">查询</button>
                                <button type="button" class="btn btn-success btn-sm" onclick="doPrint()">打印</button>
                                </div>
                                </form>
                            </div>
                            <!--startprint-->
                            <div class="card-body--">
                                <p style="margin-left: 15px;">满勤员工</p>
                                <div class="table-stats order-table ov-h">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th class="serial">#</th>
                                            <th>姓名</th>
                                            <th>工号</th>
                                            <th>邮箱</th>
                                            <th>电话</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${fullEmployees}" var="employee" varStatus="statu">
                                            <tr>
                                                <td class="serial">${statu.index + 1}</td>
                                                <td>${employee.realName}</td>
                                                <td><span class="name">${employee.employeeNum}</span></td>
                                                <td><span class="product">${employee.email}</span></td>
                                                <td><span class="product">${employee.phone}</span></td>
                                                <td><span class="badge badge-complete">已发放奖励</span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <p style="margin-left: 15px;">未满勤员工</p>
                                <div class="table-stats order-table ov-h">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th class="serial">#</th>
                                            <th>姓名</th>
                                            <th>工号</th>
                                            <th>邮箱</th>
                                            <th>电话</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${notFullEmployees}" var="employee" varStatus="statu">
                                            <tr>
                                                <td class="serial">${statu.index + 1}</td>
                                                <td>${employee.realName}</td>
                                                <td><span class="name">${employee.employeeNum}</span></td>
                                                <td><span class="product">${employee.email}</span></td>
                                                <td><span class="product">${employee.phone}</span></td>
                                                <td><span class="badge badge-dark">无奖励</span></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--endprint-->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/resource/admin/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="${ctx}/resource/admin/assets/js/popper.min.js"></script>
<script src="${ctx}/resource/admin/assets/js/plugins.js"></script>
<script src="${ctx}/resource/admin/assets/js/main.js"></script>
<script src="${ctx}/resource/datepicker/js/foundation-datepicker.js"></script>
<script src="${ctx}/resource/datepicker/js/locales/foundation-datepicker.zh-CN.js"></script>
<script>
	function doPrint() {
		bdhtml=window.document.body.innerHTML; 
		sprnstr="<!--startprint-->"; //开始打印标识字符串有17个字符
		eprnstr="<!--endprint-->"; //结束打印标识字符串
		prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); //从开始打印标识之后的内容
		prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); //截取开始标识和结束标识之间的内容
		window.document.body.innerHTML=prnhtml; //把需要打印的指定内容赋给body.innerHTML
		window.print(); //调用浏览器的打印功能打印指定区域
		window.document.body.innerHTML=bdhtml;//重新给页面内容赋值；
	}
</script>
</body>
</html>
