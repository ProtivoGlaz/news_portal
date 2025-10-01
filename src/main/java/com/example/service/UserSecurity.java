package com.example.service;

import com.example.beans.User;

public interface UserSecurity {

    User signIn(String login, String password) throws ServiceException;
}
