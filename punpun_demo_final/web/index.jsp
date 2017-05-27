
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
    Document   : index
    Created on : May 14, 2017, 7:06:02 PM
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

            <!-- Welcome Content -->
            <div class="app parallax-fullpage white-text" style="background-image: url('assets/backgrounds/banner_new16.png');">
                <div class="middle-top">
                    <h1>ปันปันดอทคอม</h1>
                    <hr>
                    <h1>ปันส่วนของตัวเอง เพื่อแบ่งปันให้ผู้อื่น</h1>
                    <div class="want-padding">
                        <a href="ViewAllServlet" class="want-top btn btn-block btn-lg btn-primary" style="border: 2px solid #ffffff;"><i class="fa fa-gift"> </i> ร่วมระดมทุน </a>
                    </div>
                    <!--<p id="demo" style="font-size:30px; color: white"></p> -->

                </div>
            </div>

            <!-- Recommended Project -->
            <div class="app">
                <article class="container content dashboard-page">

                    <!--Title-->
                    <div class="title-block">
                        <div class="col-md-6">
                            <h3> โครงการที่ใกล้จะสำเร็จ </h3>
                        </div>
                    </div>

                    <sql:query var="result" dataSource="punpun">
                        SELECT * FROM projects where project_id = 5 or project_id = 1
                    </sql:query>

                    <c:forEach var="project" items="${result.rows}">
                        <!--Profile Card-->
                        <div class="card">
                            <div class="card-block row sameheight-container stats">
                                <div class="col-md-6">
                                    <div class="card card-block-img sameheight-item" style="background-image: url('assets/img/Project_Pic/${project.project_id}/${project.project_id}.jpg'); "></div>
                                </div>
                                <div class="col-md-6 ">
                                    <div class="card card-block sameheight-item">
                                        <!--Name-->
                                        <h3><a href="project-detail.jsp">${project.name}</a></h3>
                                        <!--Short Info-->
                                        <p class=""> ${project.short_description}</p>

                                        <div class="row row-sm stats-container project-card-footer">

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
                                                    <div class="value center-text"> ${project.funded} </div>
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
                        </div>
                        <!--Profile Card-->
                    </c:forEach>





                    <a href="ViewAllServlet" class="want-top btn btn-block btn-lg btn-primary"> ดูโครงการอื่น ๆ</a>


                </article>
            </div>

            <!-- Why Content -->
            <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/banner2.png');" >
                <article class="container content content-fixed-height">
                    <!-- Title -->
                    <div class="title-block">
                        <div class="col-md-6">
                            <h2> ทำไมต้อง ''ปันปัน.คอม'' </h2>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="want-padding">
                            <h2>เน้นช่วยเหลือผู้อื่น</h2>
                            <p><strong>ปันปัน</strong> มุ่งเน้นโครงการการกุศลโดยเฉพาะ ที่นี่จึงเต็มไปด้วยบรรดาจิตอาสาและผู้ที่ต้องการช่วยเหลือผู้คนต่าง ๆ เช่นคุณ</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="want-padding">
                            <h2>ได้เท่าไหร่ เอาไปเท่านั้น</h2>
                            <p>ไม่ว่าโครงการของคุณจะสามารถระดมทุนได้ถึงเป้าหมายหรือไม่ก็ตาม คุณก็ยังจะได้รับเงินทั้งหมดที่ได้รับจากการระดมทุนกลับไป เพราะเราเชื่อว่า เงินทุกบาทนั้นมีความหมายต่อโครงการของคุณ</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="want-padding">
                            <h2>ค่าธรรมเนียม 0%</h2>
                            <p>ไม่มีค่าธรรมเนียมใด ๆ ไม่มีค่าสมัคร จึงมั่นใจได้ว่าโครงการจะได้รับสิ่งที่คุณตั้งใจจะมอบให้ทุกบาททุกสตางค์</p>
                        </div>
                    </div>


                </article>
            </div>

            <!-- Start Now Content -->
            <div class="app">
                <article class="container content">
                    <!-- Title -->
                    <div class="col-md-12">
                        <h2> ร่วมเป็นส่วนหนึ่งกับเรา </h2>
                        <p> มาเป็นส่วนหนึ่งในการสร้างศูนย์กลางกลางบริจาค (Donation Exchange Center) ด้วยการค้นหาโครงการที่สนใจหรือสร้างโครงการของคุณ </p>
                    </div>

                    <div class="col-md-6">
                        <div class="want-padding">
                            <a href="ViewAllServlet" class="want-top btn btn-block btn-lg btn-primary-outline"> ดูโครงการต่าง ๆ</a>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="want-padding">
                            <a href="dashboard-project-setup-info.jsp" class="want-top btn btn-block btn-lg btn-primary"> สร้างโครงการ</a>
                        </div>
                    </div>

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

        <script type="text/javascript">
            // Set the date counting down to
            var countDownDate = new Date("May 15 , 2017 9:00:00").getTime();

            // Update the count down every 1 second
            var x = setInterval(function () {

                // Get todays date and time
                var now = new Date().getTime();

                // Find the distance between now an the count down date
                var distance = countDownDate - now;

                // Time calculations for days, hours, minutes and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Display the result in an element with id="demo"
                document.getElementById("demo").innerHTML = days + "d " + hours + "h "
                        + minutes + "m " + seconds + "s ";

                // If the count down is finished, write some text
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("demo").innerHTML = "Congratulation. Your job should be done by now";
                }
            }, 1000);
        </script>

    </body>
</html>


