package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExampleController {

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/home")
    public String home(Model model) {
        model.addAttribute("message", "Приветствуем тебя в нашем приложении!");
        model.addAttribute("imageUrl", "/images/sample.jpg");
        model.addAttribute("additionalText", "Ну как тебе? \uD83D\uDE0A");

        return "home";
    }
}
