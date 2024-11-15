<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="bg-[#1F2833] h-16 flex items-center">
  <div class="container mx-auto flex justify-between items-center">
    <!-- Logo -->
    <a href="home.jsp" class="flex items-center">
      <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="h-20" />
    </a>

    <!-- Navbar Links -->
    <div class="hidden md:flex space-x-4">
      <a href="dashboard.jsp" class="hover:text-gray-400 text-white">Dashboard</a>
      <a href="posts.jsp" class="hover:text-gray-400 text-white">Posts</a>
      <a href="reviews.jsp" class="hover:text-gray-400 text-white">Reviews</a>
    </div>

    <!-- Authentication Links -->
    <div class="hidden md:flex space-x-4">
      <c:choose>
        <c:when test="${not empty user}">
          <a href="dashboard.jsp" class="hover:text-gray-400 text-white">Dashboard</a>
          <a href="profile.jsp" class="hover:text-gray-400 text-white">Profile</a>
          <form action="logout" method="POST">
            <button type="submit" class="hover:text-gray-400 text-white">Logout</button>
          </form>
        </c:when>
        <c:otherwise>
          <a href="login.jsp" class="hover:text-gray-400 text-white">Login</a>
          <a href="register.jsp" class="hover:text-gray-400 text-white">Register</a>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>
