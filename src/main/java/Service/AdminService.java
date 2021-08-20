package Service;

import entity.Admin;
public interface AdminService {

    public Admin login(String username,String password);

    public Admin getAll();

    /**
     * 修改网站管理密码
     * */
    public int Modifypassword(Integer id, String password);
}
