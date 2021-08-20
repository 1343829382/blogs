package Service.impl;

import Dao.AdminDao;
import Service.AdminService;
import entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceimpl implements AdminService {

    @Autowired
    private AdminDao adminDao;


    @Override
    public Admin login(String username, String password) {
        return adminDao.login(username,password);
    }

    @Override
    public Admin getAll() {
        return adminDao.getAll();
    }

    @Override
    public int Modifypassword(Integer id, String password) {
        return adminDao.Modifypassword(id,password);
    }
}
