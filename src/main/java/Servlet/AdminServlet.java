package Servlet;

import Config.InformationConfig;
import Service.*;
import com.alibaba.fastjson.JSON;
import entity.Admin;
import entity.Website;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminServlet {


    @Autowired
    private AdminService adminService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private WebsiteService websiteService;

    @Autowired
    private BlogService blogService;

    @Autowired
    private YoulianService youlianService;


    /**
     * 管理登录网站后台处理
     * */
    @RequestMapping("/login")
    public String login(){
        return "/admin/login";
    }
    @RequestMapping("/management")
    public String Management(Model model){
        Website website = websiteService.getAll();
        model.addAttribute("website",website);
        return "/admin/main";
    }
    @PostMapping("main")
    @ResponseBody
    public String main(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session, Model model){
        Map<String,Object> map = new HashMap<>();
        Admin admin = adminService.login(username,password);
        if(null != admin){
            session.setAttribute("admin",admin);
            model.addAttribute("mag",InformationConfig.Login);
            map.put("code",0);
            return JSON.toJSONString(map);
        }else {
            model.addAttribute("mag",InformationConfig.Failure);
            map.put("code",1);
            return JSON.toJSONString(map);
        }
    }



    /**
     * 修改管理密码
     * */
    @RequestMapping("/myModify")
    public String myModify(Model model){
        Admin admin = adminService.getAll();
        model.addAttribute("admin",admin);
        return "/admin/Modify";
    }
    @PostMapping("Modifypassword")
    @ResponseBody
    public String Modifypassword(Integer id,String password,Model model){
        Map<String,Object> map = new HashMap<>();
        int modify = adminService.Modifypassword(id,password);
        if(modify == 1){
            map.put("code",1);
            model.addAttribute("mag",InformationConfig.Xiug);
            return JSON.toJSONString(map);
        }else {
            map.put("code",0);
            model.addAttribute("mag",InformationConfig.Fail);
            return JSON.toJSONString(map);
        }
    }


    /**
     *网站首页信息
     * */
    @RequestMapping("/welcome")
    public String welcome(Model model){
        int count = categoryService.count();
        int countblog = blogService.count();
        int countyou = youlianService.count();
        Date date = new Date();
        model.addAttribute("countyou",countyou);
        model.addAttribute("countblog",countblog);
        model.addAttribute("date",date);
        model.addAttribute("count",count);
        return "/admin/welcome";
    }



    /**
     * 管理退出登录
     * */
    @RequestMapping("/secede")
    public String secede(HttpSession session,Model model){
        session.invalidate();
        model.addAttribute("mag", InformationConfig.Secede);
        return "/admin/login";
    }
}
