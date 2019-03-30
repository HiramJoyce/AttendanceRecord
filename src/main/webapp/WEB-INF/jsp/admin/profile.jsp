<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <li>
                    <a href="${ctx}/leave/apply"> <i class="menu-icon fa fa-clipboard"></i>休假申请</a>
                </li>
                <li class="active">
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
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">个人信息</strong>
                        </div>
                        <div class="card-body">
                            <div id="pay-invoice">
                                <div class="card-body" style="width: 500px; margin: auto; float: none;">
                                    <div class="card-title">
                                        <h3 class="text-center">${employee.realName}</h3>
                                    </div>
                                    <hr>
                                    <form action="${ctx}/employee/register" method="post" novalidate="novalidate">
                                        <input type="hidden" name="id" value="${employee.id}">
                                        <input type="hidden" name="employeeNum" value="${employee.employeeNum}">
                                        <input type="hidden" name="realName" value="${employee.realName}">
                                        <div class="form-group has-success">
                                            <label for="cc-name" class="control-label mb-1">员工姓名</label>
                                            <input id="cc-name" name="cc-name" type="text" value="${employee.realName}"
                                                   class="form-control cc-name valid" data-val="true" disabled
                                                   data-val-required=""
                                                   autocomplete="cc-name" aria-required="true" aria-invalid="false"
                                                   aria-describedby="cc-name">
                                            <span class="help-block field-validation-valid" data-valmsg-for="cc-name"
                                                  data-valmsg-replace="true"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="cc-number" class="control-label mb-1">员工编号</label>
                                            <input id="cc-number" name="cc-number" type="tel" disabled class="form-control cc-number identified visa" value="${employee.employeeNum}" data-val="true">
                                            <span class="help-block" data-valmsg-for="cc-number"
                                                  data-valmsg-replace="true"></span>
                                        </div>
                                        <div class="row form-group">
                                            <div class="col col-md-3"><label class=" form-control-label">性别</label></div>
                                            <div class="col col-md-9">
                                                <div class="form-check-inline form-check">
                                                    <label for="inline-radio1" class="form-check-label">
                                                        <input type="radio" id="inline-radio1" name="gender" value="1" ${employee.gender == 1 ? "checked" : ""} class="form-check-input">男
                                                    </label>
                                                    <label for="inline-radio2" class="form-check-label">
                                                        <input type="radio" id="inline-radio2" name="gender" value="2" ${employee.gender == 2 ? "checked" : ""} class="form-check-input">女
                                                    </label>
                                                    <label for="inline-radio3" class="form-check-label">
                                                        <input type="radio" id="inline-radio3" name="gender" value="3" ${employee.gender == 3 ? "checked" : ""} class="form-check-input">保密
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cc-email" class="control-label mb-1">员工邮箱</label>
                                            <input id="cc-email" name="email" type="email" class="form-control" value="${employee.email}" data-val="true">
                                            <span class="help-block" data-valmsg-for="cc-number"
                                                  data-valmsg-replace="true"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="cc-phone" class="control-label mb-1">联系电话</label>
                                            <input id="cc-phone" name="phone" type="tel" class="form-control" value="${employee.phone}" data-val="true">
                                            <span class="help-block" data-valmsg-for="cc-number"
                                                  data-valmsg-replace="true"></span>
                                        </div>
                                        <div class="form-group">
                                            <label for="cc-password" class="control-label mb-1">登录密码</label>
                                            <input id="cc-password" name="password" type="password" class="form-control" value="${employee.password}" data-val="true">
                                            <span class="help-block" data-valmsg-for="cc-number"
                                                  data-valmsg-replace="true"></span>
                                        </div>
                                        <div>
                                            <button id="payment-button" type="submit" class="btn btn-lg btn-info btn-block">
                                                <i class="fa fa-lock fa-lg"></i>&nbsp;
                                                <span id="payment-button-amount">保存信息</span>
                                                <span id="payment-button-sending" style="display:none;">Sending…</span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
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
