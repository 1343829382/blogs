package Servlet;

import Config.InformationConfig;
import Service.YoulianService;
import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import entity.Youlian;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/youlian")
public class YoulianServlet {

    @Autowired
    private YoulianService youlianService;



    @RequestMapping("/getAll")
    public String getAll(Model model,Integer cp){
        if(cp == null){
            cp = 1;
        }
        PageHelper.startPage(cp,InformationConfig.Page);
        List<Youlian> list = youlianService.getAll();
        PageInfo<Youlian> pageInfo = new PageInfo<>(list);
        model.addAttribute("pageInfo",pageInfo);
        return "/youlian/youlianlist";
    }


    @PostMapping("/add")
    @ResponseBody
    public String add(Youlian youlian,Model model){
        Map<String,Object> map = new HashMap<>();
        int add = youlianService.Add(youlian);
        if(add == 1){
            map.put("code",1);
            model.addAttribute("mag",InformationConfig.Add);
            return JSON.toJSONString(map);
        }else {
            map.put("code",0);
            model.addAttribute("mag",InformationConfig.FailAdd);
            return JSON.toJSONString(map);
        }
    }


    @GetMapping("/upda/{id}")
    public String upda(@PathVariable("id") Integer id,Model model){
        Youlian youlian = youlianService.finYoulianId(id);
        model.addAttribute("youlian",youlian);
        return "/youlian/update";
    }
    @PostMapping("/update")
    @ResponseBody
    public String update(Youlian youlian,Model model){
        Map<String,Object> map = new HashMap<>();
        int update = youlianService.update(youlian);
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


    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id,Model model){
        int delete = youlianService.delete(id);
        if(delete == 1){
            model.addAttribute("mag",InformationConfig.Delete);
            return "redirect:/admin/youlian/getAll";
        }else {
            model.addAttribute("mag",InformationConfig.Deletea);
            return "redirect:/admin/youlian/getAll";
        }
    }
}
