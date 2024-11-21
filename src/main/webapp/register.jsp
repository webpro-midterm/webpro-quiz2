<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.tailwindcss.com" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="input.css" rel="stylesheet">

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.bunny.net">
  <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
  <link href="https://fonts.cdnfonts.com/css/cosmic" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">

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
    <!-- Register Form -->
    <div class="max-w-md mx-auto mt-6 bg-[#181c24] p-8 rounded-md">
      <h1 class="text-2xl text-[#66FCF1] font-zen mt-10 text-center">REGISTER</h1>

      <!-- Display errors (if any) -->
      <c:if test="${not empty errorMessage}">
        <p style="color:red;" class="text-center">${errorMessage}</p>
      </c:if>

      <form method="POST" action="RegisterServlet" class="mt-6">
        <div>
          <label for="username" class="block text-sm font-medium text-gray-100">Username</label>
          <input id="username" class="block mt-1 w-full bg-[#181c24] text-white border border-gray-600 p-2" type="text" name="username" value="${param.username}" required autofocus autocomplete="username">
          <c:if test="${not empty errors.username}">
            <p class="text-red-500 text-sm">${errors.username}</p>
          </c:if>
        </div>

        <div class="mt-4">
          <label for="email" class="block text-sm font-medium text-gray-100">Email</label>
          <input id="email" class="block mt-1 w-full bg-[#181c24] text-white border border-gray-600 p-2" type="email" name="email" value="${param.email}" required>
          <c:if test="${not empty errors.email}">
            <p class="text-red-500 text-sm">${errors.email}</p>
          </c:if>
        </div>

        <div class="mt-4">
          <label for="password" class="block text-sm font-medium text-gray-100">Password</label>
          <input id="password" class="block mt-1 w-full bg-[#181c24] text-white border border-gray-600 p-2" type="password" name="password" required autocomplete="new-password">
          <c:if test="${not empty errors.password}">
            <p class="text-red-500 text-sm">${errors.password}</p>
          </c:if>
        </div>

        <div class="mt-4">
          <label for="password_confirm" class="block text-sm font-medium text-gray-100">Confirm Password</label>
          <input id="password_confirm" class="block mt-1 w-full bg-[#181c24] text-white border border-gray-600 p-2" type="password" name="password_confirm" required autocomplete="new-password">
          <c:if test="${not empty errors.password_confirm}">
            <p class="text-red-500 text-sm">${errors.password_confirm}</p>
          </c:if>
        </div>

        <div class="flex items-center justify-between mt-6">
          <button type="submit" class="px-6 py-2 bg-indigo-600 text-white rounded-md w-full">Register</button>
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
