<%-- 
    Document   : Listing
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
        <script src="javascript.js" type="text/javascript"></script>
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
    };
</script>
        
        <div id="wapper">
            <header id="header">
                <div id="top">
                    <div class="top-content">
                        <div class="top-content-left">
                            <i style="color:#5cb4c5; " class="fa fa-map-marker"></i><span style="color: #fff;font-size: 13px;font-weight: bold"> Time City:</span><span style="color:#5cb4c5; "> Amsterdam</span>
                        </div>
                        <div class="top-content-logo">

                            <img src="images/logo.png" alt=""/>
                        </div>
                        <div class="top-content-right">
                            <div class="phone">
                                <span style="color:#fff"><i class="fa fa-phone"></i> 01666202886</span>
                            </div>
                            <div class="email">
                                <span style="color:#5cb4c5;"><i class="fa fa-envelope-o"></i> admin@gmail.com</span>

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
                <li><a href="${pageContext.request.contextPath}/listing.jsp">LISTINGS</a></li>
                <li><a href="#">GALAXY</a></li>
                <li><a href="${pageContext.request.contextPath}/customerorder.jsp">CONTACT US</a></li>
                <li><a href="#">ABOUT US</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/login.jsp">SIGN IN</a></li>
            </ul>
           
        </nav>
                <div class="clear"></div>
            </header>
            <div id="title-listing">
                <h1>listing</h1>
            </div>
            <div id="container-title">
                <section class="title-top">
                    <form class="form-filter" action="index.jsp" method="POST">
                        <ul class="list-filter">
                            <li>
                               <label>Location</label>
                            </li>
                            <li>
                        <select class="list-option-filter1">
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                             
                        </select>
                            </li>
                            <li>
                                 <label>Property type:</label>
                            </li>
                            <li>
                            <select class="list-option-filter1">
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            </select>
                            </li>
                             <li>
                                 <label>Rooms:</label>
                            </li>
                            <li>
                             <select class="list-option-filter2">
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            </select>
                            </li>
                              <li>
                                 <label>Beds:</label>
                            </li>
                            <li>
                             <select class="list-option-filter2">
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            <option>thứ 1</option>
                            </select>
                            </li>
                            
                        <ul>
                            <input id="filter" class="filter" type="submit" value="filter"/>
                    </form>
                </section>
                <section id="houses">
                  <div class="houses_list">
                    <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span><br>
                            <a class="house__more" href="detail.jsp">More</a>

                        </div>
                    </article>
                    <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span></br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                    <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span></br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                    <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span><br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                      <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span><br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                      <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span><br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                      <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span><br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                      <article class="box-house">
                        <div class="houses-images">
                            <img src="images/01.png" alt="this is images"/>
                        </div>
                        <div class="houses-title">
                            <h1>Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                            <span>$ 120 000</span><br>
                            <a class="house__more" href="#">More</a>

                        </div>
                    </article>
                    
                
                    
                </div>
                    <div class="container-page-list">
                        <ul class="page-list">
                            <li><a class="back-list" href="#"><i class="fa fa-angle-left"></i></a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">6</a></li>
                            <li><a class="next-list" href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </div>
                </section>
                
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
