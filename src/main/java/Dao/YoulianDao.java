package Dao;

import entity.Youlian;

import java.util.List;

public interface YoulianDao {
    public List<Youlian> getAll();

    public Youlian finYoulianId(Integer id);

    public int Add(Youlian youlian);

    public int delete(Integer id);

    public int update(Youlian youlian);

    public int count();
}
