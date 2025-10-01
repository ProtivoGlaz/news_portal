package com.example.dao;

import com.example.beans.User;

public interface UserDao {
    User checkCredentials(String login, String password) throws DaoException;
    boolean registration(User user) throws DaoException;
    User findByEmail(String email) throws DaoException;
    void add(User user) throws DaoException;
    boolean existsByEmail(String email) throws DaoException;
    void delete(String email) throws DaoException;
    User findById(int id) throws DaoException;
}
