<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
    Document   : browse
    Created on : May 14, 2017, 7:19:05 PM
    Author     : kanok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Punpun.com เว็บไซต์การระดมทุนจากมวลชลแบบแจกแจงรายการ</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Place favicon.ico in the root directory -->
        <link rel="shortcut icon" href="assets/logo/gift.png"/>
        <!-- Animation CSS File. "Please, Don't Touch it" - Ice -->
        <link rel="stylesheet" href="assets/css/vendor.css">
        <!-- Custom CSS. Bootstrap 4 already there. -->
        <link href="assets/css/app_vistor.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <!--Main-->
        <div class="main-wrapper header-fixed">


            <!--Nav Bar-->
            <header class="header">
                <div class="brand">
                    <div class="image-container logo hidden-xs-down"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div>
                    <div class="image-container logo hidden-sm-up"style="width: 30px; height: 30px;"> <img src="assets/logo/punpun_white.png" alt="Punpun"> </div>
                </div>
                <div class="header-block header-block-search hidden-md-down">
                    <form role="search" action="searchServlet">
                        <div class="input-container">
                            <div>
                                <i class="fa fa-search"></i> <input type="search" name="keyword" placeholder="...ค้นหาโครงการ...">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="header-block header-block-nav">
                    <ul class="nav-profile">
                        <li class="header-block header-block-buttons">
                            <a href="index.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-home"></i> <span> หน้าแรก </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="ViewAllServlet" class="btn btn-none-shadow header-btn"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="how-it-works.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-list-ul"></i> <span> ขั้นตอนการบริจาค </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="dashboard-project-setup-info.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-plus"></i> <span> สร้างโครงการ </span> </a>
                        </li>
                        <c:if test="${empty member}">
                            <!-- login -->
                            <li class="header-block header-block-buttons">
                                <a href="login.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                            </li>
                        </c:if>
                        <c:if test="${member != null }">
                            <sql:query var="data" dataSource="punpun">
                                SELECT * FROM notifications where member_id = ${member.memberId} and checked = 'F'
                            </sql:query>
                            <sql:query var="count" dataSource="punpun">
                                SELECT count(notification_id) as count FROM notifications where member_id = ${member.memberId} and checked = 'F'
                            </sql:query>
                            <!-- notification -->
                            <li class="notifications new">
                                <c:forEach var="num" items="${count.rows}">
                                    <a href="" data-toggle="dropdown"> <i class="fa fa-bell-o"></i> <sup>
                                            <span class="counter">${num.count}</span>
                                        </sup>
                                    </a>
                                </c:forEach>
                                <div class="dropdown-menu notifications-dropdown-menu">
                                    <ul class="notifications-container">
                                        <c:forEach var="noti" items="${data.rows}">
                                            <li>
                                                <a href="" class="notification-item">
                                                    <div class="img-col">
                                                        <div class="img" style="background-image: url('assets/img/logo.png')"></div>
                                                    </div>
                                                    <div class="body-col">
                                                        <p> <span class="accent">${noti.actor}</span> ${noti.action}: <span class="accent"> ${noti.detail}</span>. </p>
                                                    </div>
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                    <footer>
                                        <ul>
                                            <li> <a href="">
                                                    View All
                                                </a> </li>
                                        </ul>
                                    </footer>
                                </div>
                            </li>


                            <!-- profile -->
                            <li class="profile dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                    <div class="img" style="background-image: url('assets/img/profile/${member.memberId}.jpg')"> </div> <span class="name">
                                        ${member.firstName}
                                    </span> </a>
                                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                    <a class="dropdown-item" href="profile.jsp/?member_id=${member.memberId}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
                                    <a class="dropdown-item" href="dashboard.jsp"> <i class="fa fa-user icon"></i> แดชบอร์ด </a>
                                    <a class="dropdown-item" href="dashboard-project-list.jsp"> <i class="fa fa-bell icon"></i> โครงการของคุณ </a>
                                    <a class="dropdown-item" href="dashboard-account-setting.jsp"> <i class="fa fa-gear icon"></i> ตั้งค่าบัญชีผู้ใช้ </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logoutServlet"> <i class="fa fa-power-off icon"></i> ลงชื่อออก </a>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </header>


            <!-- Search Content -->
            <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/banner2.png');" >
                <article class="container content-browse items-list-page">
                    <!-- Title -->
                    <div class="title-block">
                        <div class="col-md-12">
                            <h1 class="center-text"> ค้นหาโครงการที่น่าสนใจ </h1>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="want-padding">
                            <form>
                                <input type="text" class="form-control round" name="keyword" placeholder="ค้นหาจาก ชื่อโครงการ" >
                            </form>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="want-padding">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <sql:query var="category" dataSource="punpun">
                                        SELECT * FROM project_categories
                                    </sql:query>
                                    <select class="c-select form-control boxed" onchange="location = this.value">
                                        <option disabled selected value="http://localhost:8084/punpun_demo_final/browse.jsp?category=0&sort=${param.sort}">เลือกประเภทโครงการ</option>
                                        <option value="http://localhost:8084/punpun_demo_final/browse.jsp?category=0&sort=${param.sort}">ทั้งหมด</option>
                                        <c:forEach var="data3" items="${category.rows}">
                                            <option value="http://localhost:8084/punpun_demo_final/browse.jsp?category=${data3.project_category_id}&sort=${param.sort}">${data3.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="want-padding">
                            <div class="form-group row">
                                <div class="col-md-12">
                                    <select class="c-select form-control boxed" onchange="location = this.value">
                                        <option disabled selected value="0">เรียงจาก</option>
                                        <option value="http://localhost:8084/punpun_demo_final/browse.jsp?sort=1&category=${param.category}">ล่าสุด</option>
                                        <option value="http://localhost:8084/punpun_demo_final/browse.jsp?sort=2&category=${param.category}">วันปิดระดมทุน</option>
                                        <option value="http://localhost:8084/punpun_demo_final/browse.jsp?sort=3&category=${param.category}">ยอดระดมทุนสูงสุด</option>
                                        <option value="http://localhost:8084/punpun_demo_final/browse.jsp?sort=4&category=${param.category}">อัตราความสำเร็จ</option>
                                        <option value="http://localhost:8084/punpun_demo_final/browse.jsp?sort=5&category=${param.category}">ความนิยม</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                </article>
            </div>

            <!-- Project List -->
            <div class="app">
                <article class="container content dashboard-page">
                    <!--Title-->
                    <div class="title-block">
                        <div class="col-md-12">
                            <h3> โครงการที่น่าสนใจสำหรับคุณ </h3>
                        </div>
                    </div>

                    <!-- Project Card Container -->
                    <section class="section">
                        <c:if test="${param.category == 0}">
                            <c:forEach var="project" items="${sessionScope.projects}">
                                <!-- Project Card -->
                                <div class="col-lg-4">
                                    <div class="card card-default">

                                        <!-- Pic -->
                                        <div class="card-header">
                                            <div class="card card-block-img " style="background-image: url('assets/img/Project_Pic/${project.projectId}/${project.projectId}.jpg'); "></div>
                                        </div>

                                        <!-- Name and Short Info -->
                                        <div class="card-block-browse">
                                            <a href="viewProjectServlet?id=${project.projectId}"><h5> ${project.name}</h5></a>
                                            <p class="" id="dot1"><small>${project.shortDescription}</small></p>
                                        </div>

                                        <!-- Stat Footer -->
                                        <div class="card-footer stats">
                                            <div class="row row-sm stats-container">

                                                <!--Progress Bar-->
                                                <div class="col-md-12">
                                                    <progress class="progress stat-progress" value="${project.percent}" max="100">
                                                        <div class="progress">
                                                            <span class="progress-bar" style="width: 75%;"></span>
                                                        </div>
                                                    </progress>
                                                </div>

                                                <!--Progress Percent-->
                                                <div class="col-md-3 stat-col">
                                                    <div class="stat">
                                                        <div class="value"> ${project.percent} % </div>
                                                        <div class="name"> เป้าหมาย </div>
                                                    </div>
                                                </div>

                                                <!--Earned-->
                                                <div class="col-md-3 stat-col">
                                                    <div class="stat">
                                                        <div class="value"> ${project.funded} </div>
                                                        <div class="name"> เงินระดมทุน </div>
                                                    </div>
                                                </div>

                                                <!--Followers-->
                                                <div class="col-md-3 stat-col">
                                                    <div class="stat">
                                                        <div class="value center-text"> ${project.supporter} </div>
                                                        <div class="name"> ผู้สนับสนุน </div>
                                                    </div>
                                                </div>

                                                <!--Interester Projects-->
                                                <div class="col-md-3 stat-col">
                                                    <div class="stat">
                                                        <div class="value"> ${project.fundingDuration} </div>
                                                        <div class="name"> วัน </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${param.category != 0}">
                            <sql:query var="result" dataSource="punpun">
                                SELECT * FROM projects where project_category_id = ${param.category}
                            </sql:query>
                        </c:if>
                        <c:forEach var="project" items="${result.rows}">
                            <!-- Project Card -->
                            <div class="col-lg-4">
                                <div class="card card-default">

                                    <!-- Pic -->
                                    <div class="card-header">
                                        <div class="card card-block-img " style="background-image: url('assets/img/Project_Pic/${project.project_id}/${project.project_id}.jpg'); "></div>
                                    </div>

                                    <!-- Name and Short Info -->
                                    <div class="card-block-browse">
                                        <a href="project-detail.jsp?id=${project.project_id}"><h5> ${project.name}</h5></a>
                                        <p class="" id="dot1"><small>${project.short_description}</small></p>
                                    </div>

                                    <!-- Stat Footer -->
                                    <div class="card-footer stats">
                                        <div class="row row-sm stats-container">

                                            <!--Progress Bar-->
                                            <div class="col-md-12">
                                                <progress class="progress stat-progress" value="${project.percent}" max="100">
                                                    <div class="progress">
                                                        <span class="progress-bar" style="width: 75%;"></span>
                                                    </div>
                                                </progress>
                                            </div>

                                            <!--Progress Percent-->
                                            <div class="col-md-3 stat-col">
                                                <div class="stat">
                                                    <div class="value"> ${project.percent} % </div>
                                                    <div class="name"> เป้าหมาย </div>
                                                </div>
                                            </div>

                                            <!--Earned-->
                                            <div class="col-md-3 stat-col">
                                                <div class="stat">
                                                    <div class="value"> ${project.funded} </div>
                                                    <div class="name"> เงินระดมทุน </div>
                                                </div>
                                            </div>

                                            <!--Followers-->
                                            <div class="col-md-3 stat-col">
                                                <div class="stat">
                                                    <div class="value center-text"> ${project.supporter} </div>
                                                    <div class="name"> ผู้สนับสนุน </div>
                                                </div>
                                            </div>

                                            <!--Interester Projects-->
                                            <div class="col-md-3 stat-col">
                                                <div class="stat">
                                                    <div class="value"> ${project.funding_duration} </div>
                                                    <div class="name"> วัน </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </c:forEach>
                    </section>
                </article>
            </div>

            <!-- Footer -->
            <footer class="footer">
                <div class="container content">
                    <div class="col-md-4">
                        <p> <h3>เกี่ยวกับเรา</h3> </p>
                        <h6><a href="about-us.jsp">เรื่องราวของปันปัน</a></h6>
                        <h6><a href="team.jsp">ทีมปันปัน</a></h6>
                        <h6><a href="how-it-works.jsp">ขั้นตอนการบริจาค</a></h6>
                        <h6><a href="fee.jsp">ค่าใช้จ่ายในการระดมทุน</a></h6>
                    </div>
                    <div class="col-md-4">
                        <p> <h3>โครงการทั้งหมด</h3> </p>
                        <sql:query var="category" dataSource="punpun">
                            SELECT * FROM project_categories
                        </sql:query>
                        <h6><a href="browse.jsp?category=0&sort=0">ทั้งหมด</a></h6>
                        <c:forEach var="data3" items="${category.rows}">
                            <h6><a href="browse.jsp?category=${data3.project_category_id}&sort=0">${data3.name}</a></h6>

                        </c:forEach>

                    </div>
                    <div class="col-md-4">
                        <p> <h3>การติดต่อ</h3> </p>
                        <h6><a href="mailto:punpunproject@gmail.com?Subject=หัวข้อ%20เรื่องที่ติดต่อ" target="_top"> <i class="fa fa-envelope" style="color: #28ab60;"> </i> <span> อีเมล </span> </a> </h6>
                        <h6><a href="https://www.facebook.com/punpunproject/"> <i class="fa fa-facebook-square" style="color: #4267b2;"> </i> <span> Facebook </span> </a></h6>
                        <h6><a href="https://twitter.com"> <i class="fa fa-twitter" style="color: #1da1f2;"> </i> <span> Twitter </span> </a></h6>
                    </div>

                    <div class="col-md-12 want-top" style="border-top: 1px solid #64798d;margin-top: 20px;">
                        <div class="footer-block author" style="margin-top: 20px;">
                            <ul>
                                <li> Theme by <a href="https://github.com/modularcode"> ModularCode </a> </li>
                                <li> Created by <a href="#"> Disanuwat & Kanokwan </a> </li>
                                <li> <a href="http://www.it.kmitl.ac.th"> IT KMITL </a> </li>
                            </ul>
                        </div>
                    </div>

                </div>
            </footer>
        </div>

        <!-- Reference block for JS -->
        <div class="ref" id="ref">
            <div class="color-primary"></div>
            <div class="chart">
                <div class="color-primary"></div>
                <div class="color-secondary"></div>
            </div>
        </div>

        <!-- Script -->
        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="assets/js/jquery-3.2.1.min.js"></script>

    </body>
</html>

