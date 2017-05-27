<%--
    Document   : login
    Created on : May 14, 2017, 7:47:35 PM
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
        <div class="auth">
            <div class="auth-container">
                <div class="card">
                    <header class="auth-header">
                        <h1 class="auth-title"> ลงชื่อเข้าใช้ </h1>
                    </header>
                    <div class="auth-content">
                        <form id="login-form" action="loginServlet" method="GET" novalidate="">
                            <div class="form-group"> <label for="username">ชื่อผู้ใช้</label> <input type="text" class="form-control underlined" name="email" id="username" placeholder="ชื่อผู้ใช้ของคุณ" required> </div>
                            <div class="form-group"> <label for="password">รหัสผ่าน</label> <input type="password" class="form-control underlined" name="password" id="password" placeholder="รหัสผ่านของคุณ" required> </div>
                            <div class="form-group">
                                <label for="remember">
                                    <input class="checkbox" id="remember" type="checkbox">
                                    <span>จำฉันไว้</span>
                                </label> <a href="forgot-password.jsp" class="forgot-btn pull-right">ลืมรหัสผ่าน?</a>
                            </div>
                            <div class="form-group"> <button type="submit" class="btn btn-block btn-primary">ลงชื่อเข้าใช้</button></div>
                            <div class="form-group">
                                <p class="text-muted text-xs-center">ไม่มีบัญชีผู้ใช้? <a href="signup.jsp">สมัครเลยที่นี่!</a></p>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="text-xs-center">
                    <a href="javascript:history.back()" class="btn btn-secondary rounded btn-sm"> <i class="fa fa-arrow-left"></i> กลับไปหน้าก่อน </a>
                </div>
            </div>
        </div>

        <!-- Script -->
        <script src="assets/js/vendor.js"></script>
        <script src="assets/js/app.js"></script>
    </body>
</html>
