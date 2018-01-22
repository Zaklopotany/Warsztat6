package pl.coderslab.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.TweetRepository;

@Controller
@RequestMapping("/tweet")
public class TweetController {
	@Autowired
	private TweetRepository tweetRep;
	
	@ModelAttribute("tweetList")
	public List<Tweet> loadAllTweets(){
		return tweetRep.orderListTweet();
	}
	@GetMapping("/showAll")
	public String showAllTweets(@SessionAttribute(name = "user", required = false) User user1) {
		if(user1 == null) {
			return "redirect:/uset/login";
		}
		ModelAndViewDefiningException//doko
	}
	@PostMapping("addTweet")
	public String getTeet(@Valid Tweet tweet, BindingResult result, @SessionAttribute(name = "user", required = false) User user1, Model model) {
		if(user1 == null) {
			return "redirect:/user/login";
		}
		if(result.hasErrors()) {
			return "app/mainPage";
		} else {
			tweet.setCreated(LocalDateTime.now());
			tweetRep.save(tweet);
		}
		model.addAttribute("tweetList", loadAllTweets());
		model.addAttribute("tweet", new Tweet());
		return "app/mainPage";
	}
	
	@GetMapping("/userTweets")
	public String showAllUserTweets(@SessionAttribute(name = "user", required = false) User user1, Model model) {
		if(user1==null) {
			return "redirect:/user/login";
		}
		model.addAttribute("tweet", new Tweet());
		model.addAttribute("user1", user1);
		model.addAttribute("userTweets", tweetRep.findByUserOrderByCreated(user1));
		return "app/userPage";
	}
	
	@PostMapping("addTweetUser")
	public String getTweetUser(@Valid Tweet tweet, BindingResult result, @SessionAttribute(name = "user", required = false) User user1, Model model) {
		if(user1 == null) {
			return "redirect:/user/login";
		}
		if(result.hasErrors()) {
			return "app/userTweets";
		} else {
			tweet.setCreated(LocalDateTime.now());
			tweetRep.save(tweet);
		}
		model.addAttribute("user1", user1);
		model.addAttribute("userTweets", tweetRep.findByUserOrderByCreated(user1));
		model.addAttribute("tweet", new Tweet());
		return "app/userPage";
	}
	
}
