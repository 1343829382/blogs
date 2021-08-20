package Servlet;

import Config.InformationConfig;
import Service.WebsiteService;
import com.alibaba.fastjson.JSON;
import entity.Website;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/website")
public class WebsiteServlet {


    @Autowired
    private WebsiteService websiteService;


    /**
     * 查询网站基本信息
     * */
    @RequestMapping("/getAll")
    public String getAll(Model model){
        Website website = websiteService.getAll();
        model.addAttribute("website",website);
        return "/admin/website";
    }



    /**
     * 修改网站基本信息
     * */
    @PostMapping("/update")
    @ResponseBody
    public String update(Website website,Model model){
        Map<String,Object> map = new HashMap<>();
        int update = websiteService.update(website);
        if(update == 1){
            map.put("code",1);
            model.addAttribute("mag", InformationConfig.Xiug);
            return JSON.toJSONString(map);
        }else {
            map.put("code",0);
            model.addAttribute("mag",InformationConfig.Fail);
            return JSON.toJSONString(map);
        }
    }
}
