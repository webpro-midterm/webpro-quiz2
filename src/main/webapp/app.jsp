<!-- app.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>App Layout</title>
  <link href="https://cdn.tailwindcss.com" rel="stylesheet">
</head>
<body>
<!-- Include the navbar -->
<jsp:include page="navbar.jsp" />

<!-- Main content area (will be dynamically replaced) -->
<div class="container mx-auto">
  <jsp:invoke name="content"/>
</div>

<!-- Footer -->
<footer class="text-center py-4">
  Webpro IUP 2024
</footer>
</body>
</html>
