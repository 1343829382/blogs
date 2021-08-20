package Service.impl;

import Dao.YoulianDao;
import Service.YoulianService;
import entity.Youlian;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class YoulianServiceimpl implements YoulianService {


    @Autowired
    private YoulianDao youlianDao;


    @Override
    public List<Youlian> getAll() {
        return youlianDao.getAll();
    }

    @Override
    public Youlian finYoulianId(Integer id) {
        return youlianDao.finYoulianId(id);
    }

    @Override
    public int Add(Youlian youlian) {
        return youlianDao.Add(youlian);
    }

    @Override
    public int delete(Integer id) {
        return youlianDao.delete(id);
    }

    @Override
    public int update(Youlian youlian) {
        return youlianDao.update(youlian);
    }

    @Override
    public int count() {
        return youlianDao.count();
    }
}
