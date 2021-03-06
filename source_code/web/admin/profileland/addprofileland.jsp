<%-- 
    Document   : Add Profile Land
    Author     : PhanAnh
--%>

<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="core" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex, nofollow" />
        <title>Profile Land</title>

        <link rel="Shortcut Icon" href="http://static.bizwebmedia.net/favicon.ico" type="image/x-icon" />
        <%--        <c:set var="url">${pageContext.request.requestURL}</c:set>
                <base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" /> --%>

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
        <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js" type="text/javascript"></script>

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
        <script>
            window.onload = function () {
                CKEDITOR.replace('txt_detail');
            };
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
                                <a class="TopMenuItem" href="javascript:;">
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
                                    Add new project
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div style="clear: both;"></div>
                    <div id="cph_Main_ContentPane">
                        <div class="widget">
                            <div class="widget-body">
                                <div>
                                    <form id="form-add-profile-land" method="POST" enctype="multipart/form-data" action="${pageContext.request.contextPath}/ControllerProfileLand">
                                        <core:if test="${sessionScope.modelManage==null}">
                                            <jsp:useBean id="modelManage" class="vn.javaweb.real.estate.model.ConfigConnection" scope="session" />
                                        </core:if>
                                        <div id="cph_Main_ContentPane">
                                            <div class="widget">
                                                <div class="widget-title">
                                                    <h4>
                                                        <i class="fa fa-file-text-o"></i>
                                                        Add new construction projects
                                                    </h4>
                                                    <div class="ui-corner-top ui-corner-bottom">
                                                        <div id="toolbox">
                                                            <div class="toolbox-content" style="float: right;">
                                                                <table class="toolbar">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td align="center">
                                                                                <button class="toolbar btn btn-info" type="submit" name="action" value="saveadd">
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
                                                            Add new construction projects
                                                        </h4>
                                                        <div class="FloatMenuBar">
                                                            <div class="ui-corner-top ui-corner-bottom">
                                                                <div id="Div1">
                                                                    <div class="toolbox-content" style="float: right;">
                                                                        <table class="toolbar">
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td align="center">
                                                                                        <button class="toolbar btn btn-info" type="submit" >
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
                                                                            Project code
                                                                        </td>
                                                                        <td>
                                                                            <input id="code" class="validate[required] text" type="text" name="code" value="${object.code}" readonly="readonly" />
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Project code </p>
                                                                                    <p class="tooltipmessage"> Code construction projects automatically </p>
                                                                                </span>
                                                                            </span>
                                                                            <% String action = request.getParameter("action");
                                                                                if (action.equalsIgnoreCase("add")) { %>
                                                                            <input type="hidden" name="action" value="add">
                                                                            <script>
                                                                                var d = new Date();
                                                                                document.getElementById("code").value = "PL" + ("0" + d.getDate()).slice(-2) + ("0" + (d.getMonth() + 1)).slice(-2) +
                                                                                        ("0" + d.getHours()).slice(-2) + ("0" + d.getMinutes()).slice(-2) + d.getSeconds() + d.getMilliseconds();
                                                                            </script>  
                                                                            <% } else { %> <input type="hidden" name="action" value="edit"><% }%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Name of project construction
                                                                            <span class="Required">*</span>
                                                                        </td>
                                                                        <td>            
                                                                            <input id="name" class="validate[required] text" type="text" placeholder="Example: Homeland Platinum condo project, ..." value="${object.name}" name="name" required />
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Name of project construction </p>
                                                                                    <p class="tooltipmessage"> Name of the project may be regional location or name of the company building the project construction </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Properties location
                                                                            <span class="Required">*</span>
                                                                        </td>
                                                                        <td>
                                                                            <select id="codeRegional" name="codeRegional" >
                                                                                <option value="null">Select one option</option>
                                                                                <core:forEach var="regionalPrice" items="${modelManage.regionalPriceModelManage.findAll()}" >                     
                                                                                    <option value="${regionalPrice.code}" <core:if test="${object.codeRegional.code eq regionalPrice.code}">selected</core:if> >${regionalPrice.regionalName}</option>  
                                                                                </core:forEach>
                                                                            </select>
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Properties location </p>
                                                                                    <p class="tooltipmessage"> Regulation for regional price </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Project type                                                                            
                                                                        </td>
                                                                        <td>
                                                                            <input id="typeOf" class="validate[required] text" type="text" value="${object.typeOf}" placeholder="Luxury apartment" name="typeOf">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Project type </p>
                                                                                    <p class="tooltipmessage"> Fill type of buildings, the land will be built </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Total land area
                                                                        </td>
                                                                        <td>
                                                                            <input id="totalArea" class="validate[required] text" type="text" name="totalArea" value="${object.totalArea}">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Total land area </p>
                                                                                    <p class="tooltipmessage"> Enter the total land area building </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Capital investment
                                                                        </td>
                                                                        <td>
                                                                            <input id="capitalInvestment" class="validate[required] text" type="text" name="capitalInvestment" value="${object.capitalInvestment}">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Capital investment </p>
                                                                                    <p class="tooltipmessage"> Enter an investment estimate for the project </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Legal status of the project
                                                                        </td>
                                                                        <td>
                                                                            <input id="currentStatus" class="validate[required] text" type="text" name="currentStatus" value="${object.currentStatus}">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Legal status of the project </p>
                                                                                    <p class="tooltipmessage"> Enter the legitimate information of the project such as building permits, a red book, ... </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Estimated total population
                                                                        </td>
                                                                        <td>
                                                                            <input id="populationSize" class="validate[required] text" type="text" name="populationSize" value="${object.populationSize}" >
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Estimated total population </p>
                                                                                    <p class="tooltipmessage"> Enter the total population or office can not after completion </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Total room           
                                                                        </td>
                                                                        <td>
                                                                            <input id="totalRoom" class="validate[required] text" type="text" name="totalRoom" value="${object.totalRoom}" >
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Total room </p>
                                                                                    <p class="tooltipmessage"> Enter the total room after completion </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Total floor
                                                                        </td>
                                                                        <td>
                                                                            <input id="totalFloor" class="validate[required] text" type="text" name="totalFloor" value="${object.totalFloor}" >
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Total floor </p>
                                                                                    <p class="tooltipmessage"> Enter the total floor after completion </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Room size
                                                                        </td>
                                                                        <td>
                                                                            <input id="roomArea" class="validate[required] text" type="text" name="roomArea" value="${object.roomArea}" >
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Room size </p>
                                                                                    <p class="tooltipmessage"> Enter the room area </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Address details project
                                                                            <span class="Required">*</span>
                                                                        </td>
                                                                        <td>
                                                                            <input id="location" class="validate[required] text" type="text" name="location" value="${object.location}">
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Address details project </p>
                                                                                    <p class="tooltipmessage"> Enter the address details for a specific project </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Start date
                                                                            <span class="Required">*</span>
                                                                        </td>
                                                                        <td>
                                                                            <input id="dateStart" class="validate[custom[date]] text hasDatepicker" type="date" name="dateStart" value="${object.dateStart.toString()}">
                                                                            <span class="tooltip-help"></span>
                                                                            <% if (action.equalsIgnoreCase("add")) { %>
                                                                            <script>
                                                                                document.getElementById('dateStart').valueAsDate = new Date();
                                                                            </script>
                                                                            <% }%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            On completing
                                                                            <span class="Required">*</span>
                                                                        </td>
                                                                        <td>
                                                                            <input id="dateEnd" class="validate[custom[date]] text hasDatepicker" type="date" name="dateEnd" value="${object.dateEnd.toString()}">
                                                                            <span class="tooltip-help"></span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key">
                                                                            Select sample image
                                                                        </td>
                                                                        <td>
                                                                            <script>
                                                                                function showMyImage(fileInput) {
                                                                                    var files = fileInput.files;
                                                                                    for (var i = 0; i < files.length; i++) {
                                                                                        var file = files[i];
                                                                                        var imageType = /image.*/;
                                                                                        
                                                                                        var fileInfo = document.getElementById("file-info");
                                                                                        while (fileInfo.hasChildNodes()) {
                                                                                        fileInfo.removeChild(container.lastChild);
                                                                                        }
                                                                                        
                                                                                        if (!file.type.match(imageType)) {                                                                                            
                                                                                            fileInfo.appendChild(document.createElement("LI").appendChild(document.createTextNode("Name: " + file.name)));
                                                                                            fileInfo.appendChild(document.createElement("BR"));
                                                                                            fileInfo.appendChild(document.createElement("LI").appendChild(document.createTextNode("Type: Please image type img or jpg")));
                                                                                            document.getElementById("divimg").style.display = "none";
                                                                                        } else {                                                                                            
                                                                                            fileInfo.appendChild(document.createElement("LI").appendChild(document.createTextNode("Name: " + file.name)));
                                                                                            fileInfo.appendChild(document.createElement("BR"));
                                                                                            fileInfo.appendChild(document.createElement("LI").appendChild(document.createTextNode("Type: " + file.type)));
                                                                                            document.getElementById("divimg").style.display = "block";
                                                                                        }
                                                                                        var img = document.getElementById("thumbnil");
                                                                                        img.file = file;
                                                                                        var reader = new FileReader();
                                                                                        reader.onload = (function (aImg) {
                                                                                            return function (e) {
                                                                                                aImg.src = e.target.result;
                                                                                            };
                                                                                        })(img);
                                                                                        reader.readAsDataURL(file);
                                                                                    }
                                                                                }
                                                                            </script>
                                                                            <input type = "button" value = "Choose image" onclick ="javascript:document.getElementById('imageFile').click();">
                                                                            <input id="imageFile" class="validate[required] text" type="file" name="fileimage" accept="image/*" onchange="showMyImage(this)" style="display:none;"/>                              
                                                                            <div style="display: inline; float: left;">
                                                                                
                                                                                <h4 <core:if test="${object.image eq null || object.image eq ''}"> style="display: none;"</core:if>>File Info:</h4>
                                                                                <ul id="file-info">
                                                                                    <core:if test="${object.image ne null || object.image ne ''}">
                                                                                        <input type="hidden" name="image" value="${object.image}" />
                                                                                        <li>Name:&nbsp;<core:out value="${object.image}" /></li>
                                                                                        <li>Type:&nbsp;<core:out value="Image/*" /></li>
                                                                                    </core:if>
                                                                                </ul>                                                                                
                                                                                <span id="divimg" <core:if test="${object.image eq null || object.image eq ''}"> style="display: none;"</core:if>><img id="thumbnil" style="width:100px; margin-top:5px;" src="${pageContext.request.contextPath}/images/${object.image}" alt="image" /></span>                                                                           
                                                                            </div>                                                                            
                                                                            <span class="tooltip-help">
                                                                                <span class="tooltipContent">
                                                                                    <p class="tooltiptitle"> Select sample image </p>
                                                                                    <p class="tooltipmessage"> Picture general pattern for your project </p>
                                                                                </span>
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key"> Project description </td>
                                                                        <td>
                                                                            <textarea id="txt_description" class="validate[required]" style="visibility: visible; display: block;" rows="5" name="description" cols="20" >${object.introduction}</textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="key"> Project details </td>
                                                                        <td>
                                                                            <textarea id="txt_detail" class="validate[required]" style="visibility: visible; display: block;" rows="10" name="details" cols="20">${object.description}</textarea>
                                                                        </td>
                                                                    </tr>  
                                                                    <tr>
                                                                        <td class="key"> Installment payment </td>
                                                                        <td>
                                                                            <script type='text/javascript'>
                                                                                function addFields() {
                                                                                    // Number of inputs to create
                                                                                    var number = document.getElementById("hitspay").value;
                                                                                    // Container <div> where dynamic content will be placed
                                                                                    var container = document.getElementById("addInputDynamic");
                                                                                    // Clear previous contents of the container
                                                                                    while (container.hasChildNodes()) {
                                                                                        container.removeChild(container.lastChild);
                                                                                    }
                                                                                    document.getElementById("addInputDynamic").style.display = "none";
                                                                                    if (number > 5)
                                                                                        number = 5;
                                                                                    for (i = 0; i < number; i++) {
                                                                                        // Append a node with a random text
                                                                                        container.appendChild(document.createTextNode("Percent " + (i + 1)));
                                                                                        // Create an <input> element, set its type and name attributes
                                                                                        var inputPercent = document.createElement("input");
                                                                                        inputPercent.type = "text";
                                                                                        inputPercent.className = "stylePercent";
                                                                                        inputPercent.name = "percent" + (i+1);
                                                                                        // Create an <input> element, set its type and name attributes
                                                                                        var inputDate = document.createElement("input");
                                                                                        inputDate.type = "date";
                                                                                        inputDate.className = "styleDate";
                                                                                        inputDate.name = "deadlineDate" + (i+1);

                                                                                        container.appendChild(inputPercent);
                                                                                        container.appendChild(document.createTextNode("Date " + (i + 1)));
                                                                                        container.appendChild(inputDate);
                                                                                        // Append a line break 
                                                                                        container.appendChild(document.createElement("br"));

                                                                                        // Set style sheet
                                                                                        document.getElementById("addInputDynamic").style.display = "block";

                                                                                        // Add style sheet
                                                                                        var stylePercent = document.getElementsByClassName("stylePercent");
                                                                                        var k = 0;
                                                                                        for (k = 0; k < stylePercent.length; k++) {
                                                                                            stylePercent[k].style.display = "inline";
                                                                                            stylePercent[k].style.width = "200px";
                                                                                            stylePercent[k].style.margin = "0px 20px";
                                                                                        }
//                                                                                        
                                                                                        var styleDate = document.getElementsByClassName("styleDate");
                                                                                        var j = 0;
                                                                                        for (j = 0; j < styleDate.length; j++) {
                                                                                            styleDate[j].style.width = "200px";
                                                                                            styleDate[j].style.margin = "0px 20px";
                                                                                        }
                                                                                    }
                                                                                }
                                                                            </script>
                                                                            <core:if test="${object.paymentMode ne null}"><core:set value="${object.paymentMode.getSessionPays()}" var="sessionPays" /></core:if>
                                                                            <span style="margin-right: 15px;">Hits pay (max. 5)</span><input type="text" id="hitspay" name="hitspay" style="width:150px;" value="${sessionPays.size()}" onkeyup="addFields()"/>
                                                                            <div id="addInputDynamic" style="border: 1px solid gainsboro; box-sizing: border-box; border-radius: 5px; line-height: 35px; padding: 10px 0px 10px 20px; margin-top: 10px; <core:if test="${sessionPays eq null || sessionPays.size() le 0}">display: none;</core:if>">
                                                                                <core:forEach items="${sessionPays}" var="sessionPay">
                                                                                    <core:out value="Percent${sessionPay.id}" />
                                                                                    <input type="text" class="stylePercent" name="percent${sessionPay.id}" value="${sessionPay.percentPay}" style="display:inline;width:200px;margin:0px 20px;"/>
                                                                                    <core:out value="Date${sessionPay.id}" />
                                                                                    <input type="date" class="styleDate" name="deadlineDate${sessionPay.id}" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${sessionPay.timePay}" />" style="width:200px;margin:0px 20px;" />
                                                                                    <br/>                                                                                    
                                                                                </core:forEach>
                                                                            </div>
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