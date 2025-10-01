<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ru">
<head>
<meta charset="UTF-8">
<title>Авторизация — Новостной портал</title>
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
						href="Controller?command=page_index">Главная</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/Controller/news">Новости</a></li>
				</ul>
				<div class="d-flex align-items-center gap-2">
					<a class="btn btn-outline-light" href="/Controller/login">Войти</a>
					<a class="btn btn-warning" href="/Controller/register">Регистрация</a>
					<select class="form-select form-select-sm lang-select"
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
                    <h1 class="display-5 fw-bold mb-3">Вход в аккаунт</h1>
                    <p class="lead">Продолжите работу с вашим профилем и управляйте
                        новостями в едином интерфейсе.</p>
                    <div class="d-flex gap-2 mt-3">
                        <a class="btn btn-light btn-lg"
                            href="Controller?command=page_index">На главную</a>
                        <a class="btn btn-outline-light btn-lg" href="/Controller/register">Регистрация</a>
                    </div>
                </div>
                <div class="col-12 col-lg-5">
                    <div class="card shadow-lg border-0">
                        <div class="card-body">
                            <h5 class="card-title mb-3">Авторизация</h5>

                            <!-- Блок ошибки -->
                            <c:if test="${param.authError eq 'true'}">
                                <div class="alert alert-danger text-center" role="alert">
                                    <!-- ${errorMessage} -->
                                    Логин или пароль введён неверно
                                </div>
                            </c:if>
                            <c:if test="${param.message}">
                                <div class="alert alert-danger text-center" role="alert">
                                    <!-- ${errorMessage} -->
                                    Пожалуйста, авторизуйтесь
                                </div>
                            </c:if>

                            <form action="Controller" method="post" novalidate>
                                <input type="hidden" name="command" value="do_auth" />
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" id="email" name="email" class="form-control"
                                        placeholder="you@example.com" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Пароль</label>
                                    <input type="password" id="password" name="password"
                                        class="form-control" placeholder="••••••••" required>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="Controller?command=page_index"
                                        class="text-decoration-none">На главную</a>
                                    <button type="submit" class="btn btn-primary">Войти</button>
                                </div>
                            </form>
                            <hr class="my-4">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted">Нет аккаунта?</span>
                                <a class="btn btn-outline-primary" href="/Controller/register">Создать аккаунт</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!-- Footer -->
	<footer class="bg-dark text-light mt-auto">
		<div class="container py-4">
			<div class="row gy-3 align-items-center">
				<div class="col-12 col-md">
					<span>&copy; 2025 Новостной портал</span>
				</div>
				<div class="col-12 col-md text-md-end">
					<a class="text-decoration-none text-light me-3"
						href="Controller?command=page_index">Главная</a> <a
						class="text-decoration-none text-light me-3"
						href="/Controller/news">Новости</a> <a
						class="text-decoration-none text-light"
						href="/Controller/register">Регистрация</a>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>