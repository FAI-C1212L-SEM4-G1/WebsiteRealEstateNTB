<%-- 
    Document   : Add Regional Price
    Author     : PhanAnh
--%>

<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex, nofollow" />
        <title>Regional Price</title>

        <link rel="Shortcut Icon" href="http://static.bizwebmedia.net/favicon.ico" type="image/x-icon" />
        
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/admin/Content/Styles/bootstrap.css" />
        <link href="${pageContext.request.contextPath}/font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/admin/Content/Styles/style.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/admin/Content/Styles/style_default.css" />
        <link type="text/css" rel="Stylesheet" href="${pageContext.request.contextPath}/admin/Content/Styles/jquery-ui-1.9.2.custom.css" />   
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/admin/Content/Styles/iselector.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/Content/Styles/jquery.fancybox.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/Content/Styles/imodal.css">

        <script src="${pageContext.request.contextPath}/admin/Content/Scripts/analytics.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/admin/Content/Scripts/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">var $j = jQuery.noConflict();</script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/common.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/iselector.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/admin.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/imodal.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/admin/Content/Scripts/scripts.js"></script>

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
    </head>
    <body class="fixed-top">        
       <div id="AjaxLoading"><img src="${pageContext.request.contextPath}/admin/Content/Images/Admin/ajax-load.gif" alt=""/>&nbsp; Loading ... Please waiting ...</div>
        <form method="POST" action="" id="form1">
            <script src="${pageContext.request.contextPath}/admin/Content/Scripts/jquery.mousewheel-3.0.6.pack.js" type="text/javascript"></script>            
            <script src="${pageContext.request.contextPath}/admin/Content/Scripts/jquery.fancybox.pack.js" type="text/javascript"></script>
            <div class="PageHeader">
                <div class="LogoHeader">
                    
                </div>
                <div class="SystemMenu">
                    <div>
                        <ul class="sysMenu">
                            <li class="first"><a class="link-topmenu" href="${pageContext.request.contextPath}/index.jsp"><i class="icon-home"></i> Homepage</a></li>
                            <li><a class="link-topmenu" href="#"><i class="icon-user"></i> Profile User</a></li>
                            <li><a class="link-topmenu" href="#"><i class="icon-bar-chart"></i> Statics</a></li>
                            <li><a class="link-topmenu" href="${pageContext.request.contextPath}/index.jsp" target="_blank"><i class="icon-list-alt"></i> Website</a></li>
                            <li><a class="link-topmenu" href="#"><i class="icon-question-sign"></i> Contacts</a></li>
                            <li class="last">
                                <div class="btn-group">
                                    <a href="#" class="btn account-info btn-info"><i class="icon-user"></i>${sessionScope.account.loginId}</a>
                                    <a href="#" data-toggle="dropdown" class="btn btn-info dropdown-toggle dropdown-toggle-acount"><span class="icon-caret-down"></span></a>
                                    <ul class="dropdown-menu custome">
                                        <li><a href="#"><i class="icon-key"></i> Change password</a></li>
                                        <li><a id="siteUser_Lbtn_Logout" class="NormalGray" href="${pageContext.request.contextPath}/login.html?action=logout"><i class="icon-signout"></i> Logout</a></li>
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
                        background-image: url("${pageContext.request.contextPath}/admin/Content/Images/Admin/icon_sub.gif");
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
                        background-image: url("${pageContext.request.contextPath}/admin/Content/Images/Admin/icon_sub.gif");
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
                        /*background-image: url("../Content/Images/Admin/menu_hover.gif");*/
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
                                <a class="TopMenuItem" href="#">
                                    <span class="MenuText"><i class="icon-shopping-cart"></i> Profile building</span>
                                </a>
                                <ul>
                                    <li class="SubFirst">
                                        <a href="${pageContext.request.contextPath}/ControllerProfileLand?action=add">
                                            <span class="SubMenuText">Add new project
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ControllerProfileLand?action=list">
                                            <span class="SubMenuText">List of projects
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="TopMenuItem" href="#">
                                    <span class="MenuText"><i class="icon-tags"></i> Regional price</span>
                                </a>
                                <ul>
                                    <li class="SubFirst">
                                        <a href="${pageContext.request.contextPath}/ControllerRegionalPrice?action=add">
                                            <span class="SubMenuText">Create regional price
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ControllerRegionalPrice?action=list">
                                            <span class="SubMenuText">List regional price
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="TopMenuItem" href="#">
                                    <span class="MenuText"><i class="icon-th-large"></i> Manage account</span>
                                </a>
                                <ul>
                                    <li class="SubFirst">
                                        <a href="${pageContext.request.contextPath}/ControllerAccount?action=add">
                                            <span class="SubMenuText">Create new account
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ControllerAccount?action=list">
                                            <span class="SubMenuText">All account user
                                            </span>
                                        </a>
                                    </li>                                                                       
                                </ul>
                            </li>
                            <li>
                                <a class="TopMenuItem" href="#">
                                    <span class="MenuText"><i class="icon-user"></i> Customer</span>
                                </a>
                                <ul>
                                    <li class="SubFirst">
                                        <a href="${pageContext.request.contextPath}/ControllerCustomer?action=add">
                                            <span class="SubMenuText">Create customer
                                            </span>
                                        </a>
                                    </li>
                                    <li class="SubFirst">
                                        <a href="${pageContext.request.contextPath}/ControllerCustomer?action=listwait">
                                            <span class="SubMenuText">Customers waiting
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ControllerCustomer?action=listpayi">
                                            <span class="SubMenuText">Paying customers 
                                            </span>
                                        </a>
                                    </li>  
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ControllerCustomer?action=listpayf">
                                            <span class="SubMenuText">Pay finish 
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="TopMenuItem" href="#">
                                    <span class="MenuText"><i class="icon-globe"></i> Statics sales</span>
                                </a>
                                <ul>
                                    <li class="SubFirst">
                                        <a href="#">
                                            <span class="SubMenuText">Statics by time
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="SubMenuText">Statics by sales
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <span class="SubMenuText">Statics by location
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a class="TopMenuItem" href="#">
                                    <span class="MenuText"><i class="icon-signin"></i> Information user</span>
                                </a>
                                <ul>
                                    <li class="SubFirst">
                                        <a href="${pageContext.request.contextPath}/admin/account/profileaccount.jsp">
                                            <span class="SubMenuText">View profile
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/admin.aspx?module=socialshop">
                                            <span class="SubMenuText">Edit information
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/admin.aspx?module=socialshop">
                                            <span class="SubMenuText">Setup security
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
                onCancel: function () {
                    $j("#additionalAttr").html('');
                },
                onCleanup: function () {
                    $j("#additionalAttr").html('');
                },
                onClose: function () {
                    $j("#additionalAttr").html('');
                }
            });
            </script>
        </form>

        <div id="main-content">

            <div class="container-fluid">
                <div style="width: 100%; margin: 0 auto;">
                    <div id="Breadcrumb" class="Block Breadcrumb ui-widget-content ui-corner-top ui-corner-bottom">
                        <ul>
                            <li class="SecondLast">
                                <a href="#">
                                    <i class="fa fa-home" style="font-size:14px;"></i>
                                    Mainboard
                                </a>
                            </li>
                            <li class="Last">
                                <span>      
                                    Create regional price
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div style="clear: both;"></div>
                    <div id="cph_Main_ContentPane">
                        <div class="widget">
                            <div class="widget-body">
                                <div>
                                    <form id="form-add-profile-land" method="POST" action="${pageContext.request.contextPath}/ControllerRegionalPrice">
                                        <core:if test="${sessionScope.modelManage==null}">
                                            <jsp:useBean id="modelManage" class="vn.javaweb.real.estate.model.ConfigConnection" scope="session" />
                                        </core:if>
                                        <div id="cph_Main_ContentPane">
                                            <div class="widget">
                                                <div class="widget-title">
                                                    <h4>
                                                        <i class="fa fa-file-text-o"></i>
                                                        Create new regional price
                                                    </h4>
                                                    <div class="ui-corner-top ui-corner-bottom">
                                                        <div id="toolbox">
                                                            <div class="toolbox-content" style="float: right;">
                                                                <table class="toolbar">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <button class="toolbar btn btn-info" type="submit" value="save">
                                                                                    <i class="fa fa-floppy-o"></i>
                                                                                    Save
                                                                                </button>
                                                                            </td>
                                                                            <td align="center">
                                                                                <a class="toolbar btn btn-info" href="#" title="Back">
                                                                                    <i class="fa fa-arrow-circle-o-right"></i>
                                                                                    Back
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
                                                            <i class="icon-reorder"></i>
                                                            Create new regional price
                                                        </h4>
                                                        <div class="FloatMenuBar">
                                                            <div class="ui-corner-top ui-corner-bottom">
                                                                <div id="Div1">
                                                                    <div class="toolbox-content" style="float: right;">
                                                                        <table class="toolbar">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td align="center">
                                                                                        <button class="toolbar btn btn-info" type="submit" value="save">
                                                                                            <i class="fa fa-floppy-o"></i>
                                                                                            Save
                                                                                        </button>
                                                                                    </td>
                                                                                    <td align="center">
                                                                                        <a class="toolbar btn btn-info" href="#" title="Back">
                                                                                            <i class="fa fa-arrow-circle-o-right"></i>
                                                                                            Back
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
                                                    <div id="tabs">
                                                        <div id="tabs-1">
                                                            <table class="admintable" style="width: 100%;">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Regional price code
                                                                        </td>
                                                                        <td>
                                                                            <input id="code" class="validate[required] text" type="text" name="code" value="${object.code}" readonly="readonly" />                                                                            
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Regional price code </p>
                                                                                    <p class="tooltipmessage"> ... </p>
                                                                                </span>
                                                                            </span>                                                                            
                                                                            <% String action = request.getParameter("action");
                                                                                    if (action.equalsIgnoreCase("add")) { %>
                                                                                <input type="hidden" name="action" value="add">
                                                                                <script>
                                                                                    var d = new Date();                                                      ;
                                                                                    document.getElementById("code").value = "RP" + ("0" + d.getDate()).slice(-2) + ("0" + (d.getMonth() + 1)).slice(-2) +
                                                                                            ("0" + d.getHours()).slice(-2) + ("0" + d.getMinutes()).slice(-2) + d.getSeconds() + d.getMilliseconds();                                                                                
                                                                                </script>  
                                                                            <% } else { %> <input type="hidden" name="action" value="edit"><% }%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Location details
                                                                            <span class="Required">*</span>
                                                                        </td>
                                                                        <td>            
                                                                            <input id="regionalName" class="validate[required] text" type="text" placeholder="" value="${object.regionalName}" name="regionalName" >
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Location details </p>
                                                                                    <p class="tooltipmessage"> ... </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>                                                                    
                                                                    <tr>
                                                                        <td class="key">
                                                                            City name                                                                            
                                                                        </td>
                                                                        <td>
                                                                            <input id="city" class="validate[required] text" type="text" value="${object.city}" placeholder="" name="city">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> City name </p>
                                                                                    <p class="tooltipmessage"> ... </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Country
                                                                        </td>
                                                                        <td>
                                                                            <input id="country" class="validate[required] text" type="text" name="country" value="${object.country}">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Country </p>
                                                                                    <p class="tooltipmessage"> ... </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Unit price
                                                                        </td>
                                                                        <td>
                                                                            <input id="unitPrice" class="validate[required] text" type="text" name="unitPrice" value="${object.unitPrice}">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Unit price </p>
                                                                                    <p class="tooltipmessage"> ... </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>                                                                                                                                                                
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                                          
            <div style="margin-right: 25px; float: right; color: Gray;"> National Territory Builders - Real Estate </div>
            <div style="height: 10px; margin-top: 40px;"> </div>
        </div>                    
    </body>
</html>
