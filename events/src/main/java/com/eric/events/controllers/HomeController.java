package com.eric.events.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eric.events.models.Event;
import com.eric.events.models.User;
import com.eric.events.services.ProjService;
import com.eric.events.validator.UserValidator;

@Controller
public class HomeController {
	private final ProjService pSer;
	
	private final UserValidator uVal;
	
	public HomeController(ProjService pSer, UserValidator uVal) {
		this.pSer = pSer;
		this.uVal = uVal;
	}
	
	@RequestMapping("/")
	public String landing(@ModelAttribute("user") User user) {
		return "welcome.jsp";
	}
	
	@PostMapping("/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, RedirectAttributes redir) {
	boolean isAuthenticated = pSer.authenticateUser(email, password);
	if(isAuthenticated) {
		User currentUser = pSer.findByEmail(email);
		session.setAttribute("userId", currentUser.getId());
		return "redirect:/dashboard";
	} else {
		redir.addFlashAttribute("error", "Password and/or Email Incorrect");
		return "redirect:/";
		}
	}
	
	
	@RequestMapping("/register")
	public String Registration(@ModelAttribute("user") User user) {
		return "register.jsp";
	}
	
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
		uVal.validate(user, result);
		if(result.hasErrors()) {
			return "register.jsp";
		}
		User newUser = pSer.registerUser(user);
		session.setAttribute("userId", newUser.getId());
		return "redirect:dashboard";
	}
	
	@RequestMapping("/home")
	public String home(@ModelAttribute("event") Event event, Model model) {
		List<Event> allEvents = this.pSer.getAllEvents();
		model.addAttribute("allEvents", allEvents);
		return "home.jsp";
	}
	
	@RequestMapping("/dashboard")
	public String dashboard(@ModelAttribute("event") Event event, Model model, HttpSession session, RedirectAttributes redir) {
		if(session.getAttribute("userId") == null) {
			redir.addFlashAttribute("message", "Please Log in or register to view your dashboard");
			return "redirect:/";
		}
		Long userId = (Long)session.getAttribute("userId");
		List<Event> allEvents = this.pSer.getAllEvents();
		User currentUser = pSer.findById(userId);
		model.addAttribute("user", currentUser);
		model.addAttribute("allEvents", allEvents);
		return "dashboard.jsp";
	}
	
	@RequestMapping("/events/{id}")
	public String details(@ModelAttribute("id") Long id, Model model, HttpSession session) {
		Long userId = (Long)session.getAttribute("userId");
		   User currentUser = pSer.findById(userId);
		   Event event = this.pSer.getOneEvent(id);
		   List<Event> allEvents = this.pSer.getAllEvents();
		   model.addAttribute("allEvents", allEvents);
		   model.addAttribute("user", currentUser);
		   model.addAttribute("event", event);
		return "details.jsp";
	}
	
	@RequestMapping("/events/new")
	public String newEvent(@ModelAttribute("event") Event event, Model model, HttpSession session, RedirectAttributes redir) {
    	if (session.getAttribute("userId") == null) {
    		redir.addFlashAttribute("message", "Please login to view this page");
    		return "redirct:/dashboard";
    	}
    	Long userId = (Long)session.getAttribute("userId");
    	List<Event> allEvents = this.pSer.getAllEvents();
		  User currentUser = pSer.findById(userId);
		  model.addAttribute("user", currentUser);
		  model.addAttribute("allEvents", allEvents);
		return "new.jsp";
	}
	
	 @PostMapping("/events/new")
	   public String newEvent(@Valid @ModelAttribute("event") Event event, BindingResult result,  HttpSession session, Model model) {
		   if(result.hasErrors()) {
			   Long userId = (Long)session.getAttribute("userId");
			   List<Event> allEvents = this.pSer.getAllEvents();
		    	User currentUser = pSer.findById(userId);
		    	model.addAttribute("user", currentUser);
		    	model.addAttribute("allEvents", allEvents);
				return "new.jsp";
		   }
			this.pSer.newEvent(event);
		   	return "redirect:/dashboard"; 
		   }
	
	
	
	
	@GetMapping("/events/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model, HttpSession session) {
		Event event = pSer.getOneEvent(id);
		model.addAttribute("event", event);
		Long userId = (Long)session.getAttribute("userId");
		User currentUser = pSer.findById(userId);
		model.addAttribute("user", currentUser);
		return "edit.jsp";
	}
	

  @RequestMapping(value="/events/edit/{id}", method=RequestMethod.PUT)
   public String edit(@Valid @ModelAttribute("event") Event event, BindingResult result, Model model, HttpSession session) {
	  	Long userId = (Long)session.getAttribute("userId");
	  	User currentUser = pSer.findById(userId);
	  	model.addAttribute("user", currentUser);
		   pSer.updateEvent(event);
		   return "redirect:/dashboard";
	   }
	 
	
  @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		pSer.deleteById(id);
		return "redirect:/dashboard";
	}
  

  @GetMapping("/like/{id}")
  public String eventsLiked(HttpSession session, @PathVariable("id") Long eventId) {
	   Long userId = (long)session.getAttribute("userId");
	   User userLikes = this.pSer.getOneUser(userId);
	   Event eventsLiked = this.pSer.getOneEvent(eventId);
	   this.pSer.eventsLiked(eventsLiked, userLikes);
	   return "redirect:/dashboard";
  }

  @GetMapping("/unlike/{id}")
  public String eventsUnLiked(HttpSession session, @PathVariable("id") Long eventId) {
	   Long userId = (long)session.getAttribute("userId");
	   User userLikes = this.pSer.getOneUser(userId);
	   Event eventsLiked = this.pSer.getOneEvent(eventId);
	   this.pSer.eventsUnLiked(eventsLiked, userLikes);
	   return "redirect:/dashboard";
  }
  
  @RequestMapping("/logout")
  public String logout(HttpSession session) {
  	session.invalidate();
  	return "redirect:/home";
  }

}
