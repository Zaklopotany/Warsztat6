package pl.coderslab.controller;

import java.time.LocalDateTime;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import pl.coderslab.entity.Comments;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CommentsRepository;
import pl.coderslab.repository.TweetRepository;
@RequestMapping(value="/comment")
@Controller
public class CommentController {
	@Autowired
	CommentsRepository commentsRep;
	@Autowired
	TweetRepository tweetRep;
	
	//add new comment 
			@PostMapping(path="/addComment")
			public String addComment(@Valid Comments comments, BindingResult result, Model model, @SessionAttribute(name ="user", required=false) User user1) {
				if(user1 == null) {
					return "redirect:/user/login";
				}
				if(result.hasErrors()) {
					model.addAttribute("mainUser", user1);
//					model.addAttribute("comment", new Comments());
					model.addAttribute("tweet", tweetRep.findOne(comments.getPost().getId())); 
					model.addAttribute("allComments", commentsRep.findByPostIdOrderByCreatedDesc(comments.getPost().getId()));
					return "app/tweetDetails";
				}
				comments.setCreated(LocalDateTime.now());
				commentsRep.save(comments);
				return "redirect:/tweet/details/"+comments.getPost().getId();
				
			}
}
