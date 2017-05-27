<%--
    Document   : signup
    Created on : May 27, 2017, 1:23:10 AM
    Author     : kanok
--%>
<!DOCTYPE html>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Punpun: HTML5 App Not JSP</title>
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
                        <h1 class="auth-title"> สมัครสมาชิก </h1>
                    </header>

                    <div class="auth-content">
                        <p class="text-xs-center"></p>
                        <form id="signup-form" method="GET"action="signupServlet" novalidate="">
                            <div class="form-group"> <label for="firstname">ชื่อ - นามสกุล</label>
                                <div class="row">
                                    <div class="col-sm-6"> <input type="text" class="form-control underlined" name="firstname" id="firstname" placeholder="ชื่อจริง" required=""> </div>
                                    <div class="col-sm-6"> <input type="text" class="form-control underlined" name="lastname" id="lastname" placeholder="นามสกุล" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group"> <label for="email">อีเมล</label> <input type="email" class="form-control underlined" name="email" id="email" placeholder="กรอกอีเมลของคุณ" required=""> </div>
                            <div class="form-group"> <label for="password">รหัสผ่าน</label>
                                <div class="row">
                                    <div class="col-sm-6"> <input type="password" class="form-control underlined" name="password" id="password" placeholder="กรอกรหัสผ่าน" required=""> </div>
                                    <div class="col-sm-6"> <input type="password" class="form-control underlined" name="retype_password" id="retype_password" placeholder="กรอกรหัสผ่านอีกครั้ง" required=""> </div>
                                </div>
                            </div>
                            <div class="form-group"> <button type="submit" class="btn btn-block btn-primary"> ลงทะเบียน </button> </div>

                        </form>
                        <div class="form-group">
                            <p class="text-muted text-xs-center"> หรือ </p>
                        </div>
                        <div class="form-group"> <button type="submit" class="btn btn-block btn-info">Facebook</button> </div>
                        <div class="form-group"> <button type="submit" class="btn btn-block btn-warning">Google</button> </div>
                        <div class="form-group">
                            <p class="text-muted text-xs-center">มีบัญชีผู้ใช้อยู่แล้วหรือไม่? <a href="login.jsp">ลงชื่อเข้าใช้!</a></p>
                        </div>
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