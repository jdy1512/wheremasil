/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.62
 * Generated at: 2015-06-17 03:14:23 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.layout;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(document).ready(function() {\r\n");
      out.write("\r\n");
      out.write("\t$(\"#login_send\").on(\"click\",function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl : \"/wheremasil/member/login.do\",\r\n");
      out.write("\t\t\tdata : \"member_id=\"+$(\"#loginMember_id\").val()+\"&m_password=\"+$(\"#loginM_password\").val(),\r\n");
      out.write("\t\t\ttype : \"get\",\r\n");
      out.write("\t\t\tdataType : \"text\",\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\t// window.location.replace(data);\r\n");
      out.write("\t\t\t\tif (data == \"2\") {\r\n");
      out.write("\t\t\t\t\talert(\"아이디를 확인하세요\");\r\n");
      out.write("\t\t\t\t} else if (data == \"1\") {\r\n");
      out.write("\t\t\t\t\talert(\"password를 확인하세요\");\r\n");
      out.write("\t\t\t\t} else{\r\n");
      out.write("\t\t\t\t\tlocation.reload(true);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function(data) {\r\n");
      out.write("\t\t\t\talert(\"로그인실패 새로고침(F5)눌러주세요~\");\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#join_send\").click(function(){\r\n");
      out.write("\t\tvar formData = new FormData();\r\n");
      out.write("\t\tformData.append(\"member_id\",$(\"input[name=member_id]\").val());\r\n");
      out.write("\t\tformData.append(\"m_password\",$(\"input[name=m_password]\").val());\r\n");
      out.write("\t\tformData.append(\"m_name\",$(\"input[name=m_name]\").val());\r\n");
      out.write("\t\tformData.append(\"picture\",$(\"input[name=picture]\")[0].files[0]);\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl:\"/wheremasil/member/join.do\",\r\n");
      out.write("\t\t\tdata: formData,\r\n");
      out.write("\t\t\tprocessData : false,\r\n");
      out.write("\t\t\tcontentType : false,\r\n");
      out.write("\t\t\ttype : 'POST',\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\tif(data == \"id\"){\r\n");
      out.write("\t\t\t\t\talert(\"아이디를 확인하세요\");\r\n");
      out.write("\t\t\t\t}else if(data == \"name\"){\r\n");
      out.write("\t\t\t\t\talert(\"password를 확인하세요\");\r\n");
      out.write("\t\t\t\t}else if(data == \"success\"){\r\n");
      out.write("\t\t\t\t\tlocation.reload(true);\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function(data, xhr, message) {\r\n");
      out.write("\t\t\t\talert(data.status + \", \" + xhr + \", \" + message);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t$(\"#logout_bt\").on(\"click\", function() {\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t\t\turl : \"/wheremasil/member/logout.do\",\r\n");
      out.write("\t\t\ttype : \"post\",\r\n");
      out.write("\t\t\tdataType : \"text\",\r\n");
      out.write("\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\tlocation.href=\"/wheremasil/member/logoutmypage.do\"\r\n");
      out.write("\t\t\t},\r\n");
      out.write("\t\t\terror : function(data) {\r\n");
      out.write("\t\t\t\tlocation.href=\"/wheremasil/member/logoutmypage.do\"\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t});\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#popup_cancel_login\").on(\"click\", function() {\r\n");
      out.write("\t\t$(\"#popup_layer_login\").css(\"visibility\", \"hidden\");\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#popup_cancel_join\").on(\"click\", function() {\r\n");
      out.write("\t\t$(\"#popup_layer_join\").css(\"visibility\", \"hidden\");\r\n");
      out.write("\t});\r\n");
      out.write("\t$(\"#mypage\").on(\"click\", function() {\r\n");
      out.write("\t\tlocation.href=\"/wheremasil/member/mypageconn.do?member_id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.login_info.member_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\";\r\n");
      out.write("\t});\r\n");
      out.write("\t// HeaderSearchForm 오류 검증\r\n");
      out.write("\t$(\"#headerSearch\").on(\"submit\",function() {\r\n");
      out.write("\t\tif (!$(\"#headerSearchWord\").val()|| $(\"#headerSearchWord\").val().trim() == \"\") {\r\n");
      out.write("\t\t\t$(\"#headerSearchWord\").focus();\r\n");
      out.write("\t\t\treturn false;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\treturn true;\r\n");
      out.write("\t});\r\n");
      out.write("});\r\n");
      out.write("\t\r\n");
      out.write("function fn_layer_popup_login() {\r\n");
      out.write("\t$(\"#popup_layer_login\").css(\"visibility\", \"visible\");\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fn_layer_popup_join() {\r\n");
      out.write("\t$(\"#popup_layer_join\").css(\"visibility\", \"visible\");\r\n");
      out.write("\t$(\"#popup_layer_login\").css(\"visibility\", \"hidden\");\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function fn_layer_popup() {\r\n");
      out.write("    var layer = document.getElementById(\"popup_layer\");\r\n");
      out.write("    layer.style.visibility = \"visible\"; //반대는 hidden \r\n");
      out.write("\r\n");
      out.write(" }\r\n");
      out.write("</script>\r\n");
      out.write("<nav class=\"navbar navbar-default navbar-fixed-top\">\r\n");
      out.write("\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t<!-- Brand and toggle get grouped for better mobile display -->\r\n");
      out.write("\t\t<div class=\"navbar-header\">\r\n");
      out.write("\t\t\t<button type=\"button\" class=\"navbar-toggle collapsed\"\r\n");
      out.write("\t\t\t\tdata-toggle=\"collapse\" data-target=\"#bs-example-navbar-collapse-1\">\r\n");
      out.write("\t\t\t\t<span class=\"sr-only\">Toggle navigation</span> <span\r\n");
      out.write("\t\t\t\t\tclass=\"icon-bar\"></span> <span class=\"icon-bar\"></span> <span\r\n");
      out.write("\t\t\t\t\tclass=\"icon-bar\"></span>\r\n");
      out.write("\t\t\t</button>\r\n");
      out.write("\t\t\t<a class=\"navbar-brand\" href=\"/wheremasil/index.do\"><img\r\n");
      out.write("\t\t\t\tsrc=\"/wheremasil/uploads/images/icon/logo5.png\"\r\n");
      out.write("\t\t\t\tstyle=\"margin-top: 0px\"></a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- Collect the nav links, forms, and other content for toggling -->\r\n");
      out.write("\t\t<div class=\"collapse navbar-collapse\"\r\n");
      out.write("\t\t\tid=\"bs-example-navbar-collapse-1\">\r\n");
      out.write("\t\t\t<ul class=\"nav navbar-nav\">\r\n");
      out.write("\t\t\t\t<li><a href=\"#\" onclick=\"fn_layer_popup()\">플랜만들기\r\n");
      out.write("\t\t\t\t\t<span class=\"sr-only\">(current)</span>\r\n");
      out.write("\t\t\t\t\t</a>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t<li class=\"active\"><a href=\"/wheremasil/board/square.do\">광장</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"/wheremasil/board/review.do\">리뷰</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<form class=\"navbar-form navbar-right\" role=\"search\"\r\n");
      out.write("\t\t\t\taction=\"/wheremasil/search/simpleSearch.do\" id=\"headerSearch\">\r\n");
      out.write("\t\t\t\t<!-- headerSearch form hidden check -->\r\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</nav>\r\n");
      out.write("<div id=\"popup_layer\"\r\n");
      out.write("    style=\"position: absolute; \r\n");
      out.write("    top: 52%; \r\n");
      out.write("    left: 50%; \r\n");
      out.write("    border-radius: 0.4em; \r\n");
      out.write("    width: 30%; \r\n");
      out.write("    height: 50%; \r\n");
      out.write("    margin-left: -15%; \r\n");
      out.write("    margin-top: -20%; \r\n");
      out.write("    z-index: 1; \r\n");
      out.write("    visibility: hidden;\r\n");
      out.write("    background-color: #f5f5f5;\r\n");
      out.write("    padding: 2px;\">\r\n");
      out.write("\r\n");
      out.write("   <div class=\"panel panel-warning\">\r\n");
      out.write("      <div class=\"panel-heading\">\r\n");
      out.write("         <h3 class=\"panel-title\" align=\"right\">여행계획짜기</h3>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"panel-body\">\r\n");
      out.write("\r\n");
      out.write("         <form class=\"form-horizontal\" action=\"/wheremasil/plan/session/map.do\" method=\"post\">\r\n");
      out.write("            <fieldset>\r\n");
      out.write("               <legend>여행 일정</legend>\r\n");
      out.write("               <div class=\"form-group\">\r\n");
      out.write("                  <label for=\"inputTitle\" class=\"col-lg-2 control-label\">플랜명</label>\r\n");
      out.write("                  <div class=\"col-lg-10\">\r\n");
      out.write("                     <input type=\"text\" class=\"form-control\" id=\"title\" name=\"title\"\r\n");
      out.write("                        placeholder=\"여행 계획 명\" autofocus required>\r\n");
      out.write("                  </div>\r\n");
      out.write("               </div>\r\n");
      out.write("               <div class=\"form-group\">\r\n");
      out.write("                  <label for=\"select\" class=\"col-lg-2 control-label\">테마 </label>\r\n");
      out.write("                        <div class=\"col-lg-10\">\r\n");
      out.write("                           <select class=\"form-control\" id=\"theme\" name=\"theme\" required>\r\n");
      out.write("                              <option value=\"\">테마선택</option>\r\n");
      out.write("                              <option value=\"T1\">배낭여행</option>\r\n");
      out.write("                              <option value=\"T2\">우정여행</option>\r\n");
      out.write("                              <option value=\"T3\">가족여행</option>\r\n");
      out.write("                              <option value=\"T4\">커플여행</option>\r\n");
      out.write("                              <option value=\"T5\">부모님여행</option>\r\n");
      out.write("                           </select> <br>\r\n");
      out.write("                        </div> \r\n");
      out.write("                        <label for=\"select\" class=\"col-lg-2 control-label\">인원수</label>\r\n");
      out.write("                         <div class=\"col-lg-10\">\r\n");
      out.write("                            <select class=\"form-control\" id=\"groupNum\" name=\"groupNum\" required>\r\n");
      out.write("                              <option value=\"\">인원수 선택</option>\r\n");
      out.write("                              ");

                                 for (int i = 1; i <= 100; i++) {
                              
      out.write("\r\n");
      out.write("                              <option value=\"");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i + "명");
      out.write("</option>\r\n");
      out.write("                              ");

                                 }
                              
      out.write("\r\n");
      out.write("                           </select><br>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <label for=\"inputStDate\" class=\"col-lg-2 control-label\">시작일</label>\r\n");
      out.write("                        <div class=\"col-lg-9\">\r\n");
      out.write("                           <input type=\"text\" class=\"form-control\" id=\"stDate\"\r\n");
      out.write("                              name=\"startDate\" placeholder=\"여행 시작 날짜\" required>\r\n");
      out.write("                        </div><br>\r\n");
      out.write("                     \r\n");
      out.write("                  \r\n");
      out.write("                        <label for=\"inputendDate\" class=\"col-lg-2 control-label\">종료일</label>\r\n");
      out.write("                        <div class=\"col-lg-9\">\r\n");
      out.write("                           <input type=\"text\" class=\"form-control\" id=\"edDate\"\r\n");
      out.write("                              name=\"endDate\" placeholder=\"여행 종료 날짜\" required>\r\n");
      out.write("                        </div>\r\n");
      out.write("                  \r\n");
      out.write("               </div>\r\n");
      out.write("\r\n");
      out.write("               <div class=\"form-group\" >\r\n");
      out.write("                   <div class=\"col-lg-10 col-lg-offset-7\">\r\n");
      out.write("                      <input type=\"submit\" class=\"btn btn-warning\" value=\"작성 시작\">\r\n");
      out.write("                      <input type=\"reset\" class=\"btn btn-default\" id=\"popup_cancel\" value=\"취소\">\r\n");
      out.write("                   </div>\r\n");
      out.write("               </div>\r\n");
      out.write("            </fieldset>\r\n");
      out.write("         </form>\r\n");
      out.write("      </div>\r\n");
      out.write("   </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<!-- 로그인 -->\r\n");
      out.write("<div id=\"popup_layer_login\"\r\n");
      out.write("\tstyle=\"position: absolute; top: 70%; left: 53%; border-radius: 0.4em; width: 25%; height: 31%; margin-left: -15%; margin-top: -20%; z-index: 1; visibility: hidden; background-color: #f5f5f5; padding: 2px;\">\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"login_form_header\" class=\"panel panel-warning\">\r\n");
      out.write("\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t<h4 class=\"panel-title\" align=\"right\">\r\n");
      out.write("\t\t\t\t<a href=\"#\" onclick=\"fn_layer_popup_join()\">회원가입</a>\r\n");
      out.write("\t\t\t</h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"panel-body\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<form class=\"form-horizontal\" action=\"\">\r\n");
      out.write("\t\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t\t<legend>로그인</legend>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"inputTitle\" class=\"col-lg-3 control-label\">이메일</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"loginMember_id\"\r\n");
      out.write("\t\t\t\t\t\t\t\tplaceholder=\"email주소\" autofocus required>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"inputTitle\" class=\"col-lg-3 control-label\">패스워드</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\" id=\"loginM_password\"\r\n");
      out.write("\t\t\t\t\t\t\t\tplaceholder=\"password\" autofocus required>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7 col-lg-offset-4\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" id=\"login_send\" class=\"btn btn-warning\"\r\n");
      out.write("\t\t\t\t\t\t\t\tvalue=\"로그인\"> <input type=\"reset\" id=\"popup_cancel_login\"\r\n");
      out.write("\t\t\t\t\t\t\t\tclass=\"btn btn-default\" value=\"취소\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<!-- 회원가입 -->\r\n");
      out.write("<div id=\"popup_layer_join\"\r\n");
      out.write("\tstyle=\"position: absolute; top: 70%; left: 53%; border-radius: 0.4em; width: 25%; height: 37%; margin-left: -15%; margin-top: -20%; z-index: 1; visibility: hidden; background-color: #f5f5f5; padding: 2px;\">\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"join_form_header\" class=\"panel panel-warning\">\r\n");
      out.write("\t\t<div class=\"panel-heading\">\r\n");
      out.write("\t\t\t<h4 class=\"panel-title\" align=\"right\">**welcome**</h4>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"panel-body\">\r\n");
      out.write("\r\n");
      out.write("\t\t\t<form id=\"ajaxform\" class=\"form-horizontal\" action=\"/wheremasil/member/join.do\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t\t\t<fieldset>\r\n");
      out.write("\t\t\t\t\t<legend>회원가입</legend>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"inputTitle\" class=\"col-lg-3 control-label\">이메일</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"member_id\" placeholder=\"email주소\"\tautofocus required>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"inputTitle\" class=\"col-lg-3 control-label\">패스워드</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"password\" class=\"form-control\" name=\"m_password\" placeholder=\"password\" autofocus required>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<label for=\"inputTitle\" class=\"col-lg-3 control-label\">닉네임</label>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" name=\"m_name\" placeholder=\"닉네임\" autofocus required>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"file\" name=\"picture\">\r\n");
      out.write("\t \t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col-lg-7 col-lg-offset-4\">\r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"button\" id=\"join_send\" class=\"btn btn-warning\"\tvalue=\"가입\"> \r\n");
      out.write("\t\t\t\t\t\t\t<input type=\"reset\" id=\"popup_cancel_join\" class=\"btn btn-default\" value=\"취소\">\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</fieldset>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("</div>\r\n");
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
    // /WEB-INF/view/layout/header.jsp(137,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty requestScope.header_search}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t\t<div class=\"form-group\">\r\n");
        out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"page\" value=\"\"> <input\r\n");
        out.write("\t\t\t\t\t\t\ttype=\"text\" class=\"form-control\" placeholder=\"Search\"\r\n");
        out.write("\t\t\t\t\t\t\tname=\"searchWord\" id=\"headerSearchWord\"> <input\r\n");
        out.write("\t\t\t\t\t\t\ttype=\"hidden\" name=\"category\" value=\"simple\"> <input\r\n");
        out.write("\t\t\t\t\t\t\ttype=\"hidden\" name=\"type\" value=\"\">\r\n");
        out.write("\t\t\t\t\t</div>\r\n");
        out.write("\t\t\t\t\t<button type=\"submit\" class=\"btn btn-default\" id=\"searchWordBtn\">\r\n");
        out.write("\t\t\t\t\t\t<span class=\"glyphicon glyphicon-search\" aria-hidden=\"true\"></span>\r\n");
        out.write("\t\t\t\t\t</button>\r\n");
        out.write("\t\t\t\t");
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
    // /WEB-INF/view/layout/header.jsp(151,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${!empty sessionScope.login_info.member_id}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t\t<input id=\"logout_bt\" type=\"button\"\r\n");
        out.write("\t\t\t\t\t\tclass=\"btn btn-default navbar-btn\" value=\"로그아웃\">\r\n");
        out.write("\t\t\t\t\t<input id=\"mypage\" type=\"button\" class=\"btn btn-default navbar-btn\"\r\n");
        out.write("\t\t\t\t\t\tvalue=\"마이페이지\">\r\n");
        out.write("\r\n");
        out.write("\t\t\t\t");
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

  private boolean _jspx_meth_c_005fif_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f2.setParent(null);
    // /WEB-INF/view/layout/header.jsp(159,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${empty sessionScope.login_info.member_id}", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
    if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\r\n");
        out.write("\t\t\t\t\t<button id=\"login_form_bt\" type=\"button\"\r\n");
        out.write("\t\t\t\t\t\tclass=\"btn btn-default navbar-btn\"\r\n");
        out.write("\t\t\t\t\t\tonclick=\"fn_layer_popup_login()\">로그인</button>\r\n");
        out.write("\r\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
    return false;
  }
}
