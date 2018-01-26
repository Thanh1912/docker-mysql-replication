package com.example.demodockermysql.controller;

import com.example.demodockermysql.model.Users;
import com.example.demodockermysql.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.nio.file.Path;
import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("/all")
public class ControllerEmployee {
    @Autowired
    private UsersRepository usersRepository;

    @GetMapping()
    public List<Users> all() {
        return usersRepository.findAll();
    }

    @GetMapping("/create")
    @Transactional(readOnly = false)
    public List<Users> users() {
        Users users = new Users();
        users.setName("Sam");
        users.setSalary(3400);
        users.setTeamName("Development");
            usersRepository.save(users);
        return usersRepository.findAll();
}
    @GetMapping("/update/{iduser}")
    public List<Users> Updateusers(@PathVariable String iduser ) {
        System.out.println("update "+iduser);
        Users users = new Users();
        users.setId(Integer.parseInt(iduser));
        users.setName("Sam");
        Random r=new Random();
        users.setSalary(  r.nextInt(10000));
        users.setTeamName(" update Development");
        usersRepository.save(users);
        return usersRepository.findAll();
    }


}