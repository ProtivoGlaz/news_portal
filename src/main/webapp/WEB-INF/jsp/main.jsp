<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Новостной портал — Главная</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap 5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.hero {
	background: linear-gradient(135deg, #0d6efd 0%, #6610f2 100%);
	color: #fff;
}

.news-item img {
	width: 180px;
	height: 110px;
	object-fit: cover;
	border-radius: .5rem;
}

.news-item .card {
	border: none;
}

.lang-select {
	min-width: 140px;
}
</style>
</head>
<body class="d-flex flex-column min-vh-100">

	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand fw-bold" href="/Controller/home">Новостной
				портал</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMain">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navMain">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link"
						href="/Controller/home">Главная</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Controller/news">Новости</a></li>
				</ul>
				<div class="d-flex align-items-center gap-2">
					<a class="btn btn-outline-light"
						href="Controller?command=page_auth">Войти</a> <a
						class="btn btn-warning"
						href="Controller?command=page_registration">Регистрация</a> <select
						class="form-select form-select-sm lang-select"
						onchange="location = this.value;">
						<option value="/Controller/changeLang?lang=ru" selected>Русский</option>
						<option value="/Controller/changeLang?lang=en">English</option>
						<option value="/Controller/changeLang?lang=de">Deutsch</option>
					</select>
				</div>
			</div>
		</div>
	</nav>

	<!-- Hero -->
	<section class="hero py-5">
		<div class="container">
			<div class="row align-items-center gy-4">
				<div class="col-12 col-lg-7">
					<h1 class="display-5 fw-bold mb-3">Актуальные новости в одном
						месте</h1>
					<p class="lead">Следите за событиями, просматривайте детали и
						делитесь мнениями. Удобная навигация и единый стиль.</p>
					<div class="d-flex gap-2 mt-3">
						<a class="btn btn-light btn-lg" href="/Controller/news">Перейти
							к новостям</a> <a class="btn btn-outline-light btn-lg"
							href="Controller?command=page_registration">Создать аккаунт</a>
					</div>
				</div>
				<div class="col-12 col-lg-5">
					<div class="card shadow-lg border-0">
						<div class="card-body">
							<h5 class="card-title">Быстрый вход</h5>
							<p class="card-text">Продолжите работу с вашего аккаунта или
								зарегистрируйтесь за минуту.</p>
							<div class="d-flex gap-2">
								<a class="btn btn-primary" href="Controller?command=page_auth">Войти</a>
								<a class="btn btn-outline-primary"
									href="Controller?command=page_registration">Регистрация</a>
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
							<a href="/Controller/news"
								class="list-group-item list-group-item-action">Все новости</a> <a
								href="/Controller/news?sort=latest"
								class="list-group-item list-group-item-action">Последние</a> <a
								href="/Controller/news?sort=popular"
								class="list-group-item list-group-item-action">Популярные</a>
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

				<!-- News item -->
				<c:forEach var="news" items="${requestScope.topNews}">
					<div class="card news-item mb-4 shadow-sm">
						<div class="card-body">
							<div class="d-flex gap-3">
								<img src="https://via.placeholder.com/400x225" alt="Новость 1">
								<div class="flex-grow-1">
									<h5 class="mb-1">${news.title}</h5>
									<p class="text-muted mb-2">Опубликовано: сегодня •
										Категория: Общество</p>
									<p class="mb-3">${news.brief}</p>
									<a class="btn btn-sm btn-primary"
										href="/Controller/viewNews?id=1">Посмотреть всю новость</a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

				<!-- <div class="card news-item mb-4 shadow-sm">
					<div class="card-body">
						<div class="d-flex gap-3">
							<img src="https://via.placeholder.com/400x225" alt="Новость 2">
							<div class="flex-grow-1">
								<h5 class="mb-1">Вторая новость</h5>
								<p class="text-muted mb-2">Опубликовано: вчера • Категория:
									Экономика</p>
								<p class="mb-3">Краткое описание второй новости. Заглушка из
									репозитория.</p>
								<a class="btn btn-sm btn-primary"
									href="/Controller/viewNews?id=2">Посмотреть всю новость</a>
							</div>
						</div>
					</div>
				</div> -->

				<!-- <div class="card news-item mb-4 shadow-sm">
					<div class="card-body">
						<div class="d-flex gap-3">
							<img src="https://via.placeholder.com/400x225" alt="Новость 3">
							<div class="flex-grow-1">
								<h5 class="mb-1">Третья новость</h5>
								<p class="text-muted mb-2">Опубликовано: 2 дня назад •
									Категория: Технологии</p>
								<p class="mb-3">Краткое описание третьей новости. Заглушка
									из репозитория.</p>
								<a class="btn btn-sm btn-primary"
									href="/Controller/viewNews?id=3">Посмотреть всю новость</a>
							</div>
						</div>
					</div>
				</div> -->

				<!-- Пагинация -->
				<nav aria-label="pagination">
					<ul class="pagination justify-content-center">
						<li class="page-item disabled"><a class="page-link"
							href="/Controller/news?page=1" tabindex="-1">Назад</a></li>
						<li class="page-item"><a class="page-link"
							href="/Controller/news?page=1">1</a></li>
						<li class="page-item"><a class="page-link"
							href="/Controller/news?page=2">2</a></li>
						<li class="page-item"><a class="page-link"
							href="/Controller/news?page=3">3</a></li>
						<li class="page-item"><a class="page-link"
							href="/Controller/news?page=2">Вперёд</a></li>
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
					<a class="text-decoration-none text-light me-3"
						href="/Controller/home">Главная</a> <a
						class="text-decoration-none text-light me-3"
						href="/Controller/news">Новости</a> <a
						class="text-decoration-none text-light"
						href="Controller?command=page_auth">Войти</a>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
