package com.example.service;

import com.example.beans.News;

import java.util.List;

public interface NewsService {

    List<News> takeTopNews(int count) throws ServiceException;
}
