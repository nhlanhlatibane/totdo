package io.jumpco.demo.todo.controller;

import io.jumpco.demo.todo.model.EntityNotFoundException;
import io.jumpco.demo.todo.model.Todo;
import io.jumpco.demo.todo.model.TodoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;

@Controller
public class TodoController {
    private TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    @RequestMapping("/todo/create")
    public ModelAndView startCreate() {
        ModelAndView result = new ModelAndView("add-edit");
        result.addObject("mode", "add");
        result.addObject("modeTitle", "Create");
        result.addObject("todo", new Todo());
        return result;
    }

    @GetMapping("/todo/edit/{id}")
    public ModelAndView startEdit(@PathVariable("id") Long id) throws EntityNotFoundException {
        Todo item = todoService.find(id);
        ModelAndView result = new ModelAndView("add-edit");
        result.addObject("mode", "update");
        result.addObject("modeTitle", "Update");
        result.addObject("todo", item);
        return result;
    }

    @PostMapping(params = "cancel", path = "/todo/add")
    public View cancelAdd() {
        return home();
    }

    @PostMapping(params = "cancel", path = "/todo/update")
    public View cancelUpdate() {
        return home();
    }




   /* @PostMapping("/todo/update")
    public ModelAndView update(@Valid @ModelAttribute Todo todo, BindingResult bindingResult, Model model) throws EntityNotFoundException {
        if(bindingResult.hasErrors()){
            ModelAndView result = new ModelAndView("add-edit");
            result.addAllObjects(model.asMap());
            result.addObject("mode", "update");
            result.addObject("modeTitle", "Update");
            
            return result;
        }
        todoService.update(todo);
        return new ModelAndView(home());
    }*/
    @PostMapping("/todo/update")
    public ModelAndView update(@Valid @ModelAttribute Todo todo, BindingResult bindingResult, Model model) throws EntityNotFoundException {
        if (bindingResult.hasErrors()) {
            ModelAndView result = new ModelAndView("add-edit");
            result.addObject("mode", "update");
            result.addObject("modeTitle", "Update");
            result.addAllObjects(model.asMap());
            return result;
        }
        todoService.update(todo);
        return new ModelAndView(home());
    }
    @PostMapping("/todo/add")
    public ModelAndView create(@Valid @ModelAttribute Todo todo, BindingResult bindingResult, Model model) {
        if(bindingResult.hasErrors()){
            ModelAndView results = new ModelAndView("add-edit");
            results.addAllObjects(model.asMap());
            results.addObject("mode", "add");
            results.addObject("modeTitle", "Create");
            return results;
        }
        todoService.create(todo);
        return new ModelAndView("redirect:/");
    }
        
    @GetMapping(value = "/todo/delete/{id}")
    public View delete(@PathVariable("id") Long id) {
        todoService.delete(id);
        return home();
    }

    @GetMapping(value = "/todo/complete/{id}")
    public ModelAndView complete(@Valid @ModelAttribute @PathVariable("id") Long id, BindingResult bindingResult, Model model) throws EntityNotFoundException {
        if(bindingResult.hasErrors()){
            ModelAndView results = new ModelAndView("add-edit");
            results.addAllObjects(model.asMap());
            results.addObject("mode", "complete");
            results.addObject("modeTitle", "Complete");
            return results;
        }
        todoService.complete(id);
        return new ModelAndView(home());
    }

    private RedirectView home() {
        return new RedirectView("/");
    }
    
    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView result = new ModelAndView("index");
        result.addObject("todos", todoService.list(null));
        return result;
    }
}
