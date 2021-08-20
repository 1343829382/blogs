package Service;

import entity.Category;

import java.util.List;

public interface CategoryService {
    public List<Category> getAll();

    public Category finCaid(Integer id);

    public Integer add(Category category);

    public Integer update(Category category);

    public Integer delete(Integer id);

    public int count();

    public List<Category> like(String typename);
}
