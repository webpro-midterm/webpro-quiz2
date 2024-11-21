<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.tailwindcss.com" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../input.css" rel="stylesheet">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
    <link href="https://fonts.cdnfonts.com/css/cosmic" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">

    <!-- Custom Styles -->
    <style>
        /* Add custom font styles here */
        body {
            font-family: 'Zen Dots', cursive, sans-serif;
        }

        .font-zen {
            font-family: 'Zen Dots', cursive, sans-serif;
        }

        .font-cosmic {
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

    <!-- Navbar Include -->
    <nav class="bg-[#1F2833] h-16 flex items-center bg-opacity-50">
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
                <a href="../dashboard.jsp" class="hover:text-gray-400 text-white">Home</a>
                <a href="index.jsp" class="hover:text-gray-400 text-white">Post</a>
                <a href="../reviews/index.jsp" class="hover:text-gray-400 text-white">Reviews</a>
            </div>

            <!-- Authentication Links -->
        </div>

        <!-- Mobile Menu (Initially Hidden) -->
        <div id="mobile-menu" class="md:hidden hidden flex-col items-center bg-[#2F4156] space-y-4 p-4">
            <a href="<c:url value='/' />" class="hover:text-gray-400 text-white">Home</a>
            <a href="<c:url value='/movies' />" class="hover:text-gray-400 text-white">Movies</a>
            <a href="<c:url value='/reviews' />" class="hover:text-gray-400 text-white">Reviews</a>
            <a href="<c:url value='/categories' />" class="hover:text-gray-400 text-white">Categories</a> <!-- New Category Link -->
        </div>
    </nav>

    <!-- Page Content -->
    <main class="flex items-center justify-center mt-10">
        <div class="container flex flex-col items-center">
            <div class="bg-[#1F2833] p-5 rounded-2xl flex flex-col items-center">
                <h1 class="text-4xl mb-5 text-[#66FCF1] font-bold font-zen">POST</h1>
                <div class="bg-[#2F4156] text-white rounded px-1 py-1 transition-opacity duration-300 hover:opacity-70 max-w-fit max-h-fit">
                    <a href="create.jsp" class="btn btn-primary mb-4">Add New Movie</a>
                </div>
            </div>

            <div class="flex items-center">
                <div class="mt-5 grid grid-cols-2 sm:grid-cols-4 gap-x-5 gap-y-5 p-5">
                    <c:forEach var="movie" items="${movies}">
                        <div class="relative rounded-xl overflow-hidden">
                            <c:if test="${not empty movie.image}">
                                <img src="<c:url value='/storage/${movie.image}' />" class="object-cover h-full w-full -z-10" alt="${movie.title}">
                            </c:if>
                            <div class="absolute top-0 h-full w-full bg-gradient-to-t from-black/50 p-3 flex flex-col justify-between">
                                <div class="flex justify-between">
                                    <div>
                                        <!-- Optional: You can place the movie title here -->
                                    </div>
                                    <div class="flex gap-2">
                                        <a href="<c:url value='/movies/edit/${movie.id}' />" class="p-2.5 bg-gray-800/80 rounded-lg text-white hover:bg-red-600/80">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                                <path d="M10.586 9.586l5.828-5.828a2 2 0 112.828 2.828l-5.828 5.828H14a2 2 0 01-2 2v1.414l-4-4V10a2 2 0 012-2h1.414z" />
                                                <path fill-rule="evenodd" d="M5 3a1 1 0 000 2h2a1 1 0 100-2H5zm0 4a1 1 0 000 2h5a1 1 0 100-2H5zm0 4a1 1 0 000 2h5a1 1 0 100-2H5zm-2 4a1 1 0 100 2h7a1 1 0 100-2H3z" clip-rule="evenodd" />
                                            </svg>
                                        </a>
                                        <a href="<c:url value='/movies/show/${movie.id}' />" class="p-2.5 bg-gray-800/80 rounded-lg text-white hover:bg-red-600/80">
                                            <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd" />
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                                <div class="self-center flex flex-col items-center space-y-2">
                                    <span class="capitalize text-lg font-semibold">${movie.title}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </main>
</div>

<!-- Footer -->
<%--  <%@ include file="layouts/footer.jsp" %>--%>
</body>
</html>
