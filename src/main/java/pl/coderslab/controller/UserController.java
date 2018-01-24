package pl.coderslab.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import pl.coderslab.beans.Encoding;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

@Controller()
@RequestMapping(path = "/user")
public class UserController {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private TweetRepository tweetRep;
	
	//get tweet list
	@ModelAttribute("tweetList")
	public List<Tweet> loadAllTweets(){
		return tweetRep.orderListTweet();
	}

	//display login window
	@GetMapping(path = "/login")
	public String showLoginForm() {
		return "user/login";
	}
	//login form, get user - authentication
	@PostMapping(path = "/login")
	public String processLoginRequest(@RequestParam("email") String email,
			@RequestParam("password") String password, Model model, HttpSession ses) {
		User user = userRepository.findOneByEmailAndPassword(email, Encoding.encodePassToString(password));
		if (user != null) {
			ses.setAttribute("user", user);
			model.addAttribute("tweet", new Tweet());
			return "redirect:/tweet/showAll";
		} else {
			return "user/login";
		}
	}
	//display register window
	@GetMapping(path = "/register")
	public String showRegisterForm(Model model) {
		model.addAttribute("user", new User()) ;
		return "user/register";
	}
	//get new user (register form)
	@PostMapping(path = "/register")
	public String processRegistartionRequest(@Valid User user, BindingResult bresult, Model model) {
		if (bresult.hasErrors()) {
			return "user/register";
		} 
		return "redirect:/user/login";		
	}
	
	//logout user
	@GetMapping("/logout")
	public String logoutUser(HttpSession ses) {
		ses.setAttribute("user", null);
		return "redirect:/user/login";
	}
	@GetMapping("/settings")
	public String settings(Model model, @SessionAttribute(name = "user", required = false) User user1) {
		if (user1 == null) {
			return "redirect:/user/login";
		}
		model.addAttribute("user", user1);
		return "user/settings";
	}
	
	//change user data
	@PostMapping("/settings")
	public String getUserData(HttpServletRequest request,@SessionAttribute("user") User user1, Model model) {
		if(user1 == null) {
			return "redirect:/user/login";
		}
		
		//refactor form:form modelAttribute
		try {
			user1.setUsername(request.getParameter("username"));
			if (request.getParameter("password").length() > 0) {
				user1.setPassword(request.getParameter("password"));				
			}
			userRepository.save(user1);
		} catch (org.springframework.orm.jpa.JpaSystemException ex) {
				String invalidName = "Ta nazwa uzytkownika jest już zajęta";
				model.addAttribute("invalidName", invalidName);
			return "user/settings";
		}
		model.addAttribute("invalidName", null);
		return "redirect:/user/settings";
		
	}
	

}
