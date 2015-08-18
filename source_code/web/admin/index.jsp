<%-- 
    Document   : index
    Created on : Aug 17, 2015, 7:25:28 PM
    Author     : sang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow" />
    <link rel="Shortcut Icon" href="http://static.bizwebmedia.net/favicon.ico" type="image/x-icon" />
    <!--  -->
    
    <link type="text/css" rel="stylesheet" href="Content/Styles/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="Content/Styles/font-awesome.css">
    <link type="text/css" rel="stylesheet" href="Content/Styles/style.css">
    <link type="text/css" rel="stylesheet" href="Content/Styles/style_default.css">
    <link type="text/css" rel="Stylesheet" href="Content/Styles/jquery-ui-1.9.2.custom.css"    
    <link type="text/css" rel="stylesheet" href="Content/Styles/iselector.css" />
    <link rel="stylesheet" type="text/css" href="Content/Styles/jquery.fancybox.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="Content/Styles/imodal.css">
    
    
    <script async="" src="Content/Scripts/analytics.js">
    </script><script type="text/javascript" src="Content/Scripts/jquery.min.js"></script>
    <script type="text/javascript">        var $j = jQuery.noConflict();</script>
    <script type="text/javascript" src="Content/Scripts/jquery-ui.min.js"></script>
    <script type="text/javascript" src="Content/Scripts/common.js"></script>
    <script type="text/javascript" src="Content/Scripts/iselector.js"></script>
    <script type="text/javascript" src="Content/Scripts/admin.js"></script>
    <script type="text/javascript" src="Content/Scripts/imodal.js"></script>
    <script type="text/javascript" src="Content/Scripts/bootstrap.min.js"></script>
    
    <script type="text/javascript" src="Content/Scripts/scripts.js"></script>
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
                <div class="logoimage">
                    <a class="SiteName" href="/admin">
                        <img border="0" src="/images/logo2.png" alt="logo"
                            title="logo" />
                    </a>
                </div>
                <div class="linkroot">
                    <a class="SiteName" href="/" target="_blank">
                        <script type="text/javascript">
                            document.write(document.domain);
                        </script>
                    </a>
                </div>
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
<div class="siteinfo">
    <ul><li style="padding-top:5px;">Bạn còn</li><li class="block-time">14</li><li style="margin-right:5px; padding-top:5px;">ngày dùng thử miễn phí</li></ul>
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
                    <a href="/admin.aspx?module=orders">
                        <span class="SubMenuText">Danh sách đơn hàng
                        </span>
                    </a>
                </li>
                <li>
                    <a href="/admin.aspx?module=orders&act=message">
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

        
        <div id="main-content">
            <div class="container-fluid">
                <div style="width: 100%; margin: 0 auto;">
                    
                <div id="Breadcrumb" class="Block Breadcrumb ui-widget-content ui-corner-top ui-corner-bottom">
                    <ul>
                        <li><a href='/admin'><i class="icon-home" style="font-size:14px;"></i> Trang chủ</a></li><li class='SecondLast'><a href='/admin.aspx?module=categories'>Danh mục sản phẩm</a></li><li class='Last'><span>Thêm mới danh mục sản phẩm</span></li>
                    </ul>
                </div>

                <div style="clear: both;"></div>
                        
                <div id="cph_Main_ContentPane">
                    <div class="widget">
                        <!-- widget-title -->
                        <div class="widget-title">
                            <h4><i class="icon-reorder"></i>&nbsp;Danh mục sản phẩm</h4>
        
                    <!-- Button -->
                    <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                        <div id="toolbox">        
                            <div style="float:right;" class="toolbox-content">
            
                                <table class="toolbar">
                                    <tr>
                                        <td align="center">
                                    <a id="A1" title="Thêm mới" class="toolbar btn btn-info" href="javascript:__doPostBack('ctl00$cph_Main$ctl00$toolbox$rptAction$ctl03$lbtAction','')">
                                        <i class="icon-plus"></i>&nbsp;
                                        Thêm mới</a>
                                </td>

                                        <td align="center">
                                            <a onclick="javascript:return ConfirmDelete();" id="A2" title="Xóa" class="toolbar btn btn-info" href="javascript:__doPostBack('ctl00$cph_Main$ctl00$toolbox$rptAction$ctl02$lbtAction','')"><i class="icon-trash"></i>&nbsp;
                                        Xóa</a>
                                </td>
                                        
                                        <td align="center">
                                            <a id="A5" title="Tiếp tục" class="toolbar btn btn-info" href="javascript:__doPostBack('ctl00$cph_Main$ctl00$toolbox$rptAction$ctl02$lbtAction','')"><i class="icon-signin"></i>&nbsp;
                            Tiếp tục</a>
                                </td>
                        
                     
                        
                                        <td align="center">
                                        <a id="A3" title="Bộ lọc mặc định" class="toolbar btn btn-info" href="javascript:__doPostBack('ctl00$cph_Main$ctl00$toolbox$rptAction$ctl01$lbtAction','')"><i class="icon-search"></i>&nbsp;
                                            Bộ lọc mặc định</a>
                                    </td>
                    
                                        <td align="center">
                                        <a id="A4" title="Hủy" class="toolbar btn btn-info" href="javascript:__doPostBack('ctl00$cph_Main$ctl00$toolbox$rptAction$ctl01$lbtAction','')"><i class="icon-share-alt"></i>&nbsp;
                                            Hủy</a>
                                    </td>

                                        <td align="center">
                                            <a onclick="javascript:return PopupHelp(&#39;http://support.bizweb.vn/popuphelp.aspx?faqcat=35&#39;);" id="cph_Main_ctl00_toolbox_rptAction_lbtAction_0" title="Trợ giúp" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl01$lbtAction&#39;,&#39;&#39;)"><i class="icon-question-sign"></i>&nbsp;
                                                Trợ giúp</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox_rptAction_lbtAction_1" title="Lưu" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl02$lbtAction&#39;,&#39;&#39;)"><i class="icon-save"></i>&nbsp;
                                                Lưu</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox_rptAction_lbtAction_2" title="Lưu và Thêm mới" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl03$lbtAction&#39;,&#39;&#39;)"><i class="icon-ok"></i>&nbsp;
                                                Lưu và Thêm mới</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox_rptAction_lbtAction_3" title="Cập nhật" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl04$lbtAction&#39;,&#39;&#39;)"><i class="icon-ok"></i>&nbsp;
                                                Cập nhật</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox_rptAction_lbtAction_4" title="Quay lại" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl05$lbtAction&#39;,&#39;&#39;)"><i class="icon-chevron-left"></i>&nbsp;
                                                Quay lại</a>
                                        </td>
                
                                    </tr>
                                </table>
                
                            </div>
                        </div>
                    </div>
                    <!-- End Button -->

                    <div id="hiddenToolBarScroll" class="scrollBox hidden">
                                <h4>
                                    <i class="icon-reorder"></i>&nbsp;Danh mục sản phẩm</h4>
                                <div class="FloatMenuBar">
                
                    <div class="ui-widget-content ui-corner-top ui-corner-bottom">
                        <div id="Div1">
        
                            <div style="float:right;" class="toolbox-content">
            
                                        <table class="toolbar">
                                            <tr>
                
                                        <td align="center">
                                            <a onclick="javascript:return PopupHelp(&#39;http://support.bizweb.vn/popuphelp.aspx?faqcat=35&#39;);" id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_0" title="Trợ giúp" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl01$lbtAction&#39;,&#39;&#39;)"><i class="icon-question-sign"></i>&nbsp;
                                                Trợ giúp</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_1" title="Lưu" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl02$lbtAction&#39;,&#39;&#39;)"><i class="icon-save"></i>&nbsp;
                                                Lưu</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_2" title="Lưu và Thêm mới" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl03$lbtAction&#39;,&#39;&#39;)"><i class="icon-ok"></i>&nbsp;
                                                Lưu và Thêm mới</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_3" title="Cập nhật" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl04$lbtAction&#39;,&#39;&#39;)"><i class="icon-ok"></i>&nbsp;
                                                Cập nhật</a>
                                        </td>
                
                                        <td align="center">
                                            <a id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_4" title="Quay lại" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl05$lbtAction&#39;,&#39;&#39;)"><i class="icon-chevron-left"></i>&nbsp;
                                                Quay lại</a>
                                        </td>
                
                                            </tr>
                                        </table>
                
                            </div>
                        </div>
                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- widget-title -->

                        <!-- widget-body -->
                        <div class="widget-body">

                            
        
                            <div id="cph_Main_ctl00_notification_divNotice" style="padding-top:10px;">
                                <!-- Messange -->
                                <div id="cph_Main_ctl00_notification_rptNotice_divMessage_0" class="alert">
                                    Bạn phải nhập thông tin Tên nhóm danh mục <button data-dismiss="alert" class="close">×</button>
                                </div>            
                                    <div id="Div2" class="alert alert-info">
                                        Cập nhật thông tin thành công ! 
                                    <button class="close" data-dismiss="alert">×</button>
                                </div>
                                <!-- End Messange -->        
                            </div>

        
                    <style type="text/css">
                        .option-container
                        {
                            width: 350px;
                            float: left;
                            border: 1px solid #7F9DB9;
                            height: 150px;
                        }

                        .options
                        {
                            margin: 0;
                            padding: 0;
                        }

                            .options li
                            {
                                list-style-type: none;
                                margin: 0;
                                padding: 8px 6px;
                            }

                                .options li:hover
                                {
                                    background-color: #EFEFEF;
                                }

                        .clear
                        {
                            clear: both;
                        }

                        .filter-container
                        {
                            margin: 5px 0px 0px 10px;
                        }

                            .filter-container li
                            {
                                margin-bottom: 3px;
                                padding: 8px 10px;
                                height: 15px;
                                background: #e6e6e8;
                                width: 500px;
                                border-radius: 5px;
                                cursor: move;
                            }

                                .filter-container li strong
                                {
                                    float: left;
                                }

                                .filter-container li a
                                {
                                    float: right;
                                }
                    </style>
                    <script type="text/javascript" src="/Extensions/Js/jquery.cookie.js"></script>
                    <script type="text/javascript">
                        $j(function () {
                            $j("#tabs").tabs({ cookie: { expires: 1 } });
                            var categoryid = 0;
                            if (categoryid == 0) {
                                $j("#tabs").tabs("disable", 3);
                                $j("#tabs").tabs("select", 0);
                            }
                            else {
                                SetProductFeatureIds();
                            }
                            $j("#filter").sortable({
                                placeholder: "ui-state-highlight",
                                update: function (event, ui) {
                                    SetProductFeatureIds();
                                }
                            });
                        });
                        function SetProductFeatureIds() {
                            var productfeatureids = "/";
                            $j(".filter-item strong").each(function () {
                                productfeatureids = productfeatureids + $j(this).attr("featureid") + "/";
                            });
                            $j("[id$='hfFeatureIds']").val(productfeatureids);
                        }
                    </script>
                    <div id="tabs">
                        <ul class="nav nav-tabs">
                            <li><a href="#tabs-1">Thông tin chung</a></li>
                            <li><a href="#tabs-2">Thiết lập SEO</a></li>
                            <li><a href="#tabs-3">Danh mục tin liên quan</a></li>
                            <li><a href="#tabs-4">Bộ lọc sản phẩm</a></li>
                        </ul>
                        <div id="tabs-1">
                            <table class="admintable" style="width: 100%;">
                                <tr>
                                    <td class="key">
                                        Tên danh mục <span class="Required">*</span>
                                    </td>
                                    <td>
                                        <input name="ctl00$cph_Main$ctl00$ctl00$txtName" type="text" id="cph_Main_ctl00_ctl00_txtName" class="TextInput" style="width:350px;" />
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Tên nhóm danh mục</p>
                                            <p class="tooltipmessage">
                                                Tên danh mục sản phẩm (VD: Thời trang nữ)
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Danh mục cha <span class="Required">*</span>
                                    </td>
                                    <td>
                                        <select size="7" name="ctl00$cph_Main$ctl00$ctl00$lstParentId" id="cph_Main_ctl00_ctl00_lstParentId" class="TextInput" style="width:350px;">
	                    <option value="-1">Top</option>
	                    <option value="832431">S&#225;ch kinh doanh</option>
	                    <option value="832432">&#160;&#160;&#160;&#160;&#160;└-- T&#224;i ch&#237;nh v&#224; đầu tư</option>
	                    <option value="832433">&#160;&#160;&#160;&#160;&#160;└-- Marketing v&#224; b&#225;n h&#224;ng</option>
	                    <option value="832434">&#160;&#160;&#160;&#160;&#160;└-- L&#227;nh đạo v&#224; quản l&#253;</option>
	                    <option value="832428">Văn học</option>
	                    <option value="832429">&#160;&#160;&#160;&#160;&#160;└-- Văn học Việt Nam</option>
	                    <option value="832430">&#160;&#160;&#160;&#160;&#160;└-- Văn học nước ngo&#224;i</option>
	                    <option value="832435">S&#225;ch gi&#225;o khoa</option>
	                    <option value="832436">&#160;&#160;&#160;&#160;&#160;└-- S&#225;ch gi&#225;o khoa cấp I</option>
	                    <option value="832437">&#160;&#160;&#160;&#160;&#160;└-- S&#225;ch gi&#225;o khoa cấp II</option>
	                    <option value="832438">&#160;&#160;&#160;&#160;&#160;└-- S&#225;ch gi&#225;o khoa cấp III</option>
	                    <option value="832439">&#160;&#160;&#160;&#160;&#160;└-- S&#225;ch tham khảo</option>

                    </select>
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Danh mục cha</p>
                                            <p class="tooltipmessage">
                                                Danh mục cấp trên của danh mục đang cập nhật
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Mô tả
                                    </td>
                                    <td>
                    
                    <script type="text/javascript">
                        function getCookie(c_name) {
                            var i, x, y, ARRcookies = document.cookie.split(";");
                            for (i = 0; i < ARRcookies.length; i++) {
                                x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
                                y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
                                x = x.replace(/^\s+|\s+$/g, "");
                                if (x == c_name) {
                                    return unescape(y);
                                }
                            }
                        }

                        if (getCookie("CKFinder_Path") == null) {
                            var year = (new Date().getYear() + 1900), month = (new Date().getMonth() + 1);
                            document.cookie = "CKFinder_Path=" + escape("Images:/" + year.toString() + "/" + month.toString() + "/:0") + ";path=/";
                        }

                        $j(document).ready(function () {
                            CKEDITOR.replace('cph_Main_ctl00_ctl00_txtDescription_ckeditor',
                                {
                                    toolbar: [
                                        ['Source'], '-',
                                        ['RemoveFormat'],
                                        ['Bold', 'Italic', 'Underline', 'Strike'], '-',
                                        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'], '-',
                                        ['Image', 'Table'], '-',
                                        ['Styles', 'Format', 'Font', 'FontSize'], '-',
					                    ['Link', 'Unlink'], '-',
                                        ['TextColor', 'BGColor'], '-',
                                        ['Maximize']
                                    ],
                                    language: 'vi',
                                    height: 200,
                                    contentsCss: '/Css/ckeditor.css',
                                    resize_enabled: false,
                                    toolbarCanCollapse: false,
                                    filebrowserImageBrowseUrl: '/Extensions/ckfinder.2.3.1/ckfinder.html?Type=Images&mediadomain=http://media.bizwebmedia.net',
                                    filebrowserImageUploadUrl: '/Extensions/ckfinder.2.3.1/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images&currentFolder=/2013/12/&mediadomain=http://media.bizwebmedia.net',
                                }
                            );
                        });
                    </script>
                    <textarea name="ctl00$cph_Main$ctl00$ctl00$txtDescription$ckeditor" id="cph_Main_ctl00_ctl00_txtDescription_ckeditor" rows="3" cols="10"></textarea>

                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="key">
                                        Ảnh
                                    </td>
                                    <td>
                    
                    <table id="tblUpload" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td>
            
                            </td>
                        </tr>
                        <tr>
                            <td>
            
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="file" name="ctl00$cph_Main$ctl00$ctl00$usImage$FileUpload" id="cph_Main_ctl00_ctl00_usImage_FileUpload" class="Upload" style="width:200px;" />&nbsp;&nbsp;<input type="submit" name="ctl00$cph_Main$ctl00$ctl00$usImage$btnUpload" value="Tải lên" id="cph_Main_ctl00_ctl00_usImage_btnUpload" class="Button btn btn-small" />
                            </td>
                        </tr>
                    </table>
                    <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$usImage$hdImageUpload" id="cph_Main_ctl00_ctl00_usImage_hdImageUpload" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Thứ tự
                                    </td>
                                    <td>
                                        <input name="ctl00$cph_Main$ctl00$ctl00$txtOrderNumber" type="text" id="cph_Main_ctl00_ctl00_txtOrderNumber" class="TextInput" style="width:70px;" />
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Thứ tự hiển thị</p>
                                            <p class="tooltipmessage">
                                                Thứ tự hiển thị của danh mục sản phẩm
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Hiển thị
                                    </td>
                                    <td>
                                        <input id="cph_Main_ctl00_ctl00_chkIsVisible" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$chkIsVisible" checked="checked" />
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Hiển thị</p>
                                            <p class="tooltipmessage">
                                                Lựa chọn để danh mục sản phẩm hiển thị trên website
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="tabs-2">
                            <table class="admintable" style="width: 100%;">
                                <tr>
                                    <td class="key">
                                        Tiêu đề trang
                                    </td>
                                    <td>
                                        <input name="ctl00$cph_Main$ctl00$ctl00$txtPageTitle" type="text" id="cph_Main_ctl00_ctl00_txtPageTitle" class="TextInput" style="width:350px;" />
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Tiêu đề trang</p>
                                            <p class="tooltipmessage">
                                                Nội dung được hiển thị dưới dạng tiêu đề trong kết quả tìm kiếm và trên trình duyệt của người dùng.
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Thẻ từ khóa
                                    </td>
                                    <td>
                                        <input name="ctl00$cph_Main$ctl00$ctl00$txtMetaKeywords" type="text" id="cph_Main_ctl00_ctl00_txtMetaKeywords" class="TextInput" style="width:350px;" />
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Thẻ từ khóa</p>
                                            <p class="tooltipmessage">
                                                Mô tả các từ khóa chính của website
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Thẻ mô tả
                                    </td>
                                    <td>
                                        <textarea name="ctl00$cph_Main$ctl00$ctl00$txtMetaDesc" rows="3" cols="20" id="cph_Main_ctl00_ctl00_txtMetaDesc" class="TextInput" style="width:346px;">
                    </textarea>
                                        <span class="tooltip-help"><span class="tooltipContent">
                                            <p class="tooltiptitle">
                                                Thẻ mô tả</p>
                                            <p class="tooltipmessage">
                                                Cung cấp một mô tả ngắn của trang. Trong vài trường hợp, mô tả này được sử dụng như một phần của đoạn trích được hiển thị trong kết quả tìm kiếm.
                                            </p>
                                        </span></span>
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td class="key">
                                        Từ khóa tìm kiếm
                                    </td>
                                    <td>
                                        <input name="ctl00$cph_Main$ctl00$ctl00$txtSearchKeywords" type="text" id="cph_Main_ctl00_ctl00_txtSearchKeywords" class="TextInput" style="width:350px;" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="tabs-3">
                            <table class="admintable" cellpadding="0" cellspacing="1" style="width: 100%;">
                                <tr>
                                    <td class="key">
                                        Danh mục tin tức:
                                    </td>
                                    <td>
                                        <div>
                                            <select size="10" name="ctl00$cph_Main$ctl00$ctl00$lbxNewsCategories" id="cph_Main_ctl00_ctl00_lbxNewsCategories" ondblclick="javascript:NewsCategoriesDblClick();" style="width:400px;">
	                    <option value="81973#/">Tin khuyến M&#227;i</option>
	                    <option value="81974#/">S&#225;ch sắp c&#243;</option>
	                    <option value="81975#/">Tin thị trường</option>

                    </select>
                                        </div>
                                        <div>
                                            * Click chuột đúp để thêm vào danh sách liên quan.
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="key">
                                        Danh mục tin đã chọn:
                                    </td>
                                    <td>
                                        <div>
                                            <select size="10" name="ctl00$cph_Main$ctl00$ctl00$lbxSelectedNewsCategories" id="cph_Main_ctl00_ctl00_lbxSelectedNewsCategories" ondblclick="javascript:SelectedNewsCategoriesDblClick();" style="width:400px;">

                    </select>
                                        </div>
                                        <div>
                                            * Click chuột đúp để loại bỏ khỏi danh sách liên quan.
                                        </div>
                                    </td>
                                </tr>


                                <!--  -->

                                
<tr>        <td class="key">
            Sắp xếp
        </td>
        <td>
            <select name="ctl00$cph_Main$ctl00$ctl00$ddlOrderBy" id="cph_Main_ctl00_ctl00_ddlOrderBy" class="TextInput" style="width:178px;">
	<option value="id">Id</option>
	<option value="title">Tiêu đề</option>
	<option value="category">Thư mục</option>
	<option value="created">Ngày đăng tin</option>

</select>
            <select name="ctl00$cph_Main$ctl00$ctl00$ddlOrderType" id="cph_Main_ctl00_ctl00_ddlOrderType" class="TextInput" style="width:100px;">
	<option value="1">Tăng dần</option>
	<option value="0">Giảm dần</option>

</select>
        </td></tr>
    

                                <!--  -->

                            </table>
                            <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$hdRelatedNewsCates" id="cph_Main_ctl00_ctl00_hdRelatedNewsCates" />
                            <script type="text/javascript">
                                var m_blank = '';
                                function NewsCategoriesDblClick() {
                                    var obj = document.getElementById('cph_Main_ctl00_ctl00_lbxNewsCategories');
                                    var obj_2 = document.getElementById('cph_Main_ctl00_ctl00_lbxSelectedNewsCategories');
                                    var hd = document.getElementById('cph_Main_ctl00_ctl00_hdRelatedNewsCates');
                                    if (hd.value == m_blank) hd.value = '/';
                                    // Thêm vào danh sách category cha
                                    var categoryId = obj.options[obj.selectedIndex].value.split('#')[0];
                                    if (hd.value.indexOf('/' + categoryId.toString() + '/') > -1) return; // Có trong danh sách đã chọn rồi thì thôi, không add vào nữa
                                    var categoryName = obj.options[obj.selectedIndex].text;
                                    categoryName = categoryName.replace('└', m_blank).replace(/-/g, m_blank);
                                    var newOption = document.createElement('option');
                                    obj_2.options.add(newOption);
                                    newOption.text = categoryName.trim(); newOption.value = categoryId;
                                    hd.value = hd.value + categoryId.toString() + '/';
                                    // Thêm vào danh sách các thằng con
                                    var parentId = categoryId;
                                    var length = obj.options.length;
                                    for (var i = 0; i < length; i++) {
                                        var lineAge_2 = obj.options[i].value.split('#')[1];
                                        if (lineAge_2.indexOf('/' + parentId.toString() + '/') > -1) {
                                            categoryId = obj.options[i].value.split('#')[0];
                                            if (hd.value.indexOf('/' + categoryId.toString() + '/') > -1) continue;
                                            categoryName = obj.options[i].text;
                                            categoryName = categoryName.replace('└', m_blank).replace(/-/g, m_blank);
                                            newOption = document.createElement('option');
                                            obj_2.options.add(newOption);
                                            newOption.text = categoryName.trim(); newOption.value = categoryId;
                                            hd.value = hd.value + categoryId.toString() + '/';
                                        }
                                    }
                                }
                                function SelectedNewsCategoriesDblClick() {
                                    var obj = document.getElementById('cph_Main_ctl00_ctl00_lbxSelectedNewsCategories');
                                    var hd = document.getElementById('cph_Main_ctl00_ctl00_hdRelatedNewsCates');
                                    var categoryId = obj.options[obj.selectedIndex].value;
                                    obj.remove(obj.selectedIndex);
                                    hd.value = hd.value.replace('/' + categoryId + '/', '/');
                                }
                            </script>
                        </div>
                        <div id="tabs-4">
        
                            <div style="margin: 5px 0px 0px 10px;">
                                <strong>Chưa có thông tin bộ lọc sản phẩm của danh mục!</strong>
                            </div>
        
                        </div>
                    </div>

                        </div>
                        <!-- widget-body -->

                    </div>
                </div>

                </div>
            </div>

            <div style="margin-right: 25px; float: right; color: Gray;">
               Bizweb 4.0 - Giải pháp bán hàng online Số 1 Việt Nam
            </div>

            <div style="height: 10px; margin-top: 40px;">
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
</body>
</html>
