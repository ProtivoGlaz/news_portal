package com.example.service;

import com.example.service.impl.NewsPortalUserSecurity;
import com.example.service.impl.NewsServiceImpl;

public class ServiceProvider {
    private static final ServiceProvider instance = new ServiceProvider();

    private final UserSecurity security = new NewsPortalUserSecurity();
    private final NewsService newsService = new NewsServiceImpl();

    private ServiceProvider() {

    }

    public UserSecurity getUserSecurity() {
        return security;
    }

    public NewsService getNewsService() {
        return newsService;
    }

    public static ServiceProvider getInstance() {
        return instance;
    }
}
