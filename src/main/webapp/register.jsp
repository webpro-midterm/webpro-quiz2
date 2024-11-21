<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f5f5f5;
      padding: 50px;
    }
    .container {
      width: 400px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    h1 {
      text-align: center;
      color: #66FCF1;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .form-group label {
      font-size: 14px;
      color: #333;
    }
    .form-group input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    .form-group input:focus {
      border-color: #66FCF1;
      outline: none;
    }
    .form-group .error {
      color: red;
      font-size: 12px;
    }
    .form-group .success {
      color: green;
      font-size: 12px;
    }
    .form-group button {
      width: 100%;
      padding: 12px;
      font-size: 16px;
      background-color: #66FCF1;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .form-group button:hover {
      background-color: #45a0b3;
    }
    .login-link {
      text-align: center;
      margin-top: 20px;
    }
    .login-link a {
      color: #333;
      text-decoration: none;
    }
    .login-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Register</h1>

  <!-- Registration form -->
  <form method="POST" action="RegisterServlet">
    <!-- Username -->
    <div class="form-group">
      <label for="username">Username</label>
      <input type="text" id="username" name="username" value="${param.username != null ? param.username : ''}" required />
      <c:if test="${not empty requestScope.usernameError}">
        <span class="error">${requestScope.usernameError}</span>
      </c:if>
    </div>

    <!-- Email -->
    <div class="form-group">
      <label for="email">Email</label>
      <input type="email" id="email" name="email" value="${param.email != null ? param.email : ''}" required />
      <c:if test="${not empty requestScope.emailError}">
        <span class="error">${requestScope.emailError}</span>
      </c:if>
    </div>

    <!-- Password -->
    <div class="form-group">
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required />
      <c:if test="${not empty requestScope.passwordError}">
        <span class="error">${requestScope.passwordError}</span>
      </c:if>
    </div>

    <!-- Confirm Password -->
    <div class="form-group">
      <label for="password_confirmation">Confirm Password</label>
      <input type="password" id="password_confirmation" name="password_confirmation" required />
    </div>

    <!-- Submit Button -->
    <div class="form-group">
      <button type="submit">Register</button>
    </div>
  </form>

  <div class="login-link">
    <p>Already have an account? <a href="login.jsp">Login here</a></p>
  </div>
</div>

</body>
</html>
