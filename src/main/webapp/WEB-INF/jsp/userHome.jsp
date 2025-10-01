<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
  <meta charset="UTF-8">
  <title>Новости — Новостной портал</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .hero {
      background: linear-gradient(135deg, #0d6efd 0%, #6610f2 100%);
      color: #fff;
    }
    .lang-select { min-width: 140px; }
    .news-item img {
      width: 180px;
      height: 110px;
      object-fit: cover;
      border-radius: .5rem;
    }
    .news-item .card { border: none; }
  </style>
</head>
<body class="d-flex flex-column min-vh-100">

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container">
    <a class="navbar-brand fw-bold" href="Controller?command=page_index">Новостной портал</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMain">
      <ul class="navbar-nav me-auto">
        <li class="nav-item"><a class="nav-link" href="Controller?command=page_index">Главная</a></li>
        <li class="nav-item"><a class="nav-link active" href="Controller?command=page_news">Новости</a></li>
      </ul>
      <div class="d-flex align-items-center gap-2">
        <select class="form-select form-select-sm lang-select" onchange="location = this.value;">
          <option value="/Controller/changeLang?lang=ru" selected>Русский</option>
          <option value="/Controller/changeLang?lang=en">English</option>
          <option value="/Controller/changeLang?lang=de">Deutsch</option>
        </select>
        <a class="btn btn-outline-light" href="Controller?command=do_logout">Выйти</a>
      </div>
    </div>
  </div>
</nav>

<!-- Hero -->
<section class="hero py-5">
  <div class="container">
    <div class="row align-items-center gy-4">
      <div class="col-12 col-lg-8">
        <h1 class="display-5 fw-bold mb-3">Новости</h1>
        <p class="lead">Просматривайте ленту, открывайте детали и редактируйте записи. Единый стиль и удобная навигация.</p>
        <div class="d-flex gap-2 mt-3">
          <a class="btn btn-light btn-lg" href="Controller?command=page_index">На главную</a>
          <a class="btn btn-outline-light btn-lg" href="Controller?command=page_news_edit&action=create">Добавить новость</a>
        </div>
      </div>
      <div class="col-12 col-lg-4">
        <div class="card shadow-lg border-0">
          <div class="card-body">
            <h5 class="card-title mb-2">Ваш профиль</h5>
            <p class="text-muted mb-3">
              <strong>Пользователь:</strong> <c:out value="${sessionScope.user.email}" />
            </p>
            <div class="d-flex gap-2">
              <a class="btn btn-primary" href="Controller?command=page_news_edit&action=create">Добавить новость</a>
              <a class="btn btn-outline-primary" href="Controller?command=do_logout">Выйти</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Main content -->
<main class="container my-5">
  <div class="row gy-4">
    <!-- Sidebar -->
    <aside class="col-12 col-lg-3">
      <div class="card shadow-sm">
        <div class="card-body">
          <h5 class="card-title">Навигация</h5>
          <div class="list-group list-group-flush">
            <a href="Controller?command=page_news" class="list-group-item list-group-item-action">Все новости</a>
            <a href="Controller?command=page_news&sort=latest" class="list-group-item list-group-item-action">Последние</a>
            <a href="Controller?command=page_news&sort=popular" class="list-group-item list-group-item-action">Популярные</a>
          </div>
        </div>
      </div>
      <div class="card shadow-sm mt-4">
        <div class="card-body">
          <h5 class="card-title">Выбор языка</h5>
          <select class="form-select" onchange="location = this.value;">
            <option value="/Controller/changeLang?lang=ru" selected>Русский</option>
            <option value="/Controller/changeLang?lang=en">English</option>
            <option value="/Controller/changeLang?lang=de">Deutsch</option>
          </select>
        </div>
      </div>
    </aside>

    <!-- News feed -->
    <section class="col-12 col-lg-9">
      <h2 class="mb-3">Лента новостей</h2>

      <c:forEach var="news" items="${newsList}">
        <div class="card news-item mb-4 shadow-sm">
          <div class="card-body">
            <div class="d-flex gap-3">
              <!-- Картинка новости (заглушка) -->
              <img src="https://via.placeholder.com/400x225" alt="${news.title}">
              <div class="flex-grow-1">
                <h5 class="mb-1"><c:out value="${news.title}" /></h5>
                <p class="text-muted mb-2">Опубликовано: <c:out value="${news.date}" /></p>
                <p class="mb-3"><c:out value="${news.brief}" /></p>
                <div class="d-flex gap-2">
                  <a class="btn btn-sm btn-primary" href="Controller?command=page_news_view&id=${news.id}">Посмотреть всю новость</a>
                  <a class="btn btn-sm btn-outline-secondary" href="Controller?command=page_news_edit&id=${news.id}">Редактировать</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>

      <!-- Пагинация (заглушка) -->
      <nav aria-label="pagination">
        <ul class="pagination justify-content-center">
          <li class="page-item disabled"><a class="page-link" href="Controller?command=page_news&page=1" tabindex="-1">Назад</a></li>
          <li class="page-item"><a class="page-link" href="Controller?command=page_news&page=1">1</a></li>
          <li class="page-item"><a class="page-link" href="Controller?command=page_news&page=2">2</a></li>
          <li class="page-item"><a class="page-link" href="Controller?command=page_news&page=3">3</a></li>
          <li class="page-item"><a class="page-link" href="Controller?command=page_news&page=2">Вперёд</a></li>
        </ul>
      </nav>
    </section>
  </div>
</main>

<!-- Footer -->
<footer class="bg-dark text-light mt-auto">
  <div class="container py-4">
    <div class="row gy-3 align-items-center">
      <div class="col-12 col-md">
        <span>&copy; 2025 Новостной портал</span>
      </div>
      <div class="col-12 col-md text-md-end">
        <a class="text-decoration-none text-light me-3" href="Controller?command=page_index">Главная</a>
        <a class="text-decoration-none text-light me-3" href="Controller?command=page_news">Новости</a>
        <a class="text-decoration-none text-light" href="Controller?command=do_logout">Выйти</a>
      </div>
    </div>
  </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>