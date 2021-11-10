package com.eric.events.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.eric.events.models.User;
import com.eric.events.repositories.UserRepo;

@Component
public class UserValidator implements Validator {
	
	@Autowired
	private UserRepo uRepo;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		User user = (User) target;
		
		if(!user.getPWConfirm().equals(user.getPassword())) {
			errors.rejectValue("pWConfirm", "Match", "Password and Password Confirmation Must Match");
		}
		if(this.uRepo.existsByEmail(user.getEmail())) {
			errors.rejectValue("email", "Unique", "This Email is Already Registered");
		}
	}

}
