package com.shixun.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/demo"})
public class DemoController {
    public DemoController() {
    }

    @RequestMapping({"/demo"})
    @ResponseBody
    public String demo() {
        return "hello world!!";
    }

    @RequestMapping({"/demo1"})
    @ResponseBody
    public String demo1() {
        return "hello world!!";
    }
}
