package org.apache.jsp.JSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class addCustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Customer</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            ResultSet rsCity=(ResultSet)request.getAttribute("CityList");
            ResultSet rsState=(ResultSet)request.getAttribute("StateList");
            ResultSet rsZip=(ResultSet)request.getAttribute("Zip_codeList");
            String customer_id=(String)request.getAttribute("customer_id");
            String city=(String)request.getAttribute("customer_id");
            String state=(String)request.getAttribute("customer_id");
            String zip_code=(String)request.getAttribute("customer_id");
            String fname=(String)request.getAttribute("customer_id");
            String lname=(String)request.getAttribute("customer_id");
            String phone=(String)request.getAttribute("customer_id");
            String email=(String)request.getAttribute("customer_id");
            String street=(String)request.getAttribute("customer_id");
            String username=(String)request.getAttribute("customer_id");
            String password=(String)request.getAttribute("customer_id");
            
        
      out.write("\n");
      out.write("        <a href=\"ControllerCustomer?s=insert\">List All</a>\n");
      out.write("        <form action=\"ControllerCustomer\" method=\"POST\">\n");
      out.write("            <input name=\"s\" type=\"hidden\" value=\"insert\">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Customer id</td>\n");
      out.write("                    <td><input type=\"number\" name=\"customer_id\" value=\"");
      out.print(customer_id );
      out.write("\" readonly></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>First name</td>\n");
      out.write("                    <td><input type=\"text\" name=\"fname\" value=\"");
      out.print(fname!=null?fname:"" );
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Last name</td>\n");
      out.write("                    <td><input type=\"text\" name=\"lname\" value=\"");
      out.print(lname!=null?lname:"" );
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Phone</td>\n");
      out.write("                    <td><input type=\"number\" name=\"phone\" value=\"");
      out.print(phone!=null?phone:"" );
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email</td>\n");
      out.write("                    <td><input type=\"email\" name=\"email\" value=\"");
      out.print(email!=null?email:"" );
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Street</td>\n");
      out.write("                    <td><input type=\"text\" name=\"street\" value=\"");
      out.print(street!=null?street:"" );
      out.write("\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>City</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"city\">\n");
      out.write("                            ");
while(rsCity.next()){
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rsCity.getString(1));
      out.write("\"  \n");
      out.write("                                        ");
      out.print((rsCity.getString(1).equalsIgnoreCase(city) ? "selected" : "") );
      out.write("\n");
      out.write("                                >");
      out.print(rsCity.getString(1));
      out.write(" </option>\n");
      out.write("                            ");
}  
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>State</td>\n");
      out.write("                    <td><select name=\"state\">\n");
      out.write("                            ");
while(rsState.next()){
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rsState.getString(1));
      out.write("\" \n");
      out.write("                                        ");
      out.print((rsState.getString(1).equalsIgnoreCase(state) ? "selected" : "") );
      out.write("\n");
      out.write("                                >");
      out.print(rsState.getString(1));
      out.write(" </option>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                    </select></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Zip_code</td>\n");
      out.write("                    <td>\n");
      out.write("                        <select name=\"zip_code\">\n");
      out.write("                            ");
while(rsZip.next()){
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rsZip.getString(1));
      out.write("\" \n");
      out.write("                                        ");
      out.print((rsZip.getString(1).equalsIgnoreCase(zip_code) ? "selected" : "") );
      out.write("\n");
      out.write("                                >");
      out.print(rsZip.getString(1));
      out.write(" </option>\n");
      out.write("                            ");
}
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Username</td>\n");
      out.write("                    <td><input type=\"text\" name=\"username\" value=\"");
      out.print(username!=null?username:"" );
      out.write("\">\n");
      out.write("                    <span></span>\n");
      out.write("                    </td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td><input type=\"password\" name=\"password\" value=\"");
      out.print(password!=null?password:"" );
      out.write("\">\n");
      out.write("                    <span></span>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><button type=\"submit\" name=\"submit\">Submit</button></td>\n");
      out.write("                    <td><button type=\"reset\">Reset</button></td>\n");
      out.write("                </tr>\n");
      out.write("            </table>    \n");
      out.write("            \n");
      out.write("        </form>\n");
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
