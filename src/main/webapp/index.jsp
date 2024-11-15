<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="<%= request.getLocale().toString().replace('_', '-') %>">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Questrial&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Teko:wght@300..700&display=swap" rel="stylesheet">
    <link href="https://fonts.cdnfonts.com/css/cosmic" rel="stylesheet">
    <title>JSP Page</title>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        poppins: ['Poppins', 'sans-serif'],
                        questrial: ['Questrial', 'sans-serif'],
                        teko: ['Teko', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: 'Poppins'; font-size: 22px;
        }
    </style>
</head>
<body class="font-poppins antialiased bg-[#0B0C10] text-black/50">
<div class="relative w-full flex flex-col items-center justify-center min-h-screen mx-auto">
    <header class="w-full py-5">
        <nav class="flex items-center justify-between w-full px-4 sm:px-6">
            <!-- Left side (Logo or Title) -->
            <div class="text-2xl sm:text-3xl md:text-6xl font-semibold px-4 sm:px-24">
                <img src="${pageContext.request.contextPath}/images/logo.png" alt="Rate-View Logo" class="h-28 mx-auto mb-4">
            </div>
            <!-- Right side (Links) -->
            <div class="px-4 sm:px-24 space-x-1 flex items-center">
                <a href="dashboard.jsp" class="text-[#66FCF1] px-3 py-2 hover:text-white/70 md:text-2xl text-sm">
                    Dashboard
                </a>
            </div>
        </nav>
    </header>
    <main class="pt-16 flex-grow w-full h-auto">
        <section class="rounded-xl relative bg-cover bg-center w-full h-screen text-white bg-[url('./images/wallpaper.gif')] max-w-[85%] mx-auto">
            <div class="absolute inset-0 bg-black opacity-50 rounded-lg"></div>
            <div class="relative flex items-center justify-center h-full">
                <div class="text-center p-4 sm:p-6">
                    <img src="${pageContext.request.contextPath}/images/logo.png" alt="Rate-View Logo" class="h-72 mx-auto mb-4">
                    <p class="text-base sm:text-lg md:text-xl mb-6">Rate Shows That You Have Viewed</p>
                    <a href="#" class="mb-4 relative sm:w-auto w-full hover:-rotate-3 transition-all ease-out duration-300 inline-flex items-center justify-center px-6 py-3 text-lg font-bold text-white duration-100 bg-[#100E34] hover:bg-[#4F48EC] hover:scale-[1.01] rounded-xl focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-rose-500">
                        Get Started
                    </a>
                </div>
            </div>
        </section>
    </main>
    <footer class="py-16 text-center text-sm text-white">
        Webpro IUP 2024
    </footer>
</div>
</body>
</html>
