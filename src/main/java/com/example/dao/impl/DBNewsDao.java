package com.example.dao.impl;

import com.example.beans.News;
import com.example.dao.DaoException;
import com.example.dao.NewsDao;

import java.time.LocalDate;
import java.util.List;

public class DBNewsDao implements NewsDao {
    @Override
    public List<News> topNews(int count) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return null;
    }

    @Override
    public List<News> findAll() throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return null;
    }

    @Override
    public News findById(int id) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return null;
    }

    @Override
    public void add(News news) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return;
    }

    @Override
    public void update(News updatedNews) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return;
    }

    @Override
    public void delete(int id) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return;
    }

    @Override
    public List<News> findByDate(LocalDate date) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryNewsDao for in-memory data");
        return null;
    }
}
