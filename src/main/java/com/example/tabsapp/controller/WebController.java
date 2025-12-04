package com.example.tabsapp.controller;

import com.example.tabsapp.model.Task;
import com.example.tabsapp.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class WebController {
    private final TaskService service;
    public WebController(TaskService service) { this.service = service; }

    @GetMapping({"/", "/index"})
    public String index(Model model) {
        model.addAttribute("tasks", service.findAll());
        model.addAttribute("newTask", new Task());
        return "index";
    }

    @PostMapping("/tasks")
    public String addTask(@ModelAttribute Task task) {
        service.save(task);
        return "redirect:/index#tasks";
    }

    @PostMapping("/tasks/{id}/toggle")
    public String toggle(@PathVariable Long id) {
        service.findById(id).ifPresent(t -> {
            t.setDone(!t.isDone());
            service.save(t);
        });
        return "redirect:/index#tasks";
    }

    @PostMapping("/tasks/{id}/delete")
    public String delete(@PathVariable Long id) {
        service.deleteById(id);
        return "redirect:/index#tasks";
    }
}
