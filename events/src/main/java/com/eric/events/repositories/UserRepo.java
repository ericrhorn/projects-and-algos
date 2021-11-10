package com.eric.events.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.eric.events.models.User;

@Repository
public interface UserRepo extends CrudRepository <User, Long> {
	List<User> findAll();
	User findByEmail(String email);
	boolean existsByEmail(String email);
}
