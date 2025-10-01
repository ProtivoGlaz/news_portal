package com.example.web.impl;

import com.example.beans.News;
import com.example.service.NewsService;
import com.example.service.ServiceException;
import com.example.service.ServiceProvider;
import com.example.web.Command;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class PageMain implements Command {

    private final NewsService newsService = ServiceProvider.getInstance().getNewsService();

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<News> news;
        try {
            news = newsService.takeTopNews(3);
            request.setAttribute("topNews", news);

            RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/jsp/main.jsp");
            dispatcher.forward(request, response);
        } catch (ServiceException e) {
            // здесь был код, но его украл кот
            e.printStackTrace();

        }
    }

}
