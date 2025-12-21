package com.example.tabsapp.controller;

import com.example.tabsapp.model.Task;
import com.example.tabsapp.service.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@Controller
public class WebController {
    private final TaskService service;
    private final RestTemplate restTemplate;
    public WebController(TaskService service, RestTemplate restTemplate) {
	    this.service = service;
	    this.restTemplate = restTemplate;
    }	    

    @GetMapping({"/", "/index"})
    public String index(Model model) {
        model.addAttribute("tasks", service.findAll());
        model.addAttribute("newTask", new Task());
        return "index";
    }

    @GetMapping("/service-b")
    public String callServiceB(Model model) {
	    String response = restTemplate.getForObject(
			    "http://service-b:8081/hello",
			    String.class
	    );

	    model.addAttribute("serviceBResponse", response);
	    // reload same UI page
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
