<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
        @import url('https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap');
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

    <!-- Navbar -->
    <nav class="bg-[#1F2833] h-16 flex items-center">
        <div class="container mx-auto flex justify-between items-center">
            <!-- Logo or Brand -->
            <a href="<c:url value='/' />" class="flex items-center">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="h-20" />
            </a>

            <!-- Hamburger Menu for Mobile -->
            <div class="block md:hidden">
                <button id="menu-btn" class="text-white focus:outline-none">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7"></path>
                    </svg>
                </button>
            </div>

            <!-- Links -->
            <div id="menu" class="hidden md:flex space-x-4">
                <a href="dashboard.jsp" class="hover:text-gray-400 text-white">Home</a>
                <a href="posts/index.jsp" class="hover:text-gray-400 text-white">Post</a>
                <a href="<c:url value='/reviews' />" class="hover:text-gray-400 text-white">Reviews</a>
            </div>
        </div>
        <!-- Mobile Menu -->
<%--        <div id="mobile-menu" class="md:hidden hidden flex-col items-center bg-[#2F4156] space-y-4 p-4">--%>
<%--            <a href="<c:url value='/' />" class="hover:text-gray-400 text-white">Home</a>--%>
<%--            <a href="<c:url value='/movies' />" class="hover:text-gray-400 text-white">Movies</a>--%>
<%--            <a href="<c:url value='/reviews' />" class="hover:text-gray-400 text-white">Reviews</a>--%>
<%--            <a href="<c:url value='/categories' />" class="hover:text-gray-400 text-white">Categories</a>--%>
<%--        </div>--%>
    </nav>

    <!-- Page Content -->
    <main class="flex items-center justify-center mt-10">
        <div class="container mx-auto">
            <div class="text-4xl mb-4 text-center text-[#66FCF1] font-bold p-5 font-zen">
                <h1>REVIEWS</h1>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 mx-5">
                <!-- Check if reviews are empty -->
                <c:if test="${empty reviews}">
                    <p class="text-white text-center col-span-full">No reviews available.</p>
                </c:if>

                <!-- Iterate over reviews -->
                <c:forEach var="review" items="${reviews}">
                    <div class="m-2">
                        <div class="rounded-lg bg-[#2F4156] shadow-lg w-80 h-auto">
                            <!-- Check if movie has an image -->
                            <c:choose>
                                <c:when test="${not empty review.movie.image}">
                                    <img src="${pageContext.request.contextPath}/storage/${review.movie.image}"
                                         alt="${review.movie.title} Image"
                                         class="rounded-t-lg object-cover h-96 w-full">
                                </c:when>
                                <c:otherwise>
                                    <img src="https://via.placeholder.com/400x500"
                                         alt="No Image"
                                         class="rounded-t-lg object-cover h-64 w-full">
                                </c:otherwise>
                            </c:choose>

                            <div class="p-4 text-white">
                                <h2 class="mb-2 text-lg font-semibold">${review.movie.title}</h2>
                                <p class="mb-2 text-sm">Release Date: <fmt:formatDate value="${review.movie.releaseDate}" pattern="yyyy-MM-dd" /></p>
                                <p class="mb-4 text-sm">${fn:escapeXml(fn:substring(review.review, 0, 100))}</p>
                                <p class="mb-4 text-sm">Rating: ${review.rating}/5</p>
                                <a href="<c:url value='/reviews/show/${review.id}' />"
                                   class="block rounded-lg bg-blue-500 px-4 py-2 text-center font-semibold text-white hover:bg-blue-600">
                                    Read More
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </main>
</div>
</body>
</html>
