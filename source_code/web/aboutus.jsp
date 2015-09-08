<%-- 
    Document   : About us - Thong tin doanh nghiep
    Author     : PhanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listing</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_listing.css" rel="stylesheet" type="text/css"/>
        <link href="css/mobile.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        
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
            };
        </script>
    </head>
    <body>                
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
                    <div class="menu-show">
                         <i style="font-size: 18px;margin-top: 5px;" class="fa fa-bars"></i>
                     </div>
                     <ul>
                        <core:choose>
                            <core:when test="${sessionScope.object ne null}">
                                <li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
                                <li><a href="${pageContext.request.contextPath}/ServletProfileLandClient?action=list">LISTINGS</a></li>
                                <li><a href="${pageContext.request.contextPath}/customerinvoice.jsp">BUYING</a></li>
                                <li><a href="${pageContext.request.contextPath}/customerorder.jsp">CONTACT US</a></li>
                                <li><a href="${pageContext.request.contextPath}/aboutme.jsp">ABOUT ME</a></li>
                                <li><a href="${pageContext.request.contextPath}/login.html?action=logout">LOGOUT</a></li>
                            </core:when>
                            <core:otherwise>
                                <li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
                                <li><a href="${pageContext.request.contextPath}/ServletProfileLandClient?action=list">LISTINGS</a></li>
                                <li><a href="${pageContext.request.contextPath}/serviceserrorclient.jsp">GALAXY</a></li>
                                <li><a href="${pageContext.request.contextPath}/customerorder.jsp">CONTACT US</a></li>
                                <li><a href="${pageContext.request.contextPath}/aboutus.jsp">ABOUT US</a></li>
                                <li><a href="${pageContext.request.contextPath}/admin/login.jsp">SIGN IN</a></li>
                            </core:otherwise>
                        </core:choose> 
                     </ul>           
                 </nav>
                <div class="clear"></div>
            </header>
                            
            <div id="title-listing">
                <h1>List of projects</h1>
            </div>
                            
            <div id="container-title">
                <!-- Noi dung -->
            </div>
              
            <div class="clear"></div>

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
                                    <li><a href="#">Infomation</a></li>
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
                                <p>under logo text</p>
                            </div>
                        </div>
                    </div>
                   

                </div>

            </footer>
        </div>
    </body>
</html>
