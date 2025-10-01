package com.example.service.impl;

import com.example.beans.News;
import com.example.dao.DaoException;
import com.example.dao.DaoProvider;
import com.example.dao.NewsDao;
import com.example.service.NewsService;
import com.example.service.ServiceException;
import com.example.service.validator.NewsValidator;

import java.util.List;

public class NewsServiceImpl implements NewsService {

    private final NewsDao newsDao = DaoProvider.getInstance().getNewsDao();

    private final int MAX_AVAILABLE_TOP_NEWS = 10;

    @Override
    public List<News> takeTopNews(int count) throws ServiceException {

        if (count <= 0 || count > MAX_AVAILABLE_TOP_NEWS) {
            throw new ServiceException("Некорректное количество новостей");
        }

        try {
            return newsDao.topNews(count);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }

    public void addNews(News news) throws ServiceException {
        if (!NewsValidator.isValid(news)) {
            throw new ServiceException("Некорректные данные новости");
        }
        try {
            newsDao.add(news);
        } catch (DaoException e) {
            throw new ServiceException(e);
        }
    }
}
