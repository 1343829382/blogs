package Service.impl;

import Dao.BlogDao;
import Service.BlogService;
import entity.Blog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BlogServiceimpl implements BlogService {

    @Autowired
    private BlogDao blogDao;

    @Override
    public List<Blog> getAll() {
        return blogDao.getAll();
    }

    @Override
    public Blog findById(Integer id) {
        return blogDao.findById(id);
    }

    @Override
    public int add(Blog blog) {
        return blogDao.add(blog);
    }

    @Override
    public int update(Blog blog) {
        return blogDao.update(blog);
    }

    @Override
    public int delete(Integer id) {
        return blogDao.delete(id);
    }

    @Override
    public int count() {
        return blogDao.count();
    }

    @Override
    public List<Blog> like(String title) {
        return blogDao.like(title);
    }

    @Override
    public List<Blog> Latest() {
        return blogDao.Latest();
    }
}
