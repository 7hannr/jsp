/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.88
 * Generated at: 2024-05-09 09:22:02 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.cou;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class modal_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.LinkedHashSet<>(3);
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

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
  }

  public void _jspDestroy() {
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
      out.write("<style>\r\n");
      out.write("	#modal{\r\n");
      out.write("	top:20%\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("<!-- Modal -->\r\n");
      out.write("<div class=\"modal fade\" id=\"modal\" data-bs-backdrop=\"static\" data-bs-keyboard=\"false\" tabindex=\"-1\" aria-labelledby=\"staticBackdropLabel\" aria-hidden=\"true\">\r\n");
      out.write("  <div class=\"modal-dialog modal-lg\">\r\n");
      out.write("    <div class=\"modal-content\">\r\n");
      out.write("      <div class=\"modal-header\">\r\n");
      out.write("        <h1 class=\"modal-title fs-5\" id=\"staticBackdropLabel\">교수검색</h1>\r\n");
      out.write("        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"modal-body\">\r\n");
      out.write("      <div class=\"mb-1\">\r\n");
      out.write("      	<select class=\"form-select\" id=\"word\">\r\n");
      out.write("      		<option value=\"전산\">컴퓨터공학과</option>\r\n");
      out.write("      		<option value=\"전자\">전자공학과</option>\r\n");
      out.write("      		<option value=\"건축\">건축공학과</option>\r\n");
      out.write("      		<option value=\"음악\">실용음악과</option>\r\n");
      out.write("      	</select>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div id=\"div_pro\"></div>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"modal-footer\">\r\n");
      out.write("        <button type=\"button\" class=\"btn btn-dark\" data-bs-dismiss=\"modal\">닫기</button>\r\n");
      out.write("        <button type=\"button\" class=\"btn btn-secondary\">검색</button>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<script id=\"temp_pro\" type=\"x-handlebars-template\">\r\n");
      out.write("		<table class=\"table table-borderd table-hover\">\r\n");
      out.write("		<tr class=\"text-center\">\r\n");
      out.write("			<td>교수번호</td>\r\n");
      out.write("			<td>교수이름</td>\r\n");
      out.write("			<td>교수학과</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		{{#each .}}\r\n");
      out.write("		<tr class=\"text-center pro\" pcode=\"{{pcode}}\" pname=\"{{pname}}\" style=\"cursor:pointer\">\r\n");
      out.write("			<td>{{pcode}}</td>\r\n");
      out.write("			<td>{{pname}}</td>\r\n");
      out.write("			<td>{{dept}}</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		{{/each}}\r\n");
      out.write("	</table>\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<script>\r\n");
      out.write("	let page=1;\r\n");
      out.write("	let size=100;\r\n");
      out.write("	let key=\"dept\";\r\n");
      out.write("	let word=$(\"#word\").val();\r\n");
      out.write("	\r\n");
      out.write("	$(\"#word\").on(\"change\",function(){\r\n");
      out.write("		word=$(\"#word\").val();\r\n");
      out.write("		getData();\r\n");
      out.write("	});\r\n");
      out.write("	//각행의 tr을 클릭한경우\r\n");
      out.write("	$(\"#div_pro\").on(\"click\",\"tr\",function(){\r\n");
      out.write("		const pcode=$(this).attr(\"pcode\");\r\n");
      out.write("		const pname=$(this).attr(\"pname\");\r\n");
      out.write("		//alert(pcode + pname);\r\n");
      out.write("		$(frm.instructor).val(pcode);\r\n");
      out.write("		$(frm.pname).val(pname);\r\n");
      out.write("		$(\"#modal\").modal(\"hide\");\r\n");
      out.write("	});\r\n");
      out.write("	getData();\r\n");
      out.write("	function getData(){\r\n");
      out.write("		$.ajax({\r\n");
      out.write("			type:\"get\",\r\n");
      out.write("			url:\"/pro/list.json\",\r\n");
      out.write("			data:{page, size, key, word},\r\n");
      out.write("			dataType:\"json\",\r\n");
      out.write("			success:function(data){\r\n");
      out.write("				console.log(data);\r\n");
      out.write("				const temp=Handlebars.compile($(\"#temp_pro\").html());\r\n");
      out.write("				$(\"#div_pro\").html(temp(data));\r\n");
      out.write("			}\r\n");
      out.write("		});\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("</script>");
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
}