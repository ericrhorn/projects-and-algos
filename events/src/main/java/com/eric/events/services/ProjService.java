package com.eric.events.services;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.eric.events.models.Event;
import com.eric.events.models.User;
import com.eric.events.repositories.EventsRepo;
import com.eric.events.repositories.UserRepo;

@Service
public class ProjService {
	private final UserRepo uRepo;
	private final EventsRepo eRepo;
	
	public ProjService (UserRepo uRepo, EventsRepo eRepo) {
		this.uRepo = uRepo;
		this.eRepo = eRepo;
	}

	public List<User> getAllUsers(){
		return uRepo.findAll();
		}
	public List<Event> getAllEvents(){
		return eRepo.findAll();
	}
	
	public User getOneUser(Long id) {
		return uRepo.findById(id).orElse(null);
	}
	
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return uRepo.save(user);
	}
	
	public User findByEmail(String email) {
		return uRepo.findByEmail(email);
	}
	
	public User findById(Long id) {
		Optional<User> user = uRepo.findById(id);
		
		if(user.isPresent()) {
			return user.get();
		}else {
			return null;
		}
	}
	
	public boolean authenticateUser (String email, String password) {
		User user = uRepo.findByEmail(email);
		if(user == null) {
			return false;
		} else {
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public Event newEvent(Event event) {
		return eRepo.save(event);
	}
	
	public Event getOneEvent(Long id) {
		return eRepo.findById(id).orElse(null);
	}
	
	public void eventsLiked(Event event, User user) {
		List<User> userLikes = event.getUserLikes();
		userLikes.add(user);
		this.eRepo.save(event);
	}
	
	public void eventsUnLiked(Event event, User user) {
		List<User> userLikes = event.getUserLikes();
		userLikes.remove(user);
		this.eRepo.save(event);
	}
	
	public void deleteById(Long id) {
		this.eRepo.deleteById(id);
	}
	
	public void updateEvent(Event event) {
		this.eRepo.save(event);
	}
	
	
}











