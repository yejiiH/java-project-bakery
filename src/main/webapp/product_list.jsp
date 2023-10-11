<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.bakery.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.bakery.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
boolean isLogin = false;
String sUserId=(String)session.getAttribute("s_u_id");
if (session.getAttribute("s_u_id") != null) {
	isLogin = true;
}
String category_noStr=request.getParameter("category_no");
if(category_noStr==null)category_noStr="0";

ProductService productService = new ProductService();
List<Product> productList = null;
if(category_noStr.equals("0")){
	productList=productService.selectAll();
}else{
	productList=productService.selectByCategory(Integer.parseInt(category_noStr));
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>SEOUL BAGUETTE</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/menu.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<style type="text/css" media="screen">
</style>
<script src="js/admin.js"></script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top_product.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>

								<caption
									style="text-align: left; font-weight: bold; padding-bottom: 7px">
									<span style="border-left: 4px solid #888888;"></span>&nbsp;&nbsp;
									서울바게트 > 상품리스트
								</caption>
							</table>
							<%if(sUserId==null||sUserId.equals("")) {
								
							} 
								else if(sUserId.equals("admin")) {%>
							
								<input type="button" style="font: inherit; float:right;" value ="상품 추가" onclick="productInsertForm()" >
								<%}
									%>
							
							

							<form name="f" method="post">
								<table width="100%" align="center" border="0" cellpadding="10"
									cellspacing="1" bgcolor="FFFFFF">
									<%
									int product_size=productList.size();
									int product_column_size=4;
									int product_line_count = 1;
									
								
									for (int i=0;i<productList.size();i++) {
											Product product=productList.get(i);
											
									%>
									<!--상품시작 -->
									<%
									 if(i%product_column_size==0){
									%>
									<tr>
									<%} %>
										<td align="center" width="25%"  bgcolor="ffffff" style=" padding-left:10px;padding-top: 10px; padding-right: 10px;padding-bottom: 10px;"><a
											href="product_detail.jsp?p_no=<%=product.getP_no()%>"><img width="150px" height="130px"
												src="image/<%=product.getP_image()%>" border="0"></a><br />
											<br /> <b><%=product.getP_name()%></b><br> <font color="#FF0000">금액: <%=new DecimalFormat("#,##0").format(product.getP_price())%>원
										</font></td>
									<%if(i%product_column_size==3){%>
									</tr>
									<%} %>	
									
								   <!--상품 끝 -->
								   <%}%>	
								</table>
							</form> <br /></td>
					</tr>
				</table>
			</div>

			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
	
	</div>
	<!--container end-->
</body>
</html>