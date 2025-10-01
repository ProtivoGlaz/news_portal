package com.example.beans;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class News implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id;
    private String title;
    private LocalDate date;
    private String brief;
    private String content;

    public News() {

    }

    public News(int id, String title, LocalDate date, String brief, String content) {
        super();
        this.id = id;
        this.title = title;
        this.date = date;
        this.brief = brief;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public int hashCode() {
        return Objects.hash(brief, content, date, id, title);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null || getClass() != obj.getClass())
            return false;
        News other = (News) obj;
        return id == other.id &&
                Objects.equals(title, other.title) &&
                Objects.equals(date, other.date) &&
                Objects.equals(brief, other.brief) &&
                Objects.equals(content, other.content);
    }

    @Override
    public String toString() {
        return "News [id=" + id + ", title=" + title + ", date=" + date +
                ", brief=" + brief + ", content=" + content + "]";
    }
}
