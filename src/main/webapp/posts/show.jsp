<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.tailwindcss.com" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="../input.css" rel="stylesheet">

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
    <nav class="bg-[#1F2833] h-16 flex items-center z-50 bg-opacity-50">
        <div class="container mx-auto flex justify-between items-center">
            <!-- Logo or Brand -->
            <a href="<c:url value='/' />" class="flex items-center">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="h-20" />
            </a>

            <!-- Links (centered) -->
            <div id="menu" class="flex-1 hidden md:flex justify-center space-x-4">
                <a href="../dashboard.jsp" class="hover:text-gray-400 text-white">Home</a>
                <a href="../posts/index.jsp" class="hover:text-gray-400 text-white">Post</a>
                <a href="../reviews/index.jsp" class="hover:text-gray-400 text-white">Reviews</a>
            </div>

            <!-- Logout button (aligned to the right) -->
            <div>
                <form action="${pageContext.request.contextPath}/LogoutServlet" method="GET">
                    <button type="submit" class="text-white hover:text-gray-400 px-4 py-2">
                        Logout
                    </button>
                </form>
            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <main class="flex items-center justify-center mt-10">
        <div class="flex flex-col">
            <h1 class="text-[#66FCF1] text-center text-3xl font-bold font-zen p-5">SUBMIT REVIEW</h1>
            <div class="container bg-[#0B0C10] flex flex-col justify-start p-5 rounded-xl">

                <div class="mb-3">
                    <h1 class="text-white text-2xl font-bold">${movie.title}</h1>
                </div>

                <div class="mb-3">
                    <h1 class="text-white">Description</h1>
                    <div class="bg-white max-w-fit p-1">
                        <p>${movie.description}</p>
                    </div>
                </div>

                <div class="mb-2">
                    <p class="text-white">Release Date: ${movie.release_date}</p>
                </div>

                <div class="text-white">
                    <h2>Reviews</h2>
                    <ul>
                        <c:forEach var="review" items="${movie.reviews}">
                            <li>
                                    ${review.user.name}: ${review.rating} - ${review.review}

                                <!-- Display Comments for each Review -->
                                <div class="mt-2">
                                    <h3 class="text-white">Comments:</h3>
                                    <ul>
                                        <c:forEach var="comment" items="${review.comments}">
                                            <li>
                                                    ${comment.user.name}: ${comment.comment}

                                                <!-- Reply Form -->
                                                <form id="replyForm${comment.id}" action="<c:url value='/comments/store/${review.id}' />" method="POST" class="hidden mt-4">
                                                    <input type="hidden" name="review_id" value="${review.id}">
                                                    <input type="hidden" name="parent_id" value="${comment.id}"> <!-- For replies -->
                                                    <textarea name="comment" class="form-control" required></textarea>
                                                    <button type="submit" class="btn btn-primary bg-slate-500 mt-1 transition-opacity duration-300 hover:opacity-70 p-1 rounded text-white">
                                                        Reply
                                                    </button>
                                                </form>

                                                <!-- Display Replies -->
                                                <c:if test="${not empty comment.replies}">
                                                    <div class="ml-4">
                                                        <c:forEach var="reply" items="${comment.replies}">
                                                            <div>
                                                                    ${reply.user.name}: ${reply.comment}
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <c:if test="${not empty user}">
                    <form action="<c:url value='/reviews/store/${movie.id}' />" method="POST" class="flex flex-col mt-5">
                        <input type="hidden" name="_csrf" value="${csrfToken}" />
                        <label for="rating" class="text-white">Rating</label>
                        <input type="number" name="rating" id="rating" class="form-control" max="5" min="1" required>
                        <label for="review" class="text-white">Review</label>
                        <textarea name="review" id="review" class="form-control" required></textarea>
                        <button type="submit" class="btn btn-primary bg-slate-500 max-w-fit mt-5 transition-opacity duration-300 hover:opacity-70 p-1 rounded text-white">
                            Submit Review
                        </button>
                    </form>
                </c:if>

            </div>
        </div>
    </main>
</div>

<script>
    // Function to preview the selected image
    function previewImage(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        const imagePreview = document.getElementById('image-preview');
        const imagePlaceholder = document.getElementById('image-placeholder');

        reader.onload = function(e) {
            imagePreview.src = e.target.result;
            imagePreview.classList.remove('hidden');
            imagePlaceholder.classList.add('hidden');
        }

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    // Click event to trigger the file input
    document.getElementById('image-frame').addEventListener('click', function() {
        document.getElementById('image').click();
    });
</script>

</body>
</html>
