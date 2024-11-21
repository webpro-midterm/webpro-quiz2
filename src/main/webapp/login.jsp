<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.tailwindcss.com" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="input.css" rel="stylesheet">

  <%-- <meta name="csrf-token" content="<%= csrfToken %>">--%>
  <%-- <title><%= appConfig.get("app.name", "JavaApp") %></title>--%>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.bunny.net">
  <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
  <link href="https://fonts.cdnfonts.com/css/cosmic" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">

  <!-- Scripts -->
  <%-- <script src="<%= resourcesPath %>/js/app.js" type="text/javascript"></script>--%>
  <%-- <link href="<%= resourcesPath %>/css/app.css" rel="stylesheet">--%>

  <style>
    body {
      font-family: 'Cosmic', sans-serif;
    }
  </style>
</head>

<body class="font-sans antialiased">
<div class="background min-h-screen" style="background-color: #1F2833;">
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>
  <div class="shape"></div>




  <!-- Page Content -->
  <main class="flex items-center justify-center mt-10">
    <!-- Login Form -->
    <div class="max-w-md mx-auto mt-6 bg-[#181c24] p-8 rounded-md">
      <h1 class="text-2xl text-[#66FCF1] font-zen mt-10 text-center">LOGIN</h1>

      <!-- Display session status or errors (if any) -->
      <c:if test="${not empty errorMessage}">
        <p style="color:red;" class="text-center">${errorMessage}</p>
      </c:if>

      <form method="POST" action="LoginServlet" class="mt-6">
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
    </div>
  </main>

  <!-- Footer -->
  <footer class="py-16 text-center text-sm text-white">
    Webpro IUP 2024
  </footer>

</div>
</body>
</html>
