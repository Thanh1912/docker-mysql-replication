package com.example.demodockermysql.repository;

import com.example.demodockermysql.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;


public interface UsersRepository  extends JpaRepository<Users, Integer> {
}
