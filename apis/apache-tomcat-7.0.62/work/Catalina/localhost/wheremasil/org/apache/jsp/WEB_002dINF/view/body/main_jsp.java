/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.62
 * Generated at: 2015-06-16 02:48:18 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.body;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

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

      out.write("\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css\">\n");
      out.write("<script src=\"//code.jquery.com/ui/1.11.4/jquery-ui.js\"></script>\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\" src=\"//apis.daum.net/maps/maps3.js?apikey=8090c845eb21bcc92becc6f8f3bf61fa&libraries=services\"></script>\n");
      out.write("<script type=\"text/javascript\" src=\"/wheremasil/script/map_view.js\"></script>\n");
      out.write("\n");
      out.write("<script>\n");
      out.write("   ");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write("   ");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\n");
      out.write("   $(function() {\n");
      out.write("      $(\"header\").css(\"background-color\", \"none\");\n");
      out.write("      $(\"section\").css(\"width\",\"1880px\");\n");
      out.write("      $(\"section\").css(\"height\",\"1300px\");\n");
      out.write("      $(\".left_nav\").css(\"width\", \"0px\");\n");
      out.write("      $(\".right_nav\").css(\"width\", \"0px\");\n");
      out.write("      $(\"#bs-example-navbar-collapse-1\").css(\"width\", \"1880px\");\n");
      out.write("\n");
      out.write("      $(\"#popup_cancel\").on(\"click\", function() {\n");
      out.write("         $(\"#popup_layer\").css(\"visibility\", \"hidden\");\n");
      out.write("      });\n");
      out.write("\n");
      out.write("      $(\"#stDate\").datepicker({\n");
      out.write("         dateFormat : 'yymmdd',\n");
      out.write("         minDate:0,\n");
      out.write("          onClose: function( selectedDate ) {\n");
      out.write("           $(\"#edDate\").datepicker( \"option\", \"minDate\", selectedDate );\n");
      out.write("          }\n");
      out.write("      });\n");
      out.write("      $(\"#edDate\").datepicker({\n");
      out.write("         dateFormat : 'yymmdd',\n");
      out.write("         minDate:0,\n");
      out.write("         onClose: function( selectedDate ) {\n");
      out.write("           $(\"#stDate\").datepicker( \"option\", \"maxDate\", selectedDate );\n");
      out.write("          }\n");
      out.write("      });\n");
      out.write("      \n");
      out.write("      // plan id 리스트 select\n");
      out.write("      getPlanIdList(3);\n");
      out.write("   });\n");
      out.write("   \n");
      out.write("   function getPlanIdList(num) {\n");
      out.write("      $.ajax({\n");
      out.write("         url: \"/wheremasil/plan/getPlanIdList.do\",\n");
      out.write("         dataType: \"json\",\n");
      out.write("         type: \"POST\",\n");
      out.write("            timeout : 30000,\n");
      out.write("            data : {\"num\" : num},\n");
      out.write("         success: function(data) {\n");
      out.write("            var planIdList = [];\n");
      out.write("            for (var idx = 0; idx < data.length; idx++) {\n");
      out.write("               planIdList[idx] = data[idx].planId;\n");
      out.write("            }\n");
      out.write("            getPlanMapList(planIdList, \"plan_map_\", \"main_map\");// {'L000','L001',...}, map parent id=\"plan_map_1~\", map class=\"main_map\"\n");
      out.write("         }// end of success(getPlanIdList)\n");
      out.write("      });// end of getPlanIdList(ajax)\n");
      out.write("   }\n");
      out.write("\n");
      out.write("   function fn_layer_popup() {\n");
      out.write("      var layer = document.getElementById(\"popup_layer\");\n");
      out.write("      layer.style.visibility = \"visible\"; //반대는 hidden \n");
      out.write("\n");
      out.write("   }\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<div id=\"popup_layer\"\n");
      out.write("    style=\"position: absolute; \n");
      out.write("    top: 52%; \n");
      out.write("    left: 50%; \n");
      out.write("    border-radius: 0.4em; \n");
      out.write("    width: 30%; \n");
      out.write("    height: 50%; \n");
      out.write("    margin-left: -15%; \n");
      out.write("    margin-top: -20%; \n");
      out.write("    z-index: 1; \n");
      out.write("    visibility: hidden;\n");
      out.write("    background-color: #f5f5f5;\n");
      out.write("    padding: 2px;\">\n");
      out.write("\n");
      out.write("   <div class=\"panel panel-warning\">\n");
      out.write("      <div class=\"panel-heading\">\n");
      out.write("         <h3 class=\"panel-title\" align=\"right\">여행계획짜기</h3>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"panel-body\">\n");
      out.write("\n");
      out.write("         <form class=\"form-horizontal\" action=\"/wheremasil/plan/session/map.do\" method=\"post\">\n");
      out.write("            <fieldset>\n");
      out.write("               <legend>여행 일정</legend>\n");
      out.write("               <div class=\"form-group\">\n");
      out.write("                  <label for=\"inputTitle\" class=\"col-lg-2 control-label\">플랜명</label>\n");
      out.write("                  <div class=\"col-lg-10\">\n");
      out.write("                     <input type=\"text\" class=\"form-control\" id=\"title\" name=\"title\"\n");
      out.write("                        placeholder=\"여행 계획 명\" autofocus required>\n");
      out.write("                  </div>\n");
      out.write("               </div>\n");
      out.write("               <div class=\"form-group\">\n");
      out.write("                  <label for=\"select\" class=\"col-lg-2 control-label\">테마 </label>\n");
      out.write("                        <div class=\"col-lg-10\">\n");
      out.write("                           <select class=\"form-control\" id=\"theme\" name=\"theme\" required>\n");
      out.write("                              <option value=\"\">테마선택</option>\n");
      out.write("                              <option value=\"T1\">배낭여행</option>\n");
      out.write("                              <option value=\"T2\">우정여행</option>\n");
      out.write("                              <option value=\"T3\">가족여행</option>\n");
      out.write("                              <option value=\"T4\">커플여행</option>\n");
      out.write("                              <option value=\"T5\">부모님여행</option>\n");
      out.write("                           </select> <br>\n");
      out.write("                        </div> \n");
      out.write("                        <label for=\"select\" class=\"col-lg-2 control-label\">인원수</label>\n");
      out.write("                         <div class=\"col-lg-10\">\n");
      out.write("                            <select class=\"form-control\" id=\"groupNum\" name=\"groupNum\" required>\n");
      out.write("                              <option value=\"\">인원수 선택</option>\n");
      out.write("                              ");

                                 for (int i = 1; i <= 100; i++) {
                              
      out.write("\n");
      out.write("                              <option value=\"");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i + "명");
      out.write("</option>\n");
      out.write("                              ");

                                 }
                              
      out.write("\n");
      out.write("                           </select><br>\n");
      out.write("                        </div>\n");
      out.write("                        <label for=\"inputStDate\" class=\"col-lg-2 control-label\">시작일</label>\n");
      out.write("                        <div class=\"col-lg-9\">\n");
      out.write("                           <input type=\"text\" class=\"form-control\" id=\"stDate\"\n");
      out.write("                              name=\"startDate\" placeholder=\"여행 시작 날짜\" required>\n");
      out.write("                        </div><br>\n");
      out.write("                     \n");
      out.write("                  \n");
      out.write("                        <label for=\"inputendDate\" class=\"col-lg-2 control-label\">종료일</label>\n");
      out.write("                        <div class=\"col-lg-9\">\n");
      out.write("                           <input type=\"text\" class=\"form-control\" id=\"edDate\"\n");
      out.write("                              name=\"endDate\" placeholder=\"여행 종료 날짜\" required>\n");
      out.write("                        </div>\n");
      out.write("                  \n");
      out.write("               </div>\n");
      out.write("\n");
      out.write("               <div class=\"form-group\" >\n");
      out.write("                   <div class=\"col-lg-10 col-lg-offset-7\">\n");
      out.write("                      <input type=\"submit\" class=\"btn btn-warning\" value=\"작성 시작\">\n");
      out.write("                      <input type=\"reset\" class=\"btn btn-default\" id=\"popup_cancel\" value=\"취소\">\n");
      out.write("                   </div>\n");
      out.write("               </div>\n");
      out.write("            </fieldset>\n");
      out.write("         </form>\n");
      out.write("      </div>\n");
      out.write("   </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<div class=\"section\">\n");
      out.write("   <div class=\"main_center\" >\n");
      out.write("      <p style=\"text-align: center\">\n");
      out.write("         <font size=\"200%\" color=\"white\"><b>Where are you going ?</b></font>\n");
      out.write("      </p>\n");
      out.write("\n");
      out.write("      <div style=\"text-align: center\">\n");
      out.write("         <h4>\n");
      out.write("            <font color=\"white\">지금 당장! 어디 마실 나가고 싶다면?</font>\n");
      out.write("         </h4>\n");
      out.write("      </div>\n");
      out.write("      <div style=\"position: absolute; left: 48%; top: 58%; width: 200px; height: 60px; overflow: hidden; margin-left: -50px; margin-top: -30px\">\n");
      out.write("         <input type=\"button\" class=\"btn btn-warning btn-lg\" value=\"START\" onclick=\"fn_layer_popup()\">\n");
      out.write("      </div>\n");
      out.write("   </div>\n");
      out.write("\n");
      out.write("   <video id=\"videobcg\" preload=\"auto\" autoplay=\"true\" loop=\"loop\" muted=\"muted\">\n");
      out.write("      <source src=\"https://a0.muscache.com/airbnb/static/Seoul-P1-4.mp4\"\n");
      out.write("         type=\"video/mp4\">\n");
      out.write("      <source src=\"https://a0.muscache.com/airbnb/static/Seoul-P1-4.webm\"\n");
      out.write("         type=\"video/webm\">\n");
      out.write("      Sorry, your browser does not support HTML5 video.\n");
      out.write("   </video>\n");
      out.write("\n");
      out.write("   <div style=\"position:absolute;width:1200px;top:92%;left:25%;padding:0 0;margin:0 0;\">\n");
      out.write("      <div style=\"margin-bottom:30px\">\n");
      out.write("\t      <font size=\"2\">\n");
      out.write("\t         <h3>최신 플랜</h3>\n");
      out.write("\t      </font>\n");
      out.write("   \t  </div>\n");
      out.write("      <div class=\"col-xs-6 col-md-3\" style=\"float:left;width:300px;height:220px;margin:0 20px;\">\n");
      out.write("        <a href=\"#\" id=\"plan_map_1\" class=\"thumbnail\" style=\"width:100%;height:100%;\">\n");
      out.write("          <img src=\"/wheremasil/uploads/images/default/img_not_found.png\" alt=\"...\">\n");
      out.write("        </a>\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("      <div class=\"col-xs-6 col-md-3\" style=\"float:left;width:300px;height:220px;margin:0 20px;\">\n");
      out.write("        <a href=\"#\" id=\"plan_map_2\" class=\"thumbnail\" style=\"width:100%;height:100%;\">\n");
      out.write("          <img src=\"/wheremasil/uploads/images/default/img_not_found.png\" alt=\"...\">\n");
      out.write("        </a>\n");
      out.write("      </div>\n");
      out.write("      \n");
      out.write("      <div class=\"col-xs-6 col-md-3\" style=\"float:left;width:300px;height:220px;margin:0 20px;\">\n");
      out.write("        <a href=\"#\" id=\"plan_map_3\" class=\"thumbnail\" style=\"width:100%;height:100%;\">\n");
      out.write("          <img src=\"/wheremasil/uploads/images/default/img_not_found.png\" alt=\"...\">\n");
      out.write("        </a>\n");
      out.write("      </div>\n");
      out.write("   </div>\n");
      out.write("   \n");
      out.write("</div>\n");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/view/body/main.jsp(10,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ not empty requestScope.plan }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("      alert(\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ requestScope.plan.title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write(" 등록 완료\");\n");
        out.write("   ");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f1.setParent(null);
    // /WEB-INF/view/body/main.jsp(13,3) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ not empty requestScope.session }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\n");
        out.write("   \t  alert(\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.session}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write("\");\n");
        out.write("   ");
        int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
    return false;
  }
}
