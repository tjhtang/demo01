<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%@ page import="com.domain.Book" %>
<%@ page import="com.domain.BookType" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的bookType信息
    List<BookType> bookTypeList = (List<BookType>)request.getAttribute("bookTypeList");
    Book book = (Book)request.getAttribute("book");

    String username=(String)session.getAttribute("username");
    if(username==null){
        response.getWriter().println("<script>top.location.href='" + basePath + "login/login_view.action';</script>");
    }
%>
<HTML><HEAD><TITLE>修改图书</TITLE>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
.label {font-style.:italic; }
.errorLabel {font-style.:italic;  color:red; }
.errorMessage {font-weight:bold; color:red; }
</STYLE>
 <script src="<%=basePath %>calendar.js"></script>
<script language="javascript">
/*验证表单*/
function checkForm() {
    var bookName = document.getElementById("book.bookName").value;
    if(bookName=="") {
        alert('请输入图书名称!');
        return false;
    }
    var barcode = document.getElementById("book.barcode").value;
    if(barcode=="") {
        alert('请输入图书条形码!');
        return false;
    }
    return true; 
}
 </script>
</HEAD>
<BODY>
<s:fielderror cssStyle="color:red" />
<TABLE align="center" height="100%" cellSpacing=0 cellPadding=0 width="80%" border=0>
  <TBODY>
  <TR>
    <TD align="left" vAlign=top ><s:form action="Book/Book_ModifyBook.action" method="post" onsubmit="return checkForm();" name="form1">
<table width='100%' cellspacing='1' cellpadding='3' bgcolor='#CCCCCC' class="tablewidth">
  <tr>
    <td width=30%>图书条形码:</td>
    <td width=70%><input id="book.barcode" name="book.barcode" type="text" value="<%=book.getBarcode() %>" readOnly /></td>
  </tr>

  <tr>
    <td width=30%>图书名称:</td>
    <td width=70%><input id="book.bookName" name="book.bookName" type="text" size="20" value='<%=book.getBookName() %>'/></td>
  </tr>

  <tr>
    <td width=30%>图书所在类别:</td>
    <td width=70%>
      <select name="book.bookType.bookTypeId">
      <%
        for(BookType bookType:bookTypeList) {
          String selected = "";
          if(bookType.getBookTypeId() == book.getBookType().getBookTypeId())
            selected = "selected";
      %>
          <option value='<%=bookType.getBookTypeId() %>' <%=selected %>><%=bookType.getBookTypeName() %></option>
      <%
        }
      %>
    </td>
  </tr>

  <tr>
    <td width=30%>图书价格:</td>
    <td width=70%><input id="book.price" name="book.price" type="text" size="8" value='<%=book.getPrice() %>'/></td>
  </tr>

  <tr>
    <td width=30%>库存:</td>
    <td width=70%><input id="book.count" name="book.count" type="text" size="8" value='<%=book.getCount() %>'/></td>
  </tr>

  <tr>
    <td width=30%>出版社:</td>
    <td width=70%><input id="book.publish" name="book.publish" type="text" size="20" value='<%=book.getPublish() %>'/></td>
  </tr>

  <tr bgcolor='#FFFFFF'>
      <td colspan="4" align="center">
        <input type='submit' name='button' value='保存' >
        &nbsp;&nbsp;
        <input type="reset" value='重写' />
      </td>
    </tr>

</table>
</s:form>
   </TD></TR>
  </TBODY>
</TABLE>
</BODY>
</HTML>
