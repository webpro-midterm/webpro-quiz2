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
  <link href="../input.css" rel="stylesheet">

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.bunny.net">
  <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
  <link href="https://fonts.cdnfonts.com/css/cosmic" rel="stylesheet">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Zen+Dots&display=swap" rel="stylesheet">

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

  <!-- Navbar -->
  <nav class="bg-[#1F2833] h-16 flex items-center bg-opacity-50">
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
        <a href="index.jsp" class="hover:text-gray-400 text-white">Reviews</a>
      </div>
    </div>
    <!-- Mobile Menu -->
<%--    <div id="mobile-menu" class="md:hidden hidden flex-col items-center bg-[#2F4156] space-y-4 p-4">--%>
<%--      <a href="<c:url value='/' />" class="hover:text-gray-400 text-white">Home</a>--%>
<%--      <a href="<c:url value='/movies' />" class="hover:text-gray-400 text-white">Movies</a>--%>
<%--      <a href="<c:url value='/reviews' />" class="hover:text-gray-400 text-white">Reviews</a>--%>
<%--      <a href="<c:url value='/categories' />" class="hover:text-gray-400 text-white">Categories</a>--%>
<%--    </div>--%>
  </nav>

  <!-- Page Content -->
  <main class="flex items-center justify-center mt-10">
    <div class="container flex flex-col justify-center min-h-screen">
      <div class="text-center text-4xl text-[#66FCF1] font-zen mb-5">
        <h3 class="mt-5">MOVIE REVIEW</h3>
      </div>
      <div class="bg-[#0B0C10] p-4 rounded-xl text-white flex flex-col relative">
        <h4 class="text-xl font-bold">${review.movie.title}</h4>

        <!-- Bookmark Button -->
        <form action="<c:url value='/bookmarks/store/${review.id}' />" method="POST" class="absolute top-4 right-4">
          <input type="hidden" name="_csrf" value="${sessionScope.csrfToken}" />
          <button type="submit" class="text-[#66FCF1] bg-[#1B263B] rounded-md px-3 py-1 hover:bg-[#57B7C6] focus:outline-none">
            Bookmark
          </button>
        </form>

        <div class="flex flex-row gap-4">
          <img src="<c:choose><c:when test="${not empty review.movie.image}">${pageContext.request.contextPath}/storage/${review.movie.image}</c:when><c:otherwise>https://via.placeholder.com/400x500</c:otherwise></c:choose>"
               alt="${review.movie.title} Image" class="mb-2 max-w-full max-h-72" style="max-width: 500px; max-height: 300px;">
          <div class="flex flex-col gap-5">
            <p><strong>Description:</strong></p>
            <p>${review.movie.description}</p>
            <p><strong>Release Date:</strong> <fmt:formatDate value="${review.movie.releaseDate}" pattern="dd MMM yyyy" /></p>
          </div>
        </div>

        <div class="max-w-auto mt-10">
          <div class="flex justify-between items-center mb-6">
            <h2 class="text-lg lg:text-2xl font-bold text-gray-900 dark:text-white">Discussion (${review.comments.size()})</h2>
          </div>
          <form action="<c:url value='/comments/store/${review.id}' />" method="POST" class="mb-6">
            <input type="hidden" name="_csrf" value="${sessionScope.csrfToken}" />
            <div class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
              <label for="comment" class="sr-only">Your comment</label>
              <textarea id="comment" name="comment" rows="6"
                        class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                        placeholder="Write a comment..." required></textarea>
            </div>
            <button type="submit"
                    class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white dark:placeholder-gray-400 dark:bg-gray-800 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-[#57B7C6]">
              Post comment
            </button>
          </form>

          <c:forEach var="comment" items="${review.comments}">
            <c:if test="${comment.parentId == null}">
              <article class="p-6 mb-3 text-base bg-white rounded-lg dark:bg-gray-900">
                <footer class="flex justify-between items-center mb-2">
                  <div class="flex items-center">
                    <p class="inline-flex items-center mr-3 text-sm text-gray-900 dark:text-white font-semibold">
                        ${comment.user.name}
                    </p>
                    <p class="text-sm text-gray-600 dark:text-gray-400">
                      <fmt:formatDate value="${comment.createdAt}" pattern="dd MMM yyyy" />
                    </p>
                  </div>
                  <form action="<c:url value='/comments/destroy/${review.id}/${comment.id}' />" method="POST" class="inline-flex">
                    <input type="hidden" name="_csrf" value="${sessionScope.csrfToken}" />
                    <button type="submit" onclick="return confirm('Are you sure you want to delete this comment?');" class="text-red-600 hover:text-red-800 text-sm">
                      Delete
                    </button>
                  </form>
                </footer>
                <p class="text-gray-500 dark:text-gray-400">${comment.content}</p>
                <div class="flex items-center mt-4 space-x-4">
                  <button type="button" class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium" onclick="toggleReplyForm('replyForm${comment.id}')">
                    <svg class="mr-1.5 w-3.5 h-3.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 18">
                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 5h5M5 8h2m6-3h2m-5 3h6m2-7H2a1 1 0 0 0-1 1v9a1 1 0 0 0 1 1h3v5l5-5h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1Z"/>
                    </svg>
                    Reply
                  </button>
                </div>

                <div class="flex items-center mt-4 space-x-4">
                  <form action="<c:url value='/comments/like/${comment.id}' />" method="POST">
                    <input type="hidden" name="_csrf" value="${sessionScope.csrfToken}" />
                    <button type="submit" class="flex items-center text-sm text-gray-500 hover:underline dark:text-gray-400 font-medium">
                      <span>👍</span> Like (${comment.likesCount})
                    </button>
                  </form>
                </div>

                <form id="replyForm${comment.id}" action="<c:url value='/comments/reply/${review.id}/${comment.id}' />" method="POST" class="hidden mt-4">
                  <input type="hidden" name="_csrf" value="${sessionScope.csrfToken}" />
                  <div class="py-2 px-4 mb-4 bg-white rounded-lg rounded-t-lg border border-gray-200 dark:bg-gray-800 dark:border-gray-700">
                    <label for="reply" class="sr-only">Your reply</label>
                    <textarea id="reply" name="reply" rows="3"
                              class="px-0 w-full text-sm text-gray-900 border-0 focus:ring-0 focus:outline-none dark:text-white dark:placeholder-gray-400 dark:bg-gray-800"
                              placeholder="Write a reply..." required></textarea>
                  </div>
                  <button type="submit"
                          class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white dark:placeholder-gray-400 dark:bg-gray-800 rounded-lg focus:ring-4 focus:ring-primary-200 dark:focus:ring-primary-900 hover:bg-[#57B7C6]">
                    Post reply
                  </button>
                </form>

                <c:forEach var="reply" items="${comment.replies}">
                  <div class="ml-4 mt-3 p-4 bg-gray-100 rounded-lg dark:bg-gray-800">
                    <p class="font-semibold text-sm">${reply.user.name}</p>
                    <p class="text-gray-700 dark:text-gray-300">${reply.content}</p>
                    <p class="text-xs text-gray-500 dark:text-gray-400">
                      <fmt:formatDate value="${reply.createdAt}" pattern="dd MMM yyyy" />
                    </p>
                    <form action="<c:url value='/comments/destroy/${review.id}/${comment.id}' />" method="POST" class="inline-flex">
                      <input type="hidden" name="_csrf" value="${sessionScope.csrfToken}" />
                      <button type="submit" onclick="return confirm('Are you sure you want to delete this comment?');" class="text-red-600 hover:text-red-800 text-sm">
                        Delete
                      </button>
                    </form>
                  </div>
                </c:forEach>
              </article>
            </c:if>
          </c:forEach>

        </div>
      </div>
    </div>
  </main>
</div>
</body>
</html>


<script>
  function toggleReplyForm(formId) {
    const form = document.getElementById(formId);
    form.classList.toggle('hidden');
  }
</script>
