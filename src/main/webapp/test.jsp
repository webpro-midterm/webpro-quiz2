<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.tailwindcss.com" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="input.css" rel="stylesheet">

  <%--  <meta name="csrf-token" content="<%= csrfToken %>">--%>
  <%--  <title><%= appConfig.get("app.name", "JavaApp") %></title>--%>

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.bunny.net">
  <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
  <link href="https://fonts.cdnfonts.com/css/cosmic" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">

  <!-- Scripts -->
  <%--  <script src="<%= resourcesPath %>/js/app.js" type="text/javascript"></script>--%>
  <%--  <link href="<%= resourcesPath %>/css/app.css" rel="stylesheet">--%>

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

  <%--  <!-- Navbar Include -->--%>
  <%--  <%@ include file="layouts/navbar.jsp" %>--%>
  <nav class="bg-[#1F2833] h-16 flex items-center z-50 bg-opacity-50">
    <div class="container mx-auto flex justify-between items-center">
      <!-- Logo or Brand -->
      <a href="<c:url value='/' />" class="flex items-center">
        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="h-20" />
      </a>

      <!-- Hamburger Menu for Mobile -->
      <div class="block md:hidden">
        <button id="menu-btn" class="text-white focus:outline-none">
          <!-- Hamburger icon (three lines) -->
          <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
          </svg>
        </button>
      </div>

      <!-- Links -->
      <div id="menu" class="hidden md:flex space-x-4">
        <a href="dashboard.jsp" class="hover:text-gray-400 text-white">Home</a>
        <a href="posts/index.jsp" class="hover:text-gray-400 text-white">Post</a>
        <a href="reviews/index.jsp" class="hover:text-gray-400 text-white">Reviews</a>
      </div>
    </div>

    <!-- Mobile Menu (Initially Hidden) -->
    <div id="mobile-menu" class="md:hidden hidden flex-col items-center bg-[#2F4156] space-y-4 p-4">
      <a href="<c:url value='/' />" class="hover:text-gray-400 text-white">Home</a>
      <a href="<c:url value='/movies' />" class="hover:text-gray-400 text-white">Movies</a>
      <a href="<c:url value='/reviews' />" class="hover:text-gray-400 text-white">Reviews</a>
      <a href="<c:url value='/categories' />" class="hover:text-gray-400 text-white">Categories</a> <!-- New Category Link -->
    </div>
  </nav>

  <%--  <!-- Page Heading -->--%>
  <%--  <% if (header != null) { %>--%>
  <%--  <header class="bg-[#2F4156]">--%>
  <%--    <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">--%>
  <%--      <%= header %>--%>
  <%--    </div>--%>
  <%--  </header>--%>
  <%--  <% } %>--%>

  <%--  <!-- Page Content -->--%>
          <main class="flex items-center justify-center mt-10">


          </main>

          <footer class="py-16 text-center text-sm text-white">
            Webpro IUP 2024
          </footer>
        </div>
      </div>
    </div>
    </body>
  </main>
</div>
</body>
</html>
