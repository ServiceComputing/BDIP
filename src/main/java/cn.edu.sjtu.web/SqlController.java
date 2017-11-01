package cn.edu.sjtu.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;

@Controller
public class SqlController {

    @RequestMapping(value = "/sqlRequest.do", method = RequestMethod.GET)
    public void sqlQuery(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        PrintStream out = new PrintStream(response.getOutputStream());
        response.setContentType("text/html;charSet=utf-8");
        int x= 600+(int)(Math.random()*100);
        int y= 100+(int)(Math.random()*100);
        out.print(y+" "+x);
    }
}
