<%-- 
    Document   : userindex
    Created on : Aug 20, 2015, 4:50:13 PM
    Author     : sang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
       <div id="main-content">
            <div class="container-fluid">
                <div style="width: 100%; margin: 0 auto;">
                    
<div id="Breadcrumb" class="Block Breadcrumb ui-widget-content ui-corner-top ui-corner-bottom">
    <ul>
        <li class='SecondLast'><a href='/admin'><i class="icon-home" style="font-size:14px;"></i> Trang chủ</a></li><li class='Last'><span>Danh sách sản phẩm</span></li>
    </ul>
</div>
<div style="clear: both;"></div>

                        
    <div id="cph_Main_ContentPane">




<div class="widget">
    <div class="widget-title">
        <h4><i class="icon-list-alt"></i>&nbsp;Danh sách sản phẩm</h4>
        
<div class="ui-widget-content ui-corner-top ui-corner-bottom">
    <div id="toolbox">
        
        <div style="float:right;" class="toolbox-content">
            
                    <table class="toolbar">
                        <tr>
                
                    <td align="center">
                        <a onclick="javascript:return PopupHelp(&#39;http://support.bizweb.vn/popuphelp.aspx?faqcat=47&#39;);" id="cph_Main_ctl00_toolbox_rptAction_lbtAction_0" title="Trợ giúp" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl01$lbtAction&#39;,&#39;&#39;)"><i class="icon-question-sign"></i>&nbsp;
                            Trợ giúp</a>
                    </td>
                
                    <td align="center">
                        <a id="cph_Main_ctl00_toolbox_rptAction_lbtAction_1" title="Thêm mới" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl02$lbtAction&#39;,&#39;&#39;)"><i class="icon-plus"></i>&nbsp;
                            Thêm mới</a>
                    </td>
                
                    <td align="center">
                        <a onclick="javascript:return ConfirmDelete();" id="cph_Main_ctl00_toolbox_rptAction_lbtAction_2" title="Xóa" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox$rptAction$ctl03$lbtAction&#39;,&#39;&#39;)"><i class="icon-trash"></i>&nbsp;
                            Xóa</a>
                    </td>
                
                        </tr>
                    </table>
                
        </div>
    </div>
</div>
        <div id="hiddenToolBarScroll" class="scrollBox hidden">
            <h4>
                <i class="icon-list-alt"></i>&nbsp;Danh sách sản phẩm</h4>
            <div class="FloatMenuBar">
                
<div class="ui-widget-content ui-corner-top ui-corner-bottom">
    <div id="toolbox">
        
        <div style="float:right;" class="toolbox-content">
            
                    <table class="toolbar">
                        <tr>
                
                    <td align="center">
                        <a onclick="javascript:return PopupHelp(&#39;http://support.bizweb.vn/popuphelp.aspx?faqcat=47&#39;);" id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_0" title="Trợ giúp" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl01$lbtAction&#39;,&#39;&#39;)"><i class="icon-question-sign"></i>&nbsp;
                            Trợ giúp</a>
                    </td>
                
                    <td align="center">
                        <a id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_1" title="Thêm mới" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl02$lbtAction&#39;,&#39;&#39;)"><i class="icon-plus"></i>&nbsp;
                            Thêm mới</a>
                    </td>
                
                    <td align="center">
                        <a onclick="javascript:return ConfirmDelete();" id="cph_Main_ctl00_toolbox2_rptAction_lbtAction_2" title="Xóa" class="toolbar btn btn-info" href="javascript:__doPostBack(&#39;ctl00$cph_Main$ctl00$toolbox2$rptAction$ctl03$lbtAction&#39;,&#39;&#39;)"><i class="icon-trash"></i>&nbsp;
                            Xóa</a>
                    </td>
                
                        </tr>
                    </table>
                
        </div>
    </div>
</div>
            </div>
        </div>
    </div>
    <div class="widget-body">
        

        
<script type="text/javascript">
function SelectAllCheckboxes(chk) {
    $j('#cph_Main_ctl00_ctl00_grvProducts >tbody >tr >td:nth-child(1)').find("input:checkbox").attr('checked', chk.checked);
}
function CheckSelectAtLeastOne() {
    var checked = false;
    $j('#cph_Main_ctl00_ctl00_grvProducts >tbody >tr >td:nth-child(1)').find("input:checkbox").each(function() {
        if (this.checked) { checked = true; }
    });
    if (checked == false) {
        alert('Hãy chọn ít nhất 1 sản phẩm để thao tác');
        return false;
    } else { return true; }
}
function ConfirmDelete() {
    if (CheckSelectAtLeastOne()) {
        var confirmAlert = 'Bạn có chắc chắn muốn xóa các sản phẩm này không?';
        $j('#cph_Main_ctl00_ctl00_grvProducts >tbody').find("tr").each(function() {
            var checked = false;
            var imgChecked = false;
            $j(this).find('img[src="http://st.hangtot.com/favicon.ico"]').each(function() {
                imgChecked = true;
            });
            $j(this).find("input:checkbox:first").each(function() {
                if (this.checked) { checked = true; }
            });
            if(checked == true && imgChecked == true)
            {
                confirmAlert='Bạn có chắc chắn muốn xóa sản phẩm này và sản phẩm trên gian hàng hangtot.com?'
            }
        });
        return confirm(confirmAlert);
    }
    return false;
}
function ShowQuickHelp(container, title, desc)
{
    div = document.createElement("div");
    div.id = 'help';
    div.style.zIndex = 1;
    div.style.display = 'block';
    div.style.position = 'absolute';
    div.style.width = '185px';
    div.style.backgroundColor = '#FEFCD5';
    div.style.border = 'solid 1px #E7E3BE';
    div.style.padding = '10px';
    if(title != '') {
	    div.innerHTML = '<div class="helpTip"><strong>' + title + '</strong></div><br />';
    }
    div.innerHTML += '<div style="width:185px; padding-left:0px" class=helpTip>' + desc + '</div>';
    SetQuickHelpPosition(div, container, 185)
    container.parentNode.appendChild(div);
}
function SetQuickHelpPosition(d, container, width)
{
    var containerX = 0;
    var containerY = 0;
    var containerTemp = container;
    while( containerTemp != null ) {
	    containerX += containerTemp.offsetLeft;
	    containerY += containerTemp.offsetTop;
	    containerTemp = containerTemp.offsetParent;
    }
    var scrollXY = getScrollXY();
    var windowRight = document.documentElement.clientWidth;
    var divX = windowRight-width;
    var divY = containerY+15;
    if (divX<=containerX-scrollXY[0]) {
	    d.style.left= divX+'px';
    }
    else if(width+containerX+50 > $j(window).width()) {
	    d.style.left = (divX-width-50)+'px';
    }
    d.style.top = divY+'px';
}
function getScrollXY()
{
    var scrOfX = 0, scrOfY = 0;
    if( typeof( window.pageYOffset ) == 'number' ) {
	    //Netscape compliant
	    scrOfY = window.pageYOffset;
	    scrOfX = window.pageXOffset;
    } else if( document.body && ( document.body.scrollLeft || document.body.scrollTop ) ) {
	    //DOM compliant
	    scrOfY = document.body.scrollTop;
	    scrOfX = document.body.scrollLeft;
    } else if( document.documentElement && ( document.documentElement.scrollLeft || document.documentElement.scrollTop ) ) {
	    //IE6 standards compliant mode
	    scrOfY = document.documentElement.scrollTop;
	    scrOfX = document.documentElement.scrollLeft;
    }
    return [ scrOfX, scrOfY ];
}
function HideQuickHelp(p)
{
    if ($j("#help").length) {
	    $j("#help").css('display','none');
	    setTimeout('RemoveHelp()', 1);
    }
}
function RemoveHelp() {
    $j("#help").remove();
}

function ConvertPrice(numberText, culture) {
    if(numberText == "") return 0;
    var number = 0;
    if(culture == "vi-VN") {
        number = numberText.replace(/\./g, "");
        return Number(number);
    }
    else {
        console.log(numberText);
        var s = numberText.length - 2;
        var c = numberText.substring(s - 1, s);
        if(c == ".") {
            number = numberText.replace(/\,/g, "");
            return Number(number);
        }
        if(c == ",") {
            number = numberText.replace(/\./g, "");
            number = number.replace(/\,/g, ".");
            return Number(number);
        }
    }
    return Number(numberText);
}
function UpdateProduct(linkUpdateId, pId)
{
    var id = $j(linkUpdateId).closest('tr').children(".Id").children("#txtId").val();
    var code = $j(linkUpdateId).closest('tr').children(".Code").children("#txtCode").val();
    var price = $j(linkUpdateId).closest('tr').children(".Price").children("#txtPrice").val();
    var retailPrice = $j(linkUpdateId).closest('tr').children(".RetailPrice").children("#txtRetailPrice").val();
    var salePrice = $j(linkUpdateId).closest('tr').children(".SalePrice").children("#txtSalePrice").val();
    var orderNumber = $j(linkUpdateId).closest('tr').children(".OrderNumber").children("#txtOrderNumber").val();
    var status = $j(linkUpdateId).closest('tr').children(".Status").children("#ddlStatus").val();
    var isVisible;
    
    if ($j(linkUpdateId).closest('tr').children(".Visible").children("#cbIsVisible:checked").is(':checked')){
        isVisible = 'true';
    }
    else{
        isVisible = 'false';
    }

    if(price < salePrice){ alert("Giá khuyến mãi phải nhỏ hơn giá bán !"); return false; }
    
    var querystring = "{'siteid':'" + 52691 + "'," + 
                        "'productid':'" + id + "'," + 
                        "'price':'" + price + "'," + 
                        "'retailprice':'" + retailPrice + "'," + 
                        "'saleprice':'" + salePrice + "'," + 
                        "'ordernumber':'" + orderNumber + "'," + 
                        "'isvisible':'" + isVisible + "'," +
                        "'code':'" + code + "'," +
                        "'status':'" + status + "'" + "}";

    $j.ajax({
        beforeSend: function() {},
        type: "POST",
        url: "/WebServices/ProductService.asmx/UpdateProduct",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: querystring,
        success: function(response) {
            var result = response.d.ValueReturn;
            if(result == "true") alert("Cập nhật thông tin sản phẩm thành công !");
            else{ if(result != "false") alert(result);}
        }
    });
    
    return false;
    
}

function UpdateProduct2(pId){
    var linkUpdateId = $j("#lbtUpdateProduct" + pId);
    var id = $j(linkUpdateId).closest('tr').children(".Id").children("#txtId").val();
    id = pId;
    //alert(id);
    var code = $j(linkUpdateId).closest('tr').children(".Code").children("#txtCode").val();
    var price = $j(linkUpdateId).closest('tr').children(".Price").children("#txtPrice").val();
    //var retailPrice = $j(linkUpdateId).closest('tr').children(".RetailPrice").children("#txtRetailPrice").val();
    var retailprice = 0;
    var salePrice = $j(linkUpdateId).closest('tr').children(".SalePrice").children("#txtSalePrice").val();
    var orderNumber = $j(linkUpdateId).closest('tr').children(".OrderNumber").children("#txtOrderNumber").val();
    var status = $j(linkUpdateId).closest('tr').children(".Status").children("#ddlStatus").val();
    var culture = $j(linkUpdateId).closest('tr').children(".Price").children("#txtPrice").attr("culture");
    var isVisible;

    if ($j(linkUpdateId).closest('tr').children(".Visible").children("#cbIsVisible:checked").is(':checked')){ isVisible = 'true'; }
    else{ isVisible = 'false'; }
    
    console.log(price);
    //console.log(retailPrice);
    console.log(salePrice);

    price = ConvertPrice(price, culture);
    //retailPrice = ConvertPrice(retailPrice, culture);
    salePrice = ConvertPrice(salePrice, culture);

    if(price < salePrice){ alert("Giá khuyến mãi phải nhỏ hơn giá bán !"); return false; }
    
    //(ByVal siteid As Integer, ByVal productid As Integer, ByVal price As String, ByVal ordernumber As Integer, ByVal isvisible As String) As StringServiceInfo
    //(ByVal siteid As Integer, ByVal productid As Integer, ByVal price As String, ByVal retailprice As String, ByVal saleprice As String, ByVal ordernumber As Integer, ByVal isvisible As String, ByVal code As String, ByVal status As String)
    var querystring = "{'siteid':'" + 52691 + "'," + 
                        "'productid':'" + id + "'," + 
                        "'price':'" + price + "'," +
                        "'retailprice' :'"+retailprice+"',"+ 
                        "'saleprice':'"+salePrice+"',"+
                        "'ordernumber':'" + orderNumber + "'," +                         
                        "'isvisible':'" + isVisible + "',"+
                        "'code':'"+code+"',"+
                        "'status':'"+status+"'}";
                        
    $j.ajax({
        beforeSend: function() {},
        type: "POST",
        url: "/WebServices/ProductService.asmx/UpdateProduct",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: querystring,
        success: function(response) {
            var result = response.d.ValueReturn;
            if(result == "true"){  }
            else{ alert(result); }
        }
    });

    return false;
}

</script>
<script type="text/javascript">
function CreateHangtotProduct(){
    var useHangtot = 'False';
    if( useHangtot == 'True'){
        $j.iModal({
            type: 'iframe',
            title: 'Chọn sản phẩm mẫu trên Hangtot.com',
            onOpen: function () {
                $j('.closeModalButton').bind('click', function () {
                    $j.iModal.close();
                });
                $j('#ModalContainer').show();
            },
            //buttons: '<input type="button" class="closeModalButton" value="Close"/>',
            url: '/Admin/Hangtot/HangtotProductSearch.aspx?type=selectinfo&random=' + Math.floor((Math.random()*9000000)+1000000),
            width: 780,
            height: 410,
            top: '15%'
        });
        return false;
    }
    else{
        return true;
    }
}

function OpenHangtotSync(productid,productname) {
    $j.iModal({
        type: 'iframe',
        title: 'Đăng sản phẩm ' + decodeURIComponent(productname.replace(/\+/g, '%20')) + ' lên Hangtot.com',
        onOpen: function () {
            $j('.closeModalButton').bind('click', function () {
                $j.iModal.close();
            });
            $j('#ModalContainer').show();
        },
        //buttons: '<input type="button" class="closeModalButton" value="Close"/>',
        url: '/Admin/Hangtot/HangtotProductSearch.aspx?type=productsync&productid=' + productid + '&productname=' + productname,
        width: 780,
        height: 400,
        top: '15%'
    });

    return false;
}

function OpenHangtotProduct(productid) {
    $j.iModal({
        type: 'iframe',
        title: 'Chi tiết sản phẩm liên kết trên Hangtot.com',
        onOpen: function () {
            $j('.closeModalButton').bind('click', function () {
                $j.iModal.close();
            });
            $j('#ModalContainer').show();
        },
        //buttons: '<input type="button" class="closeModalButton" value="Close"/>',
        url: '/Admin/Hangtot/HangtotProductDetail.aspx?productid=' + productid,
        width: 450,
        height: 220,
        top: '15%'
    });

    return false;
}
</script>

<div class="row-fluid">
    <div class="span3">
        <div id="sample_1_length" class="dataTables_length">
            <select name="ctl00$cph_Main$ctl00$ctl00$ddlPage" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$cph_Main$ctl00$ctl00$ddlPage\&#39;,\&#39;\&#39;)&#39;, 0)" id="cph_Main_ctl00_ctl00_ddlPage" style="width:160px;">
	<option value="10">10 Bản ghi / trang</option>
	<option selected="selected" value="20">20 Bản ghi / trang</option>
	<option value="30">30 Bản ghi / trang</option>
	<option value="50">50 Bản ghi / trang</option>
	<option value="100">100 Bản ghi / trang</option>

</select>
        </div>
    </div>
    <div class="span9 form-search pull-right text-right">
        <input name="ctl00$cph_Main$ctl00$ctl00$txtSearch" type="text" maxlength="100" id="cph_Main_ctl00_ctl00_txtSearch" placeholder="Tên sản phẩm" style="width:200px;" />
        <select name="ctl00$cph_Main$ctl00$ctl00$ddlCate" id="cph_Main_ctl00_ctl00_ddlCate" style="width:200px;">
	<option selected="selected" value="-1">-- Danh mục sản phẩm --</option>
	<option value="832431">S&#225;ch kinh doanh</option>
	<option value="832432">└-------- T&#224;i ch&#237;nh v&#224; đầu tư</option>
	<option value="832433">└-------- Marketing v&#224; b&#225;n h&#224;ng</option>
	<option value="832434">└-------- L&#227;nh đạo v&#224; quản l&#253;</option>
	<option value="832428">Văn học</option>
	<option value="832429">└-------- Văn học Việt Nam</option>
	<option value="832430">└-------- Văn học nước ngo&#224;i</option>
	<option value="832435">S&#225;ch gi&#225;o khoa</option>
	<option value="832436">└-------- S&#225;ch gi&#225;o khoa cấp I</option>
	<option value="832437">└-------- S&#225;ch gi&#225;o khoa cấp II</option>
	<option value="832438">└-------- S&#225;ch gi&#225;o khoa cấp III</option>
	<option value="832439">└-------- S&#225;ch tham khảo</option>

</select>
        <input type="submit" name="ctl00$cph_Main$ctl00$ctl00$btnSearch" value="Tìm kiếm" id="cph_Main_ctl00_ctl00_btnSearch" class="btn" />
        <a class="btn " href="/admin.aspx?module=products&act=advance-search"><i class="icon-filter"></i> Lọc sản phẩm</a>
    </div>
</div>
<div class="row-fluid">
    <div class="span3">
        <div style="margin-top:18px;">
            Tổng số sản phẩm: <span style='color: #A52A2A;'>50</span> / <span style='color: #333;'>100</span>
        </div>
    </div>
    <div class="span9">
        
<div class="pagination pagination-small pagination-right">
    <ul>
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingTop_hplFirst" class="disabled" href="javascript:;">Trang đầu</a>
        </li>
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingTop_hplPrevPage" class="disabled" href="javascript:;">«</a>
        </li>
        
                <li>
                    <a id="cph_Main_ctl00_ctl00_PagingTop_rptPaging_hplPaging_0" class="active" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=1" style="background-color:#F5F5F5;color:#999999;">1</a>
                    
                </li>
            
                <li>
                    <a id="cph_Main_ctl00_ctl00_PagingTop_rptPaging_hplPaging_1" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=2">2</a>
                    
                </li>
            
                <li>
                    <a id="cph_Main_ctl00_ctl00_PagingTop_rptPaging_hplPaging_2" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=3">3</a>
                    
                </li>
            
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingTop_hplNextPage" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=2">»</a>
        </li>
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingTop_hplLast" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=3">Trang cuối</a>
        </li>
    
    
    </ul>
</div>


    </div>
</div>
<div>
	<table class="table table-striped table-bordered dataTable table-hover" cellspacing="0" id="cph_Main_ctl00_ctl00_grvProducts" style="border-collapse:collapse;">
		<tr>
			<th scope="col">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkAll" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl01$chkAll" onclick="javascript:SelectAllCheckboxes(this);" />
            </th><th scope="col">Ảnh</th><th scope="col">Mã sản phẩm</th><th scope="col">Tên sản phẩm</th><th scope="col">Giá</th><th scope="col">Giá khuyến mại</th><th scope="col">Trạng thái</th><th scope="col">Thứ tự</th><th scope="col">Hiển thị</th><th scope="col">Thao tác</th>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_0" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl02$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl02$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_0" value="2946699" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/5548131800cauhoibttracnghiem.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/5548131800cauhoibttracnghiem.gif&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='STK 06'
                    onchange="javascript:return UpdateProduct2(2946699);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946699">
                    800 câu hỏi bài tập trắc nghiệm Vật lí 11</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="36.000"
                    onchange="javascript:return UpdateProduct2(2946699);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946699);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946699);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946699);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946699);" />
            </td><td class="text-center" align="center" style="width:90px;">
                
                <a class="action-link-button" title="Thêm sản phẩm vào danh mục này" href="/admin.aspx?module=products&act=add&cateid=832428&random=5039628&urlreturn=%2fadmin.aspx%3fmodule%3dcategories">
                    <i class="icon-plus"></i>
                </a>
                
                
                <a href="/admin.aspx?module=products&act=edit&id=2946699" class="action-link-button" id="lbtUpdateProduct2946699"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946699&random=2946699&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_1" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl03$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl03$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_1" value="2946698" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4903897tuyentapbtchonlochoa11d.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4903897tuyentapbtchonlochoa11d.gif&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='STK 05'
                    onchange="javascript:return UpdateProduct2(2946698);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946698">
                    Tuyển tập bài tập chọn lọc Hóa học 11</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="45.000"
                    onchange="javascript:return UpdateProduct2(2946698);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946698);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946698);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946698);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946698);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946698" class="action-link-button" id="lbtUpdateProduct2946698"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946698&random=2946698&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_2" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl04$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl04$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_2" value="2946697" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4018100huongdanonlichsu9.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4018100huongdanonlichsu9.gif&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='STK 04'
                    onchange="javascript:return UpdateProduct2(2946697);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946697">
                    Hướng dẫn ôn tập lịch sử 9</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="22.000"
                    onchange="javascript:return UpdateProduct2(2946697);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946697);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946697);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946697);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946697);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946697" class="action-link-button" id="lbtUpdateProduct2946697"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946697&random=2946697&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_3" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl05$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl05$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_3" value="2946696" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/3206960hoctotnguvan8.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/3206960hoctotnguvan8.gif&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='STK 03'
                    onchange="javascript:return UpdateProduct2(2946696);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946696">
                    Học tốt Ngữ văn 8 tập 1</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="19.000"
                    onchange="javascript:return UpdateProduct2(2946696);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946696);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946696);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946696);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946696);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946696" class="action-link-button" id="lbtUpdateProduct2946696"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946696&random=2946696&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_4" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl06$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl06$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_4" value="2946695" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/2514881sp31465_11.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/2514881sp31465_11.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKIII 06'
                    onchange="javascript:return UpdateProduct2(2946695);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946695">
                    Bộ sách giáo khoa và bài tập lớp 11 Ban KHTN</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="111.000"
                    onchange="javascript:return UpdateProduct2(2946695);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946695);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946695);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946695);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946695);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946695" class="action-link-button" id="lbtUpdateProduct2946695"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946695&random=2946695&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_5" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl07$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl07$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_5" value="2946694" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/2201850bo-sach-giao-khoa-lop-12.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/2201850bo-sach-giao-khoa-lop-12.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKIII 05'
                    onchange="javascript:return UpdateProduct2(2946694);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946694">
                    Bộ sách giáo khoa và bài tập lớp 12 - Bộ chuẩn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="122.500"
                    onchange="javascript:return UpdateProduct2(2946694);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946694);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946694);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946694);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946694);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946694" class="action-link-button" id="lbtUpdateProduct2946694"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946694&random=2946694&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_6" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl08$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl08$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_6" value="2946693" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/1800772200902251520041317152.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/1800772200902251520041317152.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKIII 04'
                    onchange="javascript:return UpdateProduct2(2946693);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946693">
                    Bộ sách giáo khoa và bài tập lớp 11 Ban chuẩn - 21 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="104.100"
                    onchange="javascript:return UpdateProduct2(2946693);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946693);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946693);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946693);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946693);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946693" class="action-link-button" id="lbtUpdateProduct2946693"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946693&random=2946693&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_7" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl09$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl09$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_7" value="2946692" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/1059210L11_tonghop2.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/1059210L11_tonghop2.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKIII 03'
                    onchange="javascript:return UpdateProduct2(2946692);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946692">
                    Bộ sách giáo khoa và bài tập lớp 11 Ban KHXH - 13 cuốn </a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="120.500"
                    onchange="javascript:return UpdateProduct2(2946692);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946692);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946692);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946692);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946692);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946692" class="action-link-button" id="lbtUpdateProduct2946692"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946692&random=2946692&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_8" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl10$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl10$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_8" value="2946691" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/043574163199-9.9.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/043574163199-9.9.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKIII 02'
                    onchange="javascript:return UpdateProduct2(2946691);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946691">
                    Bộ sách giáo khoa và bài tập Lớp 10 Ban Chuẩn - 21 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="151.800"
                    onchange="javascript:return UpdateProduct2(2946691);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946691);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946691);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946691);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946691);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946691" class="action-link-button" id="lbtUpdateProduct2946691"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946691&random=2946691&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_9" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl11$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl11$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_9" value="2946690" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/0047460KH001M8.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/0047460KH001M8.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKIII 01'
                    onchange="javascript:return UpdateProduct2(2946690);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946690">
                    Bộ sách giáo khoa và bài tập lớp 10 - Ban KHXH - 21 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="168.500"
                    onchange="javascript:return UpdateProduct2(2946690);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946690);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946690);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946690);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946690);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946690" class="action-link-button" id="lbtUpdateProduct2946690"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946690&random=2946690&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_10" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl12$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl12$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_10" value="2946689" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/5401538sach giao khoa lop 9-500x500.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/5401538sach giao khoa lop 9-500x500.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKII 04'
                    onchange="javascript:return UpdateProduct2(2946689);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946689">
                    Bộ sách giáo khoa Lớp 9 - 12 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="97.500"
                    onchange="javascript:return UpdateProduct2(2946689);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946689);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946689);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946689);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946689);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946689" class="action-link-button" id="lbtUpdateProduct2946689"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946689&random=2946689&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_11" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl13$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl13$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_11" value="2946688" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/5118272sach giao khoa lop 8-500x500.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/5118272sach giao khoa lop 8-500x500.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKII 03'
                    onchange="javascript:return UpdateProduct2(2946688);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946688">
                    Bộ sách giáo khoa Lớp 8 - 13 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="105.000"
                    onchange="javascript:return UpdateProduct2(2946688);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946688);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946688);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946688);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946688);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946688" class="action-link-button" id="lbtUpdateProduct2946688"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946688&random=2946688&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_12" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl14$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl14$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_12" value="2946687" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4912585sach giao khoa lop 7.-500x500.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4912585sach giao khoa lop 7.-500x500.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKII 02'
                    onchange="javascript:return UpdateProduct2(2946687);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946687">
                    Bộ sách giáo khoa Lớp 7 - 12 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="97.000"
                    onchange="javascript:return UpdateProduct2(2946687);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946687);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946687);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946687);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946687);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946687" class="action-link-button" id="lbtUpdateProduct2946687"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946687&random=2946687&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_13" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl15$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl15$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_13" value="2946686" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4649163sach giao khoa lop 6-500x500.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4649163sach giao khoa lop 6-500x500.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKII 01'
                    onchange="javascript:return UpdateProduct2(2946686);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946686">
                    Bộ sách giáo khoa Lớp 6 - 12 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="83.500"
                    onchange="javascript:return UpdateProduct2(2946686);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946686);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946686);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946686);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946686);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946686" class="action-link-button" id="lbtUpdateProduct2946686"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946686&random=2946686&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_14" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl16$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl16$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_14" value="2946685" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4317850jxs1219113755.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4317850jxs1219113755.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKI 06'
                    onchange="javascript:return UpdateProduct2(2946685);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946685">
                    Bộ sách giáo khoa Lớp 4 - 9 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="66.100"
                    onchange="javascript:return UpdateProduct2(2946685);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946685);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946685);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946685);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946685);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946685" class="action-link-button" id="lbtUpdateProduct2946685"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946685&random=2946685&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_15" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl17$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl17$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_15" value="2946684" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4012647SACH GIAO KHOA LOP 5 BỘ-500x500.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4012647SACH GIAO KHOA LOP 5 BỘ-500x500.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKI 05'
                    onchange="javascript:return UpdateProduct2(2946684);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946684">
                    Bộ sách giáo khoa Lớp 5 - 9 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="67.200"
                    onchange="javascript:return UpdateProduct2(2946684);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946684);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946684);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946684);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946684);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946684" class="action-link-button" id="lbtUpdateProduct2946684"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946684&random=2946684&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_16" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl18$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl18$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_16" value="2946683" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/3659710jxs1219113755.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/3659710jxs1219113755.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKI 04'
                    onchange="javascript:return UpdateProduct2(2946683);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946683">
                    Bộ sách giáo khoa Lớp 4 - 19 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="109.200"
                    onchange="javascript:return UpdateProduct2(2946683);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946683);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946683);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946683);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946683);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946683" class="action-link-button" id="lbtUpdateProduct2946683"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946683&random=2946683&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_17" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl19$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl19$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_17" value="2946682" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/32419442900000000926_medium.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/32419442900000000926_medium.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKI 03'
                    onchange="javascript:return UpdateProduct2(2946682);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946682">
                    Bộ sách giáo khoa Lớp 3 - 14 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="75.900"
                    onchange="javascript:return UpdateProduct2(2946682);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946682);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946682);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946682);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946682);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946682" class="action-link-button" id="lbtUpdateProduct2946682"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946682&random=2946682&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row0">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_18" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl20$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl20$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_18" value="2946680" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/16187567132.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/16187567132.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='SGKI 01'
                    onchange="javascript:return UpdateProduct2(2946680);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946680">
                    Bộ sách giáo khoa Lớp 1 - 14 cuốn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="67.600"
                    onchange="javascript:return UpdateProduct2(2946680);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946680);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946680);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946680);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946680);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946680" class="action-link-button" id="lbtUpdateProduct2946680"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946680&random=2946680&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr><tr class="row1">
			<td align="center" style="width:8px;">
                <input id="cph_Main_ctl00_ctl00_grvProducts_chkEdit_19" type="checkbox" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl21$chkEdit" />
                <input type="hidden" name="ctl00$cph_Main$ctl00$ctl00$grvProducts$ctl21$hdEdit" id="cph_Main_ctl00_ctl00_grvProducts_hdEdit_19" value="2946679" />
            </td><td class="text-center" align="center" style="width:30px;">
                <img src="http://media.bizwebmedia.net/Thumbnails/templates/images/2011/5/4611022TRIETLYKINHDOANHTHUCTIEN-N-T.30.30.jpg" alt=""
                    onerror="this.src='http://media.bizwebmedia.net/Thumbnail.ashx?img=templates/images/2011/5/4611022TRIETLYKINHDOANHTHUCTIEN-N-T.jpg&width=30&height=30';" />
            </td><td class="Code" align="center" style="width:80px;">
                <input type="text" id="txtCode" style="width: 70px; text-align: left;" value='LÐQL 04'
                    onchange="javascript:return UpdateProduct2(2946679);" />
            </td><td>
                <a href="/admin.aspx?module=products&act=edit&id=2946679">
                    Triết lý kinh doanh thực tiễn</a>
            </td><td class="Price" align="center" style="width:90px;">
                <input type="text" id="txtPrice" style="width: 75px; text-align: right;" value="25.000"
                    onchange="javascript:return UpdateProduct2(2946679);" culture="vi-VN" />
            </td><td class="SalePrice" align="center" style="width:70px;">
                <input type="text" id="txtSalePrice" style="width: 75px; text-align: right;" value="0"
                    onchange="javascript:return UpdateProduct2(2946679);" />
                    <input type="hidden" />
            </td><td class="Status" align="center" style="width:95px;">
                <select id="ddlStatus" style="width: 95px; text-align: left;" onchange="javascript:return UpdateProduct2(2946679);">
                    <option value="allow" selected="selected">Đang bán</option>
                    <option value="disallow" >Chỉ hiển thị</option>
                    <option value="disallowandtext" >Hiển thị chữ thay thế</option>
                </select>
            </td><td class="OrderNumber" align="center" style="width:45px;">
                <input type="text" id="txtOrderNumber" style="width: 30px;" value="1" onchange="javascript:return UpdateProduct2(2946679);" />
            </td><td class="Visible text-center" align="center" style="width:45px;">
                <input type="checkbox" id="cbIsVisible" checked onchange="javascript:return UpdateProduct2(2946679);" />
            </td><td class="text-center" align="center" style="width:90px;">
                <a href="/admin.aspx?module=products&act=edit&id=2946679" class="action-link-button" id="lbtUpdateProduct2946679"
                    title="Chỉnh sửa sản phẩm này"><i class="icon-edit"></i></a>
                <a href="/admin.aspx?module=products&act=add&cloneid=2946679&random=2946679&getimage=true" class="action-link-button"
                    title="Sao chép sản phẩm này"><i class="icon-copy"></i></a>
            </td>
		</tr>
	</table>
</div>


<div class="pagination pagination-small pagination-right">
    <ul>
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingBottom_hplFirst" class="disabled" href="javascript:;">Trang đầu</a>
        </li>
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingBottom_hplPrevPage" class="disabled" href="javascript:;">«</a>
        </li>
        
                <li>
                    <a id="cph_Main_ctl00_ctl00_PagingBottom_rptPaging_hplPaging_0" class="active" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=1" style="background-color:#F5F5F5;color:#999999;">1</a>
                    
                </li>
            
                <li>
                    <a id="cph_Main_ctl00_ctl00_PagingBottom_rptPaging_hplPaging_1" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=2">2</a>
                    
                </li>
            
                <li>
                    <a id="cph_Main_ctl00_ctl00_PagingBottom_rptPaging_hplPaging_2" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=3">3</a>
                    
                </li>
            
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingBottom_hplNextPage" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=2">»</a>
        </li>
        <li>
            <a id="cph_Main_ctl00_ctl00_PagingBottom_hplLast" href="http://tuannd.bizwebvietnam.com/admin.aspx?module=products&amp;pn=3">Trang cuối</a>
        </li>
    
    
    </ul>
</div>


    



    </div>
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
    </div>
    </body>
</html>
