<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Ошибка — Новостной портал</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="d-flex flex-column min-vh-100">

  <nav class="navbar navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand fw-bold" href="Controller?command=page_main">Новостной портал</a>
    </div>
  </nav>

  <main class="container text-center my-5">
    <h1 class="display-4 text-danger">Упс! Что-то пошло не так</h1>
    <p class="lead">Произошла непредвиденная ошибка. Попробуйте вернуться на главную страницу.</p>

    <div class="alert alert-secondary mt-4">
      <strong>Код ошибки:</strong> ${pageContext.errorData.statusCode} <br>
      <strong>URI:</strong> ${pageContext.errorData.requestURI}
    </div>

    <a href="Controller?command=page_main" class="btn btn-primary mt-3">На главную</a>
  </main>

  <footer class="bg-dark text-light mt-auto py-3 text-center">
    &copy; 2025 Новостной портал
  </footer>

</body>
</html>