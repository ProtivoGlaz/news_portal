package com.example.service.validator;

import com.example.beans.User;

public class UserValidator {
    public static boolean isValidEmail(String email) {
        return email != null && email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }

    public static boolean isValidPassword(String password) {
        return password != null && password.length() >= 6;
    }

    public static boolean isValid(User user) {
        return user != null && isValidEmail(user.getEmail()) && isValidPassword(user.getPassword());
    }
}
