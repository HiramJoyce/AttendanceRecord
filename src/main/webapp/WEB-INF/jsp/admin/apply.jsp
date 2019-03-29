<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/normalize.css">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/resource/admin/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resource/calender/css/index.css"/>
    <link rel="stylesheet" href="https://at.alicdn.com/t/font_234130_nem7eskcrkpdgqfr.css">
</head>

<body>
<!-- Left Panel -->
<aside id="left-panel" class="left-panel">
    <nav class="navbar navbar-expand-sm navbar-default">
        <div id="main-menu" class="main-menu collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${ctx}/employee/"><i class="menu-icon fa fa-calendar"></i>考勤信息</a>
                </li>
                <li class="active">
                    <a href="${ctx}/leave/apply"> <i class="menu-icon fa fa-clipboard"></i>休假申请</a>
                </li>
                <li>
                    <a href="${ctx}/employee/profile"> <i class="menu-icon fa fa-user-md"></i>个人信息</a>
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
        <!-- Animated -->
        <div class="animated fadeIn">
            <div class="clearfix"></div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <form action="${ctx}/leave/apply" method="post">
                            <div class="card-header">
                                <strong>休假</strong> 申请
                            </div>
                            <div class="card-body card-block">
                                <input type="hidden" name="realName" value="${sessionScope.realName}">
                                <input type="hidden" name="employeeNum" value="${sessionScope.employeeNum}">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label class=" form-control-label">员工姓名</label></div>
                                    <div class="col-12 col-md-9">
                                        <p class="form-control-static">${sessionScope.realName}</p>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label class=" form-control-label">员工编号</label></div>
                                    <div class="col-12 col-md-9">
                                        <p class="form-control-static">${sessionScope.employeeNum}</p>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="select"
                                                                     class=" form-control-label">请假类型</label></div>
                                    <div class="col-12 col-md-9">
                                        <select name="type" id="select" class="form-control">
                                            <option value="1">病假</option>
                                            <option value="2">事假</option>
                                            <option value="3">年假</option>
                                            <option value="4">调休</option>
                                            <option value="5">婚丧假</option>
                                            <option value="6">产/护理假</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">原因说明</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <textarea name="reason" id="textarea-input"
                                                  rows="9" placeholder="Content..."
                                                  class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="startDate"
                                                                     class=" form-control-label">开始日</label></div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="startDate" name="startDate" placeholder="开始日"
                                               class="form-control">
                                        <small class="help-block form-text">格式：2019-01-01</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="endDate"
                                                                     class=" form-control-label">结束日</label></div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="endDate" name="endDate" placeholder="结束日"
                                               class="form-control">
                                        <small class="help-block form-text">格式：2019-01-01</small>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="dayCount"
                                                                     class=" form-control-label">请假天数</label></div>
                                    <div class="col-12 col-md-9">
                                        <input type="text" id="dayCount" name="dayCount" placeholder="请假天数"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o"></i> 提交
                                </button>
                                <button type="reset" class="btn btn-danger btn-sm">
                                    <i class="fa fa-ban"></i> 重置
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.orders -->
</div>

<script src="${ctx}/resource/admin/assets/js/vendor/jquery-2.1.4.min.js"></script>
<script src="${ctx}/resource/admin/assets/js/popper.min.js"></script>
<script src="${ctx}/resource/admin/assets/js/plugins.js"></script>
<script src="${ctx}/resource/admin/assets/js/main.js"></script>
</body>
</html>
