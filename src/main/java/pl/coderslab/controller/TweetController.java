package pl.coderslab.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import pl.coderslab.entity.Comments;
import pl.coderslab.entity.Tweet;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentsRepository;
import pl.coderslab.repository.TweetRepository;
import pl.coderslab.repository.UserRepository;

@Controller
@RequestMapping("/tweet")
public class TweetController {
	@Autowired
	private TweetRepository tweetRep;
	@Autowired
	private CommentsRepository commentsRep;
	@Autowired
	private UserRepository userRep;
	//get tweet list
	@ModelAttribute("tweetList")
	public List<Tweet> loadAllTweets(){
		return tweetRep.orderListTweet();
	}
	
	//show all tweets on main page
	@GetMapping("/showAll")
	public String showAllTweets(@SessionAttribute(name = "user", required = false) User user1, Model model) {
		List<Tweet> tweetList = loadAllTweets();
		tweetList = tweetList.stream().map(s -> s = s.setCommentsNumber(commentsRep.countByPostId(s.getId()))).collect(Collectors.toList());
		model.addAttribute("tweetList", tweetList);
		model.addAttribute("user", user1);
		model.addAttribute("tweet", new Tweet());		
		return "app/mainPage";
	}
	//form post method add tweet
	@PostMapping("addTweet")
	public String getTeet(@Valid Tweet tweet, BindingResult result, Model model) {
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
	//show logged user tweets 
	@GetMapping("/userTweets")
	public String showAllUserTweets(@SessionAttribute(name = "user", required = false) User user1, Model model) {
		model.addAttribute("tweet", new Tweet());
		model.addAttribute("user1", user1);
		model.addAttribute("userTweets", tweetRep.findByUserOrderByCreatedDesc(user1));
		return "app/userPage";
	}
	//add tweet userPage form
	@PostMapping("addTweetUser")
	public String getTweetUser(@Valid Tweet tweet, BindingResult result, @SessionAttribute(name = "user", required = false) User user1, Model model) {
		if(result.hasErrors()) {
			return "app/userPage";
		} else {
			tweet.setCreated(LocalDateTime.now());
			tweetRep.save(tweet);
		}
		model.addAttribute("user1", user1);
		model.addAttribute("userTweets", tweetRep.findByUserOrderByCreatedDesc(user1));
		model.addAttribute("tweet", new Tweet());
		return "app/userPage";
	}
	//show tweet details tweetDetails.jsp
	@GetMapping(path="/details/{id}")
	public String showTweetDetails(@PathVariable(required = true) Long id, Model model, @SessionAttribute(name = "user", required = false) User user1) {
		Tweet tweet = tweetRep.findById(id);
		model.addAttribute("mainUser",user1);
		model.addAttribute("tweet",tweet);
		model.addAttribute("allComments", commentsRep.findByPostIdOrderByCreatedDesc(id));
		model.addAttribute("comments", new Comments());
		return "app/tweetDetails";
	}
	
	//redirect to specific user tweets page
	@GetMapping("/oneUserTweet/{id}")
	public String showOnlyOneUserTweets(@PathVariable Long id, Model model) {

		model.addAttribute("user", userRep.findOne(id));
		model.addAttribute("tweet", new Tweet());
		model.addAttribute("tweetList", tweetRep.findByUserId(id));
		return "app/anyUserTweets";
	}
}
