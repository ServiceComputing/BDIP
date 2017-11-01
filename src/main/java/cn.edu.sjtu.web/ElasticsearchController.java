package cn.edu.sjtu.web;

import cn.edu.sjtu.service.ElasticsearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ElasticsearchController {
    @Autowired
    ElasticsearchService elasticsearchService;

    @RequestMapping(value="/test.do", method=RequestMethod.GET)
    @ResponseBody
    public String test() {
        try
        {
            elasticsearchService.make_client();
            String data = elasticsearchService.apply_query();
            elasticsearchService.close_client();
            return data;
        } catch (Exception e)
        {
            e.printStackTrace();
            return "error";
        }
    }
}
