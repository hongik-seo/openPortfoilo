/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.37
 * Generated at: 2020-10-21 16:09:53 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.pay;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class point_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("jar:file:/D:/25기_서홍익_포트폴리오/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/nanam/WEB-INF/lib/standard.jar!/META-INF/fmt.tld", Long.valueOf(1098678690000L));
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1595293922000L));
    _jspx_dependants.put("jar:file:/D:/25기_서홍익_포트폴리오/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/nanam/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      if (_jspx_meth_c_005fset_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write(" <style type=\"text/css\">\r\n");
      out.write(" \ttd{\r\n");
      out.write(" \tfont-size :10px;\r\n");
      out.write(" \t} \r\n");
      out.write(" \t\r\n");
      out.write(" \ttable{\r\n");
      out.write(" \t\twidth:500px;\r\n");
      out.write(" \t}\r\n");
      out.write(" </style>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\"\r\n");
      out.write("\t\tsrc=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${nanam}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/js/jquery-3.1.1.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script>\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t$(function(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#ticketBtn\").click(function(){\r\n");
      out.write("\t\t\tvar num=Math.floor( ( Math.random() * 10000 ) );\r\n");
      out.write("\t\t\tconsole.log(num);\t\r\n");
      out.write("\t\t\talert(\"콘솔창에서 번호를 확인하세요\");\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t$(\"#inputCultureNum\").blur(function(){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\talert(num);\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\tif($(\"#inputCultureNum\").val()!='' && $(\"#inputCultureNum\").val() ==num ){\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#getFullPointBtn\").prop(\"disabled\",false);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t$(\"#getFullPointBtn\").prop(\"disabled\",true);\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\t$(\"#getFullPointBtn\").click(function() {\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t\tvar pointId = $(\"#pointId\").val();\r\n");
      out.write("\r\n");
      out.write("\t\t\t\tvar pointPhone = $(\"#pointPhone\").val();\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\tvar point = $(\":checked\").val();\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\ttype : 'get',\r\n");
      out.write("\t\t\t\t\tdataType : 'text',\r\n");
      out.write("\t\t\t\t\turl : \"/nanam/pay/pointChargeUpdate\",\r\n");
      out.write("\t\t\t\t\tdata : {\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\"id\" : pointId,\r\n");
      out.write("\t\t\t\t\t\t\"pointPhone\" : pointPhone,\r\n");
      out.write("\t\t\t\t\t\t\"addPoint\" :point\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\tsuccess : function(data) {\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\tself.opener = self;\r\n");
      out.write("\t\t\t\t\t\tself.close();\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\terror : function(xhr, ajaxOptions, thrownError) {\r\n");
      out.write("\t\t\t\t\t\tconsole && console.log(\"request failed\");\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t});//endOfAjax\r\n");
      out.write("\r\n");
      out.write("\t\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\r\n");
      out.write("\t});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>포인트 충전 창</title>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("   <table border=1>\r\n");
      out.write("            <thead>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th colspan=\"2\">\r\n");
      out.write("                        포인트 충전 창\r\n");
      out.write("                    </th>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <th colspan=\"2\">\r\n");
      out.write("                        포인트 충전 금액\r\n");
      out.write("                    </th>\r\n");
      out.write("                </tr>\r\n");
      out.write("            <tbody>\r\n");
      out.write("            \t<tr>\r\n");
      out.write("                    <td colspan=\"2\">\r\n");
      out.write("\r\n");
      out.write("               \t  아이디     <input name=\"id\" type=\"text\" id=\"pointId\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${login.id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" readonly>\r\n");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    \r\n");
      out.write("                   \r\n");
      out.write("                </tr>\r\n");
      out.write("            \r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td colspan=\"2\">\r\n");
      out.write("\r\n");
      out.write("                      인증 :가입하신 휴대폰 번호<input type=\"text\" id=\"pointPhone\" name=\"pointPhone\" placeholder=\"(하이픈 포함)\">\r\n");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                \t  \r\n");
      out.write("                   \r\n");
      out.write("                </tr>\r\n");
      out.write("                \r\n");
      out.write("                <tr >\r\n");
      out.write("                    <td>\r\n");
      out.write("                        문화 상품권\r\n");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                    <td colspan=\"2\">\r\n");
      out.write("                       \r\n");
      out.write("                           \r\n");
      out.write("                        \r\n");
      out.write("\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                 <tr>\r\n");
      out.write("                <td colspan=\"2\">\r\n");
      out.write("                    <input type=\"button\" id=\"ticketBtn\" value=\"문화상품권 번호 받기\">\r\n");
      out.write("                     \r\n");
      out.write("                 <input id=\"inputCultureNum\" type=\"text\"  name=\"pointTicket\" placeholder=\"문화상품권 번호 입력\">\r\n");
      out.write("                </td>\r\n");
      out.write("               \r\n");
      out.write("               \r\n");
      out.write("                   \r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>\r\n");
      out.write("                        \t<label for=\"pointNum1\"></label>\r\n");
      out.write("                            <input id=\"pointNum1\"   name=\"addPoint\" type=\"radio\" class=\"addPoint\" value=10000>\r\n");
      out.write("                        \r\n");
      out.write("                    </td>\r\n");
      out.write("\r\n");
      out.write("                    <td>\r\n");
      out.write("                        10,000원\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td>\r\n");
      out.write("               \t\t\t\t<label for=\"pointNum2\"></label>\r\n");
      out.write("                            <input id=\"pointNum2\" name=\"addPoint\" type=\"radio\" class=\"addPoint\" value=20000>\r\n");
      out.write("                        \r\n");
      out.write("                    </td>\r\n");
      out.write("\r\n");
      out.write("                    <td>\r\n");
      out.write("                        20,000원\r\n");
      out.write("                    </td>\r\n");
      out.write("                </tr>\r\n");
      out.write("               \r\n");
      out.write("                <tr>\r\n");
      out.write("                    <td colspan=\"2\">\r\n");
      out.write("                        <input type=\"button\" id=\"getFullPointBtn\" value=\"충전\" disabled=\"\">\r\n");
      out.write("                    </td>\r\n");
      out.write("\r\n");
      out.write("                </tr>\r\n");
      out.write("\r\n");
      out.write("            </tbody>    \r\n");
      out.write("           \r\n");
      out.write("        </table>\r\n");
      out.write("   \r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fset_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:set
    org.apache.taglibs.standard.tag.rt.core.SetTag _jspx_th_c_005fset_005f0 = (org.apache.taglibs.standard.tag.rt.core.SetTag) _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.SetTag.class);
    boolean _jspx_th_c_005fset_005f0_reused = false;
    try {
      _jspx_th_c_005fset_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fset_005f0.setParent(null);
      // /pay/point.jsp(8,0) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setVar("nanam");
      // /pay/point.jsp(8,0) name = value type = null reqTime = true required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fset_005f0.setValue((java.lang.Object) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.Object.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      int _jspx_eval_c_005fset_005f0 = _jspx_th_c_005fset_005f0.doStartTag();
      if (_jspx_th_c_005fset_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fset_0026_005fvar_005fvalue_005fnobody.reuse(_jspx_th_c_005fset_005f0);
      _jspx_th_c_005fset_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fset_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fset_005f0_reused);
    }
    return false;
  }
}
