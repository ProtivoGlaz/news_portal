package com.example.dao.impl;

import com.example.beans.User;
import com.example.dao.DaoException;
import com.example.dao.UserDao;

public class DBUserDao implements UserDao {
    @Override
    public User checkCredentials(String login, String password) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return null;
    }

    @Override
    public boolean registration(User user) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return false;
    }

    @Override
    public User findByEmail(String email) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return null;
    }

    @Override
    public void add(User user) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return;
    }

    @Override
    public boolean existsByEmail(String email) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return false;
    }

    @Override
    public void delete(String email) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return;
    }

    @Override
    public User findById(int id) throws DaoException {
        //throw new UnsupportedOperationException("Not implemented: use InMemoryUserDao for in-memory data");
        return null;
    }
}
