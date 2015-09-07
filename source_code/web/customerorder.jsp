<%-- 
    Document   : Customer Send Information Register Buy Land
    Author     : PhanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register information</title>
        <link href="css/style_oder.css" rel="stylesheet" type="text/css"/>
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/mobile.css" rel="stylesheet" type="text/css"/>

        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </head>
    <body>
        <div class="wapper">
            <div class="container">
                <div class="register-main-top">
                    <div class="title-register">                        
                        <span style="text-transform: uppercase; font-family: sans-serif;"><i class="fa fa-th" style="padding:0px 10px 0px 10px; font-size:26px;"></i>Register information</span>
                    </div>
                </div>
                <div class="register-main">
                    <core:if test="${sessionScope.modelManage==null}">
                        <jsp:useBean id="modelManage" class="vn.javaweb.real.estate.model.ConfigConnection" scope="session" />
                    </core:if>
                    <form class="main-form" action="ServletCustomerClient" method="POST">
                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-thumb-tack"></i>
                            </span>
                            <select class="intro-form-select" id="codeProfileLand" name="codeProfileLand">                                 
                                <core:forEach items="${modelManage.profileLandModelManage.findAll()}" var="profileLand">
                                    <option value="${profileLand.code}" <core:if test="${object.code eq profileLand.code}">selected</core:if>>${profileLand.name}</option>
                                </core:forEach>
                            </select>
                        </div>

                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-hand-o-right"></i>
                            </span>
                            <input class="validate[required] form-control" type="text" placeholder="Number home - floor" name="codeHome">
                        </div>        

                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-barcode"></i>
                            </span>
                            <input class="validate[required] form-control" type="text" placeholder="Person ID" name="txtPersonId">
                        </div>

                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-user"></i>
                            </span>
                            <input class="validate[required] form-control" type="text" placeholder="Full Name" name="txtFullname">
                        </div>

                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-envelope"></i>
                            </span>
                            <input class="validate[required,custom[email]] form-control" type="text" placeholder="Email" name="txtEmail">
                            <input type="hidden" value="#" name="url">
                        </div>

                        <div class="intro-form-input">
                            <span class="intro-form-input-ico">
                                <i class="fa fa-phone"></i>
                            </span>
                            <input class="validate[required,custom[phone]] form-control" type="text" placeholder="Telephone" name="txtTel">
                            <input type="hidden" value="#" name="url">
                        </div>

                        <div class="intro-form-input">
                            <textarea class="validate[required]" style=" width:99%;height:100px;border:1px solid #fff;border-radius:5px;" placeholder=" Address details ..." name="txtAddress"></textarea>
                        </div>

                        <div class="submit">
                            <button class="btn-submit" type="submit" name="action" value="CustomerSubmit">Submit</button>
                            <button class="btn-submit" value="Back" onclick="goBack()" style="width: 70px;">Back</button>
                        </div>
                    </form>
                </div>
            </div> 
        </div>
    </body>
</html>
