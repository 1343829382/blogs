package Servlet;

import Service.AdminService;
import Service.BlogService;
import Service.WebsiteService;
import Service.YoulianService;
import entity.Admin;
import entity.Blog;
import entity.Website;
import entity.Youlian;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/layout")
public class LayoutServlet {


    @Autowired
    private BlogService blogService;
    @Autowired
    private YoulianService youlianService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private WebsiteService websiteService;


    @RequestMapping("/demo")
    public String xin(Model model){

        List<Blog> blogList = blogService.getAll();
        List<Youlian> youlist = youlianService.getAll();
        Admin admin = adminService.getAll();
        List<Blog> blogs = blogService.Latest();
        Website website = websiteService.getAll();
        model.addAttribute("blogs",blogs);
        model.addAttribute("website",website);
        model.addAttribute("admin",admin);
        model.addAttribute("blogList",blogList);
        model.addAttribute("youlist",youlist);
        return "/first/demo";

    }

    @RequestMapping("/wenzhang/{id}")
    public String Wenzhang(@PathVariable("id") Integer id, Model model){
        Blog blog = blogService.findById(id);
        Admin admin = adminService.getAll();
        List<Youlian> youlist = youlianService.getAll();
        List<Blog> blogs = blogService.Latest();
        Website website = websiteService.getAll();
        model.addAttribute("website",website);
        model.addAttribute("blogs",blogs);
        model.addAttribute("youlist",youlist);
        model.addAttribute("admin",admin);
        model.addAttribute("blog",blog);
        return "/first/wenzhang";
    }
}
