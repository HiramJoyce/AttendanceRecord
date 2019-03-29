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
                                        <span>1</span>
                                        <span>病假</span>
                                    </div>
                                    <div>
                                        <span>0</span>
                                        <span>事假</span>
                                    </div>
                                    <div>
                                        <span>2</span>
                                        <span>年假</span>
                                    </div>
                                    <div>
                                        <span>3</span>
                                        <span>调休</span>
                                    </div>
                                    <div>
                                        <span>0</span>
                                        <span>婚/丧假</span>
                                    </div>
                                    <div>
                                        <span>0</span>
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
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${leaves}" var="leave" varStatus="statu">
                                            <tr>
                                                <td class="serial">${statu.index + 1}</td>
                                                <td>${leave.realName}</td>
                                                <td><span class="name">${leave.employeeNum}</span></td>
                                                <td><span class="product"><f:formatDate value="${leave.startDate}" pattern="yyyy-MM-dd"/></span></td>
                                                <td><span class="product"><f:formatDate value="${leave.endDate}" pattern="yyyy-MM-dd"/></span></td>
                                                <td><span class="count">${leave.dayCount}</span></td>
                                                <td><span class="badge badge-complete">${leave.state}</span></td>
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
        qqDate: [{time: "2018-11-09", Morning: "", Afternoon: "16:01"}, {
            time: "2018-11-16",
            Morning: "08:15",
            Afternoon: ""
        }, {time: "2018-12-19", Morning: "08:15", Afternoon: ""}],
        //正常考勤
        zcDate: [
            {time: "2018-11-01", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-02", Morning: "08:15", Afternoon: "16:03"},
            {time: "2018-11-05", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-06", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-07", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-08", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-12", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-13", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-14", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-15", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-16", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-15", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-19", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-20", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-21", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-22", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-23", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-26", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-27", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-28", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-29", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-11-30", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-03", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-04", Morning: "08:15", Afternoon: "16:03"},
            {time: "2018-12-05", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-06", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-07", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-10", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-11", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-12", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-13", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-14", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-17", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-18", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-19", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-20", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-21", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-24", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-25", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-26", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-27", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-28", Morning: "08:15", Afternoon: "16:01"},
            {time: "2018-12-31", Morning: "08:15", Afternoon: "16:01"}
        ]
    })
</script>
</body>
</html>
