<%-- 
    Document   : detail
    Created on : Aug 12, 2015, 5:19:00 PM
    Author     : sang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/style_detail.css" rel="stylesheet" type="text/css"/>
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="javascript.js" type="text/javascript"></script>

    </head>
    <body>
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
                <nav id="menu">
                    <div class="menu-content">


                        <ul class="list-menu">
                            <li><a href="#">HOME</a></li>
                            <li><a href="#">LISTING</a></li>
                            <li><a href="#">AGENT</a></li>
                            <li><a href="#">BLOG</a></li>
                            <li><a href="#">ABOUT US</a></li>
                            <li><a href="#">CONTACT</a></li>
                            <li><a href="#">GALLERY</a></li>



                        </ul> 
                    </div>
                </nav>
                <div class="clear"></div>
            </header>
            <section id="content">

                <div class="container">
                    <h1 class="mainTitle">Listing</h1>
                    <div class="listingTop cf">
                        <div class="listingSlider">
                            
                        </div>
                        <div class="listingEntry">
                            <h1 class="listingEntry__title">Newtown Square, PA</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form alteration in some form, by injected</p>
                            <ul class="details">
                                <li class="details__item">
                                   <i class="fa fa-map-marker"></i>
                                    Amsterdam
                                </li>
                                <li class="details__item">
                                    <i class="fa fa-arrows-alt"></i>
                                    2 800 Sq Ft
                                </li>
                                <li class="details__item">
                                   <i class="fa fa-car"></i>
                                    Garrage
                                </li>
                                <li class="details__item">
                                    <i class="fa fa-wifi"></i>
                                    Internet
                                </li>
                            </ul>
                            <div class="listingEntry__price">$ 120 000</div>
                            <div class="Oder">
                                <a href="order.jsp">Oder</a>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                    <hr class="line_secondType">
                    <h1 class="titleSecondType">Features</h1>
                    
                    <ul class="markeredList">
                        <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i>In an ideal world this website wouldn’t exist</li>
                        <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i>Needless to say it’s very important, content is king and people are beginning to understand tha</li>
                        <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i>However, back over in reality some project schedules and with the web copy.</li>
                        <li class="markeredList__item"><i style="color: #70ccde;margin-right: 5px;" class="fa fa-star"></i>We want you think about how numbers, symbols and bullet points will look.</li>
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
