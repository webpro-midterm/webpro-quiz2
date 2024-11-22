<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Zen Dots', cursive, sans-serif;
        }
        .font-zen {
            font-family: 'Zen Dots', cursive, sans-serif;
        }
    </style>
</head>

<body class="bg-[#1F2833] text-white font-sans antialiased min-h-screen flex flex-col">
<!-- Navbar -->
<nav class="bg-[#1F2833] h-16 flex items-center shadow-md">
    <div class="container mx-auto flex justify-between items-center px-4">
        <!-- Logo -->
        <a href="<c:url value='/' />" class="flex items-center">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo" class="h-12">
        </a>

        <!-- Navigation Links -->
        <div id="menu" class="hidden md:flex space-x-6">
            <a href="../dashboard.jsp" class="hover:text-[#66FCF1]">Home</a>
            <a href="../posts/index.jsp" class="hover:text-[#66FCF1]">Post</a>
            <a href="../reviews/index.jsp" class="hover:text-[#66FCF1]">Reviews</a>
        </div>

        <!-- Logout -->
        <form action="${pageContext.request.contextPath}/LogoutServlet" method="GET">
            <button type="submit" class="px-4 py-2 bg-[#45A29E] hover:bg-opacity-75 rounded transition">
                Logout
            </button>
        </form>
    </div>
</nav>

<!-- Main Content -->
<main class="flex-grow flex items-center justify-center">
    <div class="container mx-auto px-4">
        <h1 class="text-3xl font-zen text-center mb-6">Add Movie</h1>

        <div class="bg-[#0B0C10] p-6 rounded-lg shadow-lg">
            <form action="<c:url value='/posts/create' />" method="POST" enctype="multipart/form-data" class="space-y-6">
                <input type="hidden" name="_csrf" value="${_csrf.token}">

                <!-- Image Upload -->
                <div class="flex justify-center">
                    <div id="image-frame" class="w-40 h-60 bg-gray-800 rounded-lg flex items-center justify-center cursor-pointer relative">
                        <img id="image-preview" src="#" alt="Image Preview" class="hidden absolute inset-0 w-full h-full object-cover rounded-lg">
                        <span id="image-placeholder" class="text-gray-400">Click to upload</span>
                        <input type="file" id="image" name="image" class="hidden" accept="image/*" onchange="previewImage(event)">
                    </div>
                </div>

                <!-- Title -->
                <div>
                    <label for="title" class="block mb-1">Title</label>
                    <input type="text" id="title" name="title" class="w-full p-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-[#66FCF1]" required>
                </div>

                <!-- Description -->
                <div>
                    <label for="description" class="block mb-1">Description</label>
                    <textarea id="description" name="description" class="w-full p-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-[#66FCF1]" required></textarea>
                </div>

                <!-- Release Date -->
                <div>
                    <label for="release_date" class="block mb-1">Release Date</label>
                    <input type="date" id="release_date" name="release_date" class="w-full p-2 rounded bg-gray-700 text-white focus:outline-none focus:ring focus:ring-[#66FCF1]" required>
                </div>

                <!-- Submit Button -->
                <div class="text-center">
                    <button type="submit" class="px-6 py-2 bg-[#45A29E] hover:bg-opacity-75 rounded transition">
                        Add Movie
                    </button>
                </div>
            </form>
        </div>
    </div>
</main>

<script>
    // Preview selected image
    function previewImage(event) {
        const file = event.target.files[0];
        const reader = new FileReader();
        const imagePreview = document.getElementById('image-preview');
        const imagePlaceholder = document.getElementById('image-placeholder');

        reader.onload = function(e) {
            imagePreview.src = e.target.result;
            imagePreview.classList.remove('hidden');
            imagePlaceholder.classList.add('hidden');
        };

        if (file) {
            reader.readAsDataURL(file);
        }
    }

    // Trigger file input on click
    document.getElementById('image-frame').addEventListener('click', () => {
        document.getElementById('image').click();
    });
</script>
</body>
</html>
