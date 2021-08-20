package Service.impl;

import Dao.WebsiteDao;
import Service.WebsiteService;
import entity.Website;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class WebsiteServiceimpl implements WebsiteService {


    @Autowired
    private WebsiteDao websiteDao;

    @Override
    public Website getAll() {
        return websiteDao.getAll();
    }

    @Override
    public Integer update(Website website) {
        return websiteDao.update(website);
    }
}
