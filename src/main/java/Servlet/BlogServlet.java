package Servlet;

import Config.InformationConfig;
import Service.BlogService;
import Service.CategoryService;
import Service.YoulianService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Blog;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/blog")
public class BlogServlet {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BlogService blogService;

    @Autowired
    private YoulianService youlianService;


    @RequestMapping("getAll")
    public String getAll(Model model,Integer cp){
        if(cp == null){
            cp = 1;
        }
        //设置分页数据
        PageHelper.startPage(cp,InformationConfig.Page);
        List<Blog> blogList = blogService.getAll();
        //        封装了详细的分页信息，包括我们查询出来的数据list，然后把page数据返回页面
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogList);
        model.addAttribute("pageInfo",pageInfo);
        return "/blog/bloglist";
    }




    @RequestMapping("/myadd")
    public String demo(Model model){
        List<Category> list = categoryService.getAll();
        model.addAttribute("list",list);
        return "/blog/blogadd";
    }
    @PostMapping("/add")
    @ResponseBody
    public String demoadd(Blog blog,Model model){
        Map<String,Object> map = new HashMap<>();
        Date date = new Date();
        blog.setDate(date);
        int blogs = blogService.add(blog);
        if(blogs == 1){
            map.put("code",1);
            model.addAttribute("mag",InformationConfig.Add);
            return JSON.toJSONString(map);
        }else {
            map.put("code",0);
            model.addAttribute("mag",InformationConfig.FailAdd);
            return JSON.toJSONString(map);
        }
    }



    /**
     * 删除信息
     * */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id,Model model){
        int delete = blogService.delete(id);
        if(delete == 1){
            model.addAttribute("mag",InformationConfig.Delete);
            return "redirect:/admin/blog/getAll";
        }else {
            model.addAttribute("mag",InformationConfig.Deletea);
            return "redirect:/admin/blog/getAll";
        }
    }




    @RequestMapping("/upda/{id}")
    public String upda(@PathVariable("id") Integer id,Model model){
        Blog blog = blogService.findById(id);
        List<Category> category = categoryService.getAll();
        model.addAttribute("blog",blog);
        model.addAttribute("category",category);
        return "/blog/blogupdate";
    }
    @PostMapping("update")
    @ResponseBody
    public String update(Blog blog,Model model){
        Map<String,Object> map = new HashMap<>();
        Date date = new Date();
        blog.setDate(date);
        int update = blogService.update(blog);
        if(update == 1){
            map.put("code",1);
            model.addAttribute("mag",InformationConfig.Xiug);
            return JSON.toJSONString(map);
        }else {
            map.put("code",0);
            model.addAttribute("mag",InformationConfig.Fail);
            return JSON.toJSONString(map);
        }
    }



    @RequestMapping("like")
    public String like(String title, Model model, Integer cp, HttpSession session){
        if(cp == null){
            cp = 1;
        }
        PageHelper.startPage(cp,5);
        List<Blog> blogList = blogService.like(title);
        session.setAttribute("title",title);
        PageInfo<Blog> pageInfo = new PageInfo<Blog>(blogList);
        model.addAttribute("pageInfo",pageInfo);
        return "/blog/bloglike";
    }
}
