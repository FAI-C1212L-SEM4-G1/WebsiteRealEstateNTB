<%-- 
    Document   : Detail Profile Land - Chi tiet du an
    Author     : PhanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Land Details</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_detail.css" rel="stylesheet" type="text/css"/>
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <link href="css/mobile.css" rel="stylesheet" type="text/css"/>   
        
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
            <section id="content">
                <div class="container">
                    <h1 class="mainTitle">Project details</h1>
                    <div class="listingTop cf">
                        <div class="listingSlider">
                            <img src="images/${requestScope.object.image}" alt="" title="Image ${requestScope.object.name}" style="height: 100%; width: 100%;"/>
                        </div>
                        <div class="listingEntry">
                            <h1 class="listingEntry__title">${requestScope.object.name}</h1>
                            <p style="display: block; margin-top: 20px;">${requestScope.object.introduction}</p>
                            <ul class="details">
                                <li class="details__item">
                                    <i class="fa fa-map-marker"></i>
                                    ${requestScope.object.codeRegional.city}
                                </li>
                                <li class="details__item">
                                    <i class="fa fa-calendar"></i>
                                    ${requestScope.object.dateStart}
                                </li>
                                <li class="details__item">
                                    <i class="fa fa-building-o"></i>
                                    ${requestScope.object.typeOf}
                                </li>
                                <li class="details__item">
                                    <i class="fa fa-usd"></i>
                                    ${requestScope.object.codeRegional.unitPrice}
                                </li>
                            </ul>
                            <div class="listingEntry__price">$ ${requestScope.object.codeRegional.unitPrice}</div>
                            <div class="Oder">
                                <a href="${pageContext.request.contextPath}/ServletProfileLandClient?action=register&code=${requestScope.object.code}">Register</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>                    
                    <p style="margin: 20px;">${requestScope.object.description}</p>
                    <hr class="line_secondType" style="margin: 10px 0px;">
                    <h1 class="titleSecondType">Features</h1>
                    <ul class="markeredList">
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Name of project</b>:&nbsp;<span>${requestScope.object.name}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Location detail</b>:&nbsp;<span>${requestScope.object.location}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Project type</b>:&nbsp;<span>${requestScope.object.typeOf}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Total building area</b>:&nbsp;<span>${requestScope.object.totalArea}&nbsp;m2</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Total investment planned</b>:&nbsp;<span>$${requestScope.object.capitalInvestment}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Land project status</b>:&nbsp;<span>${requestScope.object.currentStatus}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Population size estimates</b>:&nbsp;<span>${requestScope.object.populationSize}&nbsp;people</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Total rooms</b>:&nbsp;<span>${requestScope.object.totalRoom}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Total floors</b>:&nbsp;<span>${requestScope.object.totalFloor}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>The average room area</b>:&nbsp;<span>${requestScope.object.roomArea}&nbsp;m2</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Date of commencement</b>:&nbsp;<span>${requestScope.object.dateStart}</span></li>
                            <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i><b>Expected completion date</b>:&nbsp;<span>${requestScope.object.dateEnd}</span></li>
                    </ul>
                    <div id="secondMap" style="position: relative; background-color: rgb(229, 227, 223); overflow: hidden;">
                    </div>                    
                    <div class="map_housing">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d8857.50163386489!2d105.78625163852972!3d21.0278565262789!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e6!4m5!1s0x3135ab4d2797975f%3A0x6d0fba1dc994204a!2zVMO0biBUaOG6pXQgVGh1eeG6v3Q!3m2!1d21.0278384!2d105.7834778!4m5!1s0x3135ab9bd9861ca1%3A0xe7887f7b72ca17a9!2zSMOgIE5vaSwgSG_DoG4gS2nhur9tLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d21.0277644!2d105.8341598!5e0!3m2!1svi!2s!4v1439807464901" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
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
                                <p>under logo text</p>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>

                </div>

            </footer>
        </div>
    </body>
</html>
