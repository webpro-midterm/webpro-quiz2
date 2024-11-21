<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
</head>
<body class="bg-[#181c24] text-white">

<h1 class="text-2xl text-[#66FCF1] font-zen mt-10 text-center">
  LOGIN
</h1>

<!-- Display session status or errors (if any) -->
<c:if test="${not empty errorMessage}">
  <p style="color:red;" class="text-center">${errorMessage}</p>
</c:if>

<form method="POST" action="LoginServlet" class="max-w-md mx-auto mt-6">
  <div>
    <label for="email" class="block text-sm font-medium text-gray-100">Email</label>
    <input id="email" class="block mt-1 w-full bg-[#181c24] text-white border border-gray-600 p-2" type="email" name="email" value="${param.email}" required autofocus autocomplete="username">
    <c:if test="${not empty errors.email}">
      <p class="text-red-500 text-sm">${errors.email}</p>
    </c:if>
  </div>

  <div class="mt-4">
    <label for="password" class="block text-sm font-medium text-gray-100">Password</label>
    <input id="password" class="block mt-1 w-full bg-[#181c24] text-white border border-gray-600 p-2" type="password" name="password" required autocomplete="current-password">
    <c:if test="${not empty errors.password}">
      <p class="text-red-500 text-sm">${errors.password}</p>
    </c:if>
  </div>

  <div class="block mt-4">
    <label for="remember_me" class="inline-flex items-center">
      <input id="remember_me" type="checkbox" name="remember" class="rounded border-gray-300 text-indigo-600 focus:ring-indigo-500">
      <span class="ml-2 text-sm text-gray-600">Remember me</span>
    </label>
  </div>

  <div class="flex items-center justify-between mt-4">
    <a href="forgot-password.jsp" class="text-sm text-gray-400 hover:text-gray-500">Forgot your password?</a>
    <button type="submit" class="px-6 py-2 bg-indigo-600 text-white rounded-md">Log in</button>
  </div>
</form>

</body>
</html>
