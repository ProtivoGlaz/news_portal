package com.example.service.impl;

import com.example.beans.User;
import com.example.service.ServiceException;
import com.example.service.UserSecurity;
import com.example.service.validator.UserValidator;

public class NewsPortalUserSecurity implements UserSecurity {

    @Override
    public User signIn(String login, String password) throws ServiceException {
        if (!UserValidator.isValidEmail(login) || !UserValidator.isValidPassword(password)) {
            throw new ServiceException("Некорректные email или пароль");
        }
        // Здесь должна быть логика поиска пользователя через DAO
        // Пока что возвращаем null или выбрасываем исключение для заглушки
        return null;
    }

}
