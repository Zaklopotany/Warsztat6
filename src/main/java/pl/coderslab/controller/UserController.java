package pl.coderslab.controller;

import java.util.List;

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
	public String processLoginRequest(@RequestParam("username") String username,
			@RequestParam("password") String password, Model model, HttpSession ses) {
		User user = userRepository.findOneByUsernameAndPassword(username, Encoding.encodePassToString(password));
		if (user != null) {
			ses.setAttribute("user", user);
			model.addAttribute("tweet", new Tweet());
			return "app/mainPage";
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
		} else {
			user.setPassword(Encoding.encodePassToString(user.getPassword()));
			try {
				userRepository.save(user);
			} catch (org.springframework.orm.jpa.JpaSystemException ex) {
				String message = ex.getMostSpecificCause().toString();
				String[] messageArr = message.split("'");
				if (messageArr[1].contains("@")) {
					String invalidEmail = "Konto z podanym emailem już istnieje";
					model.addAttribute("invalidEmail", invalidEmail);
				} else {
					String invalidName = "Ta nazwa uzytkownika jest już zajęta";
					model.addAttribute("invalidName", invalidName);
				}
				return "user/register";
			}
			model.addAttribute("invalidName", null);
			model.addAttribute("invalidEmail", null);
			return "redirect:user/login";
		}
	}


}
