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
        <div class="container flex flex-col justify-center items-center">
            <div class="text-[#66FCF1] text-2xl font-bold p-5 font-zen">
                <h1>ADD MOVIE</h1>
            </div>

            <div class="bg-[#0B0C10] p-5 rounded-xl">
                <form action="<c:url value='/movies/store' />" method="POST" enctype="multipart/form-data" class="flex flex-col justify-start">
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <!-- CSRF Token (ensure it is included in the form) -->

                    <div class="flex flex-row">
                        <div class="mb-4 flex flex-col text-white p-5">
                            <div id="image-frame" class="aspect-[2/3] w-64 w-32 bg-gray-800 rounded-lg flex items-center justify-center cursor-pointer relative mx-5">
                                <img id="image-preview" src="#" alt="Image Preview" class="hidden absolute inset-0 w-full h-full object-cover rounded-lg" />
                                <span id="image-placeholder" class="text-gray-400 text-center">Click to upload image</span>
                                <input type="file" id="image" name="image" class="hidden" accept="image/*" onchange="previewImage(event)">
                            </div>
                        </div>

                        <div class="flex-1">
                            <div class="mb-4 flex flex-col">
                                <label for="title" class="form-label text-white">Title</label>
                                <input type="text" name="title" id="title" class="form-control">
                            </div>

                            <div class="mb-4 flex flex-col">
                                <label for="description" class="form-label text-white">Description</label>
                                <textarea name="description" id="description" class="form-control"></textarea>
                            </div>

                            <div class="mb-4 flex flex-col">
                                <label for="release_date" class="form-label text-white">Release Date</label>
                                <input type="date" name="release_date" id="release_date" class="form-control">
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary bg-slate-500 max-w-fit mt-5 transition-opacity duration-300 hover:opacity-70 p-1 rounded text-white">
                        Add Movie
                    </button>
                </form>
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
