package com.example.dao;

import com.example.beans.News;

import java.time.LocalDate;
import java.util.List;

public interface NewsDao {
    List<News> topNews(int count) throws DaoException;
    List<News> findAll() throws DaoException;
    News findById(int id) throws DaoException;
    void add(News news) throws DaoException;
    void update(News updatedNews) throws DaoException;
    void delete(int id) throws DaoException;
    List<News> findByDate(LocalDate date) throws DaoException;
}
