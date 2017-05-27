<%--
    Document   : about-us
    Created on : May 15, 2017, 12:55:35 AM
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

        <link href="assets/css/jquery.tagit.css" rel="stylesheet" type="text/css">
        <link href="assets/css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">

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
                    <form role="search" action="">
                        <div class="input-container">
                            <div>
                                <i class="fa fa-search"></i> <input type="search" placeholder="...ค้นหาโครงการ...">
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
                            <a href="browse.jsp?category=0&sort=0" class="btn btn-none-shadow header-btn"> <i class="fa fa-file-text"></i> <span> โครงการต่าง ๆ </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="how-it-works.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-list-ul"></i> <span> ขั้นตอนการบริจาค </span> </a>
                        </li>
                        <li class="header-block header-block-buttons">
                            <a href="dashboard-project-setup-info.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-plus"></i> <span> สร้างโครงการ </span> </a>
                        </li>
                        <c:if test="${empty member_id}">
                            <!-- login -->
                            <li class="header-block header-block-buttons">
                                <a href="login.jsp" class="btn btn-none-shadow header-btn"> <i class="fa fa-sign-in"></i> <span> ลงชื่อเข้าใช้ </span> </a>
                            </li>
                        </c:if>
                        <c:if test="${member_id != null }">
                            <sql:query var="data" dataSource="punpun">
                                SELECT * FROM notifications where member_id = ${member_id} and checked = 'F'
                            </sql:query>
                            <sql:query var="count" dataSource="punpun">
                                SELECT count(notification_id) as count FROM notifications where member_id = ${member_id} and checked = 'F'
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

                            <sql:query var="data2" dataSource="punpun">
                                SELECT * FROM members where member_id = ${member_id}
                            </sql:query>
                            <c:forEach var="user" items="${data2.rows}">
                                <!-- profile -->
                                <li class="profile dropdown">
                                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                        <div class="img" style="background-image: url('assets/img/profile/${member_id}.jpg')"> </div> <span class="name">
                                            ${user.first_name}
                                        </span> </a>
                                    <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                                        <a class="dropdown-item" href="profile.jsp/?member_id=${member_id}"> <i class="fa fa-user icon"></i> โพรไฟล์ </a>
                                        <a class="dropdown-item" href="dashboard.jsp"> <i class="fa fa-user icon"></i> แดชบอร์ด </a>
                                        <a class="dropdown-item" href="dashboard-project-list.jsp"> <i class="fa fa-bell icon"></i> โครงการของคุณ </a>
                                        <a class="dropdown-item" href="dashboard-account-setting.jsp"> <i class="fa fa-gear icon"></i> ตั้งค่าบัญชีผู้ใช้ </a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="logoutServlet"> <i class="fa fa-power-off icon"></i> ลงชื่อออก </a>
                                    </div>
                                </li>
                            </c:forEach>

                        </c:if>

                    </ul>
                </div>
            </header>


            <!-- Header Content -->
            <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/banner2.png');" >
                <article class="container content-browse items-list-page">
                    <!-- Title -->
                    <div class="">
                        <div class="col-md-12">
                            <h1 class="center-text"> ขั้นตอนการบริจาค </h1>
                        </div>
                    </div>

                </article>
            </div>

            <!-- Content -->
            <div class="app">
                <!-- Content -->
                <article class="container content dashboard-page">

                    <!--Pill Tab : Content-->
                    <section class="section">
                        <div class="row">
                            <div class="col-xs-3">
                                <div class="card items">
                                    <div class="card-block">
                                        <h4>Link List</h4>
                                        <ul class="item-list">
                                            <li> <a href="#" class="btn btn-link">List 1</a></li>
                                            <li> <a href="#" class="btn btn-link">List 1</a></li>
                                            <li>
                                                <ul class="">
                                                    <li> <a href="#" class="btn btn-link">List 1</a></li>
                                                    <li> <a href="#" class="btn btn-link">List 1</a></li>
                                                    <li> <a href="#" class="btn btn-link">List 1</a></li>
                                                </ul>
                                            </li>
                                            <li> <a href="#" class="btn btn-link">List 1</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-9">
                                <div class="card items">
                                    <div class="card-block">
                                        <h2>A little bit of context</h2>
                                        <p>Bawoorrooga, a remote aboriginal community in the Kimberley, Burnt down after the New Year. The family lost their accommodation and all of their belongings and clothes.</p>

                                        <p>Claude and Andrea build this community them selves to create a safe space for their family and friends. They are also teachers of Law and Culture and use the community to share their knowledge.</p>

                                        <p>They have build an Art Shed, a food garden, a native plant nursery, and a fruit orchard over their 16 years there, and use mainly solar power and a wood fire to survive.</p>

                                        <p>We want to give back the necessitites, Shelter, clothing and everyday use items </p>


                                        <h2>But there’s a problem</h2>
                                        <p>Fitzroy Crossing is very remote. It is very expensive to get anything there, and even more expensive to buy things there. Bawoorrooga is 500KM from Broome, and over 2000km from Perth. We need as much as we can to help get these guys back on their feet again</p>

                                        <h2>Here’s what we’re doing about it</h2>
                                        <p>We are asking for donations of anything. Every little bit counts. We can buy clothing at OP Shops to keep the cost down and we are looking for cheap partable accomodation to transport from Perth to Bawoorrooga. </p>

                                        <p>The total income of the community is 24,000 a year, for everyone there to survive off of, including the children. There are currently 5 people still staying out there at the moment. We want to build 1 or 2 Eathships, which are rammed earth buildings. The friends and family of this community will come and build them, but we need tool and materials to get it done.</p>

                                        <h2>You can join us</h2>
                                        <p>There is no maximum cap of how much we want to raise. It is a lot to ask of you, a stranger to these people, to donate anything. But Their family has lost everything, and if it were my family, I would do everything I could to get them off the ground. When the campeign is over, then the real work begins.</p>

                                        <p> We are inviting anyone to come up to this beautiful area for the construction. You will we welcome to campout and live on the community and help build these earthships. Claude said he will hunt for anyone who comes. They have a vege garden that should still be producing then as well. Clause is a great story teller who love to share the stories of his people</p>

                                        <h1>ทีมดูแลโครงการ</h1>
                                        <!--List of Teams-->
                                        <div data-exclude="xs,sm,lg">
                                            <!-- Table Content -->
                                            <ul class="item-list striped">

                                                <!-- Team Item : Loop here -->
                                                <li class="item">
                                                    <div class="item-row">
                                                        <div class="item-col fixed item-col-img md">
                                                            <a href="item-editor.html">
                                                                <div class="item-img rounded" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                            </a>
                                                        </div>
                                                        <!--Name of Team-->
                                                        <div class="item-col item-col-title no-overflow no-underline">
                                                            <div>
                                                                <a href="error-404.html" class="center-text">
                                                                    ดิศานุวัตร วรจิรกาล
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <!--Position-->
                                                        <div class="item-col item-col-center">
                                                            <div class="item-heading"> ตำแหน่ง </div>
                                                            <div> แอดมิน </div>
                                                        </div>
                                                        <!--Join Date-->
                                                        <div class="item-col item-col-center">
                                                            <div class="item-heading"> วันที่เข้าร่วม </div>
                                                            <div> 21 SEP 10:47 </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <!-- Team Item : Loop here -->
                                                <li class="item">
                                                    <div class="item-row">
                                                        <div class="item-col fixed item-col-img md">
                                                            <a href="item-editor.html">
                                                                <div class="item-img rounded" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                            </a>
                                                        </div>
                                                        <!--Name of Team-->
                                                        <div class="item-col item-col-title no-overflow no-underline">
                                                            <div>
                                                                <a href="error-404.html" class="center-text">
                                                                    ดิศานุวัตร วรจิรกาล
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <!--Position-->
                                                        <div class="item-col item-col-center">
                                                            <div class="item-heading"> ตำแหน่ง </div>
                                                            <div> แอดมิน </div>
                                                        </div>
                                                        <!--Join Date-->
                                                        <div class="item-col item-col-center">
                                                            <div class="item-heading"> วันที่เข้าร่วม </div>
                                                            <div> 21 SEP 10:47 </div>
                                                        </div>
                                                    </div>
                                                </li>

                                                <!-- Team Item : Loop here -->
                                                <li class="item">
                                                    <div class="item-row">
                                                        <div class="item-col fixed item-col-img md">
                                                            <a href="item-editor.html">
                                                                <div class="item-img rounded" style="background-image: url('assets/backgrounds/profile-card-1.jpg')"></div>
                                                            </a>
                                                        </div>
                                                        <!--Name of Team-->
                                                        <div class="item-col item-col-title no-overflow no-underline">
                                                            <div>
                                                                <a href="error-404.html" class="center-text">
                                                                    ดิศานุวัตร วรจิรกาล
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <!--Position-->
                                                        <div class="item-col item-col-center">
                                                            <div class="item-heading"> ตำแหน่ง </div>
                                                            <div> แอดมิน </div>
                                                        </div>
                                                        <!--Join Date-->
                                                        <div class="item-col item-col-center">
                                                            <div class="item-heading"> วันที่เข้าร่วม </div>
                                                            <div> 21 SEP 10:47 </div>
                                                        </div>
                                                    </div>
                                                </li>

                                            </ul>
                                        </div>

                                        <div class="alert alert-danger want-top" role="alert">
                                            Notice the little back box in the upper left corner of the page?
                                            <a class="alert-link" href="report-ban.html">ที่นี่</a>!
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- Button -->
                    <div class="col-xs-12">
                        <form action="browse.html">
                            <button class="want-top btn btn-block btn-lg btn-primary">ดูโครงการต่าง ๆ</button>
                        </form>
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

        <!-- jQuery and jQuery UI are required dependencies. -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

        <!-- The real Tag -->
        <script src="assets/js/tag-it.js" type="text/javascript" charset="utf-8"></script>

        <!-- Tag -->
        <script>
            $(function () {
                var sampleTags = ['c++', 'java', 'php', 'coldfusion', 'javascript', 'asp', 'ruby', 'python', 'c', 'scala', 'groovy', 'haskell', 'perl', 'erlang', 'apl', 'cobol', 'go', 'lua'];


                //-------------------------------
                // Preloading data in markup
                //-------------------------------
                $('#myULTags').tagit({
                    availableTags: sampleTags, // this param is of course optional. it's for autocomplete.
                    // configure the name of the input field (will be submitted with form), default: item[tags]
                    itemName: 'item',
                    fieldName: 'tags'
                });
                //-------------------------------
                // Read-only
                //-------------------------------
                $('#readOnlyTags').tagit({
                    readOnly: true
                });

            });
        </script>

    </body>
</html>
