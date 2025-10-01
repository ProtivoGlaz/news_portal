package com.example.dao.impl;

import com.example.beans.News;
import com.example.dao.DaoException;
import com.example.dao.NewsDao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.stream.Collectors;

public class InMemoryNewsDao implements NewsDao {
    private static final ConcurrentMap<Integer, News> newsMap = new ConcurrentHashMap<>();

    static {
        newsMap.put(1, new News(1, "Первая новость", LocalDate.now(), "Краткое описание 1", "Полный текст новости 1"));
        newsMap.put(2, new News(2, "Вторая новость", LocalDate.now().minusDays(1), "Краткое описание 2", "Полный текст новости 2"));
        newsMap.put(3, new News(3, "Третья новость", LocalDate.now().minusDays(2), "Краткое описание 3", "Полный текст новости 3"));
        newsMap.put(4, new News(4, "Четвёртая новость", LocalDate.now().minusDays(3), "Краткое описание 4", "Полный текст новости 4"));
        newsMap.put(5, new News(5, "Пятая новость", LocalDate.now().minusDays(4), "Краткое описание 5", "Полный текст новости 5"));
        newsMap.put(6, new News(6, "Шестая новость", LocalDate.now().minusDays(5), "Краткое описание 6", "Полный текст новости 6"));
    }

    @Override
    public List<News> topNews(int count) throws DaoException {
        return newsMap.values().stream()
                .sorted((n1, n2) -> n2.getDate().compareTo(n1.getDate()))
                .limit(count)
                .collect(Collectors.toList());
    }

    @Override
    public List<News> findAll() throws DaoException {
        return new ArrayList<>(newsMap.values());
    }

    @Override
    public News findById(int id) throws DaoException {
        return newsMap.get(id);
    }

    @Override
    public void add(News news) throws DaoException {
        if (newsMap.containsKey(news.getId())) {
            throw new DaoException("Новость с id=" + news.getId() + " уже существует");
        }
        newsMap.put(news.getId(), news);
    }

    @Override
    public void update(News updatedNews) throws DaoException {
        if (!newsMap.containsKey(updatedNews.getId())) {
            throw new DaoException("Новость с id=" + updatedNews.getId() + " не найдена для обновления");
        }
        newsMap.put(updatedNews.getId(), updatedNews);
    }

    @Override
    public void delete(int id) throws DaoException {
        if (newsMap.remove(id) == null) {
            throw new DaoException("Новость с id=" + id + " не найдена для удаления");
        }
    }

    @Override
    public List<News> findByDate(LocalDate date) throws DaoException {
        return newsMap.values().stream()
                .filter(news -> news.getDate().equals(date))
                .collect(Collectors.toList());
    }
}
