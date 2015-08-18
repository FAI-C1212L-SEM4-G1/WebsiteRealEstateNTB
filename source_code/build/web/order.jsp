<%-- 
    Document   : order
    Created on : Aug 18, 2015, 8:54:28 AM
    Author     : sang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>oder</title>
        <link href="css/style_oder.css" rel="stylesheet" type="text/css"/>
        <link href="font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="wapper">
    <div class="register-main-top">
        <span><i class="fa fa-th" style="padding:0px 10px 0px 10px; font-size:26px;"></i>Customer information</span>
    </div>
        <div class="register-main">
            <form action="#" method="post">
                <div class="intro-form-input">
                    <span class="intro-form-input-ico">
                        <i class="fa fa-user"></i>

                    </span>
                    <input class="validate[required] form-control" type="text" placeholder="Full Name" name="txtname">
                </div>

                <div class="intro-form-input">
                    <span class="intro-form-input-ico">
                        <i class="fa fa-envelope"></i>
                    </span>
                    <input class="validate[required,custom[email]] form-control" type="text" placeholder="Email" name="txtemail">
                    <input type="hidden" value="#" name="url">
                </div>

                <div class="intro-form-input">
                    <span class="intro-form-input-ico">
                        <i class="fa fa-phone"></i>
                    </span>
                    <input class="validate[required,custom[phone]] form-control" type="text" placeholder="Phone" name="txtphone">
                    <input type="hidden" value="#" name="url">
                </div>
    <div class="intro-form-input">
        
        <textarea class="validate[required]" style=" width:100%;height:100px;border:1px solid;border-radius:5px;" placeholder="Address" name="txtaddress"></textarea>
        
    </div>
                <div class="submit">
                    <button class="btn-submit" type="submit">SubMit</button>
                </div>


            }

   
  
                
            </form>
         </div>
   </div> 
        
    </body>
</html>
