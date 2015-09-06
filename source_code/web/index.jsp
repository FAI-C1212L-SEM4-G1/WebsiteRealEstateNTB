<%-- 
    Document   : Homepage
    Author     : PhanAnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device width,initial-scale=1" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/slider-show/css/nivo-slider.css" rel="stylesheet" type="text/css"/>
        <script src="css/slider-show/js/jquery.js" type="text/javascript"></script>
        <script src="css/slider-show/js/jquery.nivo.slider.pack.js" type="text/javascript"></script>

        <link href="css/mobile.css" rel="stylesheet" type="text/css"/>

        <script>
            $(window).load(function () {
                $('#slideshow').nivoSlider({
                    effect: 'random',
                    slices: 15,
                    boxCols: 8,
                    boxRows: 8,
                    animSpeed: 500,
                    pauseTime: 4000,
                    directionNav: false,
                    directionNavHide: false,
                    controlNav: true,
                    captionOpacity: 0.9
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
        <title>National Territory Builders</title>
    </head>

    <body>
        <script>
            $(function () {

                $('.menu-show').click(function () {
                    $('nav ul').toggleClass('showing');

                });

            });
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
                                <span style="color:#fff"><i class="fa fa-phone"></i> Hotline: +84933 0866 89</span>
                            </div>
                            <div class="email">
                                <span style="color:#5cb4c5;"><i class="fa fa-envelope-o"></i> Contact: NTBbuilders@express.com</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>

                <nav>
                    <div class="menu-show">
                        <i style="font-size: 18px;margin-top: 5px;" class="fa fa-bars"></i>
                    </div>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
                        <li><a href="${pageContext.request.contextPath}/ServletProfileLandClient?action=list">LISTINGS</a></li>
                        <li><a href="#">GALAXY</a></li>
                        <li><a href="${pageContext.request.contextPath}/customerorder.jsp">CONTACT US</a></li>
                        <li><a href="#">ABOUT US</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/login.jsp">SIGN IN</a></li>
                    </ul>
                </nav>
                <div class="clear"></div>
            </header>
            <div id="slideshow" class="nivoSlider">
                <img style="display: none;"  src="images/slider1.jpg" alt="" title="#htmlcaption-3"/>
                <img style="display: none;" src="images/slide-06.jpg" alt="" title="htmlcaption-1"/>
            </div>
            <div class="clear"></div>
            <section id="abount">
                <div class="container">
                    
                    <div class="abount-top">
                        <h1>National Territory Builders Company global presence with many historical buildings</h1>
                    </div>
                    
                    <div class="abount-content">
                        <span>NATIONAL TERRITORY BUILDERS is one of the leading companies operating in the field of real estate business –consulting-managing-and marketing. We offer best services in the Real Estate in Vietnam to satisfy various needs from customers. Currently, we focus on product groups of apartment, Office Building, Villa which have been selected from a number of property development projects in Hanoi City. We maintain and develop professional, high quality, and committed staff having customer service skills and knowledge of real estate market. Meeting us, customers will be satisfied and feel confident of their decisions.</span>
                    </div>
                    
                    <div class="abount-footer">
                        
                        <div class="box1-abount">
                            <i style="font-size: 80px;float: left;margin-right:5px;color:#5cb4c5"  class="fa fa-television"></i>
                            <h3>Quick and easy search</h3>
                            <span>Providing the latest projects, customers can search the individual needs quickly convenient</span>
                        </div>
                        
                        <div class="box2-abount">
                            <i style="font-size: 80px;float: left;margin-right:5px;color:#5cb4c5"  class="fa fa-heartbeat"></i>
                            <h3>Good after-sales service</h3>
                            <span>We always meet the needs of customers with the best price and service after the sale of the best</span>
                        </div>
                        
                        <div class="box3-abount">
                            <i style="font-size: 80px;float: left;margin-right:5px;color:#5cb4c5" class="fa fa-bullhorn"></i>
                            <h3>Development goals</h3>
                            <span>We expanded global building with the desire to provide comprehensive solutions for real estate</span>
                        </div>
                        
                    </div>

                </div>
            </section>
            <div class="clear"></div>
            
            <core:if test="${sessionScope.modelManage==null}">
                <jsp:useBean id="modelManage" class="vn.javaweb.real.estate.model.ConfigConnection" scope="session" />
            </core:if>
            
            <section id="houses">
                <div class="houses__header">
                    <div class="houses-container">
                        <h1>The latest project</h1>
                        <p>List of the latest projects that we are building is shown below may be where future bustling center you desire<br/> Take a look and contact us to have the house and the best price</p>
                    </div>
                </div>

                <div class="houses_list">
                    <core:forEach items="${sessionScope.modelManage.profileLandModelManage.findBetween(0, 4)}" var="profileLand" >
                        <core:set var="lengthIntroduction" value="${fn:length(profileLand.introduction)}" />
                        <core:choose>
                            <core:when test="${lengthIntroduction ge 100}" >
                                <core:set var="introduction" value="${fn:substring(profileLand.introduction, 0, 100)}" />
                            </core:when>
                            <core:when test="${lengthIntroduction le 5}" >
                                <core:set var="introduction" value="The data for the project has not been fully provided. We'll update the article as soon as possible. Sorry for inconvenience" />
                            </core:when>
                            <core:otherwise>
                                <core:set var="introduction" value="${profileLand.introduction}" />
                            </core:otherwise>
                        </core:choose>
                        <article class="box-house">
                            <div class="houses-images">
                                <img src="images/${profileLand.image}" alt="This is image ${profileLand.name}" title="${profileLand.name}" style="height: 216px; border-top-left-radius: 5px; border-bottom-left-radius: 5px;"/>
                            </div>
                            <div class="houses-title">
                                <h1>${profileLand.name}</h1>
                                <p>${introduction} ...</p>
                                <span>$&nbsp;${profileLand.codeRegional.unitPrice}</span><br>
                                <a class="house__more" href="${pageContext.request.contextPath}/ServletProfileLandClient?action=details&code=${profileLand.code}">Details</a>
                            </div>
                        </article>
                    </core:forEach>                                                          
                </div>
            </section>
            <div class="clear"></div>
            <section id="contact">
                <div class="container-contact">
                    <div class="container-contact-left">
                        <div class="title-contact">
                            <h1>Seller reputable</h1>
                        </div>
                        <div class="box-contact">
                            <core:forEach items="${modelManage.accountModelManage.getSellers(3)}" var="account" >
                                <div class="box-contact-box">                                
                                    <div class="images-contact">
                                        <img src="images/${account.person.avatar}" alt="This is images ${account.person.fullname}"/>
                                    </div>
                                    <div class="title-contact">
                                        <span>${account.person.fullname}</span>
                                        <p>Business staff</p>
                                        <ul class="list-agent">
                                            <li class="social__item">
                                                <a class="icon_twitter" target="_blank" href="#"><i style="font-size: 20px;" class="fa fa-twitter-square"></i></a>
                                            </li>
                                            <li class="social__item">
                                                <a class="icon_facebook" target="_blank" href="#"><i style="font-size: 20px;" class="fa fa-facebook-square"></i></a>
                                            </li>
                                            <li class="social__item">
                                                <a class="icon_instagram" target="_blank" href="#"><i style="font-size: 20px;" class="fa fa-instagram"></i></a>
                                            </li>
                                            <li class="social__item">
                                                <a class="icon_email" target="_blank" href="#"><i style="font-size: 20px;" class="fa fa-envelope-o"></i></a>
                                            </li>
                                        </ul>
                                    </Div>
                                </div>
                            </core:forEach>
                        </div>
                    </div>
                    <div class="container-contact-right">
                        <h1 class="title-contact_-title">Introduce</h1>
                        <core:forEach items="${modelManage.accountModelManage.getSellers(3)}" var="account" >
                            <div class="box-contact-right">
                                <h1>${account.person.fullname}</h1>
                                <p>${account.person.note}</p>
                            </div>                            
                        </core:forEach>
                    </div>
                </div>
            </section>
            <div class="clear"></div>
            <section id="blog">

                <div class="container-blog">
                    <div class="title-blog-show">
                        <h1>Newsletter & Magazine</h1>
                    </div>
                    <article class="blog-show">
                        <div class="images-blog-show">
                            <img src="images/blog1.jpg"/>
                        </div>
                        <div class="title-blog">
                            <h1><a href="#">What is lorem ipsum?</a></h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the
                                majority have suffered alteration in some form alteration in some form, by
                                injected humour, or randomised words which don't look even slightly</p>
                            <p>
                                <time class="blogPost__date" datetime="2014-07-25">25 july 2015</time>
                                <span class="postBlog__author">John Braff</span>

                            </p>
                        </div>
                    </article>
                    <article class="blog-small">
                        <div class="box-blog-small">
                            <div class="images-box-blog-smail">
                                <img src="images/blog2.jpg"/>
                            </div>
                            <div class="title-box-blog-smail">
                                <h1><a href="#">What is lorem ipsum?</a></h1>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form</p>
                                <p>
                                    <time class="blogPost__date" datetime="2014-07-25">25 july 2015</time>
                                    <span class="postBlog__author">John Braff</span>

                                </p>
                            </div>
                        </div>

                        <div class="box-blog-small">
                            <div class="images-box-blog-smail">
                                <img src="images/blog3.jpg"/>
                            </div>
                            <div class="title-box-blog-smail">
                                <h1><a href="#">What is lorem ipsum?</a></h1>
                                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form</p>
                                <p>
                                    <time class="blogPost__date" datetime="2014-07-25">25 july 2015</time>
                                    <span class="postBlog__author">John Braff</span>

                                </p>
                            </div>
                        </div>
                    </article>
                </div>
            </section>
            <div class="clear"></div>
            <section id="partner">
                <div class="container-partner">
                    <div class="partner-top">
                        <h1>Manage payment</h1>
                        <p>We link to many global banks, customers pay a transfer and management track project progress and financial online here</p>

                    </div>
                    <div class="partner-footer">
                        <ul class="list-partner">
                            <li><a href="#">
                                    <img src="images/partner1.png"/>
                                </a>
                            </li>
                            <li><a href="#">
                                    <img src="images/partner2.png"/>
                                </a>
                            </li>
                            <li><a href="#">
                                    <img src="images/partner1.png"/>
                                </a>
                            </li>
                            <li><a href="#">
                                    <img src="images/partner2.png"/>
                                </a>
                            </li>
                            <li><a href="#">
                                    <img src="images/partner1.png"/>
                                </a>
                            </li>
                            <li><a href="#">
                                    <img src="images/partner2.png"/>
                                </a>
                            </li>
                        </ul>

                    </div>
                </div>
            </section>
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
                    <div class="clear"></div>

                </div>

            </footer>
        </div>

    </body>
</html>
