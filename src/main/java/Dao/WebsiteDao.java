package Dao;

import entity.Website;

public interface WebsiteDao {

    /**
     * 查询网站基本信息
     * */
    public Website getAll();


    /**
     * 修改网站基本信息
     * */
    public Integer update(Website website);
}
