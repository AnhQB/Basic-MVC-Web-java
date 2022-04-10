package org.apache.jsp.JSP;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Map;
import java.util.HashMap;
import entity.Customers;
import java.util.ArrayList;
import java.util.List;
import entity.Products;
import java.util.Enumeration;

public final class showCart_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            
//            public void updateQuantity(int orderID, int quantity){
//                //list.put(orderID, quantityI);
//                for(Integer m: list.keySet()){
//                    log(m+" quantityla: " + list.get(m));
//                }
//            }
//            
//            public boolean existOrderID(int orderID){
//                for(Integer m: list.keySet()){
//                    if(m==orderID){
//                        
//                        return true;
//
//                    }
//                }
//                return false;
//            }
        
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/styleheader.css\">\n");
      out.write("        <title>Show Cart</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            Enumeration em = (Enumeration) request.getAttribute("Cart");
            //boolean checkCart = (boolean) request.getAttribute("checkCart");
            //int count = (int) request.getAttribute("checkCart");
            HashMap<Integer, Integer> listQuantity = new HashMap<Integer, Integer>();
        
      out.write("\n");
      out.write("        <div class=\"top\">\n");
      out.write("            <div class=\"header\">\n");
      out.write("                <h1>Shopping Cart Details</h1>\n");
      out.write("                ");

                    String username1 = (String) session.getAttribute("username");
                    if (username1 != null) {
                        Customers cus1 = (Customers) session.getAttribute(username1);
                
      out.write("\n");
      out.write("                        <p>Welcome: ");
      out.print(cus1.getFirst_name() + " " + cus1.getLast_name());
      out.write("<p>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"mid\">\n");
      out.write("            <div class=\"left\">\n");
      out.write("                <a href=\"ControllerCart\">Items List</a>\n");
      out.write("                ");
if(username1 != null){
      out.write("\n");
      out.write("                    <a href=\"ControllerLogout\">Check-out</a>\n");
      out.write("                ");
}
      out.write("\n");
      out.write("            </div>\n");
      out.write("            <div class=\"right\">\n");
      out.write("                <p style=\"color: red\"></p>\n");
      out.write("                <form action=\"ControllerCart\" method=\"get\" onkeydown=\"return event.key != 'Enter';\">\n");
      out.write("                    <input type=\"hidden\" name=\"s\" value=\"updateQuantity\">\n");
      out.write("                ");
                List<String> list = new ArrayList();
                    double totalCart = 0;
                    String username = (String) session.getAttribute("username");
                    int lock = 0;
                    //Customers cus = (Customers)session.getAttribute(username);

                    while (em.hasMoreElements()) {
                        double total = 0;
                        String key = em.nextElement().toString(); //get key
                        if (!key.equalsIgnoreCase("username") && !key.equalsIgnoreCase(username)) {
                            if (lock == 0) {
                                lock = 1;
                
      out.write("\n");
      out.write("                <table width=70% border=\"1\"  >\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Item ID</th>\n");
      out.write("                        <th>Name</th>\n");
      out.write("                        <th>Quantity</th>\n");
      out.write("                        <th>Price</th>\n");
      out.write("                        <th>Total</th>\n");
      out.write("                        <th>Remove</th>\n");
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                        }
                        Object value = session.getAttribute(key); //get value
                        list = (ArrayList<String>) value;
                        total = Integer.parseInt(list.get(0)) * Double.parseDouble(list.get(2));
                        totalCart += total;
                    
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td> ");
      out.print( key);
      out.write("</td>\n");
      out.write("                        <td> ");
      out.print( list.get(1));
      out.write("</td>\n");
      out.write("                        <td> \n");
      out.write("                            <input  \n");
      out.write("                                type=\"number\" name=\"");
      out.print(key);
      out.write("\" value=\"");
      out.print( list.get(0));
      out.write("\" min=\"1\" step=\"1\"\n");
      out.write("                                   >\n");
      out.write("                        </td>\n");
      out.write("                        <td> ");
      out.print( list.get(2));
      out.write("</td>\n");
      out.write("                        <td> ");
      out.print(total);
      out.write("</td>\n");
      out.write("                        <td><a href=\"ControllerCart?s=remove&id=");
      out.print(key);
      out.write("\">remove</a></td>\n");
      out.write("                    </tr>\n");
      out.write("                    ");

                            }
                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                    ");
if (lock == 0) {
      out.write("\n");
      out.write("                    <h3><p style=\"color: orange\">Cart is Empty<p></h3>\n");
      out.write("                    ");
} else {
      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>Total:</td>\n");
      out.write("                        <td colspan=\"4\" style=\"text-align: center\">");
      out.print(totalCart);
      out.write("</td>\n");
      out.write("                        <td><a href=\"ControllerCart?s=remove_all\">Remove all</a></td>\n");
      out.write("                    </tr>\n");
      out.write("                </table>\n");
      out.write("                        <button>Update</button>\n");
      out.write("                </form> \n");
      out.write("                        \n");
      out.write("                ");
}
      out.write("\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

//            int count=0;
//            Enumeration em1= (Enumeration) request.getAttribute("Cart");
//                    
//            while (em1.hasMoreElements())
//            {
//                em1.nextElement();
//                count++;
//            }
//            
            //if(em.hasMoreElements()){

      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
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
