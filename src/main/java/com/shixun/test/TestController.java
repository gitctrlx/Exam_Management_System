package com.shixun.test;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/test"})
public class TestController {
    @Autowired
    HttpServletRequest request;

    public TestController() {
    }

    @RequestMapping({"/demo"})
    @ResponseBody
    public String demo() {
        return "hello world!!";
    }

    @RequestMapping({"/demo1"})
    @ResponseBody
    public String demo1(String name, Integer age) {
        System.out.println(name + ", " + age);
        return name + ", " + age;
    }

    @RequestMapping({"/demo2"})
    @ResponseBody
    public String demo2() {
        String name = this.request.getParameter("name");
        String age = this.request.getParameter("age");
        System.out.println(name + ", " + age);
        return name + ", " + age;
    }

    @RequestMapping({"/demo3"})
    @ResponseBody
    public String demo3(Person person) {
        System.out.println(person.getName() + ", " + person.getAge());
        return person.getName() + ", " + person.getAge();
    }

    @RequestMapping({"/toDemoPage"})
    public String toDemoPage() {
        return "demo";
    }
}
