<%-- 
    Document   : index
    Created on : Aug 7, 2015, 10:12:15 AM
    Author     : sang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device width,initial-scale=1" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
       
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <script src="javascript.js" type="text/javascript"></script>
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
        </script>
        <title>Housing</title>
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
            </div >
            <ul   >
                <li><a href="#">Home</a></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Home</a></li>
                <li><a href="#">Home</a></li>
                   
     
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
                        <h1>There are many variations of passages of Lorem Ipsum available</h1>

                    </div>
                    <div class="abount-content">
                        <span>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span>

                    </div>
                    <div class="abount-footer">

                        <div class="box1-abount">

                            <i style="font-size: 80px;float: left;margin-right:5px;color:#5cb4c5"  class="fa fa-television"></i>





                            <h3>Lorem Ipsum</h3>
                            <span>There are many variations of passages of<br> Lorem Ipsum available, but the majority have suffered alteration in some form</span>

                        </div>
                        <div class="box2-abount">
                            <i style="font-size: 80px;float: left;margin-right:5px;color:#5cb4c5"  class="fa fa-heartbeat"></i>
                            <h3>Lorem Ipsum</h3>
                            <span>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form</span>
                        </div>
                        <div class="box3-abount">
                            <i style="font-size: 80px;float: left;margin-right:5px;color:#5cb4c5" class="fa fa-bullhorn"></i>
                            <h3>Lorem Ipsum</h3>
                            <span>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form</span>
                        </div>
                    </div>

                </div>
            </section>
            <div class="clear"></div>
            <section id="houses">
                <div class="houses__header">
                    <div class="houses-container">
                        <h1>Featured Listings</h1>
                        <p>If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything<br>
                            embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to</p>
                    </div>
                </div>

                <div class="houses_list">
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
                </div>

            </section>
            <div class="clear"></div>
            <section id="contact">
                <div class="container-contact">
                    <div class="container-contact-left">
                        <div class="title-contact">
                            <h1> Best Agents</h1>
                        </div>

                        <div class="box-contact">
                            <div class="box-contact-box">
                                <div class="images-contact">
                                    <img src="images/sang.jpg"/>
                                </div>
                                <div class="title-contact">

                                    <span>Phan Sang</span>

                                    <p >Lorem ipsum</p>
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
                            <div class="box-contact-box">
                                <div class="images-contact">
                                    <img src="images/phananh.jpg"/>
                                </div>
                                <div class="title-contact">

                                    <span>Phan Anh</span>

                                    <p >Lorem ipsum</p>
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
                            <div class="box-contact-box">
                                <div class="images-contact">
                                    <img src="images/nguyentuananh.jpg"/>
                                </div>
                                <div class="title-contact">

                                    <span>Nguyen Tuan Anh</span>

                                    <p >Lorem ipsum</p>
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
                        </div>
                    </div>
                    <div class="container-contact-right">
                        <h1 class="title-contact_-title">Reviews</h1>
                        <div class="box-contact-right">
                            <h1>Samantah Gabler</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                        </div>
                        <div class="box-contact-right">
                            <h1>Samantah Gabler</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                        </div>
                        <div class="box-contact-right">
                            <h1>Samantah Gabler</h1>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in</p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="clear"></div>
            <section id="blog">

                <div class="container-blog">
                    <div class="title-blog-show">
                        <h1>Our Blog</h1>
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
                        <h1>Partner</h1>
                        <p>There are many variations of passages of Lorem Ipsum available, but the majority<br>
                            have suffered alteration in some form</p>

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
