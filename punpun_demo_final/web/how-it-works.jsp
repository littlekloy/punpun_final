<%--
    Document   : how-it-works
    Created on : May 14, 2017, 7:23:39 PM
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
            <div class="app parallax-autoheight white-text" style="background-image: url('assets/backgrounds/banner2.png');" >
                <article class="container content-browse items-list-page">
                    <!-- Title -->
                    <div class="">
                        <div class="col-md-12">
                            <h1 class="center-text"> ปันปันคืออะไร </h1>
                        </div>
                    </div>

                </article>
            </div>

            <!-- Content -->
            <div class="app">
                <!-- Content -->
                <article class="container content dashboard-page">
                    <div class="row">
                        <!--Pill Tab : Menu-->
                        <section class="section">
                            <div class="col-sm-12 col-md-3">
                                <div class="card items">
                                    <div class="card-block">
                                        <h4>แนะนำการใช้</h4>
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-pills">
                                            <li class="nav-item"> <a href="" class="nav-link active" data-target="#intro-pills" aria-controls="intro-pills" data-toggle="tab" role="tab">ก่อนเริ่มใช้งาน</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#crowdfunding-pills" aria-controls="crowdfunding-pills" data-toggle="tab" role="tab">การระดมทุนจากมวลชน</a></li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#punpunforwho-pills" aria-controls="punpunforwho-pills" data-toggle="tab" role="tab">ปันปันเหมาะกับใคร</a></li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#fee-pills" aria-controls="fee-pills" data-toggle="tab" role="tab">ค่าดำเนินการ</a></li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#create-pills" aria-controls="create-pills" data-toggle="tab" role="tab">สร้างโครงการของคุณ</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#promote-pills" aria-controls="promote-pills" data-toggle="tab" role="tab">โปรโมทโครงการ</a> </li>
                                            <li class="nav-item"> <a href="" class="nav-link" data-target="#step-pills" aria-controls="step-pills" data-toggle="tab" role="tab">ขั้นตอนการบริจาค</a> </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </section>
                        <!-- Pill Tab : Content -->
                        <section class="section">
                            <div class="col-md-9">
                                <div class="card items">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <!-- Intro Tab -->
                                        <div class="tab-pane fade in active" id="intro-pills">
                                            <div class="card-block">
                                                <h2>Intro Tab</h2>
                                                <h2>การระดมทุนจากมวลชน (Crowdfunding)</h2>
                                                <p>การระดมทุนจากมวลชน (Crowdfunding) คือ การระดมเงินทุนเพื่อสนับสนุนโครงการในด้านงานประดิษฐ์ ผลงานต่าง ๆ หรือโครงการเพื่อสังคมจากคนจำนวนมาก โดยการระดมทุนมีหลายรูปแบบ ดังนี้ </p>
                                                <ul>
                                                    <li>
                                                        รูปแบบการบริจาค (Donation-based Crowdfunding) คือ การระดมทุนโดยผู้ระดมทุนไม่ได้รับสิ่งตอบแทน
                                                    </li>
                                                    <li>
                                                        รูปแบบการแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุน (Reward-based Crowdfunding) คือ การระดมทุนเพื่อแลกกับสิทธิประโยชน์หรือสิ่งของ
                                                    </li>
                                                    <li>
                                                        รูปแบบการกู้ยืม (Loan-based / Debt Crowdfunding) คือ การกู้เงินจากมวลชนไปใช้ตามวัตถุประสงค์ที่แจ้งไว้ โดยมีกำหนดการชำระคืนและจ่ายดอกเบี้ย
                                                    </li>
                                                    <li>
                                                        รูปแบบการเข้าหุ้น (Equity Crowdfunding) คือการเข้าหุ้นกัน โดยผู้ร่วมระดมทุนจะได้รับหุ้นของธุรกิจที่เราร่วมระดมทุนพร้อมทั้งโอกาสในการรับเงินปันผล
                                                    </li>
                                                </ul>
                                                <p>นอกจากนั้นการระดมทุนรูปแบบการบริจาคและรูปแบบแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุนสามารถแบ่งออกเป็น 2 ประเภท คือ </p>
                                                <ul>
                                                    <li>
                                                        ได้รับทั้งหมดหรือไม่ได้รับเลย (All-or-Nothing) ซึ่งหมายถึง หากโครงการไม่สำเร็จตามเป้าหมายที่ตั้งไว้ในระยะเวลาที่กำหนดเช่น ไม่ได้รับเงินระดมทุนตามที่วางแผนไว้ เป็นต้น โครงการนั้นจะไม่ได้รับเงินจากการระดมทุนเลย
                                                    </li>
                                                    <li>
                                                        เก็บทั้งหมดที่ได้รับ (Keep-It-All) ซึ่งหมายถึงไม่ว่าโครงการจะสำเร็จหรือไม่ก็ตามโครงการนั้นจะได้รับเงินตามที่ระดมทุนได้จริง
                                                    </li>
                                                </ul>

                                                <h2>ปันปันเหมาะกับใคร</h2>
                                                <ul>
                                                    <li>ผู้มีจิตอาสา</li>
                                                    <li>ผู้ที่ต้องการบริจาคเพื่อลดหย่อนภาษี</li>
                                                    <li>มูลนิธีหรือหน่วยงานเพื่อการกุศล</li>
                                                    <li>ผู้ประสบปัญหา ต้องการความช่วยเหลือ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- Crowdfunding Tab -->
                                        <div class="tab-pane fade" id="crowdfunding-pills">
                                            <div class="card-block">
                                                <h2>การระดมทุนจากมวลชน (Crowdfunding)</h2>
                                                <p>การระดมทุนจากมวลชน (Crowdfunding) คือ การระดมเงินทุนเพื่อสนับสนุนโครงการในด้านงานประดิษฐ์ ผลงานต่าง ๆ หรือโครงการเพื่อสังคมจากคนจำนวนมาก โดยการระดมทุนมีหลายรูปแบบ ดังนี้ </p>
                                                <ul>
                                                    <li>
                                                        <strong>รูปแบบการบริจาค</strong>(Donation-based Crowdfunding) คือ การระดมทุนโดยผู้ระดมทุนไม่ได้รับสิ่งตอบแทน
                                                    </li>
                                                    <li>
                                                        <strong>รูปแบบการแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุน</strong> (Reward-based Crowdfunding) คือ การระดมทุนเพื่อแลกกับสิทธิประโยชน์หรือสิ่งของ
                                                    </li>
                                                    <li>
                                                        <strong>รูปแบบการกู้ยืม</strong> (Loan-based / Debt Crowdfunding) คือ การกู้เงินจากมวลชนไปใช้ตามวัตถุประสงค์ที่แจ้งไว้ โดยมีกำหนดการชำระคืนและจ่ายดอกเบี้ย
                                                    </li>
                                                    <li>
                                                        <strong>รูปแบบการเข้าหุ้น</strong> (Equity Crowdfunding) คือการเข้าหุ้นกัน โดยผู้ร่วมระดมทุนจะได้รับหุ้นของธุรกิจที่เราร่วมระดมทุนพร้อมทั้งโอกาสในการรับเงินปันผล
                                                    </li>
                                                </ul>
                                                <p>นอกจากนั้นการระดมทุนรูปแบบการบริจาคและรูปแบบแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุนสามารถแบ่งออกเป็น 2 ประเภท คือ </p>
                                                <ul>
                                                    <li>
                                                        <strong>ได้รับทั้งหมดหรือไม่ได้รับเลย</strong> (All-or-Nothing) ซึ่งหมายถึง หากโครงการไม่สำเร็จตามเป้าหมายที่ตั้งไว้ในระยะเวลาที่กำหนดเช่น ไม่ได้รับเงินระดมทุนตามที่วางแผนไว้ เป็นต้น โครงการนั้นจะไม่ได้รับเงินจากการระดมทุนเลย
                                                    </li>
                                                    <li>
                                                        <strong>เก็บทั้งหมดที่ได้รับ</strong> (Keep-It-All) ซึ่งหมายถึงไม่ว่าโครงการจะสำเร็จหรือไม่ก็ตามโครงการนั้นจะได้รับเงินตามที่ระดมทุนได้จริง
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- Punpun For Who Tab -->
                                        <div class="tab-pane fade" id="punpunforwho-pills">
                                            <div class="card-block">
                                                <h2>ปันปันเหมาะกับใคร</h2>
                                                <p><hr></p>
                                                <h5><i class="fa fa-users"> </i> ผู้มีจิตอาสา</h5>
                                                <p><small>สำหรับผู้ที่ xxxx สามารถขอใบลดหย่อนภาษีได้จากเจ้าของโครงการ หากโครงการนั้นเป็นของหน่วยงานที่สามารถออกใบลดหย่อนภาษีได้ และสามารถขอจากปันปันในอนาคต</small></p>
                                                <h5><i class="fa fa-users"> </i> ผู้ที่ต้องการบริจาคเพื่อลดหย่อนภาษี </h5>
                                                <p><small>สำหรับผู้ที่ xxxx สามารถขอใบลดหย่อนภาษีได้จากเจ้าของโครงการ หากโครงการนั้นเป็นของหน่วยงานที่สามารถออกใบลดหย่อนภาษีได้ และสามารถขอจากปันปันในอนาคต</small></p>
                                                <h5><i class="fa fa-users"> </i> มูลนิธีหรือหน่วยงานเพื่อการกุศล </h5>
                                                <p><small>สำหรับผู้ที่ xxxx สามารถขอใบลดหย่อนภาษีได้จากเจ้าของโครงการ หากโครงการนั้นเป็นของหน่วยงานที่สามารถออกใบลดหย่อนภาษีได้ และสามารถขอจากปันปันในอนาคต</small></p>
                                                <h5><i class="fa fa-users"> </i> ผู้ประสบปัญหา ต้องการความช่วยเหลือ</h5>
                                                <p><small>สำหรับผู้ที่ xxxx สามารถขอใบลดหย่อนภาษีได้จากเจ้าของโครงการ หากโครงการนั้นเป็นของหน่วยงานที่สามารถออกใบลดหย่อนภาษีได้ และสามารถขอจากปันปันในอนาคต</small></p>
                                            </div>
                                        </div>
                                        <!-- Fee Tab -->
                                        <div class="tab-pane fade" id="fee-pills">
                                            <div class="card-block">
                                                <h2>ค่าธรรมเนียม</h2>
                                                <p><hr></p>
                                                <h5><i class="fa fa-users"> </i> ค่าธรรมเนียม</h5>
                                                <p><small>สำหรับผู้ที่ xxxx สามารถขอใบลดหย่อนภาษีได้จากเจ้าของโครงการ หากโครงการนั้นเป็นของหน่วยงานที่สามารถออกใบลดหย่อนภาษีได้ และสามารถขอจากปันปันในอนาคต</small></p>
                                            </div>
                                        </div>
                                        <!-- Creation Tab -->
                                        <div class="tab-pane fade" id="create-pills">
                                            <div class="card-block">
                                                <h2>การระดมทุนจากมวลชน (Crowdfunding)</h2>
                                                <p>การระดมทุนจากมวลชน (Crowdfunding) คือ การระดมเงินทุนเพื่อสนับสนุนโครงการในด้านงานประดิษฐ์ ผลงานต่าง ๆ หรือโครงการเพื่อสังคมจากคนจำนวนมาก โดยการระดมทุนมีหลายรูปแบบ ดังนี้ </p>
                                                <ul>
                                                    <li>
                                                        รูปแบบการบริจาค (Donation-based Crowdfunding) คือ การระดมทุนโดยผู้ระดมทุนไม่ได้รับสิ่งตอบแทน
                                                    </li>
                                                    <li>
                                                        รูปแบบการแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุน (Reward-based Crowdfunding) คือ การระดมทุนเพื่อแลกกับสิทธิประโยชน์หรือสิ่งของ
                                                    </li>
                                                    <li>
                                                        รูปแบบการกู้ยืม (Loan-based / Debt Crowdfunding) คือ การกู้เงินจากมวลชนไปใช้ตามวัตถุประสงค์ที่แจ้งไว้ โดยมีกำหนดการชำระคืนและจ่ายดอกเบี้ย
                                                    </li>
                                                    <li>
                                                        รูปแบบการเข้าหุ้น (Equity Crowdfunding) คือการเข้าหุ้นกัน โดยผู้ร่วมระดมทุนจะได้รับหุ้นของธุรกิจที่เราร่วมระดมทุนพร้อมทั้งโอกาสในการรับเงินปันผล
                                                    </li>
                                                </ul>
                                                <p>นอกจากนั้นการระดมทุนรูปแบบการบริจาคและรูปแบบแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุนสามารถแบ่งออกเป็น 2 ประเภท คือ </p>
                                                <ul>
                                                    <li>
                                                        ได้รับทั้งหมดหรือไม่ได้รับเลย (All-or-Nothing) ซึ่งหมายถึง หากโครงการไม่สำเร็จตามเป้าหมายที่ตั้งไว้ในระยะเวลาที่กำหนดเช่น ไม่ได้รับเงินระดมทุนตามที่วางแผนไว้ เป็นต้น โครงการนั้นจะไม่ได้รับเงินจากการระดมทุนเลย
                                                    </li>
                                                    <li>
                                                        เก็บทั้งหมดที่ได้รับ (Keep-It-All) ซึ่งหมายถึงไม่ว่าโครงการจะสำเร็จหรือไม่ก็ตามโครงการนั้นจะได้รับเงินตามที่ระดมทุนได้จริง
                                                    </li>
                                                </ul>

                                                <h2>ปันปันเหมาะกับใคร</h2>
                                                <ul>
                                                    <li>ผู้มีจิตอาสา</li>
                                                    <li>ผู้ที่ต้องการบริจาคเพื่อลดหย่อนภาษี</li>
                                                    <li>มูลนิธีหรือหน่วยงานเพื่อการกุศล</li>
                                                    <li>ผู้ประสบปัญหา ต้องการความช่วยเหลือ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- Promote Tab -->
                                        <div class="tab-pane fade" id="promote-pills">
                                            <div class="card-block">
                                                <h2>การระดมทุนจากมวลชน (Crowdfunding)</h2>
                                                <p>การระดมทุนจากมวลชน (Crowdfunding) คือ การระดมเงินทุนเพื่อสนับสนุนโครงการในด้านงานประดิษฐ์ ผลงานต่าง ๆ หรือโครงการเพื่อสังคมจากคนจำนวนมาก โดยการระดมทุนมีหลายรูปแบบ ดังนี้ </p>
                                                <ul>
                                                    <li>
                                                        รูปแบบการบริจาค (Donation-based Crowdfunding) คือ การระดมทุนโดยผู้ระดมทุนไม่ได้รับสิ่งตอบแทน
                                                    </li>
                                                    <li>
                                                        รูปแบบการแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุน (Reward-based Crowdfunding) คือ การระดมทุนเพื่อแลกกับสิทธิประโยชน์หรือสิ่งของ
                                                    </li>
                                                    <li>
                                                        รูปแบบการกู้ยืม (Loan-based / Debt Crowdfunding) คือ การกู้เงินจากมวลชนไปใช้ตามวัตถุประสงค์ที่แจ้งไว้ โดยมีกำหนดการชำระคืนและจ่ายดอกเบี้ย
                                                    </li>
                                                    <li>
                                                        รูปแบบการเข้าหุ้น (Equity Crowdfunding) คือการเข้าหุ้นกัน โดยผู้ร่วมระดมทุนจะได้รับหุ้นของธุรกิจที่เราร่วมระดมทุนพร้อมทั้งโอกาสในการรับเงินปันผล
                                                    </li>
                                                </ul>
                                                <p>นอกจากนั้นการระดมทุนรูปแบบการบริจาคและรูปแบบแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุนสามารถแบ่งออกเป็น 2 ประเภท คือ </p>
                                                <ul>
                                                    <li>
                                                        ได้รับทั้งหมดหรือไม่ได้รับเลย (All-or-Nothing) ซึ่งหมายถึง หากโครงการไม่สำเร็จตามเป้าหมายที่ตั้งไว้ในระยะเวลาที่กำหนดเช่น ไม่ได้รับเงินระดมทุนตามที่วางแผนไว้ เป็นต้น โครงการนั้นจะไม่ได้รับเงินจากการระดมทุนเลย
                                                    </li>
                                                    <li>
                                                        เก็บทั้งหมดที่ได้รับ (Keep-It-All) ซึ่งหมายถึงไม่ว่าโครงการจะสำเร็จหรือไม่ก็ตามโครงการนั้นจะได้รับเงินตามที่ระดมทุนได้จริง
                                                    </li>
                                                </ul>

                                                <h2>ปันปันเหมาะกับใคร</h2>
                                                <ul>
                                                    <li>ผู้มีจิตอาสา</li>
                                                    <li>ผู้ที่ต้องการบริจาคเพื่อลดหย่อนภาษี</li>
                                                    <li>มูลนิธีหรือหน่วยงานเพื่อการกุศล</li>
                                                    <li>ผู้ประสบปัญหา ต้องการความช่วยเหลือ</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- Step Tab -->
                                        <div class="tab-pane fade" id="step-pills">
                                            <div class="card-block">
                                                <h2>การระดมทุนจากมวลชน (Crowdfunding)</h2>
                                                <p>การระดมทุนจากมวลชน (Crowdfunding) คือ การระดมเงินทุนเพื่อสนับสนุนโครงการในด้านงานประดิษฐ์ ผลงานต่าง ๆ หรือโครงการเพื่อสังคมจากคนจำนวนมาก โดยการระดมทุนมีหลายรูปแบบ ดังนี้ </p>
                                                <ul>
                                                    <li>
                                                        รูปแบบการบริจาค (Donation-based Crowdfunding) คือ การระดมทุนโดยผู้ระดมทุนไม่ได้รับสิ่งตอบแทน
                                                    </li>
                                                    <li>
                                                        รูปแบบการแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุน (Reward-based Crowdfunding) คือ การระดมทุนเพื่อแลกกับสิทธิประโยชน์หรือสิ่งของ
                                                    </li>
                                                    <li>
                                                        รูปแบบการกู้ยืม (Loan-based / Debt Crowdfunding) คือ การกู้เงินจากมวลชนไปใช้ตามวัตถุประสงค์ที่แจ้งไว้ โดยมีกำหนดการชำระคืนและจ่ายดอกเบี้ย
                                                    </li>
                                                    <li>
                                                        รูปแบบการเข้าหุ้น (Equity Crowdfunding) คือการเข้าหุ้นกัน โดยผู้ร่วมระดมทุนจะได้รับหุ้นของธุรกิจที่เราร่วมระดมทุนพร้อมทั้งโอกาสในการรับเงินปันผล
                                                    </li>
                                                </ul>
                                                <p>นอกจากนั้นการระดมทุนรูปแบบการบริจาคและรูปแบบแลกเปลี่ยนบางสิ่งบางอย่างกับเงินทุนสามารถแบ่งออกเป็น 2 ประเภท คือ </p>
                                                <ul>
                                                    <li>
                                                        ได้รับทั้งหมดหรือไม่ได้รับเลย (All-or-Nothing) ซึ่งหมายถึง หากโครงการไม่สำเร็จตามเป้าหมายที่ตั้งไว้ในระยะเวลาที่กำหนดเช่น ไม่ได้รับเงินระดมทุนตามที่วางแผนไว้ เป็นต้น โครงการนั้นจะไม่ได้รับเงินจากการระดมทุนเลย
                                                    </li>
                                                    <li>
                                                        เก็บทั้งหมดที่ได้รับ (Keep-It-All) ซึ่งหมายถึงไม่ว่าโครงการจะสำเร็จหรือไม่ก็ตามโครงการนั้นจะได้รับเงินตามที่ระดมทุนได้จริง
                                                    </li>
                                                </ul>

                                                <h2>ปันปันเหมาะกับใคร</h2>
                                                <ul>
                                                    <li>ผู้มีจิตอาสา</li>
                                                    <li>ผู้ที่ต้องการบริจาคเพื่อลดหย่อนภาษี</li>
                                                    <li>มูลนิธีหรือหน่วยงานเพื่อการกุศล</li>
                                                    <li>ผู้ประสบปัญหา ต้องการความช่วยเหลือ</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
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



    </body>
</html>
