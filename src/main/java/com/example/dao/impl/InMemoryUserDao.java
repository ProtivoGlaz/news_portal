package com.example.dao.impl;

import com.example.beans.User;
import com.example.dao.DaoException;
import com.example.dao.UserDao;
import com.example.util.PasswordUtil;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

public class InMemoryUserDao implements UserDao {
    private static final ConcurrentMap<String, User> users = new ConcurrentHashMap<>();
    private static final ConcurrentMap<Integer, User> usersById = new ConcurrentHashMap<>();

    static {
        User admin = new User(1, "admin@example.com", PasswordUtil.hash("admin123"));
        User user = new User(2, "user@example.com", PasswordUtil.hash("user123"));
        users.put(admin.getEmail(), admin);
        users.put(user.getEmail(), user);
        usersById.put(admin.getId(), admin);
        usersById.put(user.getId(), user);
    }

    @Override
    public User checkCredentials(String login, String password) throws DaoException {
        User user = users.get(login);
        if (user != null && PasswordUtil.hash(password).equals(user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean registration(User user) throws DaoException {
        if (users.containsKey(user.getEmail())) {
            throw new DaoException("Пользователь с email=" + user.getEmail() + " уже существует");
        }
        users.put(user.getEmail(), user);
        usersById.put(user.getId(), user);
        return true;
    }

    @Override
    public User findByEmail(String email) throws DaoException {
        return users.get(email);
    }

    @Override
    public void add(User user) throws DaoException {
        if (users.containsKey(user.getEmail())) {
            throw new DaoException("Пользователь с email=" + user.getEmail() + " уже существует");
        }
        users.put(user.getEmail(), user);
        usersById.put(user.getId(), user);
    }

    @Override
    public boolean existsByEmail(String email) throws DaoException {
        return users.containsKey(email);
    }

    @Override
    public void delete(String email) throws DaoException {
        User removed = users.remove(email);
        if (removed == null) {
            throw new DaoException("Пользователь с email=" + email + " не найден для удаления");
        }
        usersById.remove(removed.getId());
    }

    @Override
    public User findById(int id) throws DaoException {
        return usersById.get(id);
    }
}
