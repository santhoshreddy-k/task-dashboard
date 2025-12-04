package com.example.tabsapp.service;

import com.example.tabsapp.model.Task;
import com.example.tabsapp.repository.TaskRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TaskService {
    private final TaskRepository repo;

    public TaskService(TaskRepository repo) {
        this.repo = repo;
    }

    public List<Task> findAll() { return repo.findAll(); }
    public Optional<Task> findById(Long id) { return repo.findById(id); }
    public Task save(Task t) { return repo.save(t); }
    public void deleteById(Long id) { repo.deleteById(id); }
    public List<Task> findByDone(boolean done) { return repo.findByDone(done); }
}
