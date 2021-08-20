package Service.impl;

import Dao.CategoryDao;
import Service.CategoryService;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CategoryServiceimpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> getAll() {
        return categoryDao.getAll();
    }

    @Override
    public Category finCaid(Integer id) {
        return categoryDao.finCaid(id);
    }

    @Override
    public Integer add(Category category) {
        return categoryDao.add(category);
    }

    @Override
    public Integer update(Category category) {
        return categoryDao.update(category);
    }

    @Override
    public Integer delete(Integer id) {
        return categoryDao.delete(id);
    }

    @Override
    public int count() {
        return categoryDao.count();
    }

    @Override
    public List<Category> like(String typename) {
        return categoryDao.like(typename);
    }
}
