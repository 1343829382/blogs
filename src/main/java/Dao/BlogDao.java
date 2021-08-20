package Dao;

import entity.Blog;

import java.util.List;

public interface BlogDao {

        public List<Blog> getAll();

        public Blog findById(Integer id);

        public int add(Blog blog);

        public int update(Blog blog);

        public int delete(Integer id);

        public int count();

        public List<Blog> like(String title);

        public List<Blog> Latest();
}
