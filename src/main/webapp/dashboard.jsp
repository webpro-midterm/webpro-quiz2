<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="app.jsp" %>
<jsp:directive.include file="navbar.jsp"/>

<div class="text-black/50">
  <div class="relative min-h-screen flex flex-col items-center justify-center selection:bg-[#FF2D20] selection:text-white">
    <div class="relative w-full max-w-2xl px-6 lg:max-w-7xl">
      <main class="mt-6 w-full h-auto">
        <!-- Main content here -->
        <section class="relative bg-cover bg-center w-full h-[60vh] text-white"
                 style="background-image: url('${pageContext.request.contextPath}/images/thing.gif');">
          <div class="absolute inset-0 bg-black opacity-50"></div>
          <div class="relative flex items-center justify-center h-full">
            <div class="text-center p-6">
              <img src="${pageContext.request.contextPath}/images/logo.png" alt="Rate-View Logo" class="h-42">
              <p class="text-lg md:text-xl mb-6">Rate Shows That You Have Viewed</p>
              <a href="register.jsp" class="bg-[#2F4156] hover:bg-[#567C8D] text-white font-semibold py-3 px-6 rounded transition">
                Get Started
              </a>
            </div>
          </div>
        </section>

        <div>
          <h1 class="text-center text-3xl p-5 text-[#C5C6C7]">Recommendations</h1>
        </div>

        <div class="mt-4 grid grid-cols-2 sm:grid-cols-4 gap-x-5 gap-y-5">
          <!-- Sample Recommendation Cards -->
          <div class="relative rounded-xl overflow-hidden">
            <img src="${pageContext.request.contextPath}/images/perfectblue.jpg" class="object-cover h-full w-full -z-10" alt="">
            <div class="absolute inset-0 bg-gradient-to-t from-black/50 p-3 flex flex-col justify-end">
              <div class="self-center flex flex-col items-center space-y-2">
                <span class="capitalize text-white font-medium drop-shadow-md">Perfect Blue</span>
                <span class="text-gray-100 text-xs">+12 Movies</span>
              </div>
            </div>
          </div>

          <!-- Add other cards here... -->
        </div>
      </main>

      <footer class="py-16 text-center text-sm text-white">
        Webpro IUP 2024
      </footer>
    </div>
  </div>
</div>
