package Dao;

import entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    public Admin login(@Param("username") String username, @Param("password") String password);

    public Admin getAll();

    /**
     * 修改网站管理密码
     * */
    public int Modifypassword(@Param("id") Integer id,@Param("password") String password);
}
