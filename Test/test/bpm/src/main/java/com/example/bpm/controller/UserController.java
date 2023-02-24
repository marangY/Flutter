package com.example.bpm.controller;

import com.example.bpm.dto.UserDto;
import com.example.bpm.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor //생성자 주입 어노테이션 @Autorized와 비슷하게 생성자로 객체를 만들지 않아도 자동 주입 가능하게 함
public class UserController {
    private final UserService userService;

    @GetMapping("/user/save")
//a 태그로 불러온 주소값
    public String saveForm() {
        return "save";
    }
//
//    @PostMapping("/member/save")
//    public String save(@RequestParam("memberEmail") String memberEmail,
//                       @RequestParam("memberPassword") String memberPassword,
//                       @RequestParam("memberName") String memberName) {
//        return "index";
//    }

    @PostMapping("/user/save")
    //매개변수 @ModelAttribute 속성은 html 파일의 form 태그 안 name 속성들의 값들을 dto에 맞게 받아올 수 있다.
    //form 결과로 보여지는 창
    public String save(@ModelAttribute UserDto userDto) {
        System.out.println("UserController.save");
        System.out.println("userDTO = " + userDto);
        userService.save(userDto);
        return "login";
    }

    @GetMapping("/user/login")
    public String login() {
        return "login";
    }

    @PostMapping("/user/login")
    public String login(@ModelAttribute UserDto userDto, HttpSession session) {
        UserDto loginResult = userService.login(userDto);
        if (loginResult != null) {
            //세션에 로그인한 정보롤 담아줌
            session.setAttribute("loginEmail", loginResult.getUserEmail());
            return "main";
        } else {
            return "login";
        }
    }

    @GetMapping("/user/")
    //사용자 목록 보여주기
    public String findAll(Model model) {
        List<UserDto> userDtoList = userService.finaAll();
        model.addAttribute("userList", userDtoList);
        return "list";
    }

    @GetMapping("/user/{id}")
    public String findById(@PathVariable Long id) {

    }
}