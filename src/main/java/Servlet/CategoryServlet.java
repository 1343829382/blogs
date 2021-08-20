package Servlet;

import Config.InformationConfig;
import Dao.CategoryDao;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/category")
public class CategoryServlet {


    @Autowired
    private CategoryDao categoryDao;


    /**
     * 查询分类信息并返回到页面上
     * */
    @RequestMapping("/list")
    public String getAll(Model model,Integer cp){
        if(cp == null){
            cp = 1;
        }
        //设置分页数据
        PageHelper.startPage(cp,InformationConfig.Page);
        List<Category> list = categoryDao.getAll();
//        封装了详细的分页信息，包括我们查询出来的数据list，然后把page数据返回页面
        PageInfo<Category> page = new PageInfo<Category>(list);
        long count = page.getTotal();
        model.addAttribute("page",page);
        model.addAttribute("count",count);
        return "/category/categorylist";
    }


    /**
     * 修改分类信息
     * */
    @RequestMapping("/upda/{id}")
    public String upda(@PathVariable("id") Integer id,Model model){
        Category category = categoryDao.finCaid(id);
        model.addAttribute("category",category);
        return "/category/upda";
    }
    @PostMapping("/update")
    @ResponseBody
    public String update(Category category,Model model){
        Map<String,Object> map = new HashMap<>();
        int cate = categoryDao.update(category).intValue();
        if(cate == 1){
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
     * 删除分类信息
     * */
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id,Model model){
        int delete = categoryDao.delete(id);
        if(delete == 1){
            model.addAttribute("delete", InformationConfig.Delete);
            return "redirect:/admin/category/list";
        }else {
            model.addAttribute("delete",InformationConfig.Deletea);
            return "redirect:/admin/category/list";
        }
    }


    /**
     *添加一个分类管理
     * */
    @RequestMapping("/myadd")
    public String myadd(Model model){
        return "/category/add";
    }
    @PostMapping("/add")
    public String add(Category category,Model model){
        int cate = categoryDao.add(category).intValue();
        if(cate == 1){
            model.addAttribute("mag",InformationConfig.Add);
            return "redirect:/admin/category/list";
        }else {
            model.addAttribute("mag",InformationConfig.FailAdd);
            return "/category/add";
        }
    }



    /**
     * 模糊查找一条信息
     * */
    @RequestMapping("/like")
    public String like(String typename, Model model, Integer cp, HttpSession session){
        if(cp == null){
            cp = 1;
        }
        PageHelper.startPage(cp,1);
        List<Category> ist = categoryDao.like(typename);
        session.setAttribute("typename",typename);
        PageInfo<Category> pageInfo = new PageInfo<Category>(ist);
        model.addAttribute("page",pageInfo);
        return "/category/categorylike";
    }
}
