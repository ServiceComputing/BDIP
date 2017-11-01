package cn.edu.sjtu.web;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    //Spring Security see this :
    @RequestMapping(value = "/login.do", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "msg", required = false) String error) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("msg", "Invalid username or password!");
        }
        model.setViewName("/pages/login.jsp");
        return model;
    }

    @RequestMapping(value="/logout.do", method = RequestMethod.GET)
    public ModelAndView logout (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        ModelAndView model = new ModelAndView();
        model.addObject("msg", "You've been logged out successfully.");
        model.setViewName("/pages/login.jsp");
        return model;
    }
}
