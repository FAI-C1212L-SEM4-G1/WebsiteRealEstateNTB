package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class detail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"css/style_detail.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"font/font-awesome-4.4.0/font-awesome-4.4.0/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <script src=\"javascript.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"wapper\">\n");
      out.write("            <header id=\"header\">\n");
      out.write("                <div id=\"top\">\n");
      out.write("                    <div class=\"top-content\">\n");
      out.write("                        <div class=\"top-content-left\">\n");
      out.write("                            <i style=\"color:#5cb4c5; \" class=\"fa fa-map-marker\"></i><span style=\"color: #fff;font-size: 13px;font-weight: bold\"> Time City:</span><span style=\"color:#5cb4c5; \"> Amsterdam</span>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"top-content-logo\">\n");
      out.write("\n");
      out.write("                            <img src=\"images/logo.png\" alt=\"\"/>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"top-content-right\">\n");
      out.write("                            <div class=\"phone\">\n");
      out.write("                                <span style=\"color:#fff\"><i class=\"fa fa-phone\"></i> 01666202886</span>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"email\">\n");
      out.write("                                <span style=\"color:#5cb4c5;\"><i class=\"fa fa-envelope-o\"></i> admin@gmail.com</span>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"clear\"></div>\n");
      out.write("                <nav id=\"menu\">\n");
      out.write("                    <div class=\"menu-content\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                        <ul class=\"list-menu\">\n");
      out.write("                            <li><a href=\"#\">HOME</a></li>\n");
      out.write("                            <li><a href=\"#\">LISTING</a></li>\n");
      out.write("                            <li><a href=\"#\">AGENT</a></li>\n");
      out.write("                            <li><a href=\"#\">BLOG</a></li>\n");
      out.write("                            <li><a href=\"#\">ABOUT US</a></li>\n");
      out.write("                            <li><a href=\"#\">CONTACT</a></li>\n");
      out.write("                            <li><a href=\"#\">GALLERY</a></li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </ul> \n");
      out.write("                    </div>\n");
      out.write("                </nav>\n");
      out.write("                <div class=\"clear\"></div>\n");
      out.write("            </header>\n");
      out.write("            <section id=\"content\">\n");
      out.write("\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <h1 class=\"mainTitle\">Listing</h1>\n");
      out.write("                    <div class=\"listingTop cf\">\n");
      out.write("                        <div class=\"listingSlider\">\n");
      out.write("                            \n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"listingEntry\">\n");
      out.write("                            <h1 class=\"listingEntry__title\">Newtown Square, PA</h1>\n");
      out.write("                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form alteration in some form, by injected</p>\n");
      out.write("                            <ul class=\"details\">\n");
      out.write("                                <li class=\"details__item\">\n");
      out.write("                                   <i class=\"fa fa-map-marker\"></i>\n");
      out.write("                                    Amsterdam\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"details__item\">\n");
      out.write("                                    <i class=\"fa fa-arrows-alt\"></i>\n");
      out.write("                                    2 800 Sq Ft\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"details__item\">\n");
      out.write("                                   <i class=\"fa fa-car\"></i>\n");
      out.write("                                    Garrage\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"details__item\">\n");
      out.write("                                    <i class=\"fa fa-wifi\"></i>\n");
      out.write("                                    Internet\n");
      out.write("                                </li>\n");
      out.write("                            </ul>\n");
      out.write("                            <div class=\"listingEntry__price\">$ 120 000</div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"clear\"></div>\n");
      out.write("                    </div>\n");
      out.write("                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\n");
      out.write("                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\n");
      out.write("                    <hr class=\"line_secondType\">\n");
      out.write("                    <h1 class=\"titleSecondType\">Features</h1>\n");
      out.write("                    \n");
      out.write("                    <ul class=\"markeredList\">\n");
      out.write("                        <li class=\"markeredList__item\"><i style=\"color: #70ccde;margin-right: 5px;\" class=\"fa fa-star\"></i>In an ideal world this website wouldn’t exist</li>\n");
      out.write("                        <li class=\"markeredList__item\"><i style=\"color: #70ccde;margin-right: 5px;\" class=\"fa fa-star\"></i>Needless to say it’s very important, content is king and people are beginning to understand tha</li>\n");
      out.write("                        <li class=\"markeredList__item\"><i style=\"color: #70ccde;margin-right: 5px;\" class=\"fa fa-star\"></i>However, back over in reality some project schedules and with the web copy.</li>\n");
      out.write("                        <li class=\"markeredList__item\"><i style=\"color: #70ccde;margin-right: 5px;\" class=\"fa fa-star\"></i>We want you think about how numbers, symbols and bullet points will look.</li>\n");
      out.write("                    </ul>\n");
      out.write("                    <div id=\"secondMap\" style=\"position: relative; background-color: rgb(229, 227, 223); overflow: hidden;\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <div class=\"map_housing\">\n");
      out.write("                        <iframe src=\"https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d8857.50163386489!2d105.78625163852972!3d21.0278565262789!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e6!4m5!1s0x3135ab4d2797975f%3A0x6d0fba1dc994204a!2zVMO0biBUaOG6pXQgVGh1eeG6v3Q!3m2!1d21.0278384!2d105.7834778!4m5!1s0x3135ab9bd9861ca1%3A0xe7887f7b72ca17a9!2zSMOgIE5vaSwgSG_DoG4gS2nhur9tLCBIw6AgTuG7mWksIFZp4buHdCBOYW0!3m2!1d21.0277644!2d105.8341598!5e0!3m2!1svi!2s!4v1439807464901\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("            </section>\n");
      out.write("            <footer id=\"footer\">\n");
      out.write("                <div class=\"container-footer\">\n");
      out.write("                    <div class=\"footer-top\">\n");
      out.write("                        <section class=\"footer-top-left\">\n");
      out.write("                            <div class=\"information\">\n");
      out.write("                                <h1>Information</h1>\n");
      out.write("                                <ul>\n");
      out.write("                                    <li><a href=\"#\">About company</a></li>\n");
      out.write("                                    <li><a href=\"#\">Our team</a></li>\n");
      out.write("                                    <li><a href=\"#\">Registration</a></li>\n");
      out.write("                                    <li><a href=\"#\">Payment Option</a></li>\n");
      out.write("                                    <li><a href=\"#\">Infomation</a></li>\n");
      out.write("                                    <li><a href=\"#\">FAQ</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"useful-link\">\n");
      out.write("                                <h1>Useful links</h1>\n");
      out.write("                                <ul>\n");
      out.write("\n");
      out.write("                                    <li><a href=\"#\">Homepage</a></li>\n");
      out.write("                                    <li><a href=\"#\">404 page</a></li>\n");
      out.write("                                    <li><a href=\"#\">Grid system</a></li>\n");
      out.write("                                    <li><a href=\"#\">Our agents</a></li>\n");
      out.write("                                    <li><a href=\"#\">Typography</a></li>\n");
      out.write("                                    <li><a href=\"#\">Sitemap</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"contact\">\n");
      out.write("                                <h1>Contact</h1>\n");
      out.write("                                <ul>\n");
      out.write("                                    <li><a href=\"#\"><i style=\"margin-right: 5px\"  class=\"fa fa-phone-square\"></i>01666202886</a></li>\n");
      out.write("                                    <li><a href=\"#\"><i style=\"margin-right: 5px;\" class=\"fa fa-envelope-o\"></i>admin@fpt.aptech.ac.vn</a></li>\n");
      out.write("                                    <li><a href=\"#\"><i style=\"margin-right: 5px;\" class=\"fa fa-map-marker\"></i>Ton that thuyet-Ha Noi</a></li>\n");
      out.write("\n");
      out.write("                                </ul>\n");
      out.write("                                <ul class=\"list-link-mangxahoi\">\n");
      out.write("                                    <li class=\"facebook\"><a href=\"#\"><i  class=\"fa fa-facebook-square\"></i></a></li>\n");
      out.write("                                    <li class=\"youtube\"><a href=\"#\"><i class=\"fa fa-youtube-square\"></i></a></li>\n");
      out.write("                                    <li class=\"google\"><a href=\"#\"><i class=\"fa fa-google-plus-square\"></i></a></li>\n");
      out.write("                                    <li class=\"twitter\"><a href=\"#\"><i class=\"fa fa-twitter-square\"></i></a></li>\n");
      out.write("                                    <li class=\"instagram\"><a href=\"#\"><i class=\"fa fa-instagram\"></i></a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"clear\"></div>\n");
      out.write("                            <div class=\"footer-top-left-text\">\n");
      out.write("                                <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making\n");
      out.write("                                    this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a \n");
      out.write("                                    handful of model sentence structures.</p>\n");
      out.write("                            </div>\n");
      out.write("                        </section>\n");
      out.write("                        \n");
      out.write("                        <section class=\"footer-top-right\">\n");
      out.write("                            <form class=\"form-message\" action=\"index.html\" method=\"POST\">\n");
      out.write("                                <span> Your name</span><br>\n");
      out.write("                                <input type=\"text\" name=\"yourname\" id=\"yourname\" /><br>\n");
      out.write("                                <span>Email</span><br>\n");
      out.write("\n");
      out.write("                                <input type=\"text\" name=\"email\" id=\"email\" /><br>\n");
      out.write("                                <span>Massage</span></br>\n");
      out.write("                                <textarea name=\"massage\" id=\"massage\">\n");
      out.write("                                      \n");
      out.write("                                </textarea>\n");
      out.write("                                <input id=\"submit\" type=\"submit\" value=\"SEND MESSAGE\"/>\n");
      out.write("\n");
      out.write("                            </form>\n");
      out.write("                        </section>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"clear\"></div>\n");
      out.write("                    <div class=\"footer-content\">\n");
      out.write("                        <div class=\"clear\"></div>\n");
      out.write("\n");
      out.write("                        <div class=\"back-top\">\n");
      out.write("                            <a class=\"insBackToTop\" onclick=\"kiemtra()\" href=\"#\"><i class=\"fa fa-angle-up\"></i></a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"footer-bottom\">\n");
      out.write("                        <div class=\"copyright\">© 2014 - All Rights Reserved </div>\n");
      out.write("                        <div class=\"footerLogo\">\n");
      out.write("                            <a href=\"index.html\">\n");
      out.write("                                <img src=\"images/logo_secondType.png\" all=\"fpt.aptech.ac.vn\">\n");
      out.write("                            </a>\n");
      out.write("                            <div class=\"Logo\">\n");
      out.write("                                <p>under logo text</p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"clear\"></div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </footer>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
