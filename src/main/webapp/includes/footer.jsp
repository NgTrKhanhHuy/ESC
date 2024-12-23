<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="${sessionScope.lang != null ? sessionScope.lang : 'en'}" />
<fmt:setBundle basename="messages" />
<%--
  Created by IntelliJ IDEA.
  User: Khanh Huy Studios
  Date: 28/11/2024
  Time: 11:50 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="bg-dark text-light mt-5 p-4 text-center">
  <p><fmt:message key="footer.content" /></p>
</footer>

