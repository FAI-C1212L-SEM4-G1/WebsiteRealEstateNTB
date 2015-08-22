<%-- 
    Document   : blogindex
    Created on : Aug 20, 2015, 4:49:32 PM
    Author     : sang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow" />
    <link rel="Shortcut Icon" href="http://static.bizwebmedia.net/favicon.ico" type="image/x-icon" />
    <!--  -->
    
    <link type="text/css" rel="stylesheet" href="../Content/Styles/bootstrap.css">
    <link href="../../font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    
    <link type="text/css" rel="stylesheet" href="../Content/Styles/style.css">
    <link type="text/css" rel="stylesheet" href="../Content/Styles/style_default.css">
    <link type="text/css" rel="Stylesheet" href="../Content/Styles/jquery-ui-1.9.2.custom.css"    
    <link type="text/css" rel="stylesheet" href="../Content/Styles/iselector.css" />
    <link rel="stylesheet" type="text/css" href="../Content/Styles/jquery.fancybox.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="../Content/Styles/imodal.css">
    
    
    <script async="" src="../Content/Scripts/analytics.js">
    </script><script type="text/javascript" src="../Content/Scripts/jquery.min.js"></script>
    <script type="text/javascript">        var $j = jQuery.noConflict();</script>
    <script type="text/javascript" src="../Content/Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="../Content/Scripts/common.js"></script>
    <script type="text/javascript" src="../Content/Scripts/iselector.js"></script>
    <script type="text/javascript" src="../Content/Scripts/admin.js"></script>
    <script type="text/javascript" src="../Content/Scripts/imodal.js"></script>
    <script type="text/javascript" src="../Content/Scripts/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="../Content/Scripts/scripts.js"></script>
    <!--  -->

    
    
    <script type="text/javascript">
        function beginKeepAlive() {
            setTimeout("keepAlive()", 60000); // every 1 min
        }
        function keepAlive() {
            var rand = Math.random();
            $j.get("/Handlers/KeepAlive.ashx?rand=" + rand, null, function (data) {
                beginKeepAlive();
            }, "text");
        }
        function checkWindowSize() {
            var windowWidth = $j(window).width();
            if (windowWidth < 1024) {
                $j(".iconsupport, .linkaction").hide();
            }
            else {
                $j(".iconsupport, .linkaction").show();
            }
        }
        $j(function () {
            beginKeepAlive();
            checkWindowSize();
            window.onresize = checkWindowSize;
        });
    </script>
    <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-19570215-2', 'bizwebvietnam.com');
        ga('send', 'pageview');
    </script>
    
    </head>
    <body>
         
    <script type="text/javascript">
        function beginKeepAlive() {
            setTimeout("keepAlive()", 60000); // every 1 min
        }
        function keepAlive() {
            var rand = Math.random();
            $j.get("/Handlers/KeepAlive.ashx?rand=" + rand, null, function (data) {
                beginKeepAlive();
            }, "text");
        }
        function checkWindowSize() {
            var windowWidth = $j(window).width();
            if (windowWidth < 1024) {
                $j(".iconsupport, .linkaction").hide();
            }
            else {
                $j(".iconsupport, .linkaction").show();
            }
        }
        $j(function () {
            beginKeepAlive();
            checkWindowSize();
            window.onresize = checkWindowSize;
        });
    </script>
    <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-19570215-2', 'bizwebvietnam.com');
        ga('send', 'pageview');
    </script>
    </head>
    <body class="fixed-top">
    <div id="AjaxLoading">
        <img src="/images/ajax-load.gif" alt="" />&nbsp; Đang tải... Vui lòng chờ...</div>
    <form method="post" action="/admin.aspx?module=categories&amp;act=add" id="form1" enctype="multipart/form-data">


<script type="text/javascript">
    //<![CDATA[
    var theForm = document.forms['form1'];
    if (!theForm) {
        theForm = document.form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
    //]]>
</script>



<!--<script src="/Extensions/ckeditor.4.0.1/ckeditor.js" type="text/javascript"></script>
<script src="/Extensions/fancybox-2/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>
<script src="/Extensions/fancybox-2/jquery.fancybox.pack.js" type="text/javascript"></script>-->
        <div class="PageHeader">
            <div class="LogoHeader">
               
            </div>
            <div class="SystemMenu">
                
<div>
    <ul class="sysMenu">
        <li class="first"><a class="link-topmenu" href="/admin"><i class="icon-home"></i> Trang chủ</a></li>
        <li><a class="link-topmenu" href="/admin.aspx?module=users"><i class="icon-user"></i> Tài khoản quản trị</a></li>
        <li><a class="link-topmenu" href="/admin.aspx?module=analytics"><i class="icon-bar-chart"></i> Thống kê</a></li>
        <li><a class="link-topmenu" href="/" target="_blank"><i class="icon-list-alt"></i> Xem website</a></li>
        <li><a class="link-topmenu" href="http://www.bizweb.vn/Tro-giup-p164.html" target="_blank"><i class="icon-question-sign"></i> Trợ giúp</a></li>
        <li class="last">
            <div class="btn-group">
                <a href="/admin.aspx?module=users&action=edituser&id=84211" class="btn account-info btn-info"><i class="icon-user"></i>
                    admin</a><a href="#" data-toggle="dropdown" class="btn btn-info dropdown-toggle dropdown-toggle-acount"><span class="icon-caret-down"></span></a>
                <ul class="dropdown-menu custome">
                    <li><a href="/admin.aspx?module=users&action=changepass"><i class="icon-key"></i> Đổi mật khẩu</a></li>
                    <li><a id="siteUser_Lbtn_Logout" class="NormalGray" href="javascript:__doPostBack(&#39;ctl00$siteUser$Lbtn_Logout&#39;,&#39;&#39;)"><i class="icon-signout"></i> Thoát</a></li>
                </ul>
            </div>
        </li>
    </ul>
</div>


            </div>
        </div>
        
    <div id="container" class="row-fluid">
        <div class="clear" style="height: 10px">
        </div>
        

<style type="text/css">
    .boder_menu
    {
        min-width: 1023px;
        width: 100%;
        background-color: #24c2ce;
    }

    #menu
    {
        display: block;
        float: none;
        height: 40px;
        line-height: 40px;
        margin: auto;
    }

        #menu ul
        {
            float: left;
            list-style: none outside none;
            margin-left: 20px;
        }

            #menu ul li
            {
                float: left;
                position: relative;
            }

                #menu ul li ul li
                {
                    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
                    border: medium none;
                    line-height: normal;
                    margin: 0;
                    padding: 0;
                }

                #menu ul li ul li
                {
                    width: 100%;
                }

                #menu ul li a
                {
                    background-image: url("../../images/icon_sub.gif");
                    background-position: right center;
                    background-repeat: no-repeat;
                    color: #ffffff;
                    display: block;
                    font-size: 14px;
                    font-weight: normal;
                    height: 38px;
                    line-height: 38px;
                    margin-right: 12px;
                    padding: 0 15px 0 6px;
                }

        #menu li:hover a, #menu li.current a
        {
            background-image: url("../../images/icon_sub.gif");
            color: #FFFFFF;
            text-decoration: none;
        }

        #menu li
        {
            margin: 0 4px 0 0;
            padding-bottom: 3px;
        }

            #menu li:hover
            {
                background-color: #1799a3;
            }

            #menu li ul
            {
                -moz-border-bottom-colors: none;
                -moz-border-left-colors: none;
                -moz-border-right-colors: none;
                -moz-border-top-colors: none;
                background-color: #20aeb9;
                border-color: #00ABC9 -moz-use-text-color -moz-use-text-color;
                border-image: none;
                border-right: medium none;
                border-style: none;
                border-width: 3px medium medium;
                /*box-shadow: 5px 5px 0 #D9D9D9;*/
                display: none;
                margin: 0;
                padding: 0;
                position: absolute;
                top: 40px;
                width: 240px;
                z-index: 100;
            }

                #menu li ul li
                {
                    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
                    border: medium none;
                    line-height: normal;
                    padding: 0;
                }

                    #menu li ul li a, #menu li:hover ul li a
                    {
                        background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
                        border-bottom: 1px solid #41bbc4;
                        color: #FFFFFF;
                        margin: 0 12px;
                        font-size: 14px;
                        padding-left: 10px;
                    }

                    #menu li ul li a
                    {
                        padding: 0;
                    }

    .m_icon
    {
        float: left;
        padding: 12px 5px 0 0;
        text-align: center;
        width: 23px;
    }

    #menu li:hover, #menu li.current
    {
        background-image: url("../../images/menu_hover.gif");
        background-position: center bottom;
        background-repeat: repeat-x;
    }

    #menu li ul li:hover
    {
        background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    }

    #menu li:hover ul
    {
        display: block;
        opacity: 0.95;
    }

    #menu li ul li a:hover
    {
        border-bottom-color: #1799a3;
    }

    #menu li ul li:hover
    {
        background: #1799a3;
        border: medium none;
    }

    #menu li ul li.last a
    {
        border: medium none;
    }

    #menu .MenuText i
    {
        font-size: 16px;
    }

        #menu .MenuText i.icon-shopping-cart, #menu .MenuText i.icon-gift, #menu .MenuText i.icon-globe, #menu .MenuText i.icon-signin
        {
            font-size: 18px;
        }
</style>

<div class="boder_menu">

    <div id="menu">
        <ul>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-shopping-cart"></i> Đơn hàng</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="../admin/user/userindex.jsp">
                        <span class="SubMenuText">Danh sách đơn hàng
                        </span>
                    </a>
                </li>
                <li>
                    <a href="../admin/blog/blogindex.jsp">
                        <span class="SubMenuText">Tin nhắn từ khách hàng
                        </span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-tags"></i> Sản phẩm</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=products">
                        <span class="SubMenuText">Danh sách sản phẩm
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=categories">
                        <span class="SubMenuText">Danh mục sản phẩm
                        </span>
                    </a>
                </li>
                
                <li>
                    <a href="/admin.aspx?module=export"> 
                        <span class="SubMenuText">Xuất danh sách sản phẩm
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=vendors">
                        <span class="SubMenuText">Nhà sản xuất
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=customcategories">
                        <span class="SubMenuText">Danh mục tùy chọn
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=productfeatures">
                        <span class="SubMenuText">Thuộc tính sản phẩm
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=productoption">
                        <span class="SubMenuText">
                            Nhóm tùy chọn sản phẩm
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=productreviews">
                        <span class="SubMenuText">Đánh giá, phản hồi sản phẩm
                        </span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-th-large"></i> Nội dung</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=articles">
                        <span class="SubMenuText">Quản lý tin tức
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=articlecategories">
                        <span class="SubMenuText">Danh mục tin
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=survey">
                        <span class="SubMenuText">Thăm dò ý kiến
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=gallery">
                        <span class="SubMenuText">Quản lý Slideshow ảnh
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=download">
                        <span class="SubMenuText">Quản lý download
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=pages">
                        <span class="SubMenuText">Quản lý trang chức năng 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=filemanager">
                        <span class="SubMenuText">Quản lý ảnh 
                        </span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-user"></i> Khách hàng</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=contacts">
                        <span class="SubMenuText">Liên hệ từ khách hàng 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=customers">
                        <span class="SubMenuText">Danh sách khách hàng 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=customergroups">
                        <span class="SubMenuText">Nhóm khách hàng
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=emailsubscription">
                        <span class="SubMenuText">Danh sách Email đăng ký
                        </span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-globe"></i> Tiếp thị</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=seo">
                        <span class="SubMenuText">SEO trên Google 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=promotion">
                        <span class="SubMenuText">Thiết lập khuyến mãi
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=coupons">
                        <span class="SubMenuText">Mã khuyến mại (Coupons)
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=emailmarketing">
                        <span class="SubMenuText">Tiếp thị qua Email
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=ad">
                        <span class="SubMenuText">Quảng cáo trực tuyến
                        </span>
                    </a>
                </li>
                
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-signin"></i> Tích hợp</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=sitesetting&action=hangtotstoresetting">
                        <span class="SubMenuText">Gian hàng Hangtot.com
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=socialshop">
                        <span class="SubMenuText">Ứng dụng Facebook
                        </span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-picture"></i> Giao diện</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=menu">
                        <span class="SubMenuText">Quản lý Menu
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=skins">
                        <span class="SubMenuText">Giao diện website 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=skins&action=mobile">
                        <span class="SubMenuText">Thiết bị di động
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=skins&action=banner">
                        <span class="SubMenuText">Logo & Banner 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=skins&action=footer">
                        <span class="SubMenuText">Chân trang (Footer) 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=skins&action=background">
                        <span class="SubMenuText">Thay đổi hình nền 
                        </span>
                    </a>
                </li>
            </ul>
        </li>
        <li>
            <a class="TopMenuItem" href="javascript:;">
                <span class="MenuText"><i class="icon-cogs"></i> Cấu hình</span>
            </a>
            <ul>
                <li class="SubFirst">
                    <a href="/admin.aspx?module=sitesetting">
                        <span class="SubMenuText">Cấu hình website
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=currencysetting">
                        <span class="SubMenuText">Cấu hình tiền tệ
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=paymentsetting">
                        <span class="SubMenuText">Cấu hình thanh toán 
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=shippingsetting">
                        <span class="SubMenuText">Cấu hình vận chuyển
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=support">
                        <span class="SubMenuText">Hỗ trợ trực tuyến
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=ftpsetting">
                        <span class="SubMenuText">Cấu hình FTP
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=redirects">
                        <span class="SubMenuText">Chuyển hướng 301
                        </span>
                    </a>
                </li>
            </ul>
        </li>
    </ul>
    </div>
</div>

        
        
        <!-- End main-content -->

    </div>
    <span id="additionalAttr"></span>
    <script type="text/javascript">
        $j("#registerAd").fancybox({
            'width': 780,
            'height': 550,
            'autoScale': false,
            'transitionIn': 'fade',
            'transitionOut': 'fade',
            'speedIn': 500,
            'speedOut': 300,
            'titleShow': false,
            'hideOnOverlayClick': false,
            'type': 'iframe',
            onStart: function () {
                var text =
                "<style type='text/css'>" +
                "#fancybox-outer{ background: transparent; }" +
                "#fancy-bg-n, #fancy-bg-ne, #fancy-bg-e, #fancy-bg-se, #fancy-bg-s, #fancy-bg-sw, #fancy-bg-w, #fancy-bg-nw{ background-image: none; }" +
                "#fancybox-close{ right: 54px; top: 23px; background-image: url('/sites/admin/images/registerad/close.png'); background-position: center center; background-repeat: no-repeat; }" +
                "</style>";
                $j("#additionalAttr").html(text);
            },
            onCancel: function () { $j("#additionalAttr").html(''); },
            onCleanup: function () { $j("#additionalAttr").html(''); },
            onClose: function () { $j("#additionalAttr").html(''); }
        });
    </script>
    </form>
        <div id="main-content">
            <div class="container-fluid">
                <div style="width: 100%; margin: 0 auto;">
                    <div id="Breadcrumb" class="Block Breadcrumb ui-widget-content ui-corner-top ui-corner-bottom">
                        <div style="clear: both;"></div>
                        <div id="cph_Main_ContentPane">
                            <div class="widget">
                                <div class="widget-title">
                                    <h4>
                                        <i class="icon-list-alt"></i>
                                        Danh sách thể loại
                                    </h4>
                                    <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                                        <div id="toolbox">
                                            <div class="toolbox-content" style="float:right;">
                                                <table class="toolbar">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center">
                                                                <a id="cph_Main_ctl00_toolbox_rptAction_lbtAction_1" class="toolbar btn btn-info" href="/GroupProduct/GroupProductCreate" title="Thêm mới">
                                                                    <i class="fa fa-plus "></i>
                                                                    Thêm mới
                                                                </a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="hiddenToolBarScroll" class="scrollBox hidden">
                                        <h4>
                                            <i class="icon-list-alt"></i>
                                            Danh sách thể loại
                                        </h4>
                                        <div class="FloatMenuBar">
                                            <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                                                <div id="toolbox">
                                                    <div class="toolbox-content" style="float:right;">
                                                        <table class="toolbar">
                                                            <tbody>
                                                                <tr>
                                                                    <td align="center">
                                                                        <a id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_1" class="toolbar btn btn-info" href="/GroupProduct/GroupProductCreate" title="Thêm mới">
                                                                            <i class="fa fa-plus"></i>
                                                                            Thêm mới
                                                                        </a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div>
                                        <table id="cph_Main_ctl00_ctl00_grvProducts" class="table table-striped table-bordered dataTable table-hover" cellspacing="0" style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th scope="col" style="text-align:center">Id</th>
                                                    <th scope="col" style="text-align:center">Tiêu đề thể loại</th>
                                                    <th scope="col" style="text-align:center">Thứ tự</th>
                                                    <th scope="col" style="text-align:center">Hiển thị</th>
                                                    <th scope="col" style="text-align:center">Thao tác</th>
                                                </tr>
                                                <tr>
                                                    <td class="Visible text-center" align="center" style="width:30px;">1</td>
                                                    <td class="text-center" align="center" style="width:30px;"> sức khỏe trẻ em </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;"> 1 </td>
                                                    <td class="text-center" align="center" style="width:30px;"> True </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;">
                                                        <a id="lbtUpdateProduct2946698" class="action-link-button" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductEdit/1">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="action-link-button" onclick="return DeleteConfirm()" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductRemove/1">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Visible text-center" align="center" style="width:30px;">2</td>
                                                    <td class="text-center" align="center" style="width:30px;"> sức khỏe phụ nữ </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;"> 2 </td>
                                                    <td class="text-center" align="center" style="width:30px;"> True </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;">
                                                        <a id="lbtUpdateProduct2946698" class="action-link-button" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductEdit/2">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="action-link-button" onclick="return DeleteConfirm()" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductRemove/2">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Visible text-center" align="center" style="width:30px;">3</td>
                                                    <td class="text-center" align="center" style="width:30px;"> sức khỏe người già </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;"> 3 </td>
                                                    <td class="text-center" align="center" style="width:30px;"> True </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;">
                                                        <a id="lbtUpdateProduct2946698" class="action-link-button" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductEdit/3">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="action-link-button" onclick="return DeleteConfirm()" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductRemove/3">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Visible text-center" align="center" style="width:30px;">6</td>
                                                    <td class="text-center" align="center" style="width:30px;"> Sức Khỏe Nam Giới </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;"> 4 </td>
                                                    <td class="text-center" align="center" style="width:30px;"> True </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;">
                                                        <a id="lbtUpdateProduct2946698" class="action-link-button" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductEdit/6">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="action-link-button" onclick="return DeleteConfirm()" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductRemove/6">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Visible text-center" align="center" style="width:30px;">7</td>
                                                    <td class="text-center" align="center" style="width:30px;"> bài thuốc quý </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;"> 5 </td>
                                                    <td class="text-center" align="center" style="width:30px;"> True </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;">
                                                        <a id="lbtUpdateProduct2946698" class="action-link-button" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductEdit/7">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="action-link-button" onclick="return DeleteConfirm()" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductRemove/7">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="Visible text-center" align="center" style="width:30px;">8</td>
                                                    <td class="text-center" align="center" style="width:30px;"> món ăn bổ dưỡng </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;"> 6 </td>
                                                    <td class="text-center" align="center" style="width:30px;"> True </td>
                                                    <td class="Visible text-center" align="center" style="width:45px;">
                                                        <a id="lbtUpdateProduct2946698" class="action-link-button" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductEdit/8">
                                                            <i class="fa fa-pencil-square-o"></i>
                                                        </a>
                                                        <a class="action-link-button" onclick="return DeleteConfirm()" title="Chỉnh sửa thể loại này" href="/GroupProduct/GroupProductRemove/8">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pagination pagination-small pagination-right">
                                        <ul>
                                            <li>
                                                <div class="pagination-container">
                                                    <ul class="pagination">
                                                        <li class="active">
                                                            <a>1</a>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin-right: 25px; float: right; color: Gray;"> thuốc dân gian - quà tặng của mọi nhà </div>
                <div style="height: 10px; margin-top: 40px;"> </div>
            </div>
    </body>
</html>
