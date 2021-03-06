<%-- 
    Document   : About me
    Author     : PhanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Customer</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_detail.css" rel="stylesheet" type="text/css"/>
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link href="css/mobile.css" rel="stylesheet" type="text/css"/>         
        <link href="css/css_thongtincanhan.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <script>
            $(function () {

                $('.menu-show').click(function () {
                    $('nav ul').toggleClass('showing');
                });
            });
            function kiemtra()
            {
                $(".insBackToTop").click(function () {
                    $("html, body").animate({scrollTop: 0}, 800);
                    return false;
                });
            }
            ;
        </script>
        <div id="wapper">
            <header id="header">
                <div id="top">
                    <div class="top-content">
                        <div class="top-content-left">
                            <i style="color:#5cb4c5; " class="fa fa-map-marker"></i><span style="color: #fff;font-size: 13px;font-weight: bold"> Time City:</span><span style="color:#5cb4c5; "> Hanoi, Vietnam</span>
                        </div>
                        <div class="top-content-logo">

                            <img src="images/logo.png" alt=""/>
                        </div>
                        <div class="top-content-right">
                            <div class="phone">
                                <span style="color:#fff"><i class="fa fa-phone"></i>&nbsp; Hotline: +84933 0866 89</span>
                            </div>
                            <div class="email">
                                <span style="color:#5cb4c5;"><i class="fa fa-envelope-o"></i> Contact: NTBbuilders@express.com</span>
                            </div>
                            <core:if test="${sessionScope.object ne null}">
                                <div>
                                    <span style="color: white; font-size: 20px;"><i class="fa fa-user" style="margin-top: 10px;"></i> Hello!&nbsp;${sessionScope.object.username.person.fullname}</span>
                                </div>
                            </core:if>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
                <nav>
                    <div class="menu-show" style="font-size: 18px;margin-top: 5px;"></div >
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
                        <li><a href="${pageContext.request.contextPath}/ServletProfileLandClient?action=list">LISTINGS</a></li>
                        <li><a href="${pageContext.request.contextPath}/customerinvoice.jsp">BUYING</a></li>
                        <li><a href="${pageContext.request.contextPath}/customerorder.jsp">CONTACT US</a></li>
                        <li><a href="${pageContext.request.contextPath}/aboutme.jsp">ABOUT ME</a></li>
                        <li><a href="${pageContext.request.contextPath}/login.html?action=logout">LOGOUT</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </header>
            <section id="content">
                <div class="title-infomation-user">
                    <span>Profile Information</span>
                </div>
                <hr style="margin-bottom: 20px;"/>
                <div class="content">
                    <div class="content-left">
                        <core:choose>
                            <core:when test="${sessionScope.object.username.person.avatar ne null && sessionScope.object.username.person.avatar ne ''}">
                                <img src="images/${sessionScope.object.username.person.avatar}" alt="infomation"/>
                            </core:when>
                            <core:otherwise>
                                <img src="images/profile-pic.jpg" alt=""/>
                            </core:otherwise>
                        </core:choose>
                    </div>
                    <div class="content-right">
                        <table>                            
                            <tr>
                                <td><span>Username</span></td>
                                <td><input type="text" value="${sessionScope.object.username.loginId}" readonly /></td>
                            </tr> 
                            <tr>
                                <td><span>Person ID</span></td>
                                <td><input type="text" value="${sessionScope.object.username.person.id}" readonly /></td>
                            </tr>
                            <tr>
                                <td><span>Full name</span></td>
                                <td><input type="text" value="${sessionScope.object.username.person.fullname}" readonly /></td>
                            </tr>
                            <tr>
                                <td><span>Gender</span></td>
                                <td><input type="text" value="${sessionScope.object.username.person.gender}" readonly /></td>
                            </tr>
                            <tr>
                                <td><span>Birthday</span></td>
                                <td><input type="text" value="${sessionScope.object.username.person.birthday}" readonly /></td>
                            </tr>
                            <tr>
                                <td><span>Tel</span></td>
                                <td><input type="text" value="${sessionScope.object.username.person.tel}" readonly /></td>
                            </tr>
                            <tr>
                                <td><span>Email</span></td>
                                <td><input type="text" value="${sessionScope.object.username.person.email}" readonly /></td>
                            </tr>
                            <tr>
                                <td><span>Address</span></td>
                                <td>
                                    <textarea>${sessionScope.object.username.person.address}</textarea>
                                </td>
                            </tr>                            
                            <tr>
                                <td><span>Note</span></td>
                                <td><textarea style="height: 120px;">${sessionScope.object.username.person.note}</textarea></td>
                            </tr>                                                        
                        </table>
                    </div>
                </div>
            </section>

            <footer id="footer">
                <div class="container-footer">
                    <div class="footer-top">
                        <section class="footer-top-left">
                            <div class="information">
                                <h1>Information</h1>
                                <ul>
                                    <li><a href="#">About company</a></li>
                                    <li><a href="#">Our team</a></li>
                                    <li><a href="#">Registration</a></li>
                                    <li><a href="#">Payment Option</a></li>
                                    <li><a href="#">Information</a></li>
                                    <li><a href="#">FAQ</a></li>
                                </ul>
                            </div>
                            <div class="useful-link">
                                <h1>Useful links</h1>
                                <ul>

                                    <li><a href="#">Homepage</a></li>
                                    <li><a href="#">404 page</a></li>
                                    <li><a href="#">Grid system</a></li>
                                    <li><a href="#">Our agents</a></li>
                                    <li><a href="#">Typography</a></li>
                                    <li><a href="#">Sitemap</a></li>
                                </ul>
                            </div>

                            <div class="contact">
                                <h1>Contact</h1>
                                <ul>
                                    <li><a href="#"><i style="margin-right: 5px"  class="fa fa-phone-square"></i>01666202886</a></li>
                                    <li><a href="#"><i style="margin-right: 5px;" class="fa fa-envelope-o"></i>admin@fpt.aptech.ac.vn</a></li>
                                    <li><a href="#"><i style="margin-right: 5px;" class="fa fa-map-marker"></i>Ton that thuyet-Ha Noi</a></li>

                                </ul>
                                <ul class="list-link-mangxahoi">
                                    <li class="facebook"><a href="#"><i  class="fa fa-facebook-square"></i></a></li>
                                    <li class="youtube"><a href="#"><i class="fa fa-youtube-square"></i></a></li>
                                    <li class="google"><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
                                    <li class="twitter"><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                                    <li class="instagram"><a href="#"><i class="fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                            <div class="clear"></div>
                            <div class="footer-top-left-text">
                                <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making
                                    this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a 
                                    handful of model sentence structures.</p>
                            </div>
                        </section>

                        <section class="footer-top-right">
                            <form class="form-message" action="index.html" method="POST">
                                <span> Your name</span><br>
                                <input type="text" name="yourname" id="yourname" /><br>
                                <span>Email</span><br>

                                <input type="text" name="email" id="email" /><br>
                                <span>Massage</span></br>
                                <textarea name="massage" id="massage">
                                      
                                </textarea>
                                <input id="submit" type="submit" value="SEND MESSAGE"/>

                            </form>
                        </section>
                    </div>
                    <div class="clear"></div>
                    <div class="footer-content">
                        <div class="clear"></div>

                        <div class="back-top">
                            <a class="insBackToTop" onclick="kiemtra()" href="#"><i class="fa fa-angle-up"></i></a>
                        </div>
                    </div>
                    <div class="footer-bottom">
                        <div class="copyright">© 2014 - All Rights Reserved </div>
                        <div class="footerLogo">
                            <a href="index.html">
                                <img src="images/logo_secondType.png" all="fpt.aptech.ac.vn">
                            </a>
                            <div class="Logo">
                                <p>- Real Estate -</p>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </footer>
        </div>
    </body>
</html>
