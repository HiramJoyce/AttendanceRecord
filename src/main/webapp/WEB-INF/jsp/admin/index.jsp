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
                <li class="active">
                    <a href="${ctx}/employee/"><i class="menu-icon fa fa-calendar"></i>考勤信息</a>
                </li>
                <li>
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
            <!-- Orders -->
            <div class="orders">
                <div class="row">
                    <div class="col-xl-4">
                        <div class="row">
                            <div class="index_frame_leftTop" style="width: 100%;">
                                <div id='schedule-boxS'></div>
                                <div class="index_liTLeft">
                                    <div class="index_liTline"></div>
                                </div>
                                <div class="index_liTRight">
                                    <div class="index_liTline"></div>
                                </div>
                            </div>
                            <div class="index_frame_leftBottom" style="height: auto; width: 100%;">
                                <div class="index_liBLeft"></div>
                                <div class="index_liBRight"></div>
                                <div class="index_frame_leftBottom_bottom clearfix">
                                    <div>
                                        <span>${records.type1}</span>
                                        <span>病假</span>
                                    </div>
                                    <div>
                                        <span>${records.type2}</span>
                                        <span>事假</span>
                                    </div>
                                    <div>
                                        <span>${records.type3}</span>
                                        <span>年假</span>
                                    </div>
                                    <div>
                                        <span>${records.type4}</span>
                                        <span>调休</span>
                                    </div>
                                    <div>
                                        <span>${records.type5}</span>
                                        <span>婚/丧假</span>
                                    </div>
                                    <div>
                                        <span>${records.type6}</span>
                                        <span>产假/护理假</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title">我的请假记录</h4>
                            </div>
                            <div class="card-body--">
                                <div class="table-stats order-table ov-h">
                                    <table class="table ">
                                        <thead>
                                        <tr>
                                            <th class="serial">#</th>
                                            <th>姓名</th>
                                            <th>工号</th>
                                            <th>开始日</th>
                                            <th>结束日</th>
                                            <th>天数</th>
                                            <th>状态</th>
                                            <th></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${leaves}" var="leave" varStatus="statu">
                                            <tr>
                                                <td class="serial">${statu.index + 1}</td>
                                                <td>${leave.realName}</td>
                                                <td><span class="name">${leave.employeeNum}</span></td>
                                                <td><span class="product"><f:formatDate value="${leave.startDate}"
                                                                                        pattern="yyyy-MM-dd"/></span>
                                                </td>
                                                <td><span class="product"><f:formatDate value="${leave.endDate}"
                                                                                        pattern="yyyy-MM-dd"/></span>
                                                </td>
                                                <td><span>${leave.dayCount}</span></td>
                                                <td><span
                                                        class="badge ${leave.state == 1 ? "badge-info" : "badge-complete"}">${leave.state == 1 ? "申请中" : "已批准"}</span>
                                                </td>
                                                <td style="text-align: left;">
                                                    <c:if test="${leave.state == 1}">
                                                        <button onclick="window.location.href='${ctx}/leave/apply?id=${leave.id}&see=1'"
                                                                type="button" class="btn btn-info btn-sm btn-block"
                                                                style="width: auto; margin: 0;">
                                                            查看
                                                        </button>
                                                        <button onclick="window.location.href='${ctx}/leave/apply?id=${leave.id}'"
                                                                type="button" class="btn btn-warning btn-sm btn-block"
                                                                style="width: auto; margin: 0;">
                                                            修改
                                                        </button>
                                                        <button onclick="window.location.href='${ctx}/leave/callback?id=${leave.id}'"
                                                                type="button" class="btn btn-danger btn-sm btn-block"
                                                                style="width: auto; margin: 0;">
                                                            撤销
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${leave.state == 2}">
                                                        <button onclick="window.location.href='${ctx}/leave/apply?id=${leave.id}&see=1'"
                                                                type="button" class="btn btn-info btn-sm btn-block"
                                                                style="width: auto; margin: 0;">
                                                            查看
                                                        </button>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div> <!-- /.table-stats -->
                            </div>
                        </div> <!-- /.card -->
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
<script src="${ctx}/resource/calender/js/schedule.js" type="text/javascript" charset="utf-8"></script>
<!--Local Stuff-->
<script>
    var mySchedule = new Schedule({
        el: '#schedule-boxS',
        //异常考勤
        qqDate: ${records.qqDate},
        //正常考勤
        zcDate: ${records.zcDate}
    })
</script>
</body>
</html>
