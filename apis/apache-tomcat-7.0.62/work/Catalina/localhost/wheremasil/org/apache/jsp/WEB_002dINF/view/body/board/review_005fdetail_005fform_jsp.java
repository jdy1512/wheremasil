/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.62
 * Generated at: 2015-06-17 03:28:12 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.body.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class review_005fdetail_005fform_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write(" \r\n");
      out.write("    \r\n");
      out.write("\r\n");
 request.setCharacterEncoding("utf-8"); 
      out.write('\r');
      out.write('\n');
 response.setContentType("text/html; charset=utf-8"); 
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html><!-- style=\"float: right;\" -->\r\n");
      out.write("<!-- style=\"max-width:200px;\" -->\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("<script  src=\"http://code.jquery.com/jquery-latest.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function resize(obj) {\r\n");
      out.write("    obj.style.height = \"1px\";\r\n");
      out.write("    obj.style.height = (20+obj.scrollHeight)+\"px\";\r\n");
      out.write("  }\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("var check =2;\r\n");
      out.write("\r\n");
      out.write("function insertHit(){\r\n");
      out.write("\t//alert(\"조회수 펑션\");\r\n");
      out.write("\tvar txt = \"posting_id\" + \"=\"+ $(\"#posting_id\").val();\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("   \t    url: '/wheremasil/board/insertHit.do',\r\n");
      out.write("   \t type:\"post\",\r\n");
      out.write("   \t    processData: false,\r\n");
      out.write("   \t \r\n");
      out.write("\t    data:txt,\r\n");
      out.write("\t    dataType:\"JSON\",\r\n");
      out.write("   \t    \r\n");
      out.write("   \t    success: function(result){\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t//alert(result);\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t   \r\n");
      out.write("   \t    },\r\n");
      out.write("   \t    error:function(result){\r\n");
      out.write("   \t    \t//alert(result);\r\n");
      out.write("   \t    \talert(\"조회수 업데이트 실패\");\r\n");
      out.write("   \t    }\r\n");
      out.write("   \t});\r\n");
      out.write("\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function rpccnt(){\r\n");
      out.write("\t\r\n");
      out.write("\tvar rpcnt;\r\n");
      out.write("\t\r\n");
      out.write("\tvar p_id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${posting.posting_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(";\r\n");
      out.write("\t\r\n");
      out.write("\tvar allData = \"p_id=\"+p_id;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t$.ajax({\r\n");
      out.write("\t\t       \t    url: '/wheremasil/board/rpcnt.do',\r\n");
      out.write("\t\t       \t type:\"post\",  \r\n");
      out.write("\t\t       \t    processData: false,\r\n");
      out.write("\t\t       \t data:allData,\r\n");
      out.write("\t\t    \t    dataType:\"text\",\r\n");
      out.write("\t\t       \t    \r\n");
      out.write("\t\t       \t    success: function(result){\r\n");
      out.write("\t\t       \t    \t\r\n");
      out.write("\t\t       \t    \t\r\n");
      out.write("\t\t       \t    \t\r\n");
      out.write("\t\t       \t    \trpcnt=result;\r\n");
      out.write("\t\t       \t    \t\r\n");
      out.write("\t\t \r\n");
      out.write("\t\t       \t    \r\n");
      out.write("\t\t       \t    \r\n");
      out.write("\t\t       \t    \t\r\n");
      out.write("\t\t       \t     document.getElementById(\"rp_cnt\").innerHTML = rpcnt;       \t    \t\r\n");
      out.write("\t\t       \t    \t\r\n");
      out.write("\t\t       \t   \r\n");
      out.write("\t\t       \t    },\r\n");
      out.write("\t\t       \t    error:function(result){\r\n");
      out.write("\t\t       \t    \t//alert(result);\r\n");
      out.write("\t\t       \t    \talert(\"리플개수못옴\");\r\n");
      out.write("\t\t       \t    }\r\n");
      out.write("\t\t       \t});\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function rpinsert(){\r\n");
      out.write("\tvar editor2 = \"editor1\" + \"=\"+ $(\"#posting_id\").val()+\"&\" + \"m_name\"\r\n");
      out.write("\t+ \"=\" + $(\"#m_name12345\").val();\r\n");
      out.write("\t\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("       \t    url: '/wheremasil/board/sinsertRp.do',\r\n");
      out.write("       \t    \r\n");
      out.write("       \t    processData: false,\r\n");
      out.write("       \t type:\"post\",\r\n");
      out.write("    \t    data:editor2,\r\n");
      out.write("    \t    dataType:\"JSON\",\r\n");
      out.write("       \t    \r\n");
      out.write("       \t    success: function(result){\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t    \t\r\n");
      out.write(" \r\n");
      out.write("       \t    \twashrp(result);\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t    \t\r\n");
      out.write("       \t   \r\n");
      out.write("       \t    },\r\n");
      out.write("       \t    error:function(result){\r\n");
      out.write("       \t    \t(result);\r\n");
      out.write("       \t    \talert(\"첫리플로드  실패\");\r\n");
      out.write("       \t    }\r\n");
      out.write("       \t});\r\n");
      out.write("\t\r\n");
      out.write("\tif(check==1){\r\n");
      out.write("\t\tbutton();\r\n");
      out.write("\t\tcheck=2;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function button(){\r\n");
      out.write("\t//alert(\"버튼클릭\");\r\n");
      out.write("\t//alert(check);\r\n");
      out.write("\t$(document).scrollTop( 99999);\r\n");
      out.write("\tif(check==1){\r\n");
      out.write("\tdocument.getElementById(\"rplist\").innerHTML=\"\";\r\n");
      out.write("\tdocument.getElementById(\"button\").innerHTML=\"▼\";\r\n");
      out.write("\tcheck=2;\r\n");
      out.write("\t$(document).scrollTop( 99999);\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\t\r\n");
      out.write("\t\trpinsert();\r\n");
      out.write("\t\tdocument.getElementById(\"button\").innerHTML=\"▲\";\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tcheck=1;\r\n");
      out.write("\t\t$(document).scrollTop( 99999);\r\n");
      out.write("\t}\r\n");
      out.write("\t$(document).scrollTop( 99999);\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function inertLike(posting_id){\r\n");
      out.write("\t//alert(\"추천하기 펑션\");\r\n");
      out.write("\tvar txt = \"posting_id\" + \"=\"+ $(\"#posting_id\").val();\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("   \t    url: '/wheremasil/board/insertLike.do',\r\n");
      out.write("   \t    \r\n");
      out.write("   \t    processData: false,\r\n");
      out.write("   \t type:\"post\",\r\n");
      out.write("\t    data:txt,\r\n");
      out.write("\t    dataType:\"JSON\",\r\n");
      out.write("   \t    \r\n");
      out.write("   \t    success: function(result){\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t alert(\"추천하였습니다.\");\r\n");
      out.write("   \t    \t$(document).scrollTop( 99999);\r\n");
      out.write("   \t    \r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t   \r\n");
      out.write("   \t    },\r\n");
      out.write("   \t    error:function(result){\r\n");
      out.write("   \t    \talert(result);\r\n");
      out.write("   \t    \talert(\"라이크 업데이트 실패\");\r\n");
      out.write("   \t    }\r\n");
      out.write("   \t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("$(document).ready(function(){\r\n");
      out.write("\t\r\n");
      out.write("\tinsertHit();\r\n");
      out.write("\t123456\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#like\").on(\"click\",function(){\r\n");
      out.write("\t\tif (confirm(\"정말 추천하시겠습니까??\") == true){   \r\n");
      out.write("\t\t    inertLike( $(\"#posting_id\").val());\r\n");
      out.write("\t\t}else{   \r\n");
      out.write("\t\t    return;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\trpccnt();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#button\").on(\"click\",function(){\r\n");
      out.write("\t\t\r\n");
      out.write("           button();\r\n");
      out.write("\t\t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t$(\"#rpregi\").on(\"click\",function(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tif($(\"#member_id2\").val()!=\"\"\t){\r\n");
      out.write("\r\n");
      out.write("\t\tvar editor1 =  \"editor1\" + \"=\"+ $(\"#rpcontext\").val()+\"&\" +\"member_id\" + \"=\"+ $(\"#member_id2\").val()+\"&\" +\"posting_id\" + \"=\"+ $(\"#posting_id\").val()+\"&\" +\"m_name\" + \"=\"+ $(\"#m_name12345\").val();\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$.ajax({\r\n");
      out.write("\t       \t    url: '/wheremasil/board/insertRp.do',\r\n");
      out.write("\t       \t    \r\n");
      out.write("\t       \t    processData: false,\r\n");
      out.write("\t       \t type:\"post\",\r\n");
      out.write("\t    \t    data:editor1,\r\n");
      out.write("\t    \t    dataType:\"JSON\",\r\n");
      out.write("\t       \t    \r\n");
      out.write("\t       \t    success: function(result){\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \talert(\"리플을 등록했습니다\");\r\n");
      out.write("\t \r\n");
      out.write("\t       \t    \twashrp(result);\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \trpccnt();\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t    \t\r\n");
      out.write("\t       \t   \r\n");
      out.write("\t       \t    },\r\n");
      out.write("\t       \t    error:function(result){\r\n");
      out.write("\t       \t    \talert(result);\r\n");
      out.write("\t       \t    \talert(\"리플업로드 실패\");\r\n");
      out.write("\t       \t    }\r\n");
      out.write("\t       \t});\r\n");
      out.write("\t\t\r\n");
      out.write("\t\r\n");
      out.write("\t\t}else{\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\talert(\"로그인부터하세요\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("});\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("var scrollTop = 0;\r\n");
      out.write("var scrollLeft = 0;\r\n");
      out.write("//Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);\r\n");
      out.write("function EndRequestHandler(sender, args) { \r\n");
      out.write("    setScroll();\r\n");
      out.write("}\r\n");
      out.write("function setScroll()\r\n");
      out.write("{\r\n");
      out.write("    document.getElementById('AdjResultsDiv').scrollTop = scrollTop;\r\n");
      out.write("    document.getElementById('AdjResultsDiv').scrollLeft = scrollLeft;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function saveScroll()\r\n");
      out.write("{\r\n");
      out.write("    scrollTop = document.getElementById('AdjResultsDiv').scrollTop;\r\n");
      out.write("    scrollLeft = document.getElementById('AdjResultsDiv').scrollLeft;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function del(asd){\r\n");
      out.write("\t//alert(\"확인\");\r\n");
      out.write("\tif (confirm(\"정말 삭제하시겠습니까??\") == true){  \r\n");
      out.write("\t\t//alert(asd);\r\n");
      out.write("\t   deletePost(asd);\r\n");
      out.write("\t}else{   \r\n");
      out.write("\t    return;\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function deletePost(posting_id){\r\n");
      out.write("\t//alert(\"넘너온 포스팅넘버\"+posting_id);\t\r\n");
      out.write("var txt = \"posting_id\" + \"=\"+ posting_id;\r\n");
      out.write("\t\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("   \t    url: '/wheremasil/board/RdeletePost.do',\r\n");
      out.write("   \t type:\"post\",\r\n");
      out.write("   \t    processData: false,\r\n");
      out.write("   \t \r\n");
      out.write("\t    data:txt,\r\n");
      out.write("\t    dataType:\"text\",\r\n");
      out.write("   \t    \r\n");
      out.write("   \t    success: function(result){\r\n");
      out.write("   \t   \r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \talert(\"성공\");\r\n");
      out.write("   \t    \tlocation.reload(true);\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t   \r\n");
      out.write("   \t    },\r\n");
      out.write("   \t    error:function(result){\r\n");
      out.write("   \t    \t\r\n");
      out.write("   \t    \talert(\"삭제실패\");\r\n");
      out.write("   \t    }\r\n");
      out.write("   \t});\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function getMemberImg(member_id) {\r\n");
      out.write("\tvar result1;\r\n");
      out.write("\tvar txt = \"member_id\" + \"=\" + member_id;\r\n");
      out.write("\t$.ajax({\r\n");
      out.write("\t\turl : '/wheremasil/board/getMemberImg.do',\r\n");
      out.write("\r\n");
      out.write("\t\tprocessData : false,\r\n");
      out.write("\t\ttype : \"post\",\r\n");
      out.write("\t\tdata : txt,\r\n");
      out.write("\t\tdataType : \"text\",\r\n");
      out.write("\r\n");
      out.write("\t\tsuccess : function(result) {\r\n");
      out.write("\t\t\t //alert(\"사용자 이미지가 성공적으로 넘어옴 = \t\"+result);\r\n");
      out.write("\t\t\t\tresult1=result;\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t $(\".img\"+member_id).attr('src',result);\r\n");
      out.write("\t\t},\r\n");
      out.write("\t\terror : function(result) {\r\n");
      out.write("\r\n");
      out.write("\t\t\talert(\"사용자 이미지주소 가저오기 실패\");\r\n");
      out.write("\t\t}\r\n");
      out.write("\t});\r\n");
      out.write("\t//alert(\"보내기전 이미지값 =\"+result1);\r\n");
      out.write("\treturn result1;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("function washrp(result) {\r\n");
      out.write("\t//이미지 링크 수정해야됨\r\n");
      out.write("\t\r\n");
      out.write("\tdocument.getElementById(\"rp_cnt\").innerHTML = result.length;   \r\n");
      out.write("\t $(\"#rplist\").html(\"\");\r\n");
      out.write("\tfor(var i=0; i<result.length; i++) {\r\n");
      out.write("\t\t\r\n");
      out.write("    $(\"#rplist\").append(\"<tr><td width='50'><img width='30px' height='30px' src class='img\"+result[i].m_name+\"'>\"+\"</td><td width=''>\"+result[i].m_name+\"  </td><td style='whie-space:normal; max-width: 500px;'>\"+result[i].r_content +\"</td><td width=''> <button class='btn btn-danger' id='fileSection1' onclick='del(\"+result[i].reply_id+\");' type='button' name='\"+result[i].reply_id+\"'>삭제하기</button></td><td width='10%'>\"+result[i].r_datetime+ \"</td></tr>\");\r\n");
      out.write("    getMemberImg(result[i].m_name);\r\n");
      out.write("\t}\r\n");
      out.write(" }\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=EUC-KR\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("</head>\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<table width=\"100%\" border=\"1\" cellspacing=\"0\" cellpadding=\"10\">\r\n");
      out.write("\r\n");
      out.write("<tr>\r\n");
      out.write("<td style=\"float:right;\">[<a href=\"#\">가족여행</a>]</td>\r\n");
      out.write("<td width=\"50%\"><strong>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.p_title}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</strong></td>\r\n");
      out.write("<td><a href=\"/wheremasil/board/review.do\">목록보기</a></td>\r\n");
      out.write("<td><a href=\"/wheremasil/board/postingVal.do?postring_id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${posting.posting_id -1}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" \">이전글보기</a></td>\r\n");
      out.write("<td><a href=\"/wheremasil/board/postingVal.do?postring_id=");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${posting.posting_id +1}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write(" \">다음글보기</a></td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table border=\"1\" width=\"100%\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td width=\"\" style=\"font-size: 10pt\">글번호: ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.p_number }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\r\n");
      out.write("<td width=\"\" style=\"font-size: 10pt\">글쓴이 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.member_id }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\r\n");
      out.write("<td width=\"\" style=\"font-size: 10pt\">조회수 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.p_hits }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\r\n");
      out.write("<td width=\"\" style=\"font-size: 10pt\">추천수 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.p_like }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\r\n");
      out.write("<td width=\"\" style=\"font-size: 10pt\">올린시간 : ");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.p_datetime }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("</td>\r\n");
      out.write("<td width=\"40%\"></td>\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("<table border=\"1\" width=\"100%\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td style=\"min-height:500px;\">\r\n");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.p_content }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\r\n");
      out.write("</td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</tr>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table border=\"1\" width=\"100%\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td width=\"5%\">댓글   <span id=\"rp_cnt\"></span>  </td>\r\n");
      out.write("<td width=\"5%\"><button id=\"button\" >▼</button></td>\r\n");
      out.write("<td width=\"60%\" > </td>\r\n");
      out.write("<td width=\"10%\" > <a href=\"#\" id=\"like\">   추천하기</a></td>\r\n");
      out.write("<td width=\"10%\"> 관심여행등록</td>\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table border=\"1\" width=\"100%\" id=\"rplist\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("<table border=\"1\" width=\"100%\">\r\n");
      out.write("<tr>\r\n");
      out.write("<td width=\"80%\"><textarea id=\"rpcontext\" onchange=\"resize(this)\" style=\"width:100%; overflow:visible;\"></textarea> </td>\r\n");
      out.write("<td style=\"text-align:center; margin:auto;\"  ><form action=\"#\">\r\n");
      out.write("<input type=\"hidden\" id=\"member_id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.member_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" id=\"posting_id\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${requestScope.posting.posting_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" id=\"member_id2\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.login_info.member_id}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\r\n");
      out.write("<input type=\"hidden\" id=\"m_name12345\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${sessionScope.login_info.m_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("\"/>\r\n");
      out.write("<!-- reply_id,r_parent_id,r_datetime,r_level,postring_id,member_id  -->\r\n");
      out.write("\r\n");
      out.write("<input type=\"button\" value=\"리플등록\" id=\"rpregi\">\r\n");
      out.write("\r\n");
      out.write("</form>  </td>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</table>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
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