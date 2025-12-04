package com.example.tabsapp.config;

import com.example.tabsapp.model.Task;
import com.example.tabsapp.repository.TaskRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DataLoader {
    @Bean
    CommandLineRunner init(TaskRepository repo) {
        return args -> {
            repo.save(new Task("Buy groceries", "Milk, eggs, bread"));
            repo.save(new Task("Read book", "Finish chapter 7"));
            Task t = new Task("Fix bug", "Investigate NPE on startup");
            t.setDone(true);
            repo.save(t);
        };
    }
}
