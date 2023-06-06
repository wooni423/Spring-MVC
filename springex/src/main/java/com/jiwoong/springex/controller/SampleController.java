package com.jiwoong.springex.controller;

import com.jiwoong.springex.dto.TodoDTO;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

@Controller
@Log4j2
public class SampleController {

    @GetMapping("/hello")
    public void hello() {
        log.info("hello...");
    }

    //단순 parameter 자동 수집
    @GetMapping("/ex01")
    public void ex01(String name, int age) {
        log.info("ex01....");
        log.info("name: " + name);
        log.info("age: " + age);
    }
    
    // @RequestParam -> 디폴트값 지정 가능
    @GetMapping("/ex02")
    public void ex02(@RequestParam(name = "name", defaultValue = "AAA") String name,
                     @RequestParam(name = "age", defaultValue = "20") int age){
        log.info("ex02....");
        log.info("name: " + name);
        log.info("age: " + age);
    }

    // LocalDate error 발생 -> Formatter 를 이용한 파라미터의 커스텀 처리 필요
    @GetMapping("/ex03")
    public void ex02(LocalDate dueDate){
        log.info("ex03....");
        log.info("dueDate: " + dueDate);
    }

    // Model test
    @GetMapping("/ex04")
    public void ex04(Model model){

        log.info("........................");
        model.addAttribute("message","Hello World");

    }

    @GetMapping("/ex4_1")
    public void ex4Extra(TodoDTO todoDTO,Model model){

        log.info(todoDTO);
    }

    @GetMapping("/ex05")
    public String ex05(RedirectAttributes redirectAttributes){
        // addAttribute() -> 리다이렉트할 때 쿼리 스트링 되는 값을 지정
        redirectAttributes.addAttribute("name","ABC");

        //addFlashAttribute() -> 일회용으로만 데이터를 전달하고 삭제되는 값을 지정
        redirectAttributes.addFlashAttribute("result","success");
        return "redirect:/ex06";
    }

    @GetMapping("/ex06")
    public void ex06(){

    }

    @GetMapping("/ex07")
    public void ex07(String p1,int p2){
        log.info("p1...." +p1);
        log.info("p2...." +p2);
    }


}
