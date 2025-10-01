package com.example.service.validator;

import com.example.beans.News;

public class NewsValidator {
    private static final int TITLE_MIN = 3;
    private static final int TITLE_MAX = 200;
    private static final int BRIEF_MIN = 5;
    private static final int BRIEF_MAX = 500;
    private static final int CONTENT_MIN = 10;
    private static final int CONTENT_MAX = 5000;

    public static boolean isValidTitle(String title) {
        return title != null && !title.trim().isEmpty() &&
                title.trim().length() >= TITLE_MIN && title.trim().length() <= TITLE_MAX;
    }

    public static boolean isValidBrief(String brief) {
        return brief != null && !brief.trim().isEmpty() &&
                brief.trim().length() >= BRIEF_MIN && brief.trim().length() <= BRIEF_MAX;
    }

    public static boolean isValidContent(String content) {
        return content != null && !content.trim().isEmpty() &&
                content.trim().length() >= CONTENT_MIN && content.trim().length() <= CONTENT_MAX;
    }

    public static boolean isValid(News news) {
        return news != null &&
                isValidTitle(news.getTitle()) &&
                isValidBrief(news.getBrief()) &&
                isValidContent(news.getContent());
    }
}
