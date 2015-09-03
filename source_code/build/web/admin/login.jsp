<%-- 
    Document   : Form Login Website
    Author     : PhanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login NTB System</title>
        <link href="${pageContext.request.contextPath}/font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

        <link href="${pageContext.request.contextPath}/css/style_login_user.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wapper">
            <div class="container">
                <div class="register-main-top">
                    <div class="title-register">
                        <span><i class="fa fa-th" style="padding:0px 10px 0px 10px; font-size:26px;"></i>SIGN IN</span>
                    </div>
                </div>
                <div class="register-main">
                    <form class="main-form" action="${pageContext.request.contextPath}/login.html" method="POST">
                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-user"></i>
                            </span>
                            <input class="validate[required] form-control" type="text" placeholder="Username" name="txtUsername">
                        </div>

                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-key"></i>
                            </span>
                            <input class="validate[required,custom[email]] form-control" type="password" placeholder="Password" name="txtPassword">
                            <input type="hidden" value="#" name="url">
                        </div>

                        <div class="submit">
                            <button class="btn-submit" type="submit" name="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
