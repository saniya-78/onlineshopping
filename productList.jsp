<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html5>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">

</head>
<body>

   <jsp:include page="_header.jsp" />
   <jsp:include page="_menu.jsp" />
 
   <fmt:setLocale value="en_US" scope="session"/>

   <div class="page-title"><center>Clothes And Accesories</center></div>

 <img width="200px" height="100px" src="C:\Users\Saniya\Downloads\SpringMVCAnnotationShoppingCart (2)\SpringMVCAnnotationShoppingCart\src\main\webapp\WEB-INF\pages\fs.jpg"/>
 <img width="200px" height="100px" src="C:\Users\Saniya\Downloads\SpringMVCAnnotationShoppingCart (2)\SpringMVCAnnotationShoppingCart\src\main\webapp\WEB-INF\pages\ms.jpg"/>
 <img width="200px" height="100px" src="C:\Users\Saniya\Downloads\SpringMVCAnnotationShoppingCart (2)\SpringMVCAnnotationShoppingCart\src\main\webapp\WEB-INF\pages\ns.jpg"/>
 <img width="200px" height="100px" src="C:\Users\Saniya\Downloads\SpringMVCAnnotationShoppingCart (2)\SpringMVCAnnotationShoppingCart\src\main\webapp\WEB-INF\pages\asss.jpg"/>
   <c:forEach items="${paginationProducts.list}" var="prodInfo">
       <div class="product-preview-container">
 
           <ul>
           

               <li>Code: ${prodInfo.code}</li>
               <li>Name: ${prodInfo.name}</li>
               <li>Price: <fmt:formatNumber value="${prodInfo.price}" type="currency"/></li>
               <li><a
                   href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">
                       Buy Now</a></li>
               <!-- For Manager edit Product -->
               <security:authorize  access="hasRole('ROLE_MANAGER')">
                 <li><a style="color:red;"
                     href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
                       Edit Product</a></li>
               </security:authorize>
           </ul>
           
           
       </div>

   </c:forEach>
   <br/>
   
 
   
 

  <!--  <c:if test="${paginationProducts.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationProducts.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="productList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
         
       </div>
   </c:if> -->
   

   <jsp:include page="_footer.jsp" />

</body>
</html>