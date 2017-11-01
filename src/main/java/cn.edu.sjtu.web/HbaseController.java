package cn.edu.sjtu.web;

import cn.edu.sjtu.service.HbaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HbaseController {
    HbaseService hbaseService;

    @RequestMapping(value = "/ajaxRequest.do", method = RequestMethod.GET)
    private String ExecuteQuery(@RequestParam(value = "input", required = false) String input){
        String cur_time = GetTime();
        char c_input = input.charAt(0);
        switch (c_input){
            case '1':
                return hbaseService.ScanHbase("http_request", "top10-1h", cur_time, cur_time,"src-size");
            case '2':
                return "";
            case '3':
                String tmp;
                tmp = hbaseService.ScanHbase("dns_request", "top10-1h", cur_time, cur_time,"dst");
                return tmp + " " + tmp;
            case '4':
                return hbaseService.ScanHbase("netflow", "top10-1h", cur_time, cur_time,"src-bytes");
            case '5':
                return hbaseService.ScanHbase("http_request", "top10-1h", cur_time, cur_time,"'host-count");
            case '6':
                return hbaseService.ScanHbase("syslog", "count-1h", "1496736000", "1496736000","val");
            case '7':
                return hbaseService.ScanHbase("natlog", "count-1h", cur_time, cur_time,"val");
        }
        return "";
    }

    private String GetTime(){
        int cur_time = (int)(System.currentTimeMillis()/1000);
        int tmp = (cur_time - 1484136000)/3600;
        int present = 1484136000 + (tmp - 1) * 3600;
        if ((cur_time-present)%3600 < 1200){
            present -= 3600;
        }
        //System.out.println(present);
        return present+"";
        //return "1495090800";
    }

    @Autowired
    public void setHbaseExecutor(HbaseService hbaseService) {
        this.hbaseService = hbaseService;
    }
}
