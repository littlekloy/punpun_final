<%--
    Document   : donate
    Created on : May 15, 2017, 4:26:37 AM
    Author     : kanok
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        <!-- Main -->
        <div class="main-wrapper">
            <div class="app" id="app">

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

                <!-- Header Content -->
                <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/profile-card-2.jpg');" >
                    <article class="container content-browse items-list-page">
                        <!-- Title -->
                        <div class="title-block">
                            <div class="col-md-12">
                                <h1 class="center-text"> คุณกำลังบริจาคให้</h1>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <h3 class="center-text"> ${project.name} </h3>
                        </div>
                    </article>
                </div>

                <!-- Content -->
                <article class="container content dashboard-page">

                    <!--Pill Tab-->
                    <section class="section">
                        <div class="row">
                            <div class="col-xl-12 stat-col">
                                <div class="card items">
                                    <div class="card-block">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="donate.jsp" class="nav-link active"> 1. เลือกรายการที่ต้องการช่วยเหลือ </a> </li>
                                            <li class="nav-item"> <a href="#" class="nav-link"> 2. กรอกข้อมูลการชำระเงิน </a> </li>
                                            <li class="nav-item"> <a href="#" class="nav-link"> 3. เรียบร้อย </a> </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <!--Basic Tab-->
                                            <div class="tab-pane fade in active" id="basic-pills">
                                                <div class="card card-block stats">
                                                    <form role="form" method="post" action="">

                                                        <!--Request Item List-->
                                                        <!--Change id , name , for to item1 2 3 ... ++ if have more than one item.-->
                                                        <!--Progress Bar-->
                                                        <div class="col-xs-12 col-md-12 stat-col">

                                                            <progress class="progress stat-progress" value="75" max="100">
                                                                <div class="progress">
                                                                    <span class="progress-bar" style="width: 75%;"></span>
                                                                </div>
                                                            </progress>
                                                            <div class="col-xs-12 col-md-2 offset-md-5">
                                                                <div class="stat">
                                                                    <div class="value"> 1500 / 53000 </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!--Punpun-->
                                                        <div class="col-md-12 donate-list">
                                                            <input class="accordion" type="checkbox" id="punpun" name="punpun">
                                                            <label for="punpun">บริจาคให้ ปันปัน.com</label>
                                                            <div class="panel">
                                                                <label>
                                                                    <input class="radio" name="inline-radios-punpun" type="radio">
                                                                    <span>100</span>
                                                                </label>
                                                                <label>
                                                                    <input class="radio" name="inline-radios-punpun" type="radio">
                                                                    <span>500</span>
                                                                </label>
                                                                <label>
                                                                    <input class="radio" name="inline-radios-punpun" type="radio">
                                                                    <span>1000</span>
                                                                </label>
                                                                <label>
                                                                    <input class="radio" name="inline-radios-punpun" type="radio">
                                                                    <span><input type="text" class="boxed" placeholder=" ใส่จำนวนเงินที่ต้องการ"> </span>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <!--Whole-Project-->
                                                        <div class="col-md-12 donate-list">
                                                            <input class="accordion" type="checkbox" id="whole-project" name="whole-project">
                                                            <label for="whole-project">บริจาคให้ทั้งโครงการ</label>
                                                            <div class="panel">
                                                                <label>
                                                                    <input class="radio" name="inline-radios-whole" type="radio">
                                                                    <span>100</span>
                                                                </label>
                                                                <label>
                                                                    <input class="radio" name="inline-radios-whole" type="radio">
                                                                    <span>500</span>
                                                                </label>
                                                                <label>
                                                                    <input class="radio" name="inline-radios-whole" type="radio">
                                                                    <span>1000</span>
                                                                </label>
                                                                <label>
                                                                    <input class="radio" name="inline-radios-whole" type="radio">
                                                                    <span><input type="text" class="boxed" placeholder=" ใส่จำนวนเงินที่ต้องการ"> </span>
                                                                </label>
                                                            </div>
                                                        </div>

                                                        <!-- Item-list -->
                                                        <div class="col-md-12 donate-list">
                                                            <input class="accordion" type="checkbox" id="per-item" name="per-item">
                                                            <label for="per-item">บริจาคแบบแจกแจงรายการ</label>
                                                            <div class="panel">
                                                                <!--Item 1-->
                                                                <div class="col-md-10 donate-list">
                                                                    <input class="accordion" type="checkbox" id="item1" name="item1">
                                                                    <label for="item1">เก้าอี้</label>
                                                                    <div class="panel">
                                                                        <label>
                                                                            <input class="radio" name="inline-radios1" type="radio">
                                                                            <span>100</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios1" type="radio">
                                                                            <span>500</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios1" type="radio">
                                                                            <span>1000</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios1" type="radio">
                                                                            <span><input type="text" class="boxed" placeholder=" ใส่จำนวนเงินที่ต้องการ"> </span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2 donate-list">
                                                                    <p>1000 / 10000 ฿</p>
                                                                </div>
                                                                <!-- End : Item 1 -->
                                                                <!--Item 2-->
                                                                <div class="col-md-10 donate-list">
                                                                    <input class="accordion" type="checkbox" id="item2" name="item2">
                                                                    <label for="item2">โต๊ะเรียน</label>
                                                                    <div class="panel">
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span>100</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span>500</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span>1000</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span><input type="text" class="boxed" placeholder=" ใส่จำนวนเงินที่ต้องการ"> </span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2 donate-list">
                                                                    <p>500 / 18000 ฿</p>
                                                                </div>
                                                                <!-- End : Item 1 -->
                                                                <!--Item 2-->
                                                                <div class="col-md-10 donate-list">
                                                                    <input class="accordion" type="checkbox" id="item2" name="item2">
                                                                    <label for="item2">กระดานไวท์บอร์ด</label>
                                                                    <div class="panel">
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span>100</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span>500</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span>1000</span>
                                                                        </label>
                                                                        <label>
                                                                            <input class="radio" name="inline-radios2" type="radio">
                                                                            <span><input type="text" class="boxed" placeholder=" ใส่จำนวนเงินที่ต้องการ"> </span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-2 donate-list">
                                                                    <p>0 / 18000 ฿</p>
                                                                </div>
                                                                <!-- End : Item 1 -->
                                                            </div>
                                                        </div>

                                                        <!--Button-->
                                                        <input type="submit" class="btn btn-primary btn-block"  value="ยืนยัน"  />
                                                        <a href="javascript:history.back()" class="btn btn-block btn-primary-outline">ยกเลิก</a>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.card-block -->
                                </div>
                                <!-- /.card -->
                            </div>
                        </div>
                    </section>
                </article>


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
        </div>

        <!-- Script -->
        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>

    </body>
</html>
